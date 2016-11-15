<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>

<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");
%>

<html>
<head>
	<title>商品修改</title></head>
<style>
@font-face {  
  font-family: "BoldFace";  
  src: url("../font/BoldFace.ttc");  
}
#bbody{
background: #333;
}
td{
font-family: BoldFace;
font-size:25px;
color:white;
background:#333;
}
tr{
height: 50px
}
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
</style>
<script src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
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

<body id="bbody">

<div align="center">
	
<img src="../img/prologo.png"><br>
<a href="listAllPro.jsp"><img src="../img/UPDATE.png"></a>
	
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
<c:set var="proVO" value="${proVO}"></c:set>
<FORM  METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data" >

<table border="0">
	<tr>
		<td>商品編號:</td>
		<td><font color=red><%=proVO.getProduct_id()%></font></td>
	</tr>
	
	<tr>
		<td>商品名稱:</td>
		<td>
			<input class="form-control" type="TEXT" name="product_name" size="25"  style="color:black;width:350px;font-family:BoldFace;font-size:20px" value="${proVO.getProduct_name()}" />
		</td>
	</tr>
	
	<tr>
		<td>售價:</td>
		<td>
			<input class="form-control" type="TEXT" name="product_price" size="7"  style="color:black;width:100px;font-family:BoldFace;font-size:20px" value="${proVO.getProduct_price()}" />
		</td>
	</tr>
		
	<tr>
		<td>套餐:</td>

		<td>
	<font color=red><%=proVO.getProductKindVO().getKind_name()%></font>
		</td>
	</tr>
	
	<tr>
		<td>類別:</td>
		<td>
<select name="product_class"  style="color:black;">
	
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
<select name="inMenu"  style="color:black">
	　		<option value="1" <c:if test="${proVO.inMenu==1}">selected</c:if>>上架</option>
　			<option value="0" <c:if test="${proVO.inMenu==0}">selected</c:if>>下架</option>
</select>

		</td>
	</tr>
	
	<tr>
		<td>簡介:</td>
		<td>
			<textarea rows="4" class="form-control" style="width:350px;font-size:20px;color:black"  name="product_intro"  ><c:if test="${proVO.getProduct_price()!=null}"></c:if>${proVO.getProduct_intro()}</textarea>
		</td>
	</tr>
<tr><td>商品圖片:</td>

		<td>
			<input type="file" class="btn btn-default btn-file" style="background: #333;color:white" id="FileUp" name="FileUp" size="50" maxlength="20" width="500">
		</td>

	</tr>

</table>

<table>
	<tr>
<th><img src="../img/before.png" style="display:block;margin: auto"><br></th><th align="center"><img src="../img/after.png" style="display:block;margin: auto"><br></th>
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

	<tr>
	
</table>

<br>

<input type="hidden" name="action" value="update">
<input type="hidden" name="product_id" value="${proVO.getProduct_id()}">
<input type="hidden" name="product_kind" value="<%=proVO.getProductKindVO().getKind_id()%>">

<input type="submit" value="修改" class="btn btn-warning" style="font-family:BoldFace;font-size:20px">

</FORM>

</div>

</body>

</html>

