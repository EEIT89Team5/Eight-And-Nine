<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>折扣資料</title>
</head>
<body bgcolor='white'>
<div align="center">
	<table border='1' cellpadding='5' cellspacing='0' width='600'>
		<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
			<td><h3>折扣資料</h3>
		              <a href="../index.jsp">回首頁</a></td></tr></table>

<table border='1' bordercolor='#AAAAAA' width='600'>
	<tr>
		<th>折扣編號</th>
		<th>折扣名稱</th>
		<th>折扣</th>
		
	</tr>
	<tr align='center' valign='middle'>
		<td>${discountVO.disc_id}</td>
		<td>${discountVO.disc_name}</td>
        <td>${discountVO.disc_value}</td>
       	
	 </tr>
</table>
</div>
</body>
</html>
