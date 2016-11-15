<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    EmpService empSvc = new EmpService();
    List<EmpVO> list = empSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
}
/* font{ */
/* font-family: ShowWind; */
/* font-size:17px; */
/* font-weight:bold;  */
/* } */

th{
font-family: ShowWind;
font-size:25px;
font-weight:bold;
color:white;
background: #333
}
b{
font-family: ShowWind;
font-size:18px;
font-weight:bold;
background: #333
}
td{
font-family: ShowWind;
font-size:25px;
font-weight:bold;
color:white;
background: #333
}
#bbody{
background: #333;
}
</style>
<title>歷年員工資料</title>
</head>
<body id="bbody">

<div align="center">
<div border='1' cellpadding='5' cellspacing='0' width='100%' align="center">
	
		<img src="../img/emplogo.png">
	
</div>

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
<table class="table table-striped" align="center" style="width: 1300px">
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>性別</th>
		<th>職位</th>
		<th>正職/工讀</th>
		<th>薪水</th>
		<th>雇用日期</th>
		<th>狀態</th>
		<th>個人資料</th>
		<th>修改</th>
	</tr>
	<%@ include file="../page1.file" %> 
	<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${empVO.emp_id}</td>
			<td>${empVO.emp_name}</td>
			<td>${empVO.emp_gender}</td>
			<td>${empVO.emp_title}</td>
			<td>${empVO.emp_fulltime}</td>
			<td>${empVO.emp_salary}</td>
			<td>${empVO.emp_hiredate}</td>
			<td>${empVO.emp_status}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do">
			     <input type="submit" value="個人資料" class="btn btn-primary" style="font-family:ShowWind;font-size:18px">
			     <input type="hidden" name="emp_id" value="${empVO.emp_id}">
			     <input type="hidden" name="action"	value="getOne_For_Display"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do">
			     <input type="submit" value="修改" class="btn btn-warning" style="font-family:ShowWind;font-size:18px">
			     <input type="hidden" name="emp_id" value="${empVO.emp_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<%@ include file="../page2.file" %>
</div>
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
</body>
</html>
