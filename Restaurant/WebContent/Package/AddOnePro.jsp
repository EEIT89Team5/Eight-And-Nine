<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");
	ProductService proSvc = new ProductService();
	Integer SelectMAXPack = proSvc.SelectMAXPack(2);

	List<ProductVO> getPro = proSvc.getPro(SelectMAXPack);
	pageContext.setAttribute("getPro", getPro);
%>
<html>

<head>
	<title>商品資料</title>
<style>
#bbody{
background: #333;
}
td{
font-family:ShowWind;
font-size:25px;
color:white;
background: #333;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="../js/sweetalert.css">
<script language="JavaScript" src="../js/sweetalert.min.js"></script>
<script src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
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

<body id="bbody">
	<div align="center">
<table style="width: 800px" class="table table-striped">
					<tr>
							<th style="text-align: center">商品編號</th>
							<th style="text-align: center">商品名稱</th>
							<th style="text-align: center">類別</th>
							<th style="text-align: center">刪除</th>
					</tr>
						
		<c:forEach var="getPro" items="${getPro}">
				<tr align='center' valign='middle'>
								<td>${getPro.product_id}</td>
								<td>${getPro.product_name}</td>
								<td>${getPro.dishClassVO.class_name}</td>

					
					<td>			
						<FORM METHOD="post" name="DleteForm" ACTION="<%=request.getContextPath()%>/product/pro.do">
							<input type="button" name="delete" value="刪除" class="btn btn-danger" style="font-family:ShowWind;font-size:18px"> 
							<input type="hidden" name="product_id" value="${getPro.product_id}"> 
							<input type="hidden" name="action" value="deletePackPro">
						</FORM>
					</td>
				</tr>
		</c:forEach>
		
</table>

	</div>
	
</body>

</html>
