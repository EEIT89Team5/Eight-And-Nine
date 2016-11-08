<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.packageformat.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%


%>

<html>
<head>
	<title>修改套餐</title>
</head>
<link rel="stylesheet" type="text/css" href="../js/calendar.css">
<link rel="stylesheet" type="text/css" href="../js/sweetalert.css">
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<script language="JavaScript" src="../js/sweetalert.min.js"></script>
<script>
$(function()
		{
			$("#FileUp").change(function(){
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
<div>

<FORM METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data">

				
<td style="margin: 5px">套餐編號： ${pid}<br></td>
<td style="margin: 1px">套餐名稱：<input name="product_name" value="${proVO.product_name}"><br></td>
<td style="margin: 1px">套餐價格：<input name="product_price" size="3" value="${proVO.product_price}">元<br></td>



<table border="1px">
<td>商品類別</td>
<td>可選數量</td>

<c:forEach var="row" items="${proVO1}">

<tr>
	
	<td>${row.getDishClassVO().getClass_name()}</td>
	<td>
	<select name="Class_number${row.getDishClassVO().getClass_id()}">
	<option value="0" 
<c:if test="${empty row.getClass_number()}">
	selected</c:if>>0</option>
	<option value="1" 
<c:if test="${row.getClass_number()==1}">
	selected</c:if>>1</option>
	<option value="2" 
<c:if test="${row.getClass_number()==2}">
	selected</c:if>>2</option>
	<option value="3" 
<c:if test="${row.getClass_number()==3}">
	selected</c:if>>3</option>
	<option value="4" 
<c:if test="${row.getClass_number()==4}">
	selected</c:if>>4</option>
	<option value="5" 
<c:if test="${row.getClass_number()==5}">
	selected</c:if>>5</option>
	</select>樣</td>
</tr>
<%-- 	<td>${row.getClass_number()}樣</td> --%>
</c:forEach>

</table>



<table border='1' bordercolor='black' width='800'>
<input type="file" id="FileUp" name="FileUp" size="50" maxlength="20" width="500">
	<tr>
<th>想要更改的圖片:</th><th>原先的圖片:</th>
	</tr>
<div>

	<tr>
		<td>
<img id="Browse" src="" alt="即將上傳的圖片預覽" width="500" height="400" border="1px"/>
		</td>

		<td>
<img width="500" height="400" src="${pageContext.servletContext.contextPath}/getImage?id=${proVO.product_id}">
		</td>
	</tr>
</div>

<br>

</table>
	<br>
		<input type="hidden" name="product_id" value="${pid}">
 		<input type="hidden" name="action" value="UpdatePackage">
		<input type="submit" value="修改">
</FORM>
</div>



</body>

</html>
