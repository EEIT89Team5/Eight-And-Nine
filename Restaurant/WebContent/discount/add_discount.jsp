<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.discount.model.*"%>

<%
DiscountVO discountVO = (DiscountVO) request.getAttribute("discountVO");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>折扣項目新增</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>
<div align='center'>
	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
			<td><h3>折扣項目新增</h3><a href="../index.jsp"> 回首頁 </a></td></tr></table>

<h3>新增折扣:</h3>
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
		<td>折扣名稱:</td>
		<td><input type="TEXT" name="disc_name" size="45" 
			value="<%= (discountVO==null)? "" : discountVO.getDisc_name()%>" /></td>
	</tr>
	<tr>
		<td>折扣:</td>
		<td><input type="TEXT" name="disc_value" size="2" maxlength="2"
			value="<%= (discountVO==null)? "" : discountVO.getDisc_value()%>" /></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</div>
</body>

</html>
