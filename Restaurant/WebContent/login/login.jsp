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
background-image: url("../img/Loginbackground.jpg")
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
td{
color:white;
font-family:"ShowWind";
font-size:35px;
}
#block {
    	height: 300px; /*高度*/ 
     	width: 700px;  /*寬度*/ 
    	background-color: black;
     	position: absolute; 
      	top:50%; 
      	left:50%;
      	
     	margin:0px auto;
     	background-color: rgba(0,0,0,0.2);
		margin-top: -150px;
		margin-left:-350px
}
</style>
</head>
<body>
<div align="center" id="block" style="border: 1px red solid;">
<Form Action="login.do" method="POST">
    <Table width='600' >
         <TR><TH colspan='2'>
<!--             <H1>登入</H1>  -->
         </TH><TH></TH></TR>
         <TR>
             <TD align="CENTER">帳號：<input	type="text" name="userId" size="10" class="form-control" style="font-size:30px;font-weight: bold;"></TD>
             <TD width='120'><small><Font color='red' size="-1">${ErrorMsgKey.AccountEmptyError}</Font></small></TD>
         </TR>
         <TR>
             <TD align="CENTER">密碼：<input	type="password" name="pswd"  size="10" class="form-control" style="font-size:30px"></TD>
             <TD width='120'><small><Font color='red'  size="-1">${ErrorMsgKey.PasswordEmptyError}</Font></small></TD>
         </TR>            
         <TR>
             <TD align="CENTER" colspan='3'><Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
             
         </TR>
            
        <TR>
            <TD colspan="2" align="center">      <input type="submit" value="提交"> </TD>
            </TR>
         </Table>        
         
</Form>
</div>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
</body>

</html>
