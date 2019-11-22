<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/Index.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/Index.js"></script>
 <script>
      function getClass(className) { //className指class的值
                var tagname = document.getElementsByTagName('*');  //获取指定元素
                var tagnameAll = [];     //这个数组用于存储所有符合条件的元素
                for (var i = 0; i < tagname.length; i++) {     //遍历获得的元素
                    if (tagname[i].className.indexOf(className)>=0){     //如果获得的元素中的class的值等于指定的类名，就赋值给tagnameAll
                        tagnameAll[tagnameAll.length] = tagname[i];
                    }
                }
                return tagnameAll;
             
        }
 
 
 
        window.onload=function(){//载入事件
            var btn=getClass('tab_btn');//获取按钮数组
            var div=getClass('tab_div');//获取div数组
            for(i=0;i<btn.length;i++){
                btn[i].onclick=function(){//按钮点击事件
                    var index=(this.getAttribute('index')-0);//获取是第几个按钮按下
                    if(btn[index].className.indexOf('curr_btn')>=0) return;//如果按下的按钮为当前选中的按钮则无反应
                    for(i=0;i<btn.length;i++){
                        if(index==i){
                            btn[i].className='tab_btn curr_btn';
                            div[i].className='tab_div curr_div';
                        }else{
                            btn[i].className='tab_btn';
                            div[i].className='tab_div';
                        }
                    }
                }
            }
        };
    </script>
<script type="text/javascript">
 function getUrlData(){
	    let url = window.location.search;  //url中?之后的部分
	    url = url.substring(1);    //去掉?
	    let dataObj = {};
	    
	    if(url.indexOf('&')>-1){
	    	
	        url = url.split('&');
	        for(let i=0; i<url.length; i++){
	            let arr = url[i].split('=');
	            dataObj[arr[0]] = arr[1];
	        }
	    }else{
	        url = url.split('=');
	       
	        if(url[1]=="accounterror"){
	        	alert("账号不存在");
	        }else if(url[1]=="passworderror"){
	        	alert("密码错误");
	        }else if(url[1]=="logouterror"){
	        	alert("请先登录")
	        }else if(url[1]=="toomany"){
	        	alert("当前浏览器已经登陆一个账号");
	        }
	    }
	}
 getUrlData();
 </script>
 <script type="text/javascript">
		function getUrlData1() {
			let url = window.location.search; //url中?之后的部分
			url = url.substring(1); //去掉?
			let dataObj = {};

			if (url.indexOf('&') > -1) {

				url = url.split('&');
				for (let i = 0; i < url.length; i++) {
					let arr = url[i].split('=');
					dataObj[arr[0]] = arr[1];
				}
			} else {
				url = url.split('=');

				if (url[1] == "emailerror") {
					alert("邮箱已经被注册");
				} else if (url[1] == "accounterror") {
					alert("用户账号已经存在");
				} else if (url[1] == "nameterror") {
					alert("用户名已经存在");
				}
			}
		}
		getUrlData1();
	</script>
<title>首页</title>
</head>
<body>
     

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="Index1.jsp"><span class="glyphicon glyphicon-home" style="color:red"></span>首页 <span class="sr-only">(current)</span></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-globe" ></span>关于</a></li>
        <li><a href="#">活动</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">下拉框 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" method="get" action="search.jsp">
        <div class="form-group">
          <input type="text" class="form-control" name="search" style="width: 500px;" placeholder="请输入搜索内容">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><div id="login"><a href="javascript:void(0)" style="text-decoration: none;color: black;" onclick="show('light')"><span class="glyphicon glyphicon-log-in" style="padding-right: 3px;"></span>登录/注册</a></div></li>
        <li class="dropdown">
          <div id="my">
          <a style="text-decoration: none;color: black;">欢迎您,<%=session.getAttribute("user") %></a>
          <a href="my.jsp" style="text-decoration: none;color: black;"><span class="glyphicon glyphicon-user" style="padding-right: 3px;"></span>我的</a>
          <a href="#" style="text-decoration: none;color: black; class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#"><span class="glyphicon glyphicon-heart" style="padding-right: 3px;"></span>我的关注</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-list" style="padding-right: 3px;"></span>我的贴子</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-star" style="padding-right: 3px;"></span>我的收藏</a></li>
            <li><a href="publish.jsp"><span class="glyphicon glyphicon-edit" style="padding-right: 3px;"></span>发表帖子</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-out" style="padding-right: 3px;"></span>退出登录</a></li>
          </ul>
          </div>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
    <%
    if(session.getAttribute("user")==null){
    	%>
    	<script type="text/javascript">
    	shownextt('login','my');
    	</script>
    	
    <% } 
    else{
    	%>
    	<script type="text/javascript">
    	shownextt('my','login');
    	</script>
    	
    <% } %>
  </div><!-- /.container-fluid -->
</nav>


<div class="container-fluid" style="margin-left: 50px;">
  <div class="row">
    <div class="col-md-2" style="padding-top: 20px;float: left;">
    	<a href='javascript:void(0)' index='0' class='tab_btn curr_btn'>列表1</a>
    	<a href='javascript:void(0)' index='1' class='tab_btn'>列表2</a>
    	<a href='javascript:void(0)' index='2' class='tab_btn'>列表3</a>
    	<a href='javascript:void(0)' index='3' class='tab_btn'>列表4</a>
    	<!--  <ul>
    	<li class="list-group-item"><a href='javascript:void(0)' index='0' class='tab_btn curr_btn'>列表1</a></li>
        <li class="list-group-item"><a href='javascript:void(0)' index='1' class='tab_btn'>列表2</a></li>
        <li class="list-group-item"><a href='javascript:void(0)' index='2' class='tab_btn'>列表3</a></li>
	  	</ul>-->
    </div>
    <div class="col-md-6" style="padding-left: 100px;float: left;">
      <div class="tab_div curr_div">
      <a class="title" href="#">帖子标题1</a><br>
      <a href="#" style="color: black;">作者&nbsp</a>
      <a style="color: black;text-decoration: none">2018-09-17</a>
      <div class="fakeimg"><img alt="帖子图片" src="../img/ahu.png">帖子图片</div>
      <p>内容</p>
      <br>
      <a style="float: right;padding-right: 5px;text-decoration: none"><span class="glyphicon glyphicon-thumbs-up"></span>1234</a>
      <br>
      <hr class="line"/>
      <br>
      </div>
      
      <div class="tab_div">
      <%for(int i=0;i<10;i++){ %>
      <div>
      <a class="title" href="#">帖子标题2</a><br>
      <a href="#" style="color: black;">作者</a>
      <div class="fakeimg">图像</div>
      <p>内容</p>
      <hr class="line"/>
      <br>
      </div>
      <%} %>
      </div>
      
      <div class="tab_div">
      <a class="title" href="#">帖子标题3</a><br>
      <a href="#" style="color: black;">作者</a>
      <div class="fakeimg">图像</div>
      <p>内容</p>
      <hr class="line"/>
      <br>
      </div>
      
      <div class="tab_div">
      <a class="title" href="#">帖子标题4</a><br>
      <a href="#" style="color: black;">作者</a>
      <div class="fakeimg">图像</div>
      <p>内容</p>
      <hr class="line"/>
      <br>
      </div>
      
    </div>
    <div class="col-md-4" style="padding-left: 100px;float: left;">
      <h2>今日推荐</h2>
      <div>
      <a href="#" class="title" style="font-size: 30px;">推荐标题</a>
      <div class="fakeimg">图像</div>
      <p>内容</p>
      <hr class="line"/>
      <br>
      </div>
      
      <div>
      <a href="#" class="title" style="font-size: 30px;">推荐标题</a>
      <div class="fakeimg" style="display: inline-block;vertical-align: top;">
      	<div style="float: left;"><img alt="帖子图片" src="../img/ahu.png"></div>
      	<div style="float: right;width: 300px;"><span>推荐帖子的描述,推荐帖子的描述,推荐帖子的描述,推荐帖子的描述,推荐帖子的描述,推荐帖子的描述,推荐帖子的描述,推荐帖子的描述,推荐帖子的描述,推荐帖子的描述,</span></div>
      </div>
      <br>
      <p>内容</p>
      <hr class="line"/>
      <br>
      </div>
      
    </div>
  </div>
</div>

<div id="light" class="white_content">
    <div class="close1"><a href="javascript:void(0)" onclick="hide('light')"> 关闭</a></div>
    <form action="${pageContext.request.contextPath}/check" method="post" onsubmit="return checklogin()">
    <div class="con">
    <hr color="black">
    <a class="tiptitle">请输入您的账号与密码</a>
    <br/>
    <input class="shuru" id="account" type="text" placeholder="请输入账号" name="account">
    <a class="lempty" id="accempty">*账号输入不能为空</a>
    <br/><br>
    <input class="shuru" id="psd" type="password" placeholder="请输入密码" name="pwd">
    <a class="lempty" id="psdempty">*密码输入不能为空</a>
    <br/><br/>
    <input id="loginBu" type="submit" value="登录">
    <br><br>
    <a class="tipm" onclick="hide('light');show('light1')">没有账号？去注册</a>
    <br><br>
    </div>
    </form>
    </div>
    
    <div id="light1" class="white_content">
    <div class="close1"><a href="javascript:void(0)" onclick="hide('light1')"> 关闭</a></div>
    <form action="${pageContext.request.contextPath}/register" enctype="multipart/form-data" method="post" onsubmit="return checkAll()">
    <div class="con">
    <hr color="black">
    <a class="tiptitle">请输入您的基本信息</a>
    <br/>
    <img style="margin-left: 300px;margin-right: auto;" src="${pageContext.request.contextPath}/image/portrait/default.png">
    <input style="margin-left: 300px;margin-right: auto;" type="file" name="portrait" />
    <br/>
    <input class="shuru" id="racc" type="text" placeholder="请输入帐号" name="account">
    <a class="empty" id="raccempty"></a>
    <br/><br/>
    <input class="shuru" id="rname" type="text" placeholder="请输入姓名" name="name">
    <a class="empty" id="nameempty"></a>
    <br/><br/>
    <input class="shuru" id="rtel" type="text" placeholder="请输入邮箱" name="email">
    <a class="empty" id="telempty"></a>
    <br/><br/>
    <input class="shuru" id="rpsd" type="password" placeholder="请输入密码" name="pwd">
    <a class="empty" id="rpsdempty"></a>
    <br/><br/>
    <input class="shuru" id="rrpsd" type="password" placeholder="请再次输入密码" name="confirm">
    <a class="empty" id="rrpsdempty"></a>
    <br/><br/>
    <input id="loginBu" type="submit" value="注册">
    <br><br>
    </div>
    </form>
    </div>

	<div id="fade" class="black_overlay"></div>
</body>
</html>