<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.discount.model.*"%>

<%
	DiscountVO discountVO = (DiscountVO) request.getAttribute("discountVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<title>�馩�ק�</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>
<div align='center'>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
			<td><h3>�馩�ק�</h3>
			          <a href="../index.jsp">�^���� </a></td></tr></table>

<h3>�馩�ק�:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
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
		<td>�馩�s��:
		<td><%=discountVO.getDisc_id()%></td>
	</tr>
	<tr>
		<td>�馩�W��:</td>
		<td><input type="TEXT" name="disc_name" size="45" value="<%=discountVO.getDisc_name()%>" /></td>
	</tr>
	<tr>
		<td>�馩:</td>
		<td><input type="TEXT" name="disc_value" size="45"	value="<%=discountVO.getDisc_value()%>" /></td>
	</tr>
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="disc_id" value="<%=discountVO.getDisc_id()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</div>
</body>
</html>
