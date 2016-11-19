<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登錄</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>
<CENTER>  
<Form Action="memberlogin.do" method="POST">
    <Table width='600' >
         <TR><TH colspan='2'>
            <H1>會員登入</H1> 
         </TH><TH></TH></TR>
         <TR>
             <TD align="CENTER">帳號：<input	type="text" name="userId" size="20"></TD>
             <TD width='120'><small><Font color='red' size="-1">${ErrorMsgKey.AccountEmptyError}</Font></small></TD>
         </TR>
         <TR>
             <TD align="CENTER">密碼：<input	type="password" name="pswd"  size="20"></TD>
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
</CENTER>
</body>

</html>
