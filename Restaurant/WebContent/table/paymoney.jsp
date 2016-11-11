<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>結帳清單</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
#maindiv{
	width:500px;
	margin:0 auto;
	border:6px solid red;
	padding:20px;
	font-size:25px;
	font-weight:bold;
	}
</style>
<script>
$(function(){
	var total = $('#total').html()
	$('#discounts').change(function(){
		var dis = $(this).find('option:selected');
		if(dis.val()!=0){
			var array = dis.html().split(",");
// 			alert(array[0]+"///////////"+array[1]);
			$('#dis_name').html(array[0]);
			$('#dis_val').html(array[1]);
			var newTotal = Math.round(total*array[1]);
			$('#total').html(newTotal);
			$('#pricex').val(newTotal);
			$('#discountx').val(dis.val());
// 			console.log($('#pricex').val());
// 			console.log($('#discountx').val());
		}else{
			$('#dis_name').html("");
			$('#dis_val').html("");
			$('#total').html(total);
			$('#pricex').val(total);
			$('#discountx').val("");
		}
	});
});
</script>
</head>
<body>
		<a href="formatTable.do?table=index">回監控畫面</a>
		<jsp:useBean id="disService" class="com.discount.model.DiscountService"/>
		<div>
			<select id="discounts">
				<option value="0">無折扣</option>
				<c:forEach var="discount" items="${disService.all}">
					<option value="${discount.disc_id}">${discount.disc_name},${discount.disc_value}</span></option>
				</c:forEach>
			</select>
		</div>
		<div id="maindiv">
<%-- 		<c:forEach var="bill" items="${bills}" varStatus="ii"> --%>
<%-- 			<c:if test="${ii.first}"> --%>
				桌號:${bills.order_table}<br />
				<c:set var="table" value="${bills.order_table}"/>
				<c:set var="count" value="0"/>
				消費日期:${bills.order_date }<br />
				人數:${bills.order_numP }<br />
				會員:${bills.memberVO.member_name }<br />
				點餐員工:${bills.empVO.emp_name }<br /><hr />
				<table width="500px">
				<tr><td>品名</td><td>價格</td><td>數量</td></tr>

				<c:forEach var="orderx" items="${bills.orderXs}">
					<tr>
						<td>${orderx.productVO.product_name}</td>
						<td>${orderx.productVO.product_price}</td>
						<td>${orderx.orderX_num}</td>
					</tr>
					<c:set var="count" value="${count +orderx.productVO.product_price*orderx.orderX_num}"/>
				</c:forEach>
				</table>
				<hr />
<%-- 				<c:if test="${not empty bills.discountVO}"> --%>
<%-- 					<c:set var="count" value="${count * bills.discountVO.disc_value}"/> --%>
<%-- 					<% double total = (Double)pageContext.getAttribute("count"); --%>
<%-- 					   pageContext.setAttribute("count", Math.round(total));%> --%>
<%-- 				</c:if> --%>
<%-- 				<div width="500px"><span id="dis_name">${bills.discountVO.disc_name}</span> &nbsp;&nbsp;<span id="dis_val">${bills.discountVO.disc_value}</span></div> --%>
				<div width="500px"><span id="dis_name"></span> &nbsp;&nbsp;<span id="dis_val"></span></div>
				<div width="500px"><span>總金額:</span>&nbsp;&nbsp;<span id="total">${count}</span></div>

		</div>
		<form action="formatTable.do">
			<input type="text" hidden name="table" value="money" />
			<input type="text" hidden name="order_table" value="${bills.order_table}" />
			<input type="text" hidden name="order_id" value="${bills.order_id}" />
			<input id="pricex" type="text" hidden name="order_price" value="${count}" />
			<input id="discountx" type="text" hidden name="order_discount" value="" />
			<input type="submit" value="確定明細"/>
		</form>
<!-- 		<a href="formatTable.do?table=money">確定</a> -->
		
		

</body>
</html>