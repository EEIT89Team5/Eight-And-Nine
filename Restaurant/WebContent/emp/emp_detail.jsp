<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>個人資料</title>
</head>
<body bgcolor='white'>
<div align="center">
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
		<td>
		<h3>個人資料</h3>
		<a href="../index.jsp">回首頁</a> 
		<a href='all_emp.jsp'>查詢所有員工</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#AAAAAA' width='800'>
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>生日</th>
		<th>身分證號碼</th>
		<th>電話</th>
		<th>住址</th>
		<th>E-Mail</th>
		<th>密碼</th>
	</tr>
	<tr align='center' valign='middle'>
		     <td>${empVO.emp_id}</td>
			 <td>${empVO.emp_name}</td>
             <td>${empVO.emp_birthday}</td>
             <td>${empVO.emp_idnumber}</td>
             <td>${empVO.emp_phone}</td>
             <td>${empVO.emp_addr}</td>
             <td>${empVO.emp_email}</td>
             <td>${empVO.emp_password}</td>
	 </tr>
</table>
</div>
</body>
</html>