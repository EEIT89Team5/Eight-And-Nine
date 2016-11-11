<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>商品資料</title>
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/jquery-1.12.3.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>

<body bgcolor='white'>
	<div align="center">
		<table border='1' cellpadding='5' cellspacing='0' width='400'>
			<tr align='center' valign='middle' height='20'>
				<td><h3>查詢結果</h3> <a href="../index.jsp">回首頁</a></td>
			</tr>
		</table>
		
<br>
		<table border='1' bordercolor='#CCCCFF' width='800'>
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>套餐</th>
				<th>屬於</th>
				<th>上架/下架</th>
			</tr>
			
			<br>

			<tr align='center' valign='middle'>

				<td>${proVO.product_id}</td>
				<td>${proVO.product_name}</td>
				<td>${proVO.product_price}</td>
				<td>${proVO.productKindVO.kind_name}</td>
				<td>${proVO.getDishClassVO().getClass_name()}</td>
				<td>${proVO.inMenu}</td>

			</tr>
		</table>
	</div>
	
	<div align="center">
		<table border='1' bordercolor='#CCCCFF'>
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
