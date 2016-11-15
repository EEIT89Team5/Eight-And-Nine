<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>點餐  - addOrder2.jsp</title>
</head>
<body>
<h2>您已於${time}成功加訂餐點</h2><br/>

<table>
	<tbody>
		<tr><td><h3>訂單資訊</h3></h3></td></tr>
		<tr><td>編號:${orderVO.order_id}</td></tr>		
		<tr><td>桌號:${orderVO.order_table}</td></tr>
		<tr><td>日期:${orderVO.order_date}</td></tr>
		<tr><td>總價:${orderVO.order_price}</td></tr>
		<tr><td>人數:${orderVO.order_numP}人</td></tr>
		<tr><td>會員:${orderVO.memberVO.member_id}</td></tr>
		<tr><td>員工:${orderVO.empVO.emp_id}</td></tr>
		<tr><td>折扣(結帳再說)</td></tr>
		<tr><td>結帳時間(結帳再說)</td></tr>
				
		<tr>
			<td><h3>訂單明細</h3></td>
		</tr>
		<tr>
			<td>商品編號</td>
			<td>商品名稱</td>
			<td>數量</td>
		</tr>
			<c:forEach var="orderXVO" items="${orderList}">
				<tr>
					<td>${orderXVO.productVO.product_id}</td>
					<td>${orderXVO.productVO.product_name}</td>
					<td>${orderXVO.orderX_num}</td>
				</tr>
			</c:forEach>
	</tbody>
</table><br/>
<a href="../index.jsp"> 回首頁 </a>


</body>
</html>