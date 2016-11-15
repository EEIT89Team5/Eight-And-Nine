<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>員工資料</title>
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
<td>員工編號：</td><td style="color:red">${empVO.emp_id}</td>
</tr>
<tr>
<td>員工姓名：</td><td>${empVO.emp_name}</td>
</tr>
<tr>
<td>員工性別：</td><td>${empVO.emp_gender}</td>
</tr>
<tr>
<td>職稱：</td><td>${empVO.emp_title}</td>
</tr>
<tr>
<td>薪資：</td><td>${empVO.emp_salary}</td><td><c:if test="${empVO.emp_salary>3000}">(月薪)</c:if><c:if test="${empVO.emp_salary<3000}">(時薪)</c:if></td>
</tr>
<tr>
<td>員工生日：</td><td>${empVO.emp_birthday}</td>
</tr>
<tr>
<td>身份證號碼：</td><td>${empVO.emp_idnumber}</td>
</tr>
<tr>
<td>聯絡電話：</td><td>${empVO.emp_phone}</td>
</tr>
<tr>
<td>居住地址：</td><td>${empVO.emp_addr}</td>
</tr>
<tr>
<td>到職日：</td><td>${empVO.emp_hiredate}</td>
</tr>
<tr>
<td>狀態：</td><td>${empVO.emp_status}</td>
</tr>
<tr>
<td>EMAIL：</td><td>${empVO.emp_email}</td>
</tr>



</table>


</div>
</body>
</html>