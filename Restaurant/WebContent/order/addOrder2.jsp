<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.orderx.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService" />
<jsp:useBean id="classSvc" scope="page" class="com.dishclass.model.DishClassService" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>點餐  - addOrder2.jsp</title>
<style>
body{
background-image: url("../img/0003.png");
background-size: cover;
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
@font-face{
font-family:"BoldFace";
src: url("../font/BoldFace.ttc");  
}
td{
font-family:"ShowWind";
color:white;
font-size:30px;
padding: 10px
}
h2{
color:white
}

img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
</style>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>
<div align="center">
<!-- <h2>點餐step2</h2> -->
<img src="../img/ORDERLOGO.png">
<!-- <h3>會員</h3> -->
<br>
<br>
<br>
<table>
	<tr>
<td style="width: 90px"><a href="../member/addMember.jsp" ><img src="../img/adduser.png" title="註冊會員"></a></td>
<span><td><a href="../memberlogin/memberlogin.jsp" ><img src="../img/login.png" title="登入會員"></td></span></a>
<span><td><a href="../memberlogin/memberlogout.jsp" ><img src="../img/signout.png" title="登出會員"></a></td></span>
	</tr>
</table>

<!-- <h3>訂單資訊</h3> -->
<table>
	<tr>
		<td>桌號:${orderVO.order_table}</td>
		<td>人數:${orderVO.order_numP}人</td>
		<td>會員: 
			<c:if test="${! empty MemberLoginOK }">${MemberLoginOK.member_name}</c:if>
		</td>	
		<td>員工:${orderVO.empVO.emp_name}</td>
	</tr>
</table>

<br>
<br>
<br>

<img src="../img/PACKAGE.png">

	<table>
		<tr>		
			<td>
				<form method="post" action="addOrderPackage.jsp">					
					<input type="submit" value="套餐" class="button button-3d-action button-pill" style="font-family: ShowWind;font-size:25px;font-weight: bold;" >
				</form>
			</td>			
		</tr>
	</table>
<br>

<table>
	<tr>
		<c:forEach var="classVO" items="${classSvc.getAllClasses()}">
			<td>
				<form method="post" action="order.do">
				<input type="hidden" name="class" value="${classVO.class_id }">
				<input type="hidden" name="action" value="choose_S_class">
				<input type="submit" value="${classVO.class_name }" class="button button-3d-primary button-rounded" style="font-family: ShowWind;font-size:25px;font-weight: bold;">
				</form>
			</td>
		</c:forEach>
	</tr>
</table>

<h3>點餐</h3>
<table>
	<tr style="text-align: center">
		<td>圖片</td>
		<td>菜名</td>
		<td>價格</td>
		<td></td>
	</tr>
<c:forEach var="productVO" items="${productList}">
	<tr>
		<td><img alt="${productVO.product_id}" src="${pageContext.servletContext.contextPath}/getImage?id=${productVO.product_id}" height="200"></td>
		<td>${productVO.product_name}</td>
		<td>${productVO.product_price}元</td>
		<td>
			<form METHOD="post" ACTION="order.do">
			數量:<select size="1" name="number" style="font-size:20px;font-family: ShowWind;font-weight: bold">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>			
				</select>
			<input type="hidden" name="product" value="${productVO.product_id}">
			<input type="hidden" name="price" value="${productVO.product_price}">
			<input type="hidden" name="action" value="add_S_orderX">
			<input type="submit" value="加入訂單" class="button button-3d" style="font-family: ShowWind;font-size:20px;font-weight: bold;color:black" >
			</form>
		</td>
	</tr>
</c:forEach>	

</table>


<c:if test="${not empty orderList}">
	<h2 style="color:pink;font-family:ShowWind;font-size:60px;font-weight: bold">購物車小計</h2>
	<table>

		<tr><td>菜色數量:${orderQ}</td></tr>
		<tr><td>主菜數量:${mainQ}</td></tr>
		<tr><td>套餐數量:${pcgQ}</td></tr>
		<tr><td>總金額:${orderP}</td></tr>
	</table><br>
	<form METHOD="post" ACTION="order.do" name="form1">
		<input type="hidden" name="action" value="check_orderList">
		<input type="submit" value="查看購物車" class="button button-pill button-primary" style="font-family:ShowWind;font-size:25px;font-weight:bold">
	</form>
</c:if>
</div>
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/buttons.js"></script>
<link rel="stylesheet" href="../css/buttons.css">
</body>
</html>