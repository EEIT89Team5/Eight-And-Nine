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

<link rel="stylesheet" type="text/css" href="../js/calendar.css">
<link rel="stylesheet" type="text/css" href="../js/sweetalert.css">
<script language="JavaScript" src="../js/jquery-3.1.1.min.js"></script>
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

<body bgcolor='white'>
	
	<div align="center">
		
		<table border='1' cellpadding='5' cellspacing='0' width='800'>
			<tr align='center' valign='middle' height='20'>
				<td>
					<h3>所有商品資料</h3>
					<a href="../index.jsp">回首頁</a>
				</td>
			</tr>
		</table>

		<table border='1' bordercolor='#CCCCFF' width='800'>
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>套餐</th>
				<th>商品類別</th>
				<th>上架/下架</th>
				<th>修改</th>
				<th>圖片</th>
				<th>刪除</th>
			</tr>
			
			
		<%@ include file="../page1.file"%>
			<c:forEach var="proVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				<tr align='center' valign='middle'>
					<td>${proVO.product_id}</td>
					<td>${proVO.product_name}</td>
					<td>${proVO.product_price}</td>
					<td>${proVO.productKindVO.kind_name}</td>
					<td>${proVO.getDishClassVO().getClass_name()}</td>
					<td>${proVO.inMenu}</td>

					<td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/pro.do">
							<input type="submit" value="修改"> 
							<input type="hidden" name="product_id" value="${proVO.product_id}"> 
							<input type="hidden" name="action" value="getOne_For_Update">
						</FORM>
					</td>
					
					<td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/pro.do">
							<input type="submit" value="上傳">
							<input type="hidden" name="product_id" value="${proVO.product_id}">
							<input type="hidden" name="action" value="getOne_For_UpdateIMG">
						</FORM>
					</td>
					
					<td>
						<FORM METHOD="post" name="DleteForm" ACTION="<%=request.getContextPath()%>/product/pro.do">
							<input type="button" name="delete" value="刪除"> 
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
