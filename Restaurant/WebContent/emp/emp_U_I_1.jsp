<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>員工資料修改</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>
<div align="center">

<table border='1' cellpadding='5' cellspacing='0' width='500'>
	<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
		<td>
		<h3>員工資料修改</h3>
		<a href="../index.jsp">回首頁</a>
		<a href='all_emp.jsp'>查詢所有員工</a>
		</td>
	</tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="emp.do" name="form1">

<h5>個人資料修改:</h5>
<table border="0">
	<tr>
		<td>員工編號:</td>
		<td><%=empVO.getEmp_id()%></td>
	</tr>
	<tr>
		<td>員工姓名:</td>
		<td><input type="TEXT" name="emp_name" size="45" value="<%=empVO.getEmp_name()%>" /></td>
	</tr>
	<tr>
		<td>生日:</td>
		<td>
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="emp_birthday" value="<%=empVO.getEmp_birthday()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','hiredate','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a>
		</td>
	</tr>
	<tr>
		<td>身份證號碼:</td>
		<td><input type="TEXT" name="emp_idnumber" size="45"	value="<%=empVO.getEmp_idnumber()%>" /></td>
	</tr>
	<tr>
		<td>電話:</td>
		<td><input type="TEXT" name="emp_phone" size="45"	value="<%=empVO.getEmp_phone()%>" /></td>
	</tr>
	<tr>
		<td>住址:</td>
		<td><input type="TEXT" name="emp_addr" size="45"	value="<%=empVO.getEmp_addr()%>" /></td>
	</tr>
	<tr>
		<td>E-Mail:</td>
		<td><input type="TEXT" name="emp_email" size="45"	value="<%=empVO.getEmp_email()%>" /></td>
	</tr>
	<tr>
		<td>密碼:</td>
		<td><input type="TEXT" name="emp_password" size="45"	value="<%=empVO.getEmp_password()%>" /></td>
	</tr>

</table>

<br>
<input type="hidden" name="action" value="update1">
<input type="hidden" name="emp_id" value="<%=empVO.getEmp_id()%>">
<input type="submit" value="送出修改"></FORM>
</div>
</body>
</html>
