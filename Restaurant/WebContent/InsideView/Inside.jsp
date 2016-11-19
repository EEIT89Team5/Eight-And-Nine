<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orderx.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

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

<script>
	var websocket =new WebSocket("ws://localhost:8080/Restaurant/chatroomServerEndpoint");
	websocket.onopen = function(evt){
		console.log("open");
	}
	 function sendMessage(){
		 console.log(messageText.value);
		 websocket.send(messageText.value);
		 messageText.value="";
	 }
</script>
<style>
@font-face {  
  font-family:"ShowWind";  
  src: url("../font/BoldFace.ttc"); 
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
th{ 
font-family:"ShowWind";  
/* text-align: center; */
font-weight:bolder;
font-size: 40px;
color: white;
width: 1500;
}
td{
 background:rgba(0%,0%,0%,0.1); 
font-family:"ShowWind";
font-weight:bolder;
font-size: 28px;
color: white;
/* background:rgba(0%,0%,0%,0.1); */
}
 #divdiv{/*控制TABLE的DIV */
/* margin:0px auto; */
width: 2000px;
}
</style>
<head>
<title>內場資訊 </title>
</head>
<body style="background-color:black">
		<h3  align="center" style="font-family:ShowWind ;font-size: 50px;color: white">內場資訊 </h3>
</table>

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
<table  class="table table-hover" >
	<tr>
		<th>桌號</th>
		<th>前菜</th>
		<th>沙拉</th>
		<th>湯品</th>
		<th>主菜</th>
		<th>甜點</th>
		<th>飲料</th>
		
<!-- 		<th>狀態</th> -->
		
	</tr>
	<c:set var="xx" value="0"></c:set> <%-- 使桌號第一次進入時必不相同 --%>
	<c:forEach var="orderX" items="${list}">
	<FORM METHOD="post" ACTION="Inside.do">
	<c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><%-- 如果菜色狀態完成則不會顯示在表格內 --%>
  	<c:if test="${xx!=orderX.orderVO.order_table}"> <%--不同桌次建立TRTD桌次 --%>
 			<tr><td>${orderX.orderVO.order_table}</td>
<%--  			<td><div>${orderX.productVO.product_name}</div> --%>
	
 			<c:choose>  <%--第一筆菜色類別的位置 --%>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==10}"><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br>${orderX.orderX_status}</c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==20}"><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br>${orderX.orderX_status}</c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==30}"><td></td><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==40}"><td></td><td></td><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==50}"><td></td><td></td><td></td><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==60}"><td></td><td></td><td></td><td></td><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 			</c:choose>
  	</c:if><%--不同桌次判定完成 --%>
   	<c:if test="${xx==orderX.orderVO.order_table}"><%-- 若桌次相同則進入 --%>
  	  		<c:if test="${classxx==orderX.productVO.dishClassVO.class_id}"><%--若類別相同則同TD內再開一個DIV --%>
	 			<c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}">
	 			<input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if>
	 		</c:if>
			<c:if test="${classxx!=orderX.productVO.dishClassVO.class_id }"> <%-- 若類別不同 --%>
  				<c:if test="${(orderX.productVO.dishClassVO.class_id-classxx)==10}"><%-- 若兩類別差距一格則開一個TD --%>
				<td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}">
				<input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br>
				</c:if>
				</c:if>
				</c:if>
				<c:if test="${(orderX.productVO.dishClassVO.class_id-classxx)>10 }"><%-- 若兩類別差距超過一格 --%>
					<c:forEach var="num" begin="1" end="${(orderX.productVO.dishClassVO.class_id-classxx)/10-1}">
 				<td></td> <!--依差距建立對應的TD -->
				</c:forEach>
				<td>
				<c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}">
				<input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br>
				</c:if>
 			</c:if>
			
 		</c:if>
 		
	<c:set var="classxx" value="${orderX.productVO.dishClassVO.class_id}"></c:set><%--類別佔存 --%>
 	<c:set var="xx" value="${orderX.orderVO.order_table}"></c:set><%--桌次站存 --%>
 	</c:if> <%-- 如果菜色狀態完成則不會顯示在表格內 --%>
 			 <input type="hidden" name="orderX_time" value="${orderX.orderX_time}">
			 <input type="hidden" name="product_id" value="${orderX.productVO.product_id}">
			 <input type="hidden" name="order_id" value="${orderX.orderVO.order_id}">
			 <input type="hidden" name="orderX_status" value="${orderX.orderX_status}">
			 <input type="hidden" name="orderX_num" value="${orderX.orderX_num}">
 			 <input type="hidden" name="action"	value="update"> 
</FORM>
	</c:forEach>

<!-- 	====================以下為原始檔========================================= -->
<%-- 	<c:forEach var="orderX" items="${list}" > --%>
<%-- 	<c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"> --%>
<!-- 		<tr align='center' valign='middle'}> -->
<!-- 			<FORM METHOD="post" ACTION="Inside.do"> -->
<%-- 			<td>${orderX.orderVO.order_id}</td> --%>
<%-- 			<td>${orderX.orderX_time}</td> --%>
<%-- 			<td>${orderX.orderVO.order_table}</td> --%>
<%-- 			<td>${orderX.productVO.product_id}</td> --%>
<%-- 			<td>${orderX.productVO.product_name}</td> --%>
<%-- 			<td>${orderX.orderX_num}</td> --%>
<%-- 			<td>${orderX.orderX_status}</td> --%>
			
<!-- 			<td> <input type="submit"  value="修改"  onclick="sendMessage();" id="messageText"></td> -->
			
			 <input type="hidden" name="orderX_time" value="${orderX.orderX_time}">
			 <input type="hidden" name="product_id" value="${orderX.productVO.product_id}">
			 <input type="hidden" name="order_id" value="${orderX.orderVO.order_id}">
			 <input type="hidden" name="orderX_status" value="${orderX.orderX_status}">
			 <input type="hidden" name="orderX_num" value="${orderX.orderX_num}">
<!-- 			 <input type="hidden" name="action"	value="update"> -->
<!-- 			</FORM> -->
	

<!-- 		</tr> -->
<%-- 	</c:if> --%>
<%-- 	</c:forEach> --%>
<!-- 	===================以上為原始檔======================================== -->
</table>
</div>
</body>
<script>
$(function(){
	$("tr").mouseover(over).mouseout(out);
	

	function over() {
		$(this).css('background-color','rgba(100,100,100,0.4)');
	}
	function out() {
		$(this).css('background-color','black');
	}
	
})

</script>
</html>
