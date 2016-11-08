<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>

<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");
%>

<html>
<head>
	<title>單點商品修改</title></head>
<link rel="stylesheet" type="text/css" href="../js/calendar.css">
<script language="JavaScript" src="../js/calendarcode.js"></script>
<script>
$(function()
		{
			$("#NewFileUp").change(function(){
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
			<td>
			<h3>商品修改</h3>
			<a href="../index.jsp">回首頁</a>
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

<FORM  METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data" >

<table border="0">
	<tr>
		<td>商品編號:<font color=red><b>*</b></font></td>
		<td><%=proVO.getProduct_id()%></td>
	</tr>
	
	<tr>
		<td>商品名稱:</td>
		<td>
			<input type="TEXT" name="product_name" size="25" value="<%=proVO.getProduct_name()%>" />
		</td>
	</tr>
	
	<tr>
		<td>售價:</td>
		<td>
			<input type="TEXT" name="product_price" size="7"	value="<%=proVO.getProduct_price()%>" />
		</td>
	</tr>
		
	<tr>
		<td>套餐:<font color=red><b>*</b></font></td>

		<td>
	<%=proVO.getProductKindVO().getKind_name()%>
		</td>
	</tr>
	
	<tr>
		<td>類別:</td>
		<td>
<select name="product_class">
	
　	<option value="10" <c:if test="${proVO.getDishClassVO().getClass_id()==10}">selected</c:if>>前菜</option>
　	<option value="20" <c:if test="${proVO.getDishClassVO().getClass_id()==20}">selected</c:if>>沙拉</option>
	<option value="30" <c:if test="${proVO.getDishClassVO().getClass_id()==30}">selected</c:if>>湯品</option>
	<option value="40" <c:if test="${proVO.getDishClassVO().getClass_id()==40}">selected</c:if>>主菜</option>
	<option value="50" <c:if test="${proVO.getDishClassVO().getClass_id()==50}">selected</c:if>>甜點</option>
	<option value="60" <c:if test="${proVO.getDishClassVO().getClass_id()==60}">selected</c:if>>飲料</option>
	
</select>
		</td>
</tr>


	<tr>
		<td>上架/下架:</td>
		<td>
<select name="inMenu">
	　		<option value="1" <c:if test="${proVO.inMenu==1}">selected</c:if>>存在</option>
　			<option value="0" <c:if test="${proVO.inMenu==0}">selected</c:if>>不存在</option>
</select>

		</td>
	</tr>
	
	<tr>
		<td>簡介:</td>
		<td>
			<textarea cols="40" rows="5"  name="product_intro" ></textarea>
		</td>
	</tr>

<br>

	<tr>
	
</table>

<br>

<input type="hidden" name="action" value="update">
<input type="hidden" name="product_id" value="<%=proVO.getProduct_id()%>">
<input type="hidden" name="product_kind" value="<%=proVO.getProductKindVO().getKind_id()%>">

<input type="submit" value="送出修改">

</FORM>

</div>

</body>

</html>

