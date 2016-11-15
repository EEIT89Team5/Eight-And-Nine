<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>商品資料</title>
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<style>
#bbody{
background: #333;
}
@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
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
td{
font-family: ShowWind;
font-size:25px;
color:white;
background:#333;
text-align: center;
}
</style>
</head>

<body id="bbody">
	<div align="center">
	<img src="../img/prologo.png"><br>
	<a href="../index.jsp"><img src="../img/UPDATESUCCESS.png"></a>
<br>
<br>
		<table align="center" class="table table-striped" style="width: 800px">
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>類別</th>
				<th>上架/下架</th>
			</tr>
			
			<br>

			<tr align='center' valign='middle'>

				<td>${proVO.product_id}</td>
				<td>${proVO.product_name}</td>
				<td>${proVO.product_price}</td>
				<td>
				<c:if test="${proVO.dishClassVO.class_id==10}">前菜</c:if>
				<c:if test="${proVO.dishClassVO.class_id==20}">沙拉</c:if>
				<c:if test="${proVO.dishClassVO.class_id==30}">湯品</c:if>
				<c:if test="${proVO.dishClassVO.class_id==40}">主菜</c:if>
				<c:if test="${proVO.dishClassVO.class_id==50}">甜點</c:if>
				<c:if test="${proVO.dishClassVO.class_id==60}">飲料</c:if>
				</td>
				<td><c:if test="${proVO.inMenu==1}">上架中</c:if><c:if test="${proVO.inMenu==0}">下架中</c:if></td>

			</tr>
		</table>
	</div>
	
	<div align="center">
		<table>
<br>
			<tr align='center' valign='middle'>

				<td>
				<img width='500px' height="400px" class="img-circle" alt="Responsive"
					src='${pageContext.servletContext.contextPath}/getImage?id=${proVO.product_id}'>
				</td>
			</tr>

		</table>

		<table border='1' bordercolor='#CCCCFF' width='500px' height="200px">
<br>
			<tr align='center' valign='middle'>

				<td>${proVO.product_intro}</td>

			</tr>
		</table>
	</div>
	
</body>

</html>
