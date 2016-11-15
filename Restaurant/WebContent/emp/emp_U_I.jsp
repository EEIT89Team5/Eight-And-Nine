<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>員工資料修改</title></head>
<style>
@font-face{
   font-family: "BoldFace";   
   src: url("../font/BoldFace.ttc");  
}
td{
   	font-family: "BoldFace";   
   	font-size:25px; 
/*   	color:white;   */
}
#bbody{
background: #333;
}
#Div1{
	width: 650px;
	padding:20px;
	border-radius: 10px
	
}
tr{
	height: 50px
}

</style>


<body id="bbody">

<div align="center">

<img src="../img/emplogo.png"><br>
<a href="all_emp.jsp"><img src="../img/UPDATE.png"></a>

<%-- 錯誤表列 --%>
<br>
<c:if test="${not empty errorMsgs}">
	<font color='red' style="font-family: BoldFace;font-size:20px">請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="emp.do" name="form1">
<c:set var="empp" value="${empVO}"></c:set>
<div id="Div1" align="left" style="border: 1px red solid;background:rgba(0,0,0,0.5);">
<table border="0" >
	<tr>
		<td style="color:white;">員工編號:</td>
		<td style="color:red"><%=empVO.getEmp_id()%></td>
	</tr>
	<tr>
		<td style="color:white;">員工姓名:</td>
		<td><input class="form-control" type="TEXT" name="emp_name" size="45" style="font-size:25px;width: 200px" value="<%=empVO.getEmp_name()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">性別:</td>
		<td><select name="emp_gender" class="form-control" style="font-size:25px;width: 200px;height: 40px">
			<option  value="男性" <c:if test="${empp.emp_gender=='男性'}">selected</c:if>>男</option>
			<option  value="女性" <c:if test="${empp.emp_gender=='女性'}">selected</c:if>>女</option>
		</select></td>
<%-- 		<td><input class="form-control" type="TEXT" name="emp_gender" size="45"	style="font-size:25px;width: 300px" value="<%=empVO.getEmp_gender()%>" /></td> --%>
	</tr>
	<tr>
		<td style="color:white;">職位:</td>
		<td><select name="emp_title" class="form-control" style="font-size:25px;width: 200px;height: 40px" >
			<option  value="員工" <c:if test="${empp.emp_title=='員工'}">selected</c:if>>員工</option>
			<option  value="領班" <c:if test="${empp.emp_title=='領班'}">selected</c:if>>領班</option>
			<option  value="經理" <c:if test="${empp.emp_title=='經理'}">selected</c:if>>經理</option>
		</select></td>
<%-- 		<td><input class="form-control" type="TEXT" name="emp_title" size="45"	style="font-size:25px;width: 300px" value="<%=empVO.getEmp_title()%>" /></td> --%>
	</tr>
	<tr>
		<td style="color:white;">正職/工讀:</td>
		<td><select name="emp_fulltime" class="form-control" style="font-size:25px;width: 200px;height: 40px">
			<option  value="正職" <c:if test="${empp.emp_fulltime=='正職'}">selected</c:if>>正職</option>
			<option  value="工讀" <c:if test="${empp.emp_fulltime=='工讀'}">selected</c:if>>工讀</option>
		</select></td>
<%-- 		<td><input class="form-control" type="TEXT" name="emp_fulltime" size="45" style="font-size:25px" value="<%=empVO.getEmp_fulltime()%>" /></td> --%>
	</tr>
	<tr>
		<td style="color:white;">薪水:</td>
		<td><input class="form-control" type="TEXT" name="emp_salary" size="45"	style="font-size:25px;width: 200px" value="<%=empVO.getEmp_salary()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">雇用日期:</td>
		<td>
		    <input class="form-control" size="9" readonly type="text" name="emp_hiredate" id="emp_hiredate" style="font-size:25px;width: 200px" value="<%=empVO.getEmp_hiredate()%>">
<!-- 			<a class="so-BtnLink" -->
<!-- 			href="javascript:calClick();return false;" -->
<!-- 			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);" -->
<!-- 			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);" -->
<!-- 			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','hiredate','BTN_date');return false;"> -->
<!-- 		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a> -->
		</td>
	</tr>
	<tr>
		<td style="color:white;">狀態:</td>

		<td>
		<select name="emp_status" class="form-control" style="font-size:25px;width: 200px;height: 40px">	
			<option value="在職中" <c:if test="${empp.emp_status=='在職中'}">selected</c:if>>在職中</option>
			<option value="已離職" <c:if test="${empp.emp_status=='已離職'}">selected</c:if>>已離職</option>
		</select>
		</td>
<%-- 		<td><input class="form-control" type="TEXT" name="emp_status" size="45"	style="font-size:25px" value="<%=empVO.getEmp_status()%>" /></td> --%>
	</tr>

	<tr>
		<td style="color:white;">生日:</td>
		<td>
		    <input class="form-control" size="9" readonly type="text" name="emp_birthday" id="emp_birthday" style="font-size:25px;width: 200px;" value="<%=empVO.getEmp_birthday()%>">
<!-- 			<a class="so-BtnLink" -->
<!-- 			href="javascript:calClick();return false;" -->
<!-- 			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);" -->
<!-- 			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);" -->
<!-- 			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','hiredate','BTN_date');return false;"> -->
<!-- 		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a> -->
		</td>
	</tr>
	<tr>
		<td style="color:white;">身份證號碼:</td>
		<td><input class="form-control" type="TEXT" name="emp_idnumber" size="45"	style="font-size:25px;width: 200px" value="<%=empVO.getEmp_idnumber()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">電話:</td>
		<td><input class="form-control" type="TEXT" name="emp_phone" size="45"	style="font-size:25px;width: 200px" value="<%=empVO.getEmp_phone()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">住址:</td>
		<td><input class="form-control" type="TEXT" name="emp_addr" size="55"	style="font-size:25px;width: 450px" value="<%=empVO.getEmp_addr()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">E-Mail:</td>
		<td><input class="form-control" type="TEXT" name="emp_email" size="55"	style="font-size:25px;width: 450px" value="<%=empVO.getEmp_email()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">密碼:</td>
		<td><input class="form-control" type="password" name="emp_password" size="55" style="font-size:25px;width: 450px" value="<%=empVO.getEmp_password()%>" /></td>
	</tr>

</table>

<br>
<div align="center">
<input type="hidden" name="action" value="update">
<input type="hidden" name="emp_id" value="<%=empVO.getEmp_id()%>">
<input type="submit" value="修改" class="btn btn-warning" style="font-family:BoldFace;font-size:20px">
</div>
</div>
</FORM>
</div>

<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
<script>
$(function() {
	
	
	
$('#emp_hiredate').datepicker({	
	format: 'yyyy-mm-dd',
	todayBtn: "linked"		
});

$('#emp_birthday').datepicker({	
	format: 'yyyy-mm-dd',
    startView:'decade'		
});

});
</script>

</body>
</html>
