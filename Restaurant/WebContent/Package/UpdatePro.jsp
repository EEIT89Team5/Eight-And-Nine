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
<style>
@font-face {  
font-family: "ShowWind";  
src: url("../font/ShowWind.ttc");  
}
#bbody{
background: #333;
}
.font1{
font-family:ShowWind;
font-size:35px;
color:white;
}
#deded{
height:100px;
width:200px;

position: absolute;
top:50%;
left: 50%;
margin-top: -50px ;
margin-left: -100px
}
</style>
</head>
<link rel="stylesheet" href="../css/bootstrap.css">
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

<body id="bbody">
	<div align="center">
		<img src="../img/packlogo.png"><br>
		<img src="../img/select.png">	

<div id="deded">
		<font class="font1">套餐名稱</font><br><br>
	<FORM METHOD="post" ACTION="pro.do" name="form1">	
		<select size="1" name="product_id" style="font-family:ShowWind;font-size:25px ">

			<c:forEach var="SelectPack" items="${SelectPack}">
				<option value="${SelectPack.product_id}">${SelectPack.product_name}
			</c:forEach>
			</select>
			
	
	
	<br>
	<br>
		<input type="hidden" name="action" value="SelectPackage"> 
		<input type="submit" value="查詢" class="btn btn-info" style="font-family:ShowWind;font-size:23px;">
</div>

<br>
	
	</FORM>
		
		
</body>

</html>
