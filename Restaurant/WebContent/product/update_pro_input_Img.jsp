<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>

<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<html>
<head>
	<title>新增商品圖片</title></head>
<link rel="stylesheet" type="text/css" href="../js/calendar.css">
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<script>
$(function()
		{
			$("#FileUp").change(function(){
				if (this.files && this.files[0]) {
					var reader = new FileReader();
					
					reader.onload = function (e) {
						$('#Browse').attr('src', e.target.result);
					}
					
					reader.readAsDataURL(this.files[0]);
				}
			});
			
		
		}) ;

</script>

<body bgcolor='white'>

<div align="center">
	
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr align='center' valign='middle' height='20'>
			<td><h3>新增商品圖片</h3>
			<a href="../index.jsp">回首頁</a></td></tr></table>
	
	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
		</font>
	</c:if>	

<FORM  METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data">

<table border="0">
	<tr>
		<td>商品編號:
		<%=proVO.getProduct_id()%></td>
	</tr>
	<tr>
		<td>商品名稱:
		<%=proVO.getProduct_name()%></td>
	</tr>

	<td>商品圖片:</td>
	
	<tr>
		<td>
			<input type="file" id="FileUp" name="FileUp" size="50" maxlength="20" width="500">
		</td>

	</tr>
	
	<tr>

</table>

<table border='1' bordercolor='black' width='800'>
	<tr>
<th>想要更改的圖片:</th><th>原先的圖片:</th>
	</tr>
<div>

	<tr>
		<td>
<img id="Browse" src="" alt="即將上傳的圖片預覽" width="500" height="400" border="1px"/>
		</td>

		<td>
<img width="500" height="400" src="${pageContext.servletContext.contextPath}/getImage?id=${proVO.product_id}">
		</td>
	</tr>
</div>

<br>

</table>

<br>

		<input type="hidden" name="action" value="UpImg">
		<input type="hidden" name="product_id" value="<%=proVO.getProduct_id()%>">
		<input type="submit" value="送出修改">
</FORM>

</div>

</body>

</html>
