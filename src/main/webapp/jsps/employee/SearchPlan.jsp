<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript" type="text/javascript"
  	src="<c:url value='/js/WdatePicker.js'/>">
</script>
</head>
<body>
	<form action="<c:url value="/searchPlan.do"/>" method="post">
	<input type="hidden" name="username" value="${sessionScope.Luser.truename}">
	<table border="2" width="70%" align="center">
	<!-- 这里可以写一个联动效果 -->
	<tr><td>计划名称</td><td><input type="text" name="pname"></td></tr>
	<tr><td>所属任务</td><td><select name="tid">
	<c:forEach items="${tasklist}" var="t">
	<!-- 所有的计划都在这里 -->
	<option value="${t.tid }:${t.tname}">${t.tname }</option>
	</c:forEach>
	</select></tr>
	<tr><td>开始时间</td><td>从<input type="date" name="pstart" ></td><td>到
		<input type="date" name="pstart2"></td></tr>
	<tr><td>结束时间</td><td>从<input type="date" name="pend"></td><td>到
		<input type="date" name="pend2"></td></tr>
	<tr><td>是否反馈</td><td>
		<select name="rstate">
			<option value="1">是</option>
			<option value="0">否</option></select></td></tr>
	<tr><td><input type="submit" value="查询计划"></td></tr>
	
	<tr><td colspan="6" align="center"><h4>计划信息</h4></td></tr>
	
	<tr><td>计划名称</td><td>所属任务</td><td>开始时间</td><td>结束时间</td><td>计划状态</td><td>是否反馈</td></tr>
	
	<c:forEach items="${planlist }" var="p">
	
	<tr><td>${p.pname }</td><td>${tname }</td><td>${p.pstart }</td><td>${p.pend }</td>
	<td>
	<c:choose>
	<c:when test="${p.pstate == 1 }">已完成</c:when>
	<c:when test="${p.pstate == 0 }">未实施</c:when>
	</c:choose>
	</td>
	<td>
	<c:choose>
	<c:when test="${p.rstate == 1 }">已反馈</c:when>
	<c:when test="${p.rstate == 0 }">未反馈</c:when>
	</c:choose>
	</td></tr>
	</c:forEach>
	</table>
	</form>
</body>
</html>