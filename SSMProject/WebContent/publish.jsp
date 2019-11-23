<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发表帖子</title>
</head>
<body>
	<script type="text/javascript" charset="utf-8" src="loginandregister/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="loginandregister/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="loginandregister/lang/zh-cn/zh-cn.js"></script>
    <script>
	var limit = 2,num = 0;
	function check(obj) {    
	     obj.checked?num++:num--;
	     if(num > limit){
	         obj.checked = false;
	         alert("最多选择2项");
	         num--;
	    }
	 };
	</script>
    <!--  <style type="text/css">
		.module{
			zoom:200%;
		}
	</style>-->
    <form action="${pageContext.request.contextPath}/text"
		id="uploadForm" enctype="multipart/form-data" method="post" onsubmit="return uptext()">
	<input type="hidden" value="${sessionScope.uuid}" name="uuid">
	标题 ：<input type="text" name="title">
    <script id="editor" type="text/plain" name="text" style="width:100%;height:350px;"></script>
    <script type="text/javascript">
    //实例化编辑器
    var ue = UE.getEditor('editor', {
    toolbars: [
        [
            'undo', //撤销
            'bold', //加粗
            'underline', //下划线
            'preview', //预览
            'horizontal', //分隔线
            'inserttitle', //插入标题
            'cleardoc', //清空文档
            'fontfamily', //字体
            'fontsize', //字号
            'paragraph', //段落格式
            'simpleupload', //单图上传
            'insertimage', //多图上传
            'attachment', //附件
            'music', //音乐
            'inserttable', //插入表格
            'emotion', //表情
            'insertvideo', //视频
            'justifyleft', //居左对齐
            'justifyright', //居右对齐
            'justifycenter', //居中对
            'justifyjustify', //两端对齐
            'forecolor', //字体颜色
            'fullscreen', //全屏
            'edittip ', //编辑提示
            'customstyle', //自定义标题
            'template', //模板
             ]
        ]
    });
</script>
请选择文章板块：
<label><input type="radio" name="blockname" value="篮球">篮球</label>
<label><input type="radio" name="blockname" value="足球">足球</label>
<label><input type="radio" name="blockname" value="羽毛球">羽毛球</label>
<br>
请选择文章标签：
<label class="module"><input type="checkbox" name="tag" value="比赛" onclick="check(this)">比赛</label>
<label class="module"><input type="checkbox" name="tag" value="明星" onclick="check(this)">明星</label>
<label class="module"><input type="checkbox" name="tag" value="热门" onclick="check(this)">热门</label>
<!--  <label class="module"><input type="checkbox" name="tag" value="4" onclick="check(this)">4</label> -->
<br>
<input type="submit" value="提交">
</form>　
<script type="text/javascript">
  //这段要放在文本编辑器的实例化之后
  function uptext(){
    if (!UE.getEditor('editor').hasContents()){
    alert('请先填写内容!');
    return false;
    }else{
    	return true;
    //提交编辑器中的内容
    //document.setweb.info.value=UE.getEditor('editor').getContent();
    //document.setweb.submit();
    }
  }
</script>
</body>
</html>