<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");
	ProductService proSvc = new ProductService();
	List<ProductVO> SelectPack = proSvc.SelectPack(2);
	pageContext.setAttribute("SelectPack", SelectPack);
	
%>

<html>
<head>
	<title>修改套餐</title>
</head>
<link rel="stylesheet" type="text/css" href="../js/calendar.css">
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<script>
	$(function() {
		$("#NewFileUp").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#Browse').attr('src', e.target.result);
				}

				reader.readAsDataURL(this.files[0]);
			}
		});

	});
</script>

<body bgcolor='white'>
	<div align="center">
		<tr>
			<a href="../index.jsp">回首頁</a>
			
		</tr>

	<table border='1' cellpadding='5' cellspacing='0' height='100' width="200">
		<tr align='center' valign='middle' height='20'>
				<td><h3>修改套餐</h3> 
	</table>
					
		<td>
		
<br>
	<FORM METHOD="post" ACTION="pro.do" name="form1">
<br>
		套餐名稱<br><br><select size="1" name="product_id">
<br>
<br>
			<c:forEach var="SelectPack" items="${SelectPack}">
				<option value="${SelectPack.product_id}">${SelectPack.product_name}
			</c:forEach>
			</select>
<br>
<br>
		<input type="hidden" name="action" value="SelectPackage"> 
		<input type="submit" value="查詢">
	</FORM>
		</td>
		
</body>

</html>
