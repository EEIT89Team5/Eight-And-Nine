<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="orderSvc" scope="page" class="com.order.model.OrderService" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>單筆訂單明細資料 - listOneOrderDetails.jsp</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>

<h2>訂單${orderno}明細</h2><br/>

<table>
	<thead>
		<tr>
			<th>商品編號</th>
			<th>名稱</th>
			<th>單價</th>
			<th>點餐時間</th>
			<th>數量</th>
			<th>狀態</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="orderXVO" items="${orderXVOs}">
			<tr>
				<td>${orderXVO.productVO.product_id}</td>
				<td>${orderXVO.productVO.product_name}</td>
				<td>${orderXVO.productVO.product_price}</td>
				<td>${orderXVO.orderX_time}</td>
				<td>${orderXVO.orderX_num }</td>
				<td>${orderXVO.orderX_status}</td>
			</tr>	
		</c:forEach>
	
	</tbody>

</table>
<a href="../index.jsp"> 回首頁 </a>
</body>
</html>