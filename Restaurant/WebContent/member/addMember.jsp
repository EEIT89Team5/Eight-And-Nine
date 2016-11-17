<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增會員</title>
</head>
<body>
<h3>新增會員，註冊享折扣!!</h3>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<form action="member.do" method="post">
<table>
	<tr><td>姓名:<input type="text" name="m_name"></td></tr>
	<tr>
		<td>性別:
			<input type="radio" name="m_gender" value="男" checked>男
			<input type="radio" name="m_gender" value="女">女
			<input type="radio" name="m_gender" value="其他">其他
		</td>
	</tr>
	<tr><td>Email:<input type="text" name="m_email">(忘記密碼用)</td></tr>
	<tr><td>密碼:<input type="password" name="m_password" ></td></tr>
	<tr><td>再次輸入密碼:<input type="password" ></td></tr>
	<tr><td>手機:<input type="text" id="m_phone" name="m_phone" maxlength="10" required>(必填，做為會員登錄帳號)</td></tr>
	<tr><td>
	<input type="hidden" value="add_member" name="action"> 
	<input type="submit" value="加入會員" ></td></tr>
</table>
</form>
<script src="../js/jquery-1.9.1.js"></script>
<script>
	$(function(){
		$('#m_phone').blur(function(){
			$.get('memberCheck.do',{'phone':$(this).val()},function(data){
				if(data=="手機號碼已存在"){
					alert("手機號碼已存在，請用其他手機註冊");
				}else{
					alert("手機號碼可用");
				}
			})
		})
	})
</script>
</body>
</html>