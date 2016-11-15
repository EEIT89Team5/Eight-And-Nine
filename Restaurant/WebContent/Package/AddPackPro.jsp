<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
// 	ProductVO proVO = (ProductVO) request.getAttribute("proVO");

	ProductService proSvc = new ProductService();
	Integer SelectMAXPack = proSvc.SelectMAXPack(2);
	List<ProductVO> getAppetizer = proSvc.getOneClass(10,1);
	pageContext.setAttribute("getAppetizer", getAppetizer);
	List<ProductVO> getSalad = proSvc.getOneClass(20,1);
	pageContext.setAttribute("getSalad", getSalad);
	List<ProductVO> getSoup = proSvc.getOneClass(30,1);
	pageContext.setAttribute("getSoup", getSoup);
	List<ProductVO> getMain = proSvc.getOneClass(40,1);
	pageContext.setAttribute("getMain", getMain);
	List<ProductVO> getDessert = proSvc.getOneClass(50,1);
	pageContext.setAttribute("getDessert", getDessert);
	List<ProductVO> getDrink = proSvc.getOneClass(60,1);
	pageContext.setAttribute("getDrink", getDrink);
%>

<html>
<head>
	<title>新增套餐菜色</title>
<style>
#bbody{
background: #333;
}
@font-face {  
font-family: "ShowWind";  
src: url("../font/ShowWind.ttc");  
}
td{
font-family:ShowWind;
font-size:25px;
color:white;
}
.font1{
font-family:ShowWind;
font-size:25px;
color:white;
}
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
th{
font-family: ShowWind;
font-size:25px;
font-weight:bold;
color:white;
background: #333;
text-align: center
}
</style>
</head>

<body id="bbody">
<div align="center">
<img src="../img/packlogo.png"><br>
 
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
		<tr align='center' valign='middle' height='20'>
				<h3><font class="font1">請選擇限制種類數量</font></h3>
			</tr>
				<FORM METHOD="post" ACTION="pro.do" name="form0">
				<tr>
					<td><font class="font1">前菜:</font></td>
					<td><select name="Class_number10">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td><font class="font1">沙拉:</font></td>
					<td><select name="Class_number20">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td><font class="font1">湯品:</font></td>
					<td><select name="Class_number30">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td><font class="font1">主菜:</font></td>
					<td><select name="Class_number40">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td><font class="font1">甜點:</font></td>
					<td><select name="Class_number50">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td><font class="font1">飲料:</font></td>
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
				<br>
				<input type="hidden" name="pcg_id" value="<%=SelectMAXPack%>">
				<input type="hidden" name="action" value="insertClassNum"> 
				<input type="submit" value="設定" class="btn btn-success" style="font-family:ShowWind;font-size:20px">
				</FORM>
</c:if>

<c:if test="${not empty PVO}">
<tr>
	<br>
	<br>
		<input type="radio" name="product_id" value="Appetizer"><font class="font1">前菜</font>
		<input type="radio" name="product_id" value="Salad"><font class="font1">沙拉</font>
		<input type="radio" name="product_id" value="Soup"><font class="font1">湯品</font>
		<input type="radio" name="product_id" value="Main"><font class="font1">主菜</font>
		<input type="radio" name="product_id" value="Dessert"><font class="font1">甜點</font>
		<input type="radio" name="product_id" value="Drink" ><font class="font1">飲料</font>
</tr>	
				
	<table border="0" id="addPro">
		<tr align="center">
				<td>
			<div hidden id="Appetizer">
				<FORM METHOD="post" ACTION="pro.do" name="form1">
					<font class="font1">前菜:</font><select size="1" name="product_name" style="color:black">
					<c:forEach var="getAppetizer" items="${getAppetizer}">
						<option value="${getAppetizer.product_name}">${getAppetizer.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="10"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Salad">
				<FORM METHOD="post" ACTION="pro.do" name="form2">
					<font class="font1">沙拉:</font><select size="1" name="product_name" style="color:black">
					<c:forEach var="getSalad" items="${getSalad}">
						<option value="${getSalad.product_name}">${getSalad.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="20"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Soup">
				<FORM METHOD="post" ACTION="pro.do" name="form3">
					<font class="font1">湯品:</font><select size="1" name="product_name" style="color:black">
					<c:forEach var="getSoup" items="${getSoup}">
						<option value="${getSoup.product_name}">${getSoup.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="30"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Main">
				<FORM METHOD="post" ACTION="pro.do" name="form4">
					<font class="font1">主菜:</font><select size="1" name="product_name" style="color:black">
					<c:forEach var="getMain" items="${getMain}">
						<option value="${getMain.product_name}">${getMain.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="40"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Dessert">
				<FORM METHOD="post" ACTION="pro.do" name="form5">
					<font class="font1">甜點:</font><select size="1" name="product_name" style="color:black">
					<c:forEach var="getDessert" items="${getDessert}">
						<option value="${getDessert.product_name}">${getDessert.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="50"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
				</td>
				
				<td>
			<div hidden id="Drink">
				<FORM METHOD="post" ACTION="pro.do" name="form6">
					<font class="font1">飲料:</font><select size="1" name="product_name" style="color:black">
					<c:forEach var="getDrink" items="${getDrink}">
						<option value="${getDrink.product_name}">${getDrink.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="<%=SelectMAXPack%>"> 
							<input type="hidden" name="product_class" value="60"> 
							<input type="hidden" name="action" value="insertPackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
				</td>
	<br>
		</tr>
	</table>
 <div align="center">
 	<br>			
	<table border='1' bordercolor='#CCCCFF'>
	
	<tr align='center' valign='middle'>

		<img width='500px' height="400px" src='${pageContext.servletContext.contextPath}/getImage?id=<%=SelectMAXPack%>'>
	</tr>
				
	</table>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
					<tr align='center' valign='middle' height='20'>
				<td style="font-size:30px">套餐所屬菜色</td><br>
					</tr>
	</table>

</div>
			<jsp:include page="/Package/AddOnePro.jsp" />
</c:if>

<script src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">

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

</body>

</html>
