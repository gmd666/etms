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
	<h3 align="center">人员信息</h3>
	<table border="1" width="70%" align="center">
	<span style="color: red;font-weight:900">${msg}</span>
	<span style="color: green;font-weight:900">${msg1}</span>
		<tr>
		<!-- 一列的开头部分 -->
		<th>姓名</th>
		<th>性别</th>
		<th>入职时间</th>
		<th>职位</th>
		<th>操作</th>
		</tr>
		<c:forEach items="${userlist }" var="user">
		<tr>
		<td>${user.truename }</td>
		<td>${user.gender }</td>
		<td>${user.swt }</td>
		<td>${user.position }</td>
		<td><a href="<c:url value='/userDetails.do?id=${user.id }'/>">详细信息</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>