<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>修改${memberVO.member_name}資料成功</h3>
<table>

<tr><td>會員編號:${memberVO.member_id }</td></tr>
<tr><td>會員姓名:${memberVO.member_name }</td></tr>
<tr><td>性別:${memberVO.member_gender }</td></tr>
<tr><td>信箱:${memberVO.member_email }</td></tr>
<tr><td>密碼${memberVO.member_password }</td></tr>
<tr><td>手機:${memberVO.member_phone }</td></tr>

</table>

</body>
</html>