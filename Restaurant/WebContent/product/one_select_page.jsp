<%@page import="com.product.model.ProductVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/jquery-1.12.3.min.js"></script>
<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");

	ProductService proSvc = new ProductService();
	List<ProductVO> getAppetizer = proSvc.getOneClass(10,0);
	pageContext.setAttribute("getAppetizer", getAppetizer);
	List<ProductVO> getSalad = proSvc.getOneClass(20,0);
	pageContext.setAttribute("getSalad", getSalad);
	List<ProductVO> getSoup = proSvc.getOneClass(30,0);
	pageContext.setAttribute("getSoup", getSoup);
	List<ProductVO> getMain = proSvc.getOneClass(40,0);
	pageContext.setAttribute("getMain", getMain);
	List<ProductVO> getDessert = proSvc.getOneClass(50,0);
	pageContext.setAttribute("getDessert", getDessert);
	List<ProductVO> getDrink = proSvc.getOneClass(60,0);
	pageContext.setAttribute("getDrink", getDrink);
%>
<script>
	$(function(){
		//點擊 input name 是product_id時 全部table下的div都隱藏 但是點擊的那個input的val取出來移除隱藏效果
	$('input[name="product_id"]').click(function() {

			$('table div').attr("hidden", "hidden");
			var aa = $(this).val();
			var bb = "#" + aa;

			$(bb).removeAttr("hidden");
		});
	});
</script>

<head>
	<title>商品單筆查詢</title>
</head>


<body bgcolor='white'>
<br>
	<div align="center">


	
	
查詢項目
<br>
<br>
		<input type="radio" name="product_id" value="Appetizer">前菜
		<input type="radio" name="product_id" value="Salad">沙拉
		<input type="radio" name="product_id" value="Soup">湯品
		<input type="radio" name="product_id" value="Main">主菜
		<input type="radio" name="product_id" value="Dessert">甜點
		<input type="radio" name="product_id" value="Drink" >飲料

	<table border="0">	
		<td>
	<div hidden id="Appetizer">
		<FORM METHOD="post" ACTION="pro.do" name="form1">
			前菜:<select size="1" name="product_id">
					<c:forEach var="getAppetizer" items="${getAppetizer}">
						<option value="${getAppetizer.product_id}">${getAppetizer.product_name}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="getOne_For_Display"> 
				<input type="submit" value="查詢">
		</FORM>
	</div>
		</td>
	
		<td>
	<div hidden id="Salad">
		<FORM METHOD="post" ACTION="pro.do" name="form2">
			沙拉:<select size="1" name="product_id">
					<c:forEach var="getSalad" items="${getSalad}">
						<option value="${getSalad.product_id}">${getSalad.product_name}
					</c:forEach>
				</select>

				<input type="hidden" name="action" value="getOne_For_Display"> 
				<input type="submit" value="查詢">
		</FORM>
	</div>
		</td>
		
		<td>
	<div hidden id="Soup">
		<FORM METHOD="post" ACTION="pro.do" name="form3">
			湯品:<select size="1" name="product_id">
					<c:forEach var="getSoup" items="${getSoup}">
						<option value="${getSoup.product_id}">${getSoup.product_name}
					</c:forEach>
				</select> 

				<input type="hidden" name="action" value="getOne_For_Display"> 
				<input type="submit" value="查詢">
		</FORM>
	</div>
		</td>
	
		<td>
	<div hidden id="Main">
		<FORM METHOD="post" ACTION="pro.do" name="form4">
			主菜:<select size="1" name="product_id">
					<c:forEach var="getMain" items="${getMain}">
						<option value="${getMain.product_id}">${getMain.product_name}
					</c:forEach>
				</select>

				<input type="hidden" name="action" value="getOne_For_Display"> 
				<input type="submit" value="查詢">
		</FORM>
	</div>
		</td>
		
		<td>
	<div hidden id="Dessert">
		<FORM METHOD="post" ACTION="pro.do" name="form5">
			甜點:<select size="1" name="product_id">
					<c:forEach var="getDessert" items="${getDessert}">
						<option value="${getDessert.product_id}">${getDessert.product_name}
					</c:forEach>
				</select>

				<input type="hidden" name="action" value="getOne_For_Display"> 
				<input type="submit" value="查詢">
		</FORM>
	</div>
		</td>
		
		<td>
	<div hidden id="Drink">
		<FORM METHOD="post" ACTION="pro.do" name="form6">
			飲料:<select size="1" name="product_id">
					<c:forEach var="getDrink" items="${getDrink}">
						<option value="${getDrink.product_id}">${getDrink.product_name}
					</c:forEach>
				</select>

	<input type="hidden" name="action" value="getOne_For_Display"/> 
	<input type="submit" value="查詢">
		</FORM>
	</div>	
		</td>


</table>
<br>
<br>
<br>
	</div>

			<c:if test="${!empty proVO}">
				<jsp:include page="/product/listOnePro.jsp" />
			</c:if>

</body>

</html>
