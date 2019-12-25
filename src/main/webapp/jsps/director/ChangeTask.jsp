<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
		body{
			text-align:center;
		}
</style>
</head>
<body>
	<h2>未实施任务信息</h2>
	<span style="color: red;font-weight:900">${msg}</span>
	<span style="color: green;font-weight:900">${msg1}</span>
	<table border="2" align="center" width="70%">
	<tr><th>任务名称</th><th>实施人</th><th>开始时间</th><th>结束时间</th><th>任务状态</th><th>选择</th></tr>
	<c:forEach items="${tasklist }" var="task">
	<tr><td><a href="<c:url value='/modifyTask.do?tid=${task.tid}&url=/jsps/director/EditTask.jsp'/>">${task.tname }</a></td><td>${task.tuser}</td>
		<td>${task.tstart }</td><td>${task.tend }</td><td>未实施</td><td><a href="<c:url value=''/>">删除</a></td></tr>
	</c:forEach>
	</table>
</body>
</html>