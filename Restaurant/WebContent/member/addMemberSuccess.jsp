<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊成功</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>
<h3>成功加入會員</h3>
<table>
<tr><td>${memberVO.member_id }</td></tr>
<tr><td>${memberVO.member_name }</td></tr>
<tr><td>${memberVO.member_gender }</td></tr>
<tr><td>${memberVO.member_email }</td></tr>
<tr><td>${memberVO.member_password }</td></tr>
<tr><td>${memberVO.member_phone }</td></tr>
<tr><td>${memberVO.member_register }</td></tr>

</table>

</body>
</html>