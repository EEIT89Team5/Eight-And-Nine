<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<%
ProductVO proVO = (ProductVO) request.getAttribute("proVO");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新增單點菜色</title></head>
<script src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
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

.st1{
	margin: 10px
}
@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
}  
.font1{  
  font-family: "ShowWind"; 
  font-size:30px; 
  font-weight: normal;
  color: white
}
span{ 
font-family: "ShowWind";
font-weight:bold; 
 }
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
td{
font-family: ShowWind;
font-size:25px;
color:white;
background:#333;
}
::-webkit-input-placeholder { font-family:"ShowWind";font-size: 20px;font-weight:bold}
</style>

<body background="../img/13.png" style="background-size: cover;">

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
              <br />
         <legend style="font-size: 40px;font-family:ShowWind;color: white;font-weight:bold">新增餐點</legend>
         
         <FORM METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data" >
       
        <div class="st1">
            
        <td><font class="font1">商品名稱:</font></td>
          <td> <input type="text" id="product_name" name="product_name" size="25" placeholder="請輸入商品名稱" /></td>
            <span id="pna"></span>
          
            <br>
            <label class="font1" style="color:#9bff00; font-size:19px">(1.不可空白，2.至少兩個字以上，3.必須為中文或英文)</label> 
            
          
        </div>
        
         <div class="st1">
            
		 <font class="font1">售價:</font>	

		 	<input type="text" id="product_price" name="product_price" size="7" placeholder="商品售價"/>
			<span id="ppi"></span>
        </div>
        <!--<hr>-->
        <div class="st1">
            
		<label><font class="font1">類別:</font>
		<select name="product_class" class="font1" style="font-size: 23px;color:gray">
				<option value="10">前菜</option>
				<option value="20">沙拉</option>
				<option value="30">湯品</option>
				<option value="40">主菜</option>
				<option value="50">甜點</option>
				<option value="60">飲料</option>
			</select>
		</label>
		</div>
		
		<div class="st1">
		<label><font class="font1">上架/下架:</font>
		<select name="inMenu" class="font1" style="font-size: 23px;color:gray">
				<option value="1">上架</option>
				<option value="0">下架</option>
		</select>
		</label>
		  </div>
		  
	<div class="st1">
		     <font class="font1">簡介:</font><br>

 	<textarea cols="30" rows="5"  name="product_intro" style="font-size:25px;font-family: ShowWind;font-weight: bold;"></textarea>

     </div>

		<font class="font1">商品圖片:</font>

<font class="font1" style="font-size:20px">
<input type="file" name="NewFileUp" id="NewFileUp" size="50" maxlength="20"></td>
</font>

	<div align="center">
	<font class="font1">
	<img id="Browse" src="" alt="即將上傳的圖片預覽" width="500" height="400" border="1px"/>
	</font>
	</div>
	<br>
	<br>
	<div align="center">
		<input type="hidden" name="product_kind" value="1">
		<input type="hidden" name="action" value="insertSinglePro">
		<input id="allbutton" type="button" value="新增" class="btn btn-warning" style="font-family:BoldFace;font-size:20px">
	</div>	
</FORM>

</div>
<script>
$(function(){
			$("#NewFileUp").change(function(){
				if (this.files && this.files[0]) {
					var reader = new FileReader();
					
					reader.onload = function (e) {
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
			
}) ;

</script>
</body>

</html>
