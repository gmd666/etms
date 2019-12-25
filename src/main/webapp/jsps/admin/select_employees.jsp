<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="3" width="500px" height="100" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
		<span style="color: red;font-weight:900;margin: 0 auto;">${msg}</span>
		<tr>
			<td  align="center">用户名</td>
			<td align="center">密码</td>
			<td align="center">真实姓名</td>
			<td align="center">性别</td>
			<td align="center">出生日期</td>
			<td align="center">所属角色</td>
			<td colspan="2" align="center">操作</td>
		</tr>
		<c:forEach items="${userlist}" var="user">
			<tr>
				<td  align="center">${user.username}</td>
				<td  align="center">${user.password}</td>
				<td  align="center">${user.truename}</td>
				<td  align="center">${user.gender}</td>
				<td  align="center">${user.borndate}</td>
				<td  align="center">${user.identify}</td>
				<td  align="center">
					<a href="<c:url value='/findById.do?id=${user.id}'/>">查看</a>
				</td>
				<td  align="center">
					<a href="<c:url value='/deleteById.do?id=${user.id}'/>">删除</a>
				</td>	
			</tr>
		</c:forEach>
	</table>
</body>
</html>