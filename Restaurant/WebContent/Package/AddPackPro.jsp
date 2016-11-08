<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
// 	ProductVO proVO = (ProductVO) request.getAttribute("proVO");

	ProductService proSvc = new ProductService();
	Integer SelectMAXPack = proSvc.SelectMAXPack(2);
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

<html>
<head>
	<title>新增套餐菜色</title>
</head>
<link rel="stylesheet" type="text/css" href="../js/calendar.css">
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>

<script>
	$(function() {
		$("#NewFileUp").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#Browse').attr('src', e.target.result);
				}

				reader.readAsDataURL(this.files[0]);
			}
		});
		
		$('input[name="product_id"]').click(function() {

			$('#addPro div').attr("hidden", "hidden");
			var aa = $(this).val();
			var bb = "#" + aa;

			$(bb).removeAttr("hidden");
		});
		

	});
</script>

<body bgcolor='white'>
<div align="center">
<a href="../index.jsp">回首頁</a>
	
			<tr align='center' valign='middle' height='20'>
				<td><h3>新增套餐菜色</h3>
			</tr>
 
 <c:if  test="${not empty errorMsgs}"> 
 	<font color='red'>請修正以下錯誤: 
		<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
			</ul>
	</font> 
</c:if>
<c:if test="${empty PVO}">

				<FORM METHOD="post" ACTION="pro.do" name="form0">
				<tr>
					<td>前菜:</td>
					<td><select name="Class_number10">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td>沙拉:</td>
					<td><select name="Class_number20">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td>湯品:</td>
					<td><select name="Class_number30">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td>主菜:</td>
					<td><select name="Class_number40">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td>甜點:</td>
					<td><select name="Class_number50">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td>飲料:</td>
					<td><select name="Class_number60">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
				</tr>
				<br>
				<input type="hidden" name="pcg_id" value="<%=SelectMAXPack%>">
				<input type="hidden" name="action" value="insertClassNum"> 
				<input type="submit" value="設定">
				</FORM>
</c:if>

<c:if test="${not empty PVO}">
<tr>
	<br>
	<br>
		<input type="radio" name="product_id" value="Appetizer">前菜
		<input type="radio" name="product_id" value="Salad">沙拉
		<input type="radio" name="product_id" value="Soup">湯品
		<input type="radio" name="product_id" value="Main">主菜
		<input type="radio" name="product_id" value="Dessert">甜點
		<input type="radio" name="product_id" value="Drink" >飲料
</tr>	
				
	<table border="0" id="addPro">
		<tr align="center">
				<td>
			<div hidden id="Appetizer">
				<FORM METHOD="post" ACTION="pro.do" name="form1">
					前菜:<select size="1" name="product_name">
					<c:forEach var="getAppetizer" items="${getAppetizer}">
						<option value="${getAppetizer.product_name}">${getAppetizer.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="10"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Salad">
				<FORM METHOD="post" ACTION="pro.do" name="form2">
					沙拉:<select size="1" name="product_name">
					<c:forEach var="getSalad" items="${getSalad}">
						<option value="${getSalad.product_name}">${getSalad.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="20"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Soup">
				<FORM METHOD="post" ACTION="pro.do" name="form3">
					湯品:<select size="1" name="product_name">
					<c:forEach var="getSoup" items="${getSoup}">
						<option value="${getSoup.product_name}">${getSoup.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="30"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Main">
				<FORM METHOD="post" ACTION="pro.do" name="form4">
					主菜:<select size="1" name="product_name">
					<c:forEach var="getMain" items="${getMain}">
						<option value="${getMain.product_name}">${getMain.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="40"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Dessert">
				<FORM METHOD="post" ACTION="pro.do" name="form5">
					甜點:<select size="1" name="product_name">
					<c:forEach var="getDessert" items="${getDessert}">
						<option value="${getDessert.product_name}">${getDessert.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="50"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Drink">
				<FORM METHOD="post" ACTION="pro.do" name="form6">
					飲料:<select size="1" name="product_name">
					<c:forEach var="getDrink" items="${getDrink}">
						<option value="${getDrink.product_name}">${getDrink.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="60"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
				</td>
				

	<br>
	<br>
		</tr>
	</table> 
 	
			<jsp:include page="/Package/SelectOnePro.jsp" />
			<jsp:include page="/Package/AddOnePro.jsp" />
</c:if>
</body>

</html>
