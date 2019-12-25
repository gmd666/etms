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
	<h4>任务信息</h4>
	<table border="1" width="70%" align="center">
		<tr>
			<th>任务名称</th>
			<th>实施人</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>任务状态</th>
			<th>选择</th>
		</tr>
		<c:forEach items="${tasklist}" var="task">
			<tr>
				<td>${task.tname }</td>
				<td>${task.tuser}</td>
				<td>${task.tstart }</td>
				<td>${task.tend }</td>
				<td align="center">${task.tstate }</td>
				<td><a href="<c:url value='/findByTid.do?tid=${ task.tid}'/>">详细信息</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>