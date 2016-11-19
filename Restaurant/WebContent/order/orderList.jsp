<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.controller.*"%>
<%@ page import="com.orderx.model.*"%>
<%@ page import="java.util.*"%>

<% OrderXService orderXSvc=new OrderXService();
	List<OrderXVO> orderList=(List<OrderXVO>)session.getAttribute("orderList");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物車 - orderList.jsp</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>
	<h3>訂單明細</h3>
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
						<input type="hidden" name="action" value="alter_S_orderX">
						<input type="submit" value="修改">
						<input type="type" name="altNumber">
					</form>
				</td>
				<td>
					<form method="post" ACTION="order.do" >
						<input type="hidden" name="del" value="${index.count}">
						<input type="hidden" name="action" value="delete_S_orderX">
						<input type="submit" value="刪除">
					</form>
				</td>
			</tr>

			
		</c:forEach>

		<tr><td>菜色數量:${orderQ}</td></tr>
		<tr><td>主菜數量:${mainQ}</td></tr>
		<tr><td>套餐數量:${pcgQ}</td></tr>
		<tr><td>總金額:${orderP}</td></tr>
		
	</table><br>
	<form METHOD="post" ACTION="order.do">
		<input type="hidden" name="action" value="final_order">
		<input type="submit" value="確認點餐">
	</form>
		<form METHOD="post" ACTION="order.do">
		<input type="hidden" name="action" value="keep_order">
		<input type="submit" value="繼續點餐">
	</form>
</body>
</html>