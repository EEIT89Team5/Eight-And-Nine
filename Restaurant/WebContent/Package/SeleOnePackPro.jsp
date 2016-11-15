<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");
	ProductService proSvc = new ProductService();
	Integer SelectMAXPack = proSvc.SelectMAXPack(2);

	List<ProductVO> getPro = proSvc.getPro(SelectMAXPack);
	pageContext.setAttribute("getPro", getPro);
%>

<html>
<head>
	<title>商品資料</title>
</head>

<c:if  test="${not empty errorMsgs}"> <font color='red'>請修正以下錯誤:
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
</c:if>

<body bgcolor='white'>
	<div align="center">
		<table border='1' bordercolor='#CCCCFF' width='800'>
			<tr>
					<th>商品編號</th>
					<th>商品名稱</th>
					<th>售價</th>
					<th>類別</th>
					<th>菜色種類</th>
					<th>屬於套餐</th>
			</tr>
				<c:forEach var="getPro" items="${getPro}">
			<tr align='center' valign='middle'>
								<td>${proVO.product_id}</td>
								<td>${getPro.product_name}</td>
								<td>${getPro.product_price}</td>
								<td>${getPro.product_kind}</td>
								<td>${getPro.product_class}</td>
								<td>${getPro.product_pcg}</td>
				<td>			
					<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/product/pro.do">
							<input type="submit" value="刪除"> 
							<input type="hidden" name="product_id" value="${getPro.product_id}"> 
							<input type="hidden" name="action" value="deletePackPro">
					</FORM>
				</td>
			</tr>
				</c:forEach>
		
		</table>

	</div>
	
</body>

</html>
