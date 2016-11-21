<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="orderSvc" scope="page" class="com.order.model.OrderService" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單資料 - listAllOrder.jsp</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
<style>
body{
background-image: url("../img/0003.png");
background-size: cover;
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
td{
font-family:"ShowWind";
color:white;
font-size:25px;
text-align:center;
width: 130px;
font-weight:bold
}
th{
font-family:"ShowWind";
color:yellow;
font-size:30px;
text-align:center;
}
</style>
</head>
<body>
<div align="center">
<img src="../img/ORDERLOGO.png"><br><br>
<img src="../img/select.png">
<h2>訂單</h2><br/>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<table class="table" id="orderlist">
	<thead>
		<tr>
			<th>ID</th>
			<th>桌位</th>
			<th>日期</th>
			<th>總金額</th>
			<th>人數</th>
			<th>會員編號</th>
			<th>會員名稱</th>
			<th>員工</th>
			<th>姓名</th>
			<th>折扣</th>
			<th>名稱</th>
			<th>數值</th>
			<th>結帳時刻</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="orderVO" items="${orderSvc.getAllOrder()}">
			<tr>
			<td>${orderVO.order_id}</td>
			<td>${orderVO.order_table}</td>
			<td>${orderVO.order_date}</td>
			<td>${orderVO.order_price}</td>
			<td>${orderVO.order_numP}</td>
			<td>${orderVO.memberVO.member_id}</td>
			<td>${orderVO.memberVO.member_name}</td>
			<td>${orderVO.empVO.emp_id}</td>
			<td>${orderVO.empVO.emp_name}</td>
			<td>${orderVO.discountVO.disc_id}</td>
			<td>${orderVO.discountVO.disc_name}</td>
			<td>${orderVO.discountVO.disc_value}</td>
			<td>${orderVO.order_paytime}</td>
			<td>
				<form METHOD="post" action="order.do">
					<input type="hidden" name="orderno" value="${orderVO.order_id}">
					<input type="hidden" name="action" value="get_one_for_display">
					<input type="submit" value="明細" class="button button-pill" style="font-family:ShowWind;font-size:20px;font-weight: bold;">
				</form>
			</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
<br>
<br>
<br>
<a href="../index.jsp" class="button button-pill button-highlight" style="font-family:ShowWind;font-size:25px;font-weight:bold"> 回首頁 </a>
</div>
<script src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../css/buttons.css">
<script>
$(document).ready(function() {

	$.each($('#orderlist tbody tr'),function(){
		var x = $(this).find('td:eq(12)');
		x.text(x.text().substring(0,19));
	});
	
});
</script>
</body>
</html>