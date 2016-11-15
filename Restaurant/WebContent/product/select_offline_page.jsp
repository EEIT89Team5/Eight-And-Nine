<%@page import="com.product.model.ProductVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");

	ProductService proSvc = new ProductService();
	List<ProductVO> getAppetizer = proSvc.getOneClass(10,0);
	pageContext.setAttribute("getAppetizer", getAppetizer);
	List<ProductVO> getSalad = proSvc.getOneClass(20,0);
	pageContext.setAttribute("getSalad", getSalad);
	List<ProductVO> getSoup = proSvc.getOneClass(30,0);
	pageContext.setAttribute("getSoup", getSoup);
	List<ProductVO> getMain = proSvc.getOneClass(40,0);
	pageContext.setAttribute("getMain", getMain);
	List<ProductVO> getDessert = proSvc.getOneClass(50,0);
	pageContext.setAttribute("getDessert", getDessert);
	List<ProductVO> getDrink = proSvc.getOneClass(60,0);
	pageContext.setAttribute("getDrink", getDrink);
%>
<script>
	$(function(){
		//點擊 input name 是product_id時 全部table下的div都隱藏 但是點擊的那個input的val取出來移除隱藏效果
	$('input[name="product_id"]').click(function() {

			$('div div').attr("hidden", "hidden");
			var aa = $(this).val();
			var bb = "#" + aa;

			$(bb).removeAttr("hidden");
		});
	});
</script>

<head>
	<title>商品單筆查詢</title>
</head>

<style>
th{
font-family: ShowWind;
font-size:25px;
font-weight:bold;
color:white;
background: #333;
text-align: center
}
td{
font-family: ShowWind;
font-size:35px;
color:white;
background:#333;
text-align: center;
}
#bbody{
background: #333;
}
@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
}
font{
font-family: ShowWind;
color:white;
font-size:30px
}
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
</style>
<body id="bbody">

<br>
	<div align="center">
		<img src="../img/prologo.png"><br>
		<a href="../index.jsp"><img src="../img/OFFLINE.png"></a>

<br>
<br>
		<input type="radio" name="product_id" value="Appetizer"><font>前菜</font>
		<input type="radio" name="product_id" value="Salad"><font>沙拉</font>
		<input type="radio" name="product_id" value="Soup"><font>湯品</font>
		<input type="radio" name="product_id" value="Main"><font>主菜</font>
		<input type="radio" name="product_id" value="Dessert"><font>甜點</font>
		<input type="radio" name="product_id" value="Drink" ><font>飲料</font>
	<br>
	<br>
				<div id="Appetizer" hidden>
	<table align="center" class="table table-striped" style="width: 1400px">
	

		
	<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getAppetizer" items="${getAppetizer}">
	<tr>	
						<td>${getAppetizer.product_id}</td>
						<td>${getAppetizer.product_name}</td>
						<td>${getAppetizer.product_price}</td>
						<td>${getAppetizer.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getAppetizer.product_id}"></td>
						<td><c:if test="${getAppetizer.inMenu==1}">上架中</c:if><c:if test="${getAppetizer.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>
				</table>
			</div>
		
	<div id="Salad" hidden>
		<table align="center" class="table table-striped" style="width: 1400px">
	<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getSalad" items="${getSalad}">
	<tr>	
						<td>${getSalad.product_id}</td>
						<td>${getSalad.product_name}</td>
						<td>${getSalad.product_price}</td>
						<td>${getSalad.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getSalad.product_id}"></td>
						<td><c:if test="${getSalad.inMenu==1}">上架中</c:if><c:if test="${getSalad.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>
				</table>
	</div>	
		
	<div hidden id="Soup">
		<table align="center" class="table table-striped" style="width: 1400px">

			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getSoup" items="${getSoup}">
	<tr>	
						<td>${getSoup.product_id}</td>
						<td>${getSoup.product_name}</td>
						<td>${getSoup.product_price}</td>
						<td>${getSoup.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getSoup.product_id}"></td>
						<td><c:if test="${getSoup.inMenu==1}">上架中</c:if><c:if test="${getSoup.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>

		</table>
	</div>
		
	
		
	<div hidden id="Main">
		<table align="center" class="table table-striped" style="width: 1400px">

			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getMain" items="${getMain}">
	<tr>	
						<td>${getMain.product_id}</td>
						<td>${getMain.product_name}</td>
						<td>${getMain.product_price}</td>
						<td>${getMain.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getMain.product_id}"></td>
						<td><c:if test="${getMain.inMenu==1}">上架中</c:if><c:if test="${getMain.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>

		</table>
	</div>
		
		
		
	<div hidden id="Dessert">
		<table align="center" class="table table-striped" style="width: 1400px">

			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getDessert" items="${getDessert}">
	<tr>	
						<td>${getDessert.product_id}</td>
						<td>${getDessert.product_name}</td>
						<td>${getDessert.product_price}</td>
						<td>${getDessert.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getDessert.product_id}"></td>
						<td><c:if test="${getDessert.inMenu==1}">上架中</c:if><c:if test="${getDessert.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>

		</table>
	</div>
		
		
		
	<div hidden id="Drink">
		<table align="center" class="table table-striped" style="width: 1400px">

			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getDrink" items="${getDrink}">
	<tr>	
						<td>${getDrink.product_id}</td>
						<td>${getDrink.product_name}</td>
						<td>${getDrink.product_price}</td>
						<td>${getDrink.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getDrink.product_id}"></td>
						<td><c:if test="${getDrink.inMenu==1}">上架中</c:if><c:if test="${getDrink.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>

		</table>
	</div>	

<br>
	</div>

</body>

</html>
