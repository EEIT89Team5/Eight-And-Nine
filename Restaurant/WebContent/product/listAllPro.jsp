<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductService proSvc = new ProductService();
	List<ProductVO> list = proSvc.getSingle();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
	<title>所有商品資料</title>
</head>
<script src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../js/sweetalert.css">
<script language="JavaScript" src="../js/sweetalert.min.js"></script>
<script>
$(function() {
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
<style>
@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
}
td{
font-family: ShowWind;
font-size:25px;
color:white;
background:#333;
text-align: center;
}
b{
font-family: ShowWind;
font-size:18px;
font-weight:bold;
}
#bbody{
background: #333;
}
th{
font-family: ShowWind;
font-size:25px;
font-weight:bold;
color:white;
background: #333;
text-align: center
}
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
</style>
<body id="bbody">
	
	<div align="center">
		
		<img src="../img/prologo.png"><br>
		<a href="../index.jsp"><img src="../img/TOTAL.png"></a><br>

		<table align="center" class="table table-striped" style="width: 1400px">
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>產品圖片</th>
				<th>售價</th>
				<th>套餐</th>
				<th>商品類別</th>
				<th>上架/下架</th>
				<th>修改</th>
				<th>刪除</th>
			</tr>
			
			
		<%@ include file="../page1.file"%>
			<c:forEach var="proVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				<tr align='center'>
					<td>${proVO.product_id}</td>
					<td>${proVO.product_name}</td>	
				<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${proVO.product_id}"></td>
					<td>${proVO.product_price}</td>
					<td>${proVO.productKindVO.kind_name}</td>
					<td>${proVO.getDishClassVO().getClass_name()}</td>
					<td><c:if test="${proVO.inMenu==1}">上架中</c:if><c:if test="${proVO.inMenu==0}">下架中</c:if></td>

					<td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/pro.do">
							<input type="submit" value="修改" class="btn btn-primary" style="font-family:ShowWind;font-size:18px"> 
							<input type="hidden" name="product_id" value="${proVO.product_id}"> 
							<input type="hidden" name="action" value="getOne_For_Update">
						</FORM>
					</td>
					
					<td>
						<FORM METHOD="post" name="DleteForm" ACTION="<%=request.getContextPath()%>/product/pro.do">
							<input type="button" name="delete" value="刪除" class="btn btn-primary" style="font-family:ShowWind;font-size:18px"> 
							<input type="hidden" name="product_id" value="${proVO.product_id}">
							<input type="hidden" name="action" value="delete">
						</FORM>
					</td>
				</tr>
				
			</c:forEach>
			
		</table>
		
		<%@ include file="../page2.file"%>
		
	</div>

</body>

</html>
