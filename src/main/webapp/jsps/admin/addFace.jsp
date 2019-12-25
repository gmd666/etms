<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
		<%
    		String path = request.getContextPath();
    		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
   		%>
 		<script src="<%=basePath %>/js/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/admin.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/login.css" />
	</head>
	<body>
		<div class="layui-tab page-content-wrap">
		  <ul class="layui-tab-title">
		    <li class="layui-this">人脸注册</li>
		    <li>
		    	<label class="layui-form-label">1.工作编号：</label>
				    <div class="layui-input-block">
				      <input type="text" id="eid" autocomplete="off" class="layui-input">
				    </div>
		    </li>
		    <li>
		    	<label class="layui-form-label">2.工作身份：</label>
				    <div class="layui-input-block">
				      <select class="layui-input" id="identify">
							<option value ="管理员">管理员</option>
							<option value="主管">主管</option>
							<option value="员工">员工</option>
						</select>
				    </div>
		    </li>
		  </ul>
		  <div class="m-login-bg">
			<div class="m-login">
				<br/><br/>
				<div class="m-login-warp" style="height:320px;">
						<h2>3.调整好姿势后请点击下方确认按钮</h2>
						<video id="myVideo" src="" width= 100%; height=100%></video>
 						<canvas id="myCanvas" width="640px" height="480px" hidden="hidden"></canvas>
 						<button  class="layui-btn layui-btn-primary" onclick="takePhoto()">确认</button>
 						<button  class="layui-btn layui-btn-primary" style="float:right;" onclick="javascript:{window.location='<%=basePath %>/Success.jsp'}">取消,返回首页</button>
				</div>
			</div>
		</div>
		</div>
	<script src="<%=basePath %>/js/layui.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"> 
		  var myVideo = document.getElementById('myVideo');
		  navigator.mediaDevices.getUserMedia({
		    video: true
		  }).then(function (mediaStream) {
		    myVideo.srcObject = mediaStream;
		    myVideo.onloadedmetadata = function () {
		      /* myVideo.controls = "controls"; 不显示控件*/
		      myVideo.play();
		    }
		  });
		 
		 function takePhoto(){
			 var eid = document.getElementById('eid').value;
			 var role = document.getElementById('identify').value;
			 var canvas = document.getElementById('myCanvas').getContext('2d');
			 canvas.drawImage(myVideo, 0, 0);
			    var imgsrc = document.getElementById("myCanvas").toDataURL(
				"image/png").split("base64,")[1];
			    $.ajax({
					type: "POST",
			        url:'../../addFace.do',
			        data:{message:imgsrc,Eid:eid,Role:role},
			      	success:function(score){
			          	if(score>=80){
			          		alert("人脸注册成功,您可以使用快速登陆！")
			             }
			          	else{
			          		return ;
			             }
			        },
			        error:function(){
			        	alert("注册失败！请调整好姿势，检查工号和身份后再点击确认!")
			        }
			    })
			}
		 /* setInterval("jiance()","1100");   */
	</script>
	</body>
</html>