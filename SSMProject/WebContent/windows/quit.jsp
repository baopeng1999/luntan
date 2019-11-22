<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退出登录</title>
</head>
<body>
<%
	session.removeAttribute("account");
%>
<script type="text/javascript">
	alert("注销成功！");
	window.location.href = document.referrer;
</script>
</body>
</html>