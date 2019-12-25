<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>分配人员</h3>
	<form action="<c:url value="/allotBoss.do"/>" method="post">
	<!-- 分别将主管id和用户id传入后台 -->
	<table border="2"align="center" cellspacing="0">
			<tr>
			<td>
			员工ID<br><input type="text" name="Eid" value="${eid }">
			</td>
			<td>
			真实姓名<br><input type="text" name="name" value="${name}">
			</td>
				<td>主管：<select name="buser">
				<c:forEach items="${userlist}" var="user">
					<option value="${user.id}:${user.truename}">${user.truename}</option>
				</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
			<td><input type="submit" value="提交信息"></td></tr>
	</table>
	</form>
</body>
</html>