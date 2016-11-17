<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:remove var="LoginOK"/>
<%
  session.invalidate();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登出</title>
<style>
body{
background-image: url("../img/Loginbackground.jpg");
background-size: cover;
}
#block {
    	height: 300px; /*高度*/ 
     	width: 700px;  /*寬度*/ 
     	position: absolute; 
      	top:50%; 
      	left:50%;
      	
     	margin:0px auto;
		margin-top: -150px;
		margin-left:-350px
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
</style>
</head>
<body>
<div align="center">
<div id="block"><img src="../img/logout.png"></div>
</div>
您已經登出<P/>
<div align="center"><a href="../index_theme.jsp" style="text-decoration:none;"><font style="color:white;font-family:ShowWind;font-size:50px;font-weight: bold;">回首頁</font></a></div>
</body>
</html>