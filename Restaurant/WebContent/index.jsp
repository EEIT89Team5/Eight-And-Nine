<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>目錄</title>
</head>

<body>


<a href="order/addOrder1.jsp" >點餐</a><br>
<a href="order/additional1.jsp" >加點餐</a><br>
<a href="order/listAllOrder.jsp" >查看訂單</a><br>
<a href="InsideView/Inside.jsp" >內場</a><br>
<a href="Outsideview/Outside.jsp" >出餐口</a><br>
<a href="member/addMember.jsp" >新增會員</a><br>
<a href="member/listAllMember.jsp" >查詢及修改會員</a><br>
<br>

	<a href='table/formatTable.do?table=index'>桌位狀況</a><br/>
	<a href='space/spaceC.jsp'>設定場地配置</a>
	<a href='space/spaceQ.jsp'>查詢場地配置</a>
	<a href='space/spaceU.jsp'>修改場地配置</a><br/>
	<a href='reserve/reserveC.jsp'>新增預約</a>
	<a href='reserve/reserveQ.jsp'>查詢預約</a>

<table border='1' cellpadding='5' cellspacing='0' width='400' align="center">
		<tr align='center' valign='middle' height='20'>
			<td>
			<a href='discount/all_discount.jsp'>查詢所有折扣</a><br>
			<a href='discount/add_discount.jsp'>新增折扣</a><br>
			<a href='emp/all_emp.jsp'>查詢所有員工</a><br>
			<a href='emp/EmpRegister.jsp'>員工註冊</a><br>
			</td></tr>
	</table>

<table border='1' cellpadding='5' cellspacing='0' width='400' align="center">
	<tr align='center' valign='middle' height='20'>
		<td>
			<a href="product/listAllPro.jsp">Select</a><br>
			<a href="product/select_online_page.jsp">SelectOnline</a><br>
			<a href="product/select_offline_page.jsp">SelectOffline</a><br>
            <a href="product/addSinglePro.jsp">AddOne</a><br>
            <a href="Package/AddPack.jsp">AddPack</a><br>
            <a href="Package/UpdatePro.jsp">UpPack</a><br>
	
		</td>
	</tr>
</table>
</body>
</html>