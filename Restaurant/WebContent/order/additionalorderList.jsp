<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.orderx.model.*"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物車 - orderList.jsp</title>
</head>
<body>
	<h3>加點訂單明細</h3>
	<table>
		<tr>
			<td>商品編號</td>
			<td>商品名稱</td>
			<td>數量</td>
			<td>價格</td>
		</tr>

		<c:forEach var="orderXVO" items="${orderList}" varStatus="index">
			<tr>
				<td>${orderXVO.productVO.product_id}</td>
				<td>${orderXVO.productVO.product_name}</td>
				<td>${orderXVO.productVO.productKindVO.kind_name}</td>
				<td>${orderXVO.orderX_num}</td>
				<td>${orderXVO.productVO.product_price}</td>
				<td>
					<form method="post" ACTION="order.do" >
						<input type="hidden" name="alt" value="${index.count}">
						<input type="hidden" name="action" value="add_alter_S_orderX">
						<input type="submit" value="修改">
						<input type="text" name="altNumber">
					</form>
				</td>
				<td>
					<form method="post" ACTION="order.do" >
						<input type="hidden" name="del" value="${index.count}">
						<input type="hidden" name="action" value="add_delete_S_orderX">
						<input type="submit" value="刪除">
					</form>
				</td>
			</tr>

			
		</c:forEach>

		<tr><td>商品數量:${orderQ }</td></tr>			
<%-- 		<tr><td>單點主菜數量:<%= orderXSvc.getDishQuantity(1,40,orderList) %></td></tr> --%>
<%-- 		<tr><td>套餐數量:<%= orderXSvc.getPackageQuantity(orderList) %></td></tr> --%>
		<tr><td>總金額:${orderP}</td></tr>
	</table><br>
	<form METHOD="post" ACTION="order.do">
		<input type="hidden" name="action" value="add_final_order">
		<input type="submit" value="確認點餐">
	</form>
		<form METHOD="post" ACTION="order.do">
		<input type="hidden" name="action" value="add_keep_order">
		<input type="submit" value="繼續點餐">
	</form>
</body>
</html>