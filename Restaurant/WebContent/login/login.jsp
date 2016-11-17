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
      	top:50%; 
      	left:50%;
      	
     	margin:0px auto;
		margin-top: -150px;
		margin-left:-350px
}
</style>
</head>
<body>
<div align="center"><img src="../img/welcomelogin.png"></div>
	<div align="center"><font style="color:#31aada;font-size:45px;font-family:ShowWind;font-weight: bold;">員工登入系統</font></div>
<div align="center" id="block">
<Form Action="login.do" method="POST">
    <Table>
         <TR>
             <TD align="CENTER">帳號：<input	type="text" name="userId" size="25" class="form-control" style="font-size:30px;font-weight: bold;"></TD>
             <TD><small><Font color='red' size="-1">${ErrorMsgKey.AccountEmptyError}</Font></small></TD>
         </TR>
         <TR>
             <TD align="CENTER">密碼：<input	type="password" name="pswd"  size="25" class="form-control" style="font-size:30px"></TD>
             <TD><small><Font color='red'  size="-1">${ErrorMsgKey.PasswordEmptyError}</Font></small></TD>
         </TR>            
<!--          <TR> -->
<%--              <TD align="CENTER" colspan='3'><Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></TD> --%>
             
<!--          </TR> -->        
        <TR>
            <TD align="center"><input type="submit" value="提交" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:30px"> </TD>
            </TR>
         </Table>        
         
</Form>
</div>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/buttons.js"></script>
<link rel="stylesheet" href="../css/buttons.css">
</body>

</html>
