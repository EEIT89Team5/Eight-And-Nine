<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登錄</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
<style>
body{
	background-image: url("../img/Loginbackground.jpg");
	background-size: cover;
}
@font-face{
font-family:"ShowWind";
src:url("../font/ShowWind.ttc");
}
td{
color:white;
font-family:"ShowWind";
font-size:35px;
height: 50px;
}

</style>
</head>
<body>
<div align="center">
<div align="center"><img src="../img/welcomelogin.png"></div>
<div align="center"><font style="color:#31aada;font-size:45px;font-family:ShowWind;font-weight: bold;">會員登入系統</font></div>
<br>
<br>
<br>
<br>
<br>
<Form Action="memberlogin.do" method="POST">
    <Table>
         <TR><TH colspan='2'>
<!--             <H1>會員登入</H1>  -->
         </TH><TH></TH></TR>
         <TR>
             <TD align="CENTER">帳號：</TD><TD><input	type="text" name="userId" style="width: 250px"></TD>
        </TR>
        <TR>
             <TD width='150' colspan='2'><small><Font color='red' size="6">${ErrorMsgKey.AccountEmptyError}</Font></small></TD>
        </TR>
         <TR>
             <TD align="CENTER">密碼：</TD><TD><input	type="password" name="pswd"  size="20" style="width: 250px"></TD>
         </TR>
         <TR>    
             <TD width='150' colspan='2'><small><Font color='red'  size="6">${ErrorMsgKey.PasswordEmptyError}</Font></small></TD>
         </TR>            
         <TR>
             <TD align="CENTER" colspan='2'><Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
             
         </TR>
            
        <TR>
           <td></td> <TD align="left">  <input type="submit" value="確認" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:30px;"> </TD>
            </TR>
         </Table>        
         
</Form>
</div>
<script src="../js/jquery-3.1.1.min.js"></script> 
<script src="../js/buttons.js"></script>
<link rel="stylesheet" href="../css/buttons.css">
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
</body>

</html>
