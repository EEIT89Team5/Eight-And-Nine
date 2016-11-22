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
<style>
body{
margin:0;
padding:0;
background: #000 url(../img/0003.png) center center fixed no-repeat;
moz-background-size: cover;
background-size:cover;
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
th{
font-family:"ShowWind";
color:yellow;
font-size:30px;
text-align:center;
width:250px
}
td{
font-family:"ShowWind";
color:white;
font-size:25px;
text-align:center;
font-weight:bold;
height: 50px;
width:150px
}
.alldish{
font-size:40px;
color:yellow
}
</style>
</head>
<body>
<div align="center">
<!-- 	<h3>訂單明細</h3> -->
<img src="../img/ORDERLOGO.png"><br><br>
<img src="../img/Detail.png"><br><br><br><br><br>
	<table>
		<tr>
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>餐點類別</th>
			<th style="width: 80px">數量</th>
			<th style="width: 200px">價格</th>
		</tr>

		<c:forEach var="orderXVO" items="${orderList}" varStatus="index">
			<tr>
				<td>${orderXVO.productVO.product_id}</td>
				<td>${orderXVO.productVO.product_name}</td>
				<td>${orderXVO.productVO.productKindVO.kind_name}</td>
				<td style="width: 80px">${orderXVO.orderX_num}</td>
				<td style="width:200px">${orderXVO.productVO.product_price}</td>
				
					<form method="post" ACTION="order.do" >
					<td>
					<input type="text" maxlength="3" name="altNumber" style="width:50px;height: 35px;font-family:ShowWind;font-size:25px;font-weight: bold;">
					</td>
					<td>
						<input type="hidden" name="alt" value="${index.count}">
						<input type="hidden" name="action" value="alter_S_orderX">
						<input type="submit" value="修改" class="button button-3d" style="font-family: ShowWind;font-size:20px;font-weight: bold;color:black;">
						</td>
					</form>
				
				<td>
					<form method="post" ACTION="order.do" >
						<input type="hidden" name="del" value="${index.count}">
						<input type="hidden" name="action" value="delete_S_orderX">
						<input type="submit" value="刪除" class="button button-3d-royal button-rounded" style="font-family: ShowWind;font-size:20px;font-weight: bold;color:white">
					</form>
				</td>
			</tr>

			
		</c:forEach>
<tr style="height: 50px"></tr>
		<tr><td class="alldish">菜色數量:${orderQ}</td></tr>
		<tr><td class="alldish">主菜數量:${mainQ}</td></tr>
		<tr><td class="alldish">套餐數量:${pcgQ}</td></tr>
		<tr><td class="alldish">總金額:${orderP}</td></tr>
		
	</table>
	<br>
	<br>
	<br>
	<form METHOD="post" ACTION="order.do">
		<input type="hidden" name="action" value="final_order">
		<input type="submit" value="確認點餐" class="button button-3d" style="font-family:ShowWind;font-size:25px;font-weight:bold">
	</form>
	<br>
	<br>
		<form METHOD="post" ACTION="order.do">
		<input type="hidden" name="action" value="keep_order">
		<input type="submit" value="繼續點餐" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:25px;font-weight:bold">
	</form>
</div>
<link rel="stylesheet" href="../css/buttons.css">
</body>
</html>