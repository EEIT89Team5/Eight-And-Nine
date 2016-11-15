<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.discount.model.*"%>

<%
	DiscountVO discountVO = (DiscountVO) request.getAttribute("discountVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<title>折扣修改</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>
<div align='center'>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
			<td><h3>折扣修改</h3>
			          <a href="../index.jsp">回首頁 </a></td></tr></table>

<h3>折扣修改:</h3>
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

<FORM METHOD="post" ACTION="disc.do" name="form1">
<table border="0">
	<tr>
		<td>折扣編號:
		<td><%=discountVO.getDisc_id()%></td>
	</tr>
	<tr>
		<td>折扣名稱:</td>
		<td><input type="TEXT" name="disc_name" size="45" value="<%=discountVO.getDisc_name()%>" /></td>
	</tr>
	<tr>
		<td>折扣:</td>
		<td><input type="TEXT" name="disc_value" size="45"	value="<%=discountVO.getDisc_value()%>" /></td>
	</tr>
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="disc_id" value="<%=discountVO.getDisc_id()%>">
<input type="submit" value="送出修改"></FORM>
</div>
</body>
</html>
