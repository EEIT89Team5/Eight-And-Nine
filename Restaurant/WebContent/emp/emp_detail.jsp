<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�ӤH���</title>
</head>
<body bgcolor='white'>
<div align="center">
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
		<td>
		<h3>�ӤH���</h3>
		<a href="../index.jsp">�^����</a> 
		<a href='all_emp.jsp'>�d�ߩҦ����u</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#AAAAAA' width='800'>
	<tr>
		<th>���u�s��</th>
		<th>���u�m�W</th>
		<th>�ͤ�</th>
		<th>�����Ҹ��X</th>
		<th>�q��</th>
		<th>��}</th>
		<th>E-Mail</th>
		<th>�K�X</th>
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