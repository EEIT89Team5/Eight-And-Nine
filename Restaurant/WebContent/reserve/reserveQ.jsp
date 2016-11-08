<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢預約表</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
#todayList{
	margin:20px 0px;
	border:2px solid gray;
	text-align:center;
	border-collapse:collapse;
	width:750px;
/* 	border-radius:20px; */
}
tr {
	height:30px;
} 
</style>
<script type="text/javascript">
$(function(){
	
// 	$.each($('select[name="months"] option'),function(){
<%-- 		if($(this).val()==<%= request.getParameter("months") %>) --%>
// 			$(this).attr("selected","selected");
// 	});
	$.each($('select[name="months"] option'),function(){
		var monthx=$(this).val();
		if(monthx == <%= request.getParameter("months") %>){
			$(this).attr("selected","selected");
			var d=0;
			if(monthx==1 || monthx==3 || monthx==5 || monthx==7 || monthx==8 || monthx==10 || monthx==12)
				d=31;
			else if(monthx==2)
				d=29;
			else
				d=30;
			var days = $('select[name="days"]');
			var i=1;
			for(i;i<=d;i++){
				if(i==<%= request.getParameter("days") %>)
					days.append("<option value='"+i+"' selected>"+i+"日</option>");
				else
					days.append("<option value='"+i+"'>"+i+"日</option>");
			}	
		}
	});
	
	
	$('table tr').hover(function(){
		$(this).css("background-color","lightblue");
	},function(){
		$(this).css("background-color","white");
	});
	
		
	$('select[name="months"]').change(function(){
		var monthx = $(this).find('option:selected').val();
		var dayx = $('select[name="days"]');
		dayx.html("<option value='0'>選擇日期</option>");
		if(monthx!=0){
			if(monthx==1 || monthx==3 || monthx==5 || monthx==7 || monthx==8 || monthx==10 || monthx==12)
				d=31;
			else if(monthx==2)
				d=29;
			else
				d=30;
			var i=1;
			for(i;i<=d;i++){
				dayx.append("<option value='"+i+"'>"+i+"日</option>")
			}
		}
	});
	
	$('#btn_select').click(function(){
		var check = $('select[name="months"]').val();
		if(check=="0"){
			alert("請選擇月份");
		}else{
			$(this).parent().submit();
		}
	});
	
	$('#showbtn').click(function(){
		$('td form').removeAttr("hidden");
		$(this).attr("disabled","disabled");
	});
	
	$('td input[type="button"]').click(function(){
		if($(this).val()=="修改"){
			$(this).parent().attr("action","ReserveServlet.do?doWhat=update").submit();
		}
		if($(this).val()=="刪除"){
			$(this).parent().attr("action","ReserveServlet.do?doWhat=delete").submit();
		}
	});
	
});
</script>
</head>
<body>
	<a href="../index.jsp">回首頁</a>
	
	<jsp:useBean id="reserveBean" class="com.reserve.model.ReserveService"></jsp:useBean>
	<form id="selectReserve" action="ReserveServlet.do?doWhat=selects" method="post">
		<select name="months">
			<option value="0">選擇月份</option>
			<c:forEach var="month" begin="1" end="12">
				<option value="${month}">${month}月</option>
			</c:forEach>
		</select>
		<select name="days">
			<option value="0">選擇日期</option>
		</select>
		<input type="button" id="btn_select" value="查詢" />
	</form>
	
	<button id="showbtn">修改預約表</button>
	
	<table id="todayList">
		<tr><th>預約的時間</th><th>名稱</th><th>手機</th><th>人數</th><th>特殊需求</th><th></th></tr>
		<c:if test="${test != 'xxx'}">
			<c:forEach var="reserveVO" items="${reserveBean.today}">
				<tr>
				<td width="200px">${reserveVO.res_time}</td>
				<td width="80px">${reserveVO.res_name}${reserveVO.res_gender}</td>
				<td width="100px">${reserveVO.res_phone}</td>
				<td width="50px">${reserveVO.res_numP}人</td>
				<td width="200px">${reserveVO.res_remark}</td>
				<td>
					<form hidden action="" method="post">
						<input hidden type="text" name="res_time" value="${reserveVO.res_time}" />
						<input hidden type="text" name="res_phone" value="${reserveVO.res_phone}"/>
						<input type="button" value="修改" /> &nbsp;
						<input type="button" value="刪除" />
					</form>
				</td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${test == 'xxx'}">
			<c:forEach var="reserveVO" items="${resVO}">
			<tr>
				<td width="200px">${reserveVO.res_time}</td>
				<td width="80px">${reserveVO.res_name}${reserveVO.res_gender}</td>
				<td width="100px">${reserveVO.res_phone}</td>
				<td width="50px">${reserveVO.res_numP}人</td>
				<td width="200px">${reserveVO.res_remark}</td>
				<td>
					<form hidden action="" method="post">
						<input hidden type="text" name="res_time" value="${reserveVO.res_time}" />
						<input hidden type="text" name="res_phone" value="${reserveVO.res_phone}"/>
						<input type="button" value="修改" /> &nbsp;
						<input type="button" value="刪除" />
					</form>
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
</body>
</html>