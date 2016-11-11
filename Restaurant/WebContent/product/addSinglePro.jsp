<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<%
ProductVO proVO = (ProductVO) request.getAttribute("proVO");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新增單點菜色</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/jquery-1.12.3.min.js"></script>
<script>
$(function(){
			$("#NewFileUp").change(function(){
				if (this.files && this.files[0]) {
					var reader = new FileReader();
					
					reader.onload = function (e) {
						$('#Browse').attr('src', e.target.result);
					}
					
					reader.readAsDataURL(this.files[0]);
				}
			});		
			
}) ;

</script>

<body bgcolor='white'>

	<div align="center">
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr align='center' valign='middle' height='20'>
			<td>
				<h3>新增單點菜色</h3>
		         	<a href="../index.jsp">回首頁</a>
		    </td>
		</tr>
	</table>

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

<FORM METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data" >
<table border="0">

	<tr>
		<td>商品名稱:</td>
		<td><input type="TEXT" name="product_name" size="25" /></td>
	</tr>
	
	<tr>
		<td>價格:</td>
		<td><input type="TEXT" name="product_price" size="7" /></td>
	</tr>


	<tr>
		<td>類別:</td>
		
		<td>
<select name="product_class">
　		<option value="10">前菜</option>
　		<option value="20">沙拉</option>
		<option value="30">湯品</option>
		<option value="40">主菜</option>
		<option value="50">甜點</option>
		<option value="60">飲料</option>
</select>
		</td>
	</tr>

	<tr>
		<td>上架/下架:</td>
		<td>
<select name="inMenu">
　		<option value="1">存在</option>
　		<option value="0">不存在</option>

</select>
		</td>
	</tr>


	<tr>
		<td>簡介:</td>
		
 		<td><textarea cols="40" rows="5"  name="product_intro" ></textarea></td>
	</tr>

<br>

	<tr>
		<td>商品圖片:</td>
		<td>
<input type="file" name="NewFileUp" id="NewFileUp" size="50" maxlength="20"></td>
		<br>
	</tr>
</table>

	<img id="Browse" src="" alt="上傳的圖片將能先在此預覽" width="500" height="400" border="1px" />

<br>

<br>

		<input type="hidden" name="product_kind" value="1">
		<input type="hidden" name="action" value="insertSinglePro">
		<input type="submit" value="送出新增">
		
</FORM>

</div>

</body>

</html>
