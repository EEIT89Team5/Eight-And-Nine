<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���u��ƭק�</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>
<div align="center">

<table border='1' cellpadding='5' cellspacing='0' width='500'>
	<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
		<td>
		<h3>���u��ƭק�</h3>
		<a href="../index.jsp">�^����</a>
		<a href='all_emp.jsp'>�d�ߩҦ����u</a>
		</td>
	</tr>
</table>

<h5>���u��ƭק�:</h5>
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

<FORM METHOD="post" ACTION="emp.do" name="form1">

<table border="0" >
	<tr>
		<td>���u�s��:</td>
		<td><%=empVO.getEmp_id()%></td>
	</tr>
	<tr>
		<td>���u�m�W:</td>
		<td><input type="TEXT" name="emp_name" size="45" value="<%=empVO.getEmp_name()%>" /></td>
	</tr>
	<tr>
		<td>�ʧO:</td>
		<td><input type="TEXT" name="emp_gender" size="45"	value="<%=empVO.getEmp_gender()%>" /></td>
	</tr>
	<tr>
		<td>¾��:</td>
		<td><input type="TEXT" name="emp_title" size="45"	value="<%=empVO.getEmp_title()%>" /></td>
	</tr>
	<tr>
		<td>��¾/�uŪ:</td>
		<td><input type="TEXT" name="emp_fulltime" size="45"	value="<%=empVO.getEmp_fulltime()%>" /></td>
	</tr>
	<tr>
		<td>�~��:</td>
		<td><input type="TEXT" name="emp_salary" size="45"	value="<%=empVO.getEmp_salary()%>" /></td>
	</tr>
	<tr>
		<td>���Τ��:</td>
		<td>
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="emp_hiredate" value="<%=empVO.getEmp_hiredate()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','hiredate','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="�}�l���"></a>
		</td>
	</tr>
	<tr>
		<td>���A:</td>
		<td><input type="TEXT" name="emp_status" size="45"	value="<%=empVO.getEmp_status()%>" /></td>
	</tr>

</table>
<h5>�ӤH��ƭק�:</h5>
<table border="0">
	<tr>
		<td>�ͤ�:</td>
		<td>
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="emp_birthday" value="<%=empVO.getEmp_birthday()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','hiredate','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="�}�l���"></a>
		</td>
	</tr>
	<tr>
		<td>�����Ҹ��X:</td>
		<td><input type="TEXT" name="emp_idnumber" size="45"	value="<%=empVO.getEmp_idnumber()%>" /></td>
	</tr>
	<tr>
		<td>�q��:</td>
		<td><input type="TEXT" name="emp_phone" size="45"	value="<%=empVO.getEmp_phone()%>" /></td>
	</tr>
	<tr>
		<td>��}:</td>
		<td><input type="TEXT" name="emp_addr" size="45"	value="<%=empVO.getEmp_addr()%>" /></td>
	</tr>
	<tr>
		<td>E-Mail:</td>
		<td><input type="TEXT" name="emp_email" size="45"	value="<%=empVO.getEmp_email()%>" /></td>
	</tr>
	<tr>
		<td>�K�X:</td>
		<td><input type="TEXT" name="emp_password" size="45"	value="<%=empVO.getEmp_password()%>" /></td>
	</tr>

</table>

<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="emp_id" value="<%=empVO.getEmp_id()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</div>
</body>
</html>
