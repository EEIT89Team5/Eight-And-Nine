<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>點餐  - addOrder2.jsp</title>
<style>
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
td{
font-family:ShowWind;
font-size:38px;
color:white;
}
h3{
color:yellow;
font-size:45px;
}
body{
/* background-image: url("../img/0003.jpg"); */
background-size: cover;
background-color: black
}
</style>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>
<%-- <h2>您已於${time}成功加訂餐點</h2><br/> --%>
<div align="center">
<img src="../img/ORDERDETAIL.png"><br>
<table>
	<tbody>
		<tr><td><h3>訂單資訊</h3></h3></td></tr>
		<tr><td>編號:${orderVO.order_id}</td></tr>		
		<tr><td>桌號:${orderVO.order_table}</td></tr>
		<tr><td>日期:${orderVO.order_date}</td></tr>
		<tr><td>總價:${orderVO.order_price}</td></tr>
		<tr><td>人數:${orderVO.order_numP}人</td></tr>
		<tr><td>會員:${orderVO.memberVO.member_id}</td></tr>
		<tr><td>員工:${orderVO.empVO.emp_id}</td></tr>
				
		<tr>
			<td><h3>訂單明細</h3></td>
		</tr>
		<tr>
		    <td>商品名稱</td>
			<td>菜色類別</td>
			<td>數量</td>
		</tr>
				<c:forEach var="orderXVO" items="${orderList}">
			  <c:if test="${orderXVO.productVO.productKindVO.kind_name == '單點菜色' }">
				<tr>
					<td>${orderXVO.productVO.product_name}</td>
					<td>${orderXVO.productVO.dishClassVO.class_name}</td>
					<td>${orderXVO.orderX_num}</td>
				</tr>
		       </c:if>
			</c:forEach>
			
		<c:forEach var="mapForPackageIdAndQty" items="${mapForPackageIdAndQty}">               
           <tr><td><hr/></td><td><hr/></td><td><hr/></td><td><hr/></td><td><hr/></td>
		    </tr> 
            <tr>
            	<td>${productSvc.findByPrimaryKey(mapForPackageIdAndQty.key).product_name}</td>    <!-- 變數productSvc 為第七行的 jsp:useBean 創造 -->         	                
                <td></td>
                <td>${mapForPackageIdAndQty.value}</td>
                <td></td>			    	
            </tr>
            <tr><td><hr/></td><td><hr/></td><td><hr/></td><td><hr/></td><td><hr/></td>
		    </tr>
		      
       <c:forEach var="numXXX"  begin="10" end="60" step="10">
         <c:forEach var="orderXVO" items="${orderList}"  >	
	         <c:if test="${mapForPackageIdAndQty.key == orderXVO.productVO.product_pcg}">      	   

                  <c:if test="${orderXVO.productVO.dishClassVO.class_id == numXXX}">              
			        <tr>
				      <td>${orderXVO.productVO.product_name}</td>
				      <td>${orderXVO.productVO.dishClassVO.class_name}</td>
				      <td>${orderXVO.orderX_num}</td>				  
			        </tr>	
			       </c:if>
              </c:if>  
		 </c:forEach>
        </c:forEach>                   
		    <tr><td></td><td></td><td></td> <td></td></tr>	
      </c:forEach>  	
          
	</tbody>
</table><br/>
</div>
<div align="center"><a href="../index22.jsp" class="button button-pill button-highlight" style="font-family:ShowWind;font-size:25px;font-weight:bold"> 回首頁 </a></div>
<link rel="stylesheet" href="../css/buttons.css">
</body>
</html>