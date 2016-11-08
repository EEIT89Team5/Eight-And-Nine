<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="tableSvc" scope="page" class="com.table.model.TableService" />
<jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>點餐  - addOrder1.jsp</title>
</head>
<body>
<h2>輸入桌號狀況</h2><br/>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<form METHOD="post" ACTION="order.do" >
<table>
	<tbody>
		<tr><td>未點餐桌號:<select name="table">
						<c:forEach var="tableVO" items="${tableSvc.getAllTableReadyToOrder() }">
							<option value="${tableVO.table_name }">${tableVO.table_name }</option>
						</c:forEach>
					</select>
					</td></tr>
		<tr><td>會員:<input type="text" name="member"></td></tr>
		<tr><td>員工:<select name="employee">
						<c:forEach var="empVO" items="${empSvc.getAll() }">
							<option value="${empVO.emp_id }">${empVO.emp_name }</option>
						</c:forEach>
					</select>
					</td></tr>
	</tbody>
</table><br/>
<input type="hidden" name="action" value="begin_order">
<input type="submit" value="下一步">
</form>


</body>
</html>