<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<input id="mes" type="hidden" value="${requestScope.block_mes }" />
<body>
	修改板块:
	<form action="${pageContext.request.contextPath}/update_block/${requestScope.block.getBlock_name()}">
		新名字：<input type="text" name="new_name"/>
		新管理员的用户名或者账号：<input type="text" name="manager"/>
		<input type="submit" value="提交"/>
	</form>
	
	
	
	${requestScope.block.getBlock_name()}
	${requestScope.block.getBlock_id()}
	${requestScope.block.getCreate_time()}
	${requestScope.block.getManager()}
</body>
 <script type="text/javascript">
 function getMes(){
	 var mes = document.getElementById("mes").value;
	 if(mes=="user_notexist"){
		 alert("用户不存在");
	 }else if(mes=="user_notmanager"){
		 alert("用户不是管理员");
	 }else if(mes=="name_exist"){
		 alert("板块名已存在");
	 }
	}
 getMes();
 </script>
</html>