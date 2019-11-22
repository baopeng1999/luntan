<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆成功页</title>
</head>
<body>
<%
	String account=request.getParameter("account");
	session.setAttribute("account", account);
%>
<script type="text/javascript">
   alert("登录成功，欢迎您!");
   window.location.href = document.referrer;
   </script>
</body>
</html>