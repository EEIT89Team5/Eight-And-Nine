<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");
	ProductService proSvc = new ProductService();
	Integer SelectMAXPack = proSvc.SelectMAXPack(2);
%>


<html>
<head>
	<title>商品資料</title>
</head>

<body bgcolor='white'>
	
<div align="center">
		<table border='1' bordercolor='#CCCCFF'>

					<tr align='center' valign='middle'>

						<td><img width='500px' height="400px"
									src='${pageContext.servletContext.contextPath}/getImage?id=<%=SelectMAXPack%>'></td>
					</tr>
				
						</table>

		<table border='1' cellpadding='5' cellspacing='0' width='400'>
					<tr align='center' valign='middle' height='20'>
				<td><h3>套餐所屬菜色</h3></td><br>
					</tr>
						</table>


</div>
</body>
</html>
