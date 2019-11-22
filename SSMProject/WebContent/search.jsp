<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/Index.css">
<style type="text/css">
	.sresult{
		margin-left: 100px;
	}
</style>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/Index.js"></script>
<title>搜索结果</title>
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
            <li><a href="quit.jsp"><span class="glyphicon glyphicon-log-out" style="padding-right: 3px;"></span>退出登录</a></li>
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

	<%for(int i=0;i<10;i++){ %>
      <div class="sresult">
      <a class="title" href="#">帖子标题2</a><br>
      <a href="#" style="color: black;">作者</a>
      <div class="fakeimg">图像</div>
      <p>内容</p>
      </div>
      <hr class="line"/>
     <%} %>


</body>
</html>