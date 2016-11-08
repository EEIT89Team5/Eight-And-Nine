<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>

<% OrderService orderSvc=new OrderService(); 
	Date order_date=new Date(System.currentTimeMillis());
	List<OrderVO> list=orderSvc.getUnpaidOrdersByDate(order_date);
	pageContext.setAttribute("list", list);
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加點</title>
</head>
<body>
<h3>選擇加訂桌位(當天尚未結帳之桌位)</h3>
<table>
<tr>
<td>訂單編號</td>
<td>當日未結帳桌位</td>
<td>總價</td>
<td></td>
</tr>
<c:forEach var="orderVO" items="${list}">
	<tr>
	<td>${orderVO.order_id }</td>
	<td>${orderVO.order_table }</td>
	<td>${orderVO.order_price }</td>
	<td>
		<form method="post" action="order.do" >
			<input type="submit" value="加訂">
			<input type="hidden" name="action" value="addition1"/>
			<input type="hidden" name="order_id" value="${orderVO.order_id }"/>
		</form>
	</td>
	</tr>
</c:forEach>


</table>

<table>

</table>

</body>
</html>