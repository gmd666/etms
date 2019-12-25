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
	<h3 align="center">未分配部门员工信息查询</h3>
	<span style="color: green;font-weight:900;margin: 0 auto;">${msg}</span>
	<span style="color: green;font-weight:900;margin: 0 auto;">${msg1}</span>
	<table border="1" width="70%" align="center">
		<tr>
		<!-- 一列的开头部分 -->
		<th>员工编号</th>
		<th>密码</th>
		<th>姓名</th>
		<th>性别</th>
		<th>出生日期</th>
		<th>所属角色</th>
		<th>操作</th>
		</tr>
	<c:forEach items="${userlist }" var="user">
		<tr>
		<td>${user.eid }</td>
		<td>${user.password }</td>
		<td>${user.truename }</td>
		<td>${user.gender }</td>
		<td>${user.borndate }</td>
		<td>${user.identify }</td>
		<td>
		<a href="<c:url value='/allotApart.do?id=${user.eid }&name=${user.truename}'/>">分配部门</a>
		</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>