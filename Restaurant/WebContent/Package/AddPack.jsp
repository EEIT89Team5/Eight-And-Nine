<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");
%>

<html>
<head>
	<title>新增套餐菜色</title>
<style>
#Div1{
	width: 700px;
	padding:20px;
	border-radius: 10px
}
@font-face {  
  font-family: "BoldFace";  
  src: url("../font/BoldFace.ttc");  
}
@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
}
td{
font-family: ShowWind;
font-size:25px;
color:white;
background:#333;
}
.st1{
margin: 10px
}
.font1{  
  font-family: "ShowWind"; 
  font-size:30px; 
  font-weight: normal;
  color: white
}
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
::-webkit-input-placeholder { font-family:"ShowWind";font-size: 20px;font-weight:bold}
</style>
</head>
<script src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">

<body background="../img/14.png" style="background-size: cover;">
	<div align="center">

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
<div id="Div1" align="left" style="border: 1px red solid;background:rgba(0,0,0,0.7);">
		 <legend style="font-size: 40px;font-family:ShowWind;color: white;font-weight:bold">新增套餐</legend>

	<FORM METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data">
			
			<div class="st1">
					<td><font class="font1">商品名稱:</font></td>
					<td><input type="TEXT" name="product_name" size="25" placeholder="請輸入套餐名稱"/></td>
					<span id="pna"></span>
			</div>	
			<div class="st1">
					<td><font class="font1">售價:</font></td>
					<td><input type="TEXT" name="product_price" size="7" placeholder="套餐價格"/></td>
					<span id="ppi"></span>
			</div>
			
			<div class="st1">
					<td><font class="font1">上架/下架:</font></td>
					<td>
					<select name="inMenu" class="font1" style="font-size: 20px;color:gray;font-weight: bold;">
							<option value="1">上架中</option>
							<option value="0">下架中</option>
					</select>
					</td>
			</div>
			
			<div class="st1">		
					<td><font class="font1">簡介:</font></td><br>
					<td><textarea cols="40" rows="5" name="product_intro" style="font-size:25px;font-family: ShowWind;font-weight: bold;"></textarea></td>
			</div>

					<td>商品圖片:</td>
					<font class="font1" style="font-size:20px">
					<td><input type="file" name="NewFileUp" id="NewFileUp"
						size="50" maxlength="20"></td></font>
				
				
			<br>
			<div align="center">
			<img id="Browse" src="" alt="上傳的圖片將能先在此預覽" width="500" height="400" border="1px" />
			</div>
			<br> 
			<div align="center">
				<input type="hidden" name="product_kind" value="2"> 
				<input type="hidden" name="action" value="insertPackage"> 
				<input type="button" value="新增" id="allbutton" class="btn btn-warning" style="font-family:BoldFace;font-size:20px">
			</div>
		</FORM>
</div>
	</div>
	
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
		$("#product_name").blur(function(){
			var un=$("#product_name").val()
				
			if(un.length>0&&un.length<2){
				$("#pna").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>產品名稱至少要兩個字以上</span>")
				$("#product_name").focus();
			}else if(un.trim()==""||un==null){
				$("#pna").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>產品名稱不能空白</span>")
				$("#product_name").focus();	
			}else if(un.match(/[^\u3447-\uFA29 a-z A-Z]/ig)){
				$("#pna").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>必須為中文或英文</span>")
				$("#product_name").focus();
			}else{
				$("#pna").html("<img src='../icon/oo.png' /><span style='color:#3db39e;font-size:18px'>格式正確</span>")
				
			}
		})
			$("#product_price").blur(function(){
				var count=0;
				var pdv=$("#product_price").val()	
				if(pdv==null||pdv==""){
					$("#ppi").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>售價不能空白</span>")
					$("#product_price").focus();
					
				}else if(pdv.match(/[^0-9]/ig)){
					$("#ppi").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>售價必須是數字</span>")
					
				}else{
					$("#ppi").html("<img src='../icon/oo.png' /><span style='color:#3db39e;font-size:18px'>格式正確</span>")
					
				}
			})
		
		$("#allbutton").click(function(){
			var count=0;
			var pna=$("input[name='product_name']").val()
			var pdv=$("input[name='product_price']").val()
			
			if(pna=null||pna.trim()==""){
				$("#pna").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>產品名稱不能空白</span>")
				count++;
			}

			if(pdv=null || pdv.trim()==""){
				$("#ppi").html("<img src='../icon/xx.png' /><span style='color:red;font-size:18px'>售價不能空白</span>")
				count++;
			}
			if(count==0){
				$("#allbutton").parent().parent().submit();
			}
		
		})
			

	});
</script>
</body>
</html>
