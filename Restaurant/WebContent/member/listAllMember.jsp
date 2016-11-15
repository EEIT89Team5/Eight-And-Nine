<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="memberSvc" class="com.member.model.MemberService" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢所有會員</title>
</head>
<body>
<table>
	<tr>
		<td>編號</td>
		<td>姓名</td>
		<td>性別</td>
		<td>email</td>
		<td>密碼</td>
		<td>手機</td>
		<td>註冊日</td>
	</tr>
	<c:forEach var="memberVO" items="${memberSvc.getAllMember()}" >
		<tr>
			<td>${memberVO.member_id }</td>
			<td>${memberVO.member_name }</td>
			<td>${memberVO.member_gender }</td>
			<td>${memberVO.member_email }</td>
			<td>${memberVO.member_password }</td>
			<td>${memberVO.member_phone }</td>	
			
			<td>${memberVO.member_register }</td>
			<td>
				<form action="member.do" method="post">
					<input type="hidden" name="member_id" value="${memberVO.member_id }"/> 
					<input type="hidden" name="action" value="update_member1"/>
					<input type="submit" value="修改資料">
				</form>
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>