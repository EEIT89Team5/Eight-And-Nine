<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�馩���</title>
</head>
<body bgcolor='white'>
<div align="center">
	<table border='1' cellpadding='5' cellspacing='0' width='600'>
		<tr bgcolor='#DDDDDD' align='center' valign='middle' height='20'>
			<td><h3>�馩���</h3>
		              <a href="../index.jsp">�^����</a></td></tr></table>

<table border='1' bordercolor='#AAAAAA' width='600'>
	<tr>
		<th>�馩�s��</th>
		<th>�馩�W��</th>
		<th>�馩</th>
		
	</tr>
	<tr align='center' valign='middle'>
		<td>${discountVO.disc_id}</td>
		<td>${discountVO.disc_name}</td>
        <td>${discountVO.disc_value}</td>
       	
	 </tr>
</table>
</div>
</body>
</html>
