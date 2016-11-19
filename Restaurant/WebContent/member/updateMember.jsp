<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改會員資料</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>
<h3>修改會員${memberVO.member_id} ${memberVO.member_name}資料</h3>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<form method="post" action="member.do">
<table>
<tr><td>會員編號:${memberVO.member_id} </td></tr>
<tr><td>會員姓名:${memberVO.member_name}</td></tr>
<tr><td>性別:<input type="radio" name="m_gender" value="男" <c:if test="${memberVO.member_gender=='男'}">checked</c:if> />男
			<input type="radio" name="m_gender" value="女"  <c:if test="${memberVO.member_gender=='女'}">checked</c:if>/>女
			<input type="radio" name="m_gender" value="不填"/>不填</td></tr>
<tr><td>信箱:<input type="text" name="m_email" value="${memberVO.member_email}"></td></tr>
<tr><td>密碼:<input type="password" name="m_password" value="${memberVO.member_password}"></td></tr>
<tr><td>再次輸入密碼:<input type="password" ></td></tr>
<tr><td>手機:<input type="text" name="m_phone" value="${memberVO.member_phone}"></td></tr>
</table>
<input type="hidden" name="action" value="update_member2"/>
<input type="submit" value="修改"/>
</form>
</body>
</html>