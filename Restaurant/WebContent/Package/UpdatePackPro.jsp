<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

ProductService proSvc = new ProductService();
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
font-size:32px;
color:white;
background: #333;
}
th{
font-family: ShowWind;
font-size:25px;
font-weight:bold;
color:white;
background: #333;
}
.font1{
font-family:ShowWind;
font-size:25px;
color:white;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="../js/sweetalert.css">
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<script language="JavaScript" src="../js/sweetalert.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">

<script>
	$(function() {
		
		$('input[name="productid"]').click(function() {

			$('#addPro div').attr("hidden", "hidden");
			var aa = $(this).val();
			var bb = "#" + aa;

			$(bb).removeAttr("hidden");
		});
		
		var del=null;
		$("input[name='delete']").click(function(){
				del=$(this);
			sweetAlert({
				  title: "此事當真?",
				  text: "您確定要將此筆資料刪除嗎?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "刪除此筆資料",
				  cancelButtonText: "放棄刪除",
				  closeOnConfirm: false,
				  closeOnCancel: false
				},
				function(isConfirm){
				  if (isConfirm) {
					 del.parent().submit();
				  } else {
					 sweetAlert("已取消", "您已取消刪除此筆資料", "error");
				  }
				});
		})

	});
</script>

<body id="bbody">
	<div align="center">
	<img src="../img/packlogo.png"><br>


<br>
<br>
<tr>
		<input type="radio" name="productid" value="Appetizer"><font class="font1">前菜</font>
		<input type="radio" name="productid" value="Salad"><font class="font1">沙拉</font>
		<input type="radio" name="productid" value="Soup"><font class="font1">湯品</font>
		<input type="radio" name="productid" value="Main"><font class="font1">主菜</font>
		<input type="radio" name="productid" value="Dessert"><font class="font1">甜點</font>
		<input type="radio" name="productid" value="Drink" ><font class="font1">飲料</font>
		
			
<table border="0" id="addPro">
		<td>
			<div hidden id="Appetizer" align="center"> 
				<FORM METHOD="post" ACTION="pro.do" name="form1">
					<font class="font1">前菜:</font>
					<select size="1" name="product_name" class="font1" style="color:black">
					<c:forEach var="getAppetizer" items="${getAppetizer}">
						<option value="${getAppetizer.product_name}">${getAppetizer.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="10"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
		</td>
		
		<td>
			<div hidden id="Salad" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form2">
					<font class="font1">沙拉:</font>
					<select size="1" name="product_name" class="font1" style="color:black">
					<c:forEach var="getSalad" items="${getSalad}">
						<option value="${getSalad.product_name}">${getSalad.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}">
							<input type="hidden" name="product_class" value="20">
 							<input type="hidden" name="action" value="UpdatePackagePro">
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
		</td>
				
		<td>
			<div hidden id="Soup" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form3">
					<font class="font1">湯品:</font>
					<select size="1" name="product_name" class="font1" style="color:black">
					<c:forEach var="getSoup" items="${getSoup}">
						<option value="${getSoup.product_name}">${getSoup.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="30"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
		</td>
				
		<td>
			<div hidden id="Main" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form4">
					<font class="font1">主菜:</font>
					<select size="1" name="product_name" class="font1" style="color:black">
					<c:forEach var="getMain" items="${getMain}">
						<option value="${getMain.product_name}">${getMain.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="40"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
		</div>
		</td>
				
		<td>
			<div hidden id="Dessert" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form5">
					<font class="font1">甜點:</font>
					<select size="1" name="product_name" class="font1" style="color:black">
					<c:forEach var="getDessert" items="${getDessert}">
						<option value="${getDessert.product_name}">${getDessert.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="50"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
		</td>
		
		<td>
			<div hidden id="Drink" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form6">
					<font class="font1">飲料:</font>
					<select size="1" name="product_name" class="font1" style="color:black">
					<c:forEach var="getDrink" items="${getDrink}">
						<option value="${getDrink.product_name}">${getDrink.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="60"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增" class="btn btn-info" style="font-family:ShowWind;font-size:18px">
				</FORM>
			</div>
		</td>
</tr>
<br>
<br>
					
</table> 
	<br>	
<table class="table table-striped" style="width: 1300px">
						
			<tr>
				<th style="text-align: center">商品編號</th>
				<th style="text-align: center">商品名稱</th>
				<th style="text-align: center">菜色種類</th>
				<th style="text-align: center">刪除</th>
			</tr>
			
		<c:forEach var="proVO" items="${proVO}" >
			<tr align='center' valign='middle'>
				<td>${proVO.product_id}</td>
				<td>${proVO.product_name}</td>
				<td>${proVO.dishClassVO.class_name}</td>
			
				<td>		
	<FORM METHOD="post" name="DleteForm" ACTION="<%=request.getContextPath()%>/product/pro.do">
			<input type="button" name="delete" value="刪除" class="btn btn-primary" style="font-family:ShowWind;font-size:23px"> 
			<input type="hidden" name="product_id" value="${proVO.product_id}">
			<input type="hidden" name="product_pcg" value="${proVO.product_pcg}">
			<input type="hidden" name="action" value="UpdatePackDelete" >
	</FORM>
				</td>
			</tr>
		</c:forEach>
		
</table>
	</div>

</body>

</html>
