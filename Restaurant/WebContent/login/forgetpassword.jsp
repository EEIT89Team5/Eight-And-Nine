<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登錄</title>
<style>
body{
background-image: url("../img/Loginbackground.jpg");
background-size: cover;
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
td{
color:white;
font-family:"ShowWind";
font-size:35px;
height: 80px;
}
#block {
    	height: 300px; /*高度*/ 
     	width: 700px;  /*寬度*/ 
     	position: absolute; 
      	top:35%; 
      	left:50%;
      	
     	margin:0px auto;
		margin-top: -150px;
		margin-left:-350px
}
</style>
</head>
<body>
<div align="center" id="block">
<div align="center"><img src="../img/I FORGET.png"></div>
	<div align="center"><div align="center"><img src="../img/passwordkey.png"></div></div>
<br>
<br>
<br>
<Form Action="forget.do" method="POST"> 
<table>   
<TR><td><input type="text" id="emp_email" name="emp_email" placeholder="請輸入信箱" style="color:black;font-size:25px"></td></TR>	
<TR><td align="center"><input type="submit" value="確認" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:30px"></td></TR>
<font style="color:red;font-size:28px;font-family:ShowWind">我們將會寄送新的密碼給您</font>
</table>
</Form>
</div>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/buttons.js"></script>
<link rel="stylesheet" href="../css/buttons.css">
</body>

</html>
