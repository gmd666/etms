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
	<h4>任务详细信息</h4>
	<table border="1" width="70%" align="center">
	<tr><td>任务名称</td><td>${task.tname }</td></tr>
	<tr><td>任务描述</td><td colspan="3">${task.ttxt }</td></tr>
	<tr><td>开始时间</td><td>${task.tstart }</td><td>结束时间</td><td>${task.tend }</td></tr>
	<tr><td>实施人</td><td>${task.tuser }</td>
	<td>实施状态</td>
	<td>
	<c:choose>
	<c:when test="${task.tstate == 0 }">未实施</c:when>
	<c:when test="${task.tstate == 1 }">实施中</c:when>
	<c:when test="${task.tstate == 2 }">已完成</c:when>
	</c:choose>
	</td>
	</tr>
	<tr><td colspan="6"><h3>实施计划</h3></td></tr>
	<tr><td>计划名称</td><td>完成状态</td><td>是否反馈</td><td>开始时间</td><td>结束时间</td><td>操作</td></tr>
	 <c:forEach items="${planList }" var="p">
	<tr><td>${p.pname }</td>
	<td>
	<c:choose>
	<c:when test="${p.pstate == 0 }">未完成</c:when>
	<c:when test="${p.pstate == 1 }">已完成</c:when>
	</c:choose>
	</td>
	<td>
	<c:choose>
	<c:when test="${p.rstate == 0 }">未反馈</c:when>
	<c:when test="${p.rstate == 1 }">已反馈</c:when>
	</c:choose>	
	</td>
	<td>${p.pstart }</td><td>${p.pend }</td>
	<!-- 计划详情 -->
	<td><a href="<c:url value='/findByPid.do?pid=${p.pid }&tname=${task.tname }'/>">详细信息</a></td></tr>
	</c:forEach>
	</table>
</body>
</html>