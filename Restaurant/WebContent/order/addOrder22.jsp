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
<h2>點餐step2</h2>

<h3>訂單資訊</h3>
<table>
	<tr>
		<td>桌號:${orderVO.order_table}</td>
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
				<input type="hidden" name="action" value="choose_S_class">
				<input type="submit" value="${classVO.class_name }">
				</form>
			</td>
		</c:forEach>
	</tr>
</table>

<h3>點餐</h3>
<form METHOD="post" ACTION="order.do">
<table>
	<tbody>	
		<tr>
			<td>
				${classVO.class_name}:
				<select size="1" name="product" >
					<c:forEach var="productVO" items="${productList}">	
						<option value="${productVO.product_id}">${productVO.product_name}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				數量:<input type="text" name="number">
			</td>
			<td>
				<input type="hidden" name="action" value="add_S_orderX">
				<input type="submit" value="加入訂單">
			</td>
		</tr>
	</tbody>
</table>
</form>

<c:if test="${not empty orderList}">
	<h3>購物車小計</h3>
	<table>
			<% OrderXService orderXSvc=new OrderXService();
				List<OrderXVO> orderList=(List<OrderXVO>)session.getAttribute("orderList");	%>
		<tr><td>單點主菜數量:<%= orderXSvc.getDishQuantity(1,40,orderList) %></td></tr>
		<tr><td>套餐數量:<%= orderXSvc.getPackageQuantity(orderList) %></td></tr>
		<tr><td>總金額:${orderVO.order_price}</td></tr>
	</table><br>
	<form METHOD="post" ACTION="order.do" name="form1">
		<input type="hidden" name="action" value="check_orderList">
		<input type="submit" value="查看購物車">
	</form>
</c:if>
</body>
</html>