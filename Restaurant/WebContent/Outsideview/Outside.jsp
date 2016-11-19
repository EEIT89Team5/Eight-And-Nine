<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orderx.model.*"%>

<%
OrderXService svc = new OrderXService();
java.sql.Date d=new java.sql.Date(System.currentTimeMillis());
java.sql.Date d2=java.sql.Date.valueOf("2016-10-10");
    
//  	List<KitchenVO> list = dao.getAll(d2);//指定當日
    
    List<OrderXVO> list = svc.getAll(d);
    
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
<style>

@font-face {  
  font-family:"ShowWind";  
  src: url("../font/BoldFace.ttc"); 
}
th{
text-align: center;
font-weight:bolder;
font-size: 40px;
}
td{
font-family:"ShowWind";
font-weight:bolder;
font-size: 30px;
 background:rgba(100%,100%,100%,0.6); */
}
.button2 {
    background-color: white;
    color: black;
    border: 2px solid #008CBA;
}

.button2:hover {
    background-color: #008CBA;
    color: white;
}
 #divdiv{/*控制TABLE的DIV */
 margin:0px auto;
width: 1300px;
}
</style>
<script>
var websocket =new WebSocket("ws://localhost:8080/Restaurant/chatroomServerEndpoint");

websocket.onmessage = function processMessage(message){
	
	console.log(message);

	window.location.reload();
}
 function sendMessage(){
	 console.log(messageText.value);
	 websocket.send(messageText.value);
	 messageText.value="";
	 
 } 
</script>
<head>
<title>出餐口資訊 </title>
</head>
<body  background="../Outsideview/images/bg.jpg" style="background-size: cover">
		<h3  align="center" style="font-family:ShowWind ;font-size: 50px;">出餐口資訊 </h3>



<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<div id='divdiv'>
<table class="table table-hover" >

	<tr>
<!-- 		<th>訂單編號</th> -->
<!-- 		<th>訂單時間</th> -->
		<th>訂單桌號</th>
<!-- 		<th>菜色編號</th> -->
		<th>菜色名稱</th>
		<th>菜色數量</th>
		<th>出餐狀態</th>
		<th>完成</th>
	</tr>

	<c:forEach var="orderX" items="${list}">
		<c:if test="${orderX.orderX_status=='待出餐'}">
		<tr align='center' valign='middle'>
			<FORM METHOD="post" ACTION="Outside.do">
			
<%-- 			<td>${orderX.orderVO.order_id}</td> --%>
<%-- 			<td>${orderX.orderX_time}</td> --%>
			<td>${orderX.orderVO.order_table}</td>
<%-- 			<td>${orderX.productVO.product_id}</td> --%>
			<td>${orderX.productVO.product_name}</td>
			<td>${orderX.orderX_num}</td>
			<td>${orderX.orderX_status}</td>
			<td> <input type="submit"  value="出餐"  class="button2"  ></td>
			<input type="hidden" name="order_table" value="${orderX.orderVO.order_table}">
			 <input type="hidden" name="orderX_time" value="${orderX.orderX_time}">
			 <input type="hidden" name="product_id" value="${orderX.productVO.product_id}">
			 <input type="hidden" name="order_id" value="${orderX.orderVO.order_id}">
			 <input type="hidden" name="orderX_status" value="${orderX.orderX_status}">
			 <input type="hidden" name="orderX_num" value="${orderX.orderX_num}">
			 <input type="hidden" name="action"	value="update2">
			</FORM>
	
<%-- 			<td>${empVO.ename}</td> --%>
<%-- 			<td>${empVO.job}</td> --%>
<%-- 			<td>${empVO.hiredate}</td> --%>
<%-- 			<td>${empVO.sal}</td> --%>
<%-- 			<td>${empVO.comm}</td> --%>
<%-- 			<td>${empVO.deptno}</td> --%>

		</tr>
		</c:if>
	</c:forEach>
</table>
</div>

</body>
</html>
