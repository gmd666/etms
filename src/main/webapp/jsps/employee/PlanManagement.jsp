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
	<h4 style="text-align:center">任务信息</h4>
	<table border="1" width="70%" align="center">
	<tr>
		<th>任务名称</th>
		<th>负责人</th>
		<th>开始时间</th>
		<th>结束时间</th>
		<th>任务状态</th>
		<th>选定</th>
	</tr>
		<c:forEach items="${tasklist}" var="task">
			<tr>
				<td>${task.tname }</td>
				<!-- 指定计划的人，是该员工的上司 -->
				<td>${sessionScope.Luser.bname }</td>
				<td>${task.tstart }</td>
				<td>${task.tend}</td>
				<td>
					<c:choose>
						<c:when test="${task.tstate == 0 }">未实施</c:when>
						<c:when test="${task.tstate == 1 }">实施中</c:when>
						<c:when test="${task.tstate == 2 }">已完成</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${task.tstate != 2 }">
							<a href="<c:url value='/drawPlan.do?tid=${task.tid }'/>">制定计划</a>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>