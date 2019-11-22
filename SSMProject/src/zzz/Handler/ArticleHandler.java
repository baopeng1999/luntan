package zzz.Handler;

import java.text.Collator;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zzz.Mapper.ArticleMapper;
import zzz.Mapper.BlockMapper;
import zzz.Mapper.CommentMapper;
import zzz.Mapper.UserMapper;
import zzz.entity.Article;
import zzz.entity.Comment;
import zzz.entity.Page;
import zzz.entity.User;

@Controller
public class ArticleHandler {
	
	@Autowired
	@Qualifier("articleMapper")
	ArticleMapper articleMapper;
	
	@Autowired
	@Qualifier("blockMapper")
	BlockMapper blockMapper;
	
	@Autowired
	@Qualifier("article")
	Article article;
	
	//Ð´Ìû×Ó
	@SuppressWarnings("unchecked")
	@RequestMapping("create_article")
	public String create_article(@RequestParam("content")String content,HttpSession session,@RequestParam("blockname")String  blockname,@RequestParam("tag")String []tags,@RequestParam("title")String title) {
		User user = (User)session.getAttribute("user");
		if(user==null) {
			return "<a href='loginandregister/login.jsp'>»¹Î´µÇÂ½£¬ÇëµÇÂ¼</a>";
		}
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sf.format(new Date());
		
		
		String block_id = blockMapper.query_blockid(blockname);
		String a = UUID.randomUUID().toString().replace("-", "") ;
		StringBuilder id = new StringBuilder(a);
		id.insert(0, 'A');
		
		article.setTitle(title);
		article.setArticle_id(id.toString());
		article.setAuthor_id(user.getUser_id());
		article.setBlock_id(block_id);
		article.setContent(content);
		article.setUpload_date(date);
		@SuppressWarnings("rawtypes")
		Comparator cmp = Collator.getInstance(java.util.Locale.CHINA);
		Arrays.sort(tags,cmp);
		article.setTag1(tags[0]);
		article.setTag2(tags[1]);
		article.setTag3(tags[2]);
		article.setTag4(tags[3]);
		article.setTag5(tags[4]);
		articleMapper.create_arts(article);
		
		return "";
	}
	
	@Autowired
	@Qualifier("userMapper")
	UserMapper userMapper;
	
	@Autowired
	@Qualifier("commentMapper")
	CommentMapper commentMapper;
	
	@Autowired
	@Qualifier("page")
	Page page;
	
	
	@RequestMapping("view_art")
	public String view_art(@RequestParam("id")String art_id,HttpSession session,Map<String,Object>map) {
		User user = (User)session.getAttribute("user");
		
		article = articleMapper.view_article(art_id);
		int comment_num = articleMapper.query_comments(art_id);
		if(user!=null) {
			if(articleMapper.query_like(user.getUser_id(),art_id)==1) {
				map.put("flag", "like");
			}

			if(articleMapper.query_scoreexist(user.getUser_id(),art_id)==0) {
				articleMapper.score(user.getUser_id(), art_id);
			}

		}
		int like_num = articleMapper.query_likes(art_id);
		int report_num = articleMapper.query_reports(art_id);
		map.put("like_num", like_num);
		map.put("comment_num", comment_num);
		map.put("report_num", report_num);
		map.put("article", article);
						
		//ÆÀÂÛ,·ÖÒ³
		
		int totalCount = commentMapper.query_NumofComments(art_id);
		page.setTotalCount(totalCount);
		page.setPageSize(4);
		page.setTotalPage();
		@SuppressWarnings("unchecked")
		ArrayList<Comment>comments = (ArrayList)commentMapper.query_comments(page.getPageSize(),page.getCurrentPage(),art_id);
		page.setDisplays(comments);
		return "";
	}
}
