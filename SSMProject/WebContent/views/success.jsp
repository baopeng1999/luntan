<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/reload">首页</a>
用户：<c:forEach items="${requestScope.users }" var="user">
	<a href="find_user/${user.getNickname()}">${user.getNickname()}</a>
</c:forEach>
	<c:set var="flag" value="${requestScope.flag }"/>
	
	<c:choose>
		<c:when test="${flag==0 }"><a href="${pageContext.request.contextPath}/follow/${requestScope.f_user.getUser_id() }">关注${requestScope.f_user.getNickname() }</a></c:when>
		<c:when test="${flag==1 }" ><a href="${pageContext.request.contextPath}/cancle_follow/${requestScope.f_user.getUser_id() }">取消关注${requestScope.f_user.getNickname() }</a></c:when>
	</c:choose>
	
	
文章：

</body>
</html>