<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.packageformat.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>修改套餐</title>
<style>
#bbody{
background: #333;
}
@font-face {  
  font-family: "BoldFace";  
  src: url("../font/BoldFace.ttc");  
}
@font-face {  
font-family: "ShowWind";  
src: url("../font/ShowWind.ttc");  
}
td{
font-family:ShowWind;
font-size:25px;
color:white;
margin: 10px
}
.font1{
font-family:ShowWind;
font-size:25px;
color:white;
}
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
</style>
</head>
<script src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
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


<body id="bbody">
<div align="center">
		<img src="../img/packlogo.png"><br>
		<img src="../img/UPDATE.png"><br>
		<br>
	<div align="left" style="width: 300px">
<FORM METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data">

<td style="margin: 5px"><font class="font1">套餐編號： ${pid}</font><br></td>
<td style="margin: 1px"><font class="font1">套餐名稱：</font><input name="product_name" value="${proVO.product_name}" style="font-family:ShowWind;font-size:23px;margin: 5px"><br></td>
<td style="margin: 1px"><font class="font1">套餐價格：</font><input name="product_price" size="8" value="${proVO.product_price}" style="font-family:ShowWind;font-size:23px;margin: 5px"><font class="font1">元</font><br></td>
<font class="font1">上架中/下架中：</font>
<select name="inMenu" style="font-family:ShowWind;font-size:25px">
	<option value="1" <c:if test="${proVO.getInMenu()==1}">selected</c:if>>上架中</option>
　	<option value="0" <c:if test="${proVO.getInMenu()==0}">selected</c:if>>下架中</option>
</select>


<table border="1px" align="center">
<td>商品類別</td>
<td>可選數量</td>

<c:forEach var="row" items="${proVO1}">
<tr>
	<td>${row.getDishClassVO().getClass_name()}</td>
	<td>
	<select style="color:black" name="Class_number${row.getDishClassVO().getClass_id()}">
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
<font class="font1" style="font-size:20px"><input type="file" id="FileUp" name="FileUp" size="50" maxlength="20" width="500"></font>
	</div>
<table>

	<tr>
<th><img src="../img/before.png" style="display:block;margin: auto"><br></th><th align="center"><img src="../img/after.png" style="display:block;margin: auto"><br></th>
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
		<input type="submit" value="修改" class="btn btn-warning" style="font-family:BoldFace;font-size:20px">
</FORM>
</div>



</body>

</html>
