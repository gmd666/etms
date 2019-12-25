<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		<%
    		String path = request.getContextPath();
    		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
   		%>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/admin.css"/>
	</head>
	<body>
		<div class="layui-tab page-content-wrap">
		  <ul class="layui-tab-title">
		    <li class="layui-this">添加信息</li>
		    <li style="color: red;font-weight:900">${msg}</li>
		    <li style="color: green;font-weight:900">${msg1}</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
		    	<form class="layui-form" action="<c:url value='/addEmployee.do'/>" method="post">
				  <div class="layui-form-item">
				    <label class="layui-form-label">用户名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="username" autocomplete="off" class="layui-input" value="${user.username}">
				      <span style="color: red;font-weight:900">${errors.username}</span>
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">设置密码：</label>
				    <div class="layui-input-block">
				      <input type="password" name="password" id="pwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="${user.password }">
				    	<span style="color: red;font-weight:900">${errors.password}</span>
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">确认密码：</label>
				    <div class="layui-input-block">
				      <input type="password" name="password2" id="pwd1" required lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input" onkeyup="validate()">
				   	  <span id="tishi"></span>
				    </div>
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">真实姓名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="truename" required  lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input" value="${user.truename }">
				   		<span style="color: red;font-weight:900">${errors.truename}</span>
				    </div>
				  </div>
				  <!--  选择性别-->
				   <label class="layui-form-label" style="margin-top:5px;">性别：</label>
				   <div class="layui-input-block" >
				      <input type="radio" name="gender" checked="checked" value="男">男
				      &nbsp; &nbsp;&nbsp; &nbsp;
				      <input type="radio" name="gender" value="女">女
				     </div> 
				   <!-- 选择出生日期-->
				   <div class="layui-form-item">
					    <label class="layui-form-label">出生日期：</label>
					    <div class="layui-input-block">
					      <input type="date" name="borndate"  class="layui-input">
					    </div>
				  </div>
				   <!--选择学历  -->
				   	<div class="layui-form-item">
						<label class="layui-form-label">学历：</label>
					    <div class="layui-input-block">
					     		<select class="layui-input" name="degree">
									<option value ="大专">大专</option>
									<option value="本科">本科</option>
									<option value="硕士研究生">硕士研究生</option>
									<option value="博士研究生">博士研究生</option>
								</select>
					    </div>
					</div>
					<!-- 选择入职时间 -->
					<div class="layui-form-item">
					    <label class="layui-form-label">入职时间：</label>
					    <div class="layui-input-block">
					      <input type="date" name="swt"  class="layui-input">
					    </div>
				  	</div>
				  <!--  选择身份-->
				  <div class="layui-form-item">
						<label class="layui-form-label">角色：</label>
					    <div class="layui-input-block">
					     		<select class="layui-input" name="identify">
									<option value ="管理员">管理员</option>
									<option value="主管">主管</option>
									<option value="员工">员工</option>
								</select>
					    </div>
					</div>
				  <!-- 选择职位 -->
				  <div class="layui-form-item">
				    <label class="layui-form-label">职位：</label>
				    <div class="layui-input-block">
				      <input type="text" name="position" required  lay-verify="required" placeholder="请输入职位" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <!-- 人脸识别权限-->
				 <label class="layui-form-label" >人脸识别：</label>
				   <div class="layui-input-block" style="margin-top:5px;">
				      <input type="radio" name="facelogin" checked="checked" value="1">开启
				      &nbsp; &nbsp;&nbsp; &nbsp;
				      <input type="radio" name="facelogin" value="0">不开启
				    </div> 
				  <!-- 工作经历 -->
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">工作经历：</label>
				    <div class="layui-input-block">
				      <textarea name="works" placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="submit" class="layui-btn layui-btn-normal" lay-submit lay-filter="adminInfo">立即提交</button>
				      <button type="reset" class="layui-btn layui-btn-normal" style="margin-left:200px;">取消提交</button>
				    </div>
				  </div>
				</form>
		    </div>
		  </div>
		</div>
	<script type="text/javascript">
	function validate() {
	    var pwd1 = document.getElementById("pwd").value;
	    var pwd2 = document.getElementById("pwd1").value;
	 
	    if(pwd1 == pwd2)
	     {
	        document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
	     }
		else {
		        document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
		     }
		}
	</script>
	</body>
</html>