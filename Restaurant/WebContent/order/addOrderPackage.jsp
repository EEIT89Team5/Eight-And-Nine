<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.orderx.model.*"%>
<%@ page import="com.dishclass.model.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService" />
<jsp:useBean id="classSvc" scope="page" class="com.dishclass.model.DishClassService" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 	<script src="js/jquery-1.9.1.js"></script> -->
<!-- 	<script src="js/jquery-3.1.1.min.js"></script> -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>點餐 - addOrderPackage.jsp</title>
</head>
<body>
	<h2>點選套餐</h2>

<h3>會員</h3>
<table>
	<tr>
		<td><a href="../member/addMember.jsp" >新增會員</a></td>
		<td><a href="../memberlogin/memberlogin.jsp" >會員登入</a></td>
		<td><a href="../memberlogin/memberlogout.jsp" >會員登出</a></td>
	</tr>
</table>

<h3>訂單資訊</h3>
<table>
	<tr>
		<td>桌號:${orderVO.order_table}</td>
		<td>人數:${orderVO.order_numP}人</td>
		<td>會員: 
			<c:if test="${! empty MemberLoginOK }">${MemberLoginOK.member_name}</c:if>
		</td>	
		<td>員工:${orderVO.empVO.emp_id}</td>
	</tr>
</table>



	<h3>套餐</h3>
	<table>
		<tr>
			<c:forEach var="pruductVO" items="${productSvc.getAllPackages()}">
				<td>
				  <div>
					<form method="post" action="order.do">
						<input type="hidden" name="classOfPackage" value="${pruductVO.product_id}">
						<input type="hidden" name="action" value="choose_P_class">
						<input type="submit" value="${pruductVO.product_name}">				   
					</form>
				  </div>				
				  ${pruductVO.product_price}元								
				</td>
			</c:forEach>
		</tr>
  </table>
  
  <c:if test="${packageFormatVO != null}">  <!--如果套餐資訊為Null 就不顯示 點餐&選擇套數 -->
	<h3>點餐</h3>
	       請選擇套數:<select name='qtyOfPackage' id='qtyOfPackage' selected='1' >			   
			     <option value="1">1</option>
			     <option value="2">2</option>
			     <option value="3">3</option>
			     <option value="4">4</option>
			     <option value="5">5</option>
			     <option value="6">6</option>
			     <option value="7">7</option>
			     <option value="8">8</option>
			     <option value="9">9</option>
			     <option value="10">10</option>
		     </select>
   
       <form METHOD="post" ACTION="order.do" id="formOfDish" name="formOfDish">
		   <c:forEach var="packageFormatVO" items="${packageFormatVO}">			                         
	          <c:if test="${packageFormatVO.getClass_number() != '0'}">       <!-- 把套餐內沒有的菜色類別不顯示   個人獨享餐沒有沙拉、湯品、甜點。-->
				<div ><h3 class="headOfH3">${packageFormatVO.getDishClassVO().getClass_name()} <span name="showMoreOrShort${packageFormatVO.getDishClassVO().getClass_id()}"></span></h3> 
					<h3>(可選 <span id="limitOfDish" name="limitOfDish${packageFormatVO.getDishClassVO().getClass_id()}" value="${packageFormatVO.getClass_number()}">${packageFormatVO.getClass_number()}</span>樣)</h3></div> 
<!-- 					                           name= 值+EL 這樣可以讓每次跑出來的name有所區隔-->
<%-- 原本				<form METHOD="post" ACTION="order.do" id="formOfDish${packageFormatVO.getDishClassVO().getClass_id()}" name="formOfDish"> --%>
				  <c:forEach var="productVO" items="${productSvc.getDishesByPackageAndClass(pcg_id ,packageFormatVO.getDishClassVO().getClass_id())}">
     		        
	                ${productVO.getProduct_name()}
						<select name="qtyOfDish" class="myClass${packageFormatVO.getDishClassVO().getClass_id()}">	 						
							 <option value="0" selected>0</opt可選 4樣)ion>
							 <option value="1" >1</option>
							 <option value="2">2</option>
							 <option value="3">3</option>
							 <option value="4">4</option>
							 <option value="5">5</option>
							 <option value="6">6</option>
							 <option value="7">7</option>
							 <option value="8">8</option>
							 <option value="9">9</option>
						     <option value="10">10</option>
						</select>
					    
						<input type="hidden" name="action" value="add_P_orderX">
						<input type="hidden" name="dishOfPackage" value="${productVO.getProduct_id()}">
						<input type="hidden" name="belongOfPackage" value="${productVO.getProduct_pcg()}">
					
				   </c:forEach>
				   <input type="hidden" name="limit" value=" ${packageFormatVO.getClass_number()}">
   			       <input type="hidden" name="dishClassOfPackage" value="${packageFormatVO.getDishClassVO().getClass_id()}">
<!-- 原本 				   <input type="submit" value="送出" name="btn" id="btn555"> -->
<!-- 原本 				 </form> -->
               </c:if>    
			</c:forEach><br/>  
	       <input type="submit" value="送出" name="btn" id="btn555">
	     </form>
		 <br/>    
    <a href="addOrder2.jsp" >回點餐</a>

	<c:if test="${not empty orderList}">
		<h3>購物車小計</h3>
		<table>
			<%
				OrderXService orderXSvc = new OrderXService();
				List<OrderXVO> orderList = (List<OrderXVO>) session.getAttribute("orderList");
			%>
			<tr>
				<td>單點主菜數量:<%=orderXSvc.getDishQuantity(1, 40, orderList)%></td>
			</tr>
			<tr>
				<td>套餐數量:<%=orderXSvc.getPackageQuantity(orderList)%></td>
			</tr>
			<tr>
				<td>總金額:${orderVO.order_price}</td>
			</tr>
		</table>
		<br>
		<form METHOD="post" ACTION="order.do" name="form1">
			<input type="hidden" name="action" value="check_orderList"> <input
				type="submit" value="查看購物車">
		</form>
	</c:if>
	</c:if>
</body>


<!-- 	<script src="js/jquery-1.9.1.js"></script> -->
<!-- 	<script src="js/jquery-3.1.1.min.js"></script> -->

<script>
         $(function(){             
        	 $('#formOfDish').submit(function(){ 
           		          		 
        		 var total = 0; 
        		 for(var i = 10 ; i < 70 ; i=i+10){
        		   var $limitOfDishS = $("span[name='limitOfDish"+i+"']");	 
        		    //jquery陣列的變數宣告要加上$        		  
//         		   console.log($limitOfDishS.text());
//         		   var $selects =  $limitOfDishS.parent().parent().find(".myClass"+i);  原本1114  17:07
//         		   console.log($selects.text());   原本1114  17:07
        		 } 	       
        	//	 }   原本1114  17:07
           	     var flag =0;
                 var alertWord = ""; 

                 for(var i = 10 ; i < 70 ; i=i+10){
//       		     for(var j = 0 ; j < $('.myClass'+i).length ; j++){
//       			     console.log(i);
        		     var $selects = $(".myClass"+i);
        		     
        	         for(var k = 0 ; k < $selects.length ; k++ ){             //formOfDish10  將同名 
                	    var $options = $("option:selected" , $selects[k]);   //的 select 的數量(option)
                	    total += parseInt($options.val());
                     } 
console.log("====================================================");
                   
        	         var  $headOfH3 =   $("span[name='limitOfDish"+i+"']").parent().parent().find(".headOfH3");  
        	         var  $showMoreOrShort =  $("span[name='showMoreOrShort" +i+ "']");     //用i準確抓showMoreOrShort位置
        	         if($headOfH3.text() != ""){
        	           if(total > $limitOfDishS.text()){        	    	     
        	    	      $showMoreOrShort.empty();                                         //將showMoreOrShort清空
        	    	      $showMoreOrShort.text("超過"+(total-$limitOfDishS.text())+"樣")     //顯示新的showMoreOrShort資訊
        	    	      $headOfH3.css("color","red");                                     //改變headOfH3顏色
//         	    	      $headOfH3.empty().html($headOfH3.html() + "超過"+(total-$limitOfDishS.text())+"樣").css("color","red");
        	    	      alertWord += $headOfH3.text() +"\n" ;
        	    	      flag=flag;
        	           }else if(total < $limitOfDishS.text()){
        	        	  $showMoreOrShort.empty();
        	        	  $showMoreOrShort.text("不足"+($limitOfDishS.text()-total)+"樣")
        	           	  $headOfH3.css("color","red");
        	        	  alertWord += $headOfH3.text()  +"\n" ;
        	        	  flag=flag;
        	        	  wordOfHeadOfH3 = "";
        	           }else if(total == $limitOfDishS.text()){
        	        	  $showMoreOrShort.empty();
        	        	  $headOfH3.css("color","black");
>>>>>>> branch 'master' of https://github.com/EEIT89Team5/Eight-And-Nine.git
        	    	      console.log("剛剛好");  
        	    	      flag=flag+1;
        	           }else{
        	        	  console.log("????");
        	           }
         	         console.log("我是總額:"+total);
        	         $selects = [];
        	         total = 0;

                     console.log("====================================================");
        	     }
              }
              console.log("這是旗幟:"+flag); 
        	  if(flag == $("span[name*='limitOfDish']").length){
        	      console.log(flag+"成功囉");
        		  return true ;
        	  }else{
        	      console.log("失敗"+flag);
        	      alert(alertWord);
        	      return false;
        	  }
//    11/14: 	 var i = 1
//    此27行     	 var limit = $("span[name='limitOfDish']:eq("+i+")").text();
//    為舊版        		 
//         		 console.log(limit);
//         		 var total = 0;
//         		 i=10;
//         		 var $selects = $('#formOfDish'+i+' select[name="qtyOfDish"]');
        		 
//         		 for(var i = 0 ; i < $selects.length ; i++ ){             //formOfDish10  將同名 
//         			 var $options = $("option:selected" , $selects[i]);   //的 select 的數量(option)
//         			 console.log("val" + i + "=" + $options.val());       //印出並加總
//         			 console.log("text" + i + "=" + $options.text());
//         			 total += parseInt($options.val());
//         		 }
//         		 console.log("我是總額:"+total);
        		 

        		 
//         		 if(limit < total){
//         			 alert("數量超過");
//         			 return false ;
//         		 }else if(limit > total){
//         			 alert("數量不足");
//         			 return false ;
//         		 }else{
//         			 alert("完成");
//         	     }

         	 });
        	 

        	 $('#qtyOfPackage').change(function(){  
                 var qtyOfPackage = $('#qtyOfPackage').val();                   // 套餐數量選擇
        		 for( var i = 0; i< $("span[name*='limitOfDish']").length; i++){        	//	$("span[name='limitOfDish']") 為陣列
             		 var limitOfDish = $("span[name*='limitOfDish']:eq("+i+")").attr("value");   //找 屬性為value的值    當作初始值用。 
            		 $("span[name*='limitOfDish']:eq("+i+")").text(limitOfDish*qtyOfPackage);    //改變畫面的text   (初始數 * 選擇數量)
            		 console.log($("span[name*='limitOfDish']:eq("+i+")").text());              //印出改變後的text
        		 }
        		 
//         		 $("span[name='limitOfDish']").each(function(index){
//         			 var limitOfDish = $(this).text();
//             		 $(this).text(limitOfDish*qtyOfPackage);
//         	     });
        		 

//         		 alert($('#limitOfDish').text());                     //id的做法
//         		 var limitOfDish = $('#limitOfDish').text();
//         		 var qtyOfPackage = $('#qtyOfPackage').val();
//         		 alert(limitOfDish *qtyOfPackage);
//         		 $('#limitOfDish').html(limitOfDish*qtyOfPackage);

        	 });              	 
        });



//       var formOfDish = document.getElementsByName("formOfDish");    //收及菜色類別 ，下面要拿來判斷有幾個
//       var formOfDish10 = document.getElementById("formOfDish10");   
//       var dishClassOfPackage = document.getElementsByName("dishClassOfPackage"); //收集菜色類別ID
//       var dishOfPackage = document.getElementsByName("dishOfPackage"); //收集菜色ID
// //       for(var i = 0; i < bb.length; i++){
// //          console.log(bb[i].value);
// //       }
      
//       var btns =   document.getElementsByName("btn");     
// //       var qtyOfDish10s =   document.getElementsByName("qtyOfDish10");     //收集數量     用這個不好，會導致Servlet那的getPara..的參數要更改
// //       var qtyOfDish40s =   document.getElementsByName("qtyOfDish40");     //收集數量

//       for(var i = 0 ; i < btns.length ; i++){
//      	  btns[i].addEventListener("click",checkLimit);      //把所有菜色類別的btn綁定click後去跑checkLimit
// //     	  qtyOfDishs[i].addEventListener("click",checkLimit);      //把所有菜色類別的btn綁定click後去跑checkLimit
//       }
      
//       function checkLimit(){
    	
// //     	  console.log(dishClassOfPackage[0].value);
// //     	  for(var j = 0; j < dishClassOfPackage.length;  j++){
// //     	    for(var i = 0 ; i < qtyOfDishs.length ; i++){
// //     	   if(dishClassOfPackage[j].value == "10"  && dishOfPackage[j].value < 10610){
// //     		   console.log("我是菜色類別"+dishClassOfPackage[j].value);
// //     	        console.log("我是菜色數量"+qtyOfDishs[i].value);
//     	        console.log("-------------------------------");
// //     	      }
// //     	    }
             
//          var total = 0;
//          for(var i = 0 ; i < qtyOfDish10s.length;  i++){    
//     	    console.log(formOfDish40.qtyOfDish40[i].value);
//     	    total += formOfDish10.qtyOfDish10[i].value;
//          }
//             if(total > 0){
//     	      formOfDish10.submit();
//             }else{
//     	      alert("錯囉");
//             }
        
	  
//      	  alert(document.getElementsByTagName("form")[4].qtyOfDishs.nodeValue);
//     	  console.log("=========================================");
//       }
      
      
      
      
</script>
</html>