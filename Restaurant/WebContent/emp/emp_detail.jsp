<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���u���</title>
<style>
@font-face{
   font-family: "BoldFace";   
   src: url("../font/BoldFace.ttc");  
}

table td{
   	font-family: "BoldFace";   
   	font-size:25px; 
   	color:white;
   	
}
th{
	font-family: "BoldFace"; 
	color:white
}
tr{
 height:60px
}
#bbody{
background: #333;
}

</style>
</head>
<body id="bbody">
<div align="center">

<img src="../img/emplogo.png">
<br>
<a href="all_emp.jsp"><img src="../img/select.png"></a>
<table class="table table-striped">
<tr>
<td>���u�s���G</td><td style="color:red">${empVO.emp_id}</td>
</tr>
<tr>
<td>���u�m�W�G</td><td>${empVO.emp_name}</td>
</tr>
<tr>
<td>���u�ʧO�G</td><td>${empVO.emp_gender}</td>
</tr>
<tr>
<td>¾�١G</td><td>${empVO.emp_title}</td>
</tr>
<tr>
<td>�~��G</td><td>${empVO.emp_salary}</td><td><c:if test="${empVO.emp_salary>3000}">(���~)</c:if><c:if test="${empVO.emp_salary<3000}">(���~)</c:if></td>
</tr>
<tr>
<td>���u�ͤ�G</td><td>${empVO.emp_birthday}</td>
</tr>
<tr>
<td>�����Ҹ��X�G</td><td>${empVO.emp_idnumber}</td>
</tr>
<tr>
<td>�p���q�ܡG</td><td>${empVO.emp_phone}</td>
</tr>
<tr>
<td>�~��a�}�G</td><td>${empVO.emp_addr}</td>
</tr>
<tr>
<td>��¾��G</td><td>${empVO.emp_hiredate}</td>
</tr>
<tr>
<td>���A�G</td><td>${empVO.emp_status}</td>
</tr>
<tr>
<td>EMAIL�G</td><td>${empVO.emp_email}</td>
</tr>



</table>


</div>
</body>
</html>