<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orderx.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
OrderXDAO dao = new OrderXDAO();
java.sql.Date d=new java.sql.Date(System.currentTimeMillis());
java.sql.Date d2=java.sql.Date.valueOf("2016-10-10");
    
//  	List<KitchenVO> list = dao.getAll(d2);//指定當日
    
    List<OrderXVO> list = dao.getAll(d);
    
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>出餐口資訊 </title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#00FFFF' align='center' valign='middle' height='20'>
		<td>
		<h3>出餐口資訊 </h3>
		<a href="Outside.jsp"><img src="images/01.jpg" width="200" height="60" border="0">重新整理</a>
		</td>
	</tr>
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

<table border='1' bordercolor='#00BBFF' width='800'>
	<tr>
		<th>訂單編號</th>
<!-- 		<th>訂單時間</th> -->
		<th>訂單桌號</th>
<!-- 		<th>菜色編號</th> -->
		<th>菜色名稱</th>
		<th>菜色數量</th>
		<th>出餐狀態</th>
		<th>完成</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="orderX" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<c:if test="${orderX.orderX_status=='待出餐'&&orderX.orderX_status!='出餐完成'}">
		<tr align='center' valign='middle'}>
			<FORM METHOD="post" ACTION="Outside.do">
			
			<td>${orderX.orderVO.order_id}</td>
<%-- 			<td>${orderX.orderX_time}</td> --%>
			<td>${orderX.orderVO.order_table}</td>
<%-- 			<td>${orderX.productVO.product_id}</td> --%>
			<td>${orderX.productVO.product_name}</td>
			<td>${orderX.orderX_num}</td>
			<td>${orderX.orderX_status}</td>
			<td> <input type="submit"  value="修改"></td>
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
<%@ include file="page2.file" %>
</body>
</html>
