<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

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

<html>
<head>
	<title>新增套餐菜色</title>
</head>
<link rel="stylesheet" type="text/css" href="../js/calendar.css">
<link rel="stylesheet" type="text/css" href="../js/sweetalert.css">
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<script language="JavaScript" src="../js/sweetalert.min.js"></script>

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

<body bgcolor='white'>
	<div align="center">
		<a href="../index.jsp">回首頁</a><br>
<br>
		<tr>新增項目
<br>
<br>
<tr>
		<input type="radio" name="productid" value="Appetizer">前菜
		<input type="radio" name="productid" value="Salad">沙拉
		<input type="radio" name="productid" value="Soup">湯品
		<input type="radio" name="productid" value="Main">主菜
		<input type="radio" name="productid" value="Dessert">甜點
		<input type="radio" name="productid" value="Drink" >飲料
		
			
<table border="0" id="addPro">
		<td>
			<div hidden id="Appetizer" align="center"> 
				<FORM METHOD="post" ACTION="pro.do" name="form1">
					前菜:<select size="1" name="product_name">
					<c:forEach var="getAppetizer" items="${getAppetizer}">
						<option value="${getAppetizer.product_name}">${getAppetizer.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="10"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
		</td>
		
		<td>
			<div hidden id="Salad" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form2">
					沙拉:<select size="1" name="product_name">
					<c:forEach var="getSalad" items="${getSalad}">
						<option value="${getSalad.product_name}">${getSalad.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}">
							<input type="hidden" name="product_class" value="20">
 							<input type="hidden" name="action" value="UpdatePackagePro">
							<input type="submit" value="新增">
				</FORM>
			</div>
		</td>
				
		<td>
			<div hidden id="Soup" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form3">
					湯品:<select size="1" name="product_name">
					<c:forEach var="getSoup" items="${getSoup}">
						<option value="${getSoup.product_name}">${getSoup.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="30"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
		</td>
				
		<td>
			<div hidden id="Main" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form4">
					主菜:<select size="1" name="product_name">
					<c:forEach var="getMain" items="${getMain}">
						<option value="${getMain.product_name}">${getMain.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="40"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增">
				</FORM>
		</div>
		</td>
				
		<td>
			<div hidden id="Dessert" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form5">
					甜點:<select size="1" name="product_name">
					<c:forEach var="getDessert" items="${getDessert}">
						<option value="${getDessert.product_name}">${getDessert.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="50"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
		</td>
		
		<td>
			<div hidden id="Drink" align="center">
				<FORM METHOD="post" ACTION="pro.do" name="form6">
					飲料:<select size="1" name="product_name">
					<c:forEach var="getDrink" items="${getDrink}">
						<option value="${getDrink.product_name}">${getDrink.product_name}
					</c:forEach>
						</select><br> 
							<input type="hidden" name="product_pcg" value="${pid}"> 
							<input type="hidden" name="product_class" value="60"> 
							<input type="hidden" name="action" value="UpdatePackagePro"> 
							<input type="submit" value="新增">
				</FORM>
			</div>
		</td>
</tr>

<br>
<br>
					
</table> 
		
<table border='1' bordercolor='#CCCCFF' width='800'>
						
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>類別</th>
				<th>菜色種類</th>
				<th>屬於套餐</th>
			</tr>
						
		<c:forEach var="proVO" items="${proVO}" >
			<tr align='center' valign='middle'>
				<td>${proVO.product_id}</td>
				<td>${proVO.product_name}</td>
				<td>${proVO.product_price}</td>
				<td>${proVO.productKindVO.kind_name}</td>
				<td>${proVO.dishClassVO.class_name}</td>
				<td>${proVO.product_pcg}</td>
			
				<td>		
	<FORM METHOD="post" name="DleteForm" ACTION="<%=request.getContextPath()%>/product/pro.do">
			<input type="button" name="delete" value="刪除"> 
			<input type="hidden" name="product_id" value="${proVO.product_id}">
			<input type="hidden" name="product_pcg" value="${proVO.product_pcg}">
			<input type="hidden" name="action" value="UpdatePackDelete">
	</FORM>
				</td>
			</tr>
		</c:forEach>
		
</table>
	</div>

</body>

</html>
