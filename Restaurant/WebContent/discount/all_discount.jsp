<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.discount.model.*"%>
<%-- 此頁採用 JSTL 與 EL 取值 --%>

<%
    DiscountService discSvc = new DiscountService();
    List<DiscountVO> list = discSvc.getAll();
    pageContext.setAttribute("list",list);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>所有折扣資訊</title>
</head>
<body bgcolor='white'>
<div align="center">
<table border='1' cellpadding='5' cellspacing='0' width='600' align="center">
	<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
		<td><h3>所有折扣項目</h3>
		          <a href="../index.jsp">回首頁</a></td></tr></table>

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
  <jsp:useBean id="dsicSvc" scope="page" class="com.discount.model.DiscountService" />
   
  <li>
     <FORM METHOD="post" ACTION="disc.do" >
       <b>選擇折扣編號:</b>
       <select size="1" name="disc_id">
         <c:forEach var="discountVO" items="${dsicSvc.all}" > 
          <option value="${discountVO.disc_id}">${discountVO.disc_id}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="disc.do" >
       <b>選擇折扣名稱:</b>
       <select size="1" name="disc_id">
         <c:forEach var="discountVO" items="${dsicSvc.all}" > 
          <option value="${discountVO.disc_id}">${discountVO.disc_name}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
</ul>


<table border='1' bordercolor='#AAAAAA' width='600' >
	<tr>
		<th>折扣編號</th>
		<th>折扣名稱</th>
		<th>折扣</th>
		<th>修改</th>
		<th>刪除</th>

	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="discVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${discVO.disc_id}</td>
			<td>${discVO.disc_name}</td>
			<td>${discVO.disc_value}</td>

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/discount/disc.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="disc_id" value="${discVO.disc_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/discount/disc.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="disc_id" value="${discVO.disc_id}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</div>
</body>
</html>
