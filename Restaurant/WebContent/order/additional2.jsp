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
</head>
<body>
<h2>加點餐step2</h2>

<h3>訂單資訊</h3>
<table>
	<tr>
		<td>桌號:${orderVO.order_table}</td>
		<td>總價:${orderVO.order_price}</td>
		<td>人數:${orderVO.order_numP}人</td>
		<td>會員:${orderVO.memberVO.member_id}</td>	
		<td>員工:${orderVO.empVO.emp_id}</td>
	</tr>
</table>

<h3>單點類別</h3>
<table>
	<tr>
		<c:forEach var="classVO" items="${classSvc.getAllClasses()}">
			<td>
				<form method="post" action="order.do">
				<input type="hidden" name="class" value="${classVO.class_id }">
				<input type="hidden" name="action" value="add_choose_S_class">
				<input type="submit" value="${classVO.class_name }">
				</form>
			</td>
		</c:forEach>
	</tr>
</table>

<h3>點餐</h3>

${classVO.class_name}:
<table>
	<tr>
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
			數量:<select size="1" name="number">
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
			<input type="hidden" name="action" value="add_add_S_orderX">
			<input type="submit" value="加入訂單">
			</form>
		</td>
	</tr>
</c:forEach>	

</table>

<c:if test="${not empty orderList}">
	<h3>購物車小計</h3>
	<table>

		<tr><td>菜色數量:${orderQ}</td></tr>
		<tr><td>主菜數量:${mainQ}</td></tr>
		<tr><td>套餐數量:${pcgQ}</td></tr>
		<tr><td>總金額:${orderP}</td></tr>
	</table><br>
	<form METHOD="post" ACTION="order.do" name="form1">
		<input type="hidden" name="action" value="add_check_orderList">
		<input type="submit" value="查看購物車">
	</form>
</c:if>
</body>
</html>