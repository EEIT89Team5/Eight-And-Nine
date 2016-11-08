<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>桌位狀況</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script>

	$(function(){
		var peopleform = $('#peopleform');
		var myModalLabel=$('#myModalLabel');
		var pfrom=$('#peopleform p');
		$('#people').click(function (){
			peopleform.slideToggle(300);
		});
		$('#myModal').focus(function(){peopleform.slideUp(300);});
		$('#second div').click(function(){
			var table_name = $(this).find("[name='a']").text();
			myModalLabel.text('選單').append("<b>"+ table_name +"</b>");
			pfrom.html("<input style='display:none' name='table_name' value="+table_name+" />");
			$('#clear').attr('href','formatTable.do?table=clear&table_name='+table_name);
			$('#paymoney').attr('href','formatTable.do?table=paymoney&table_name='+table_name);
		});
		var myVar = setInterval(myTimer, 1000);
		function myTimer() {
		    var d = new Date();

			document.getElementById("xx").innerHTML = d.toTimeString("zh-TW").substring(0,8);
		} 
	});

</script>
<style>
	body{background-color:#000000;}
 	#main{
 		width:1600px;
		margin:40px 50px;
 	} 
 	#second{
/*  		border:1px solid gray; */
 		margin:20px 0px;
 		position:relative;
 	}
	.xx{
		text-align:center;
 		font-family:Microsoft JhengHei;
		font-size:20px;
		font-weight:bold;
		border:3px solid white;
		position:absolute;
	}
	.small{
		width: 150px;
	    height: 150px;
	}
	.bigx{
		width: 300px;
	    height: 150px;
	}
	.bigy{
		width: 150px;
	    height: 300px;
	}
	p{
		width:110px;
		border:1px;
 		margin:0px 20px; 
		color:#FFFFFF;
	}
	.bigx p{margin:0px 95px; }
 	.bigy p[name="a"]{margin:75px 20px 0px 20px; } 
	
	.a{background-color:#000000;
		color:#FFFFFF;}
	.b{background-color:#F4FA58;
		color:#000000;}
	.c{background-color:#58FAD0;
		color:#000000;}
	.d{background-color:#F5A9F2;
		color:#000000;}

	
	
.modal{text-align: center; } 

@media screen and (min-width: 768px) { 
  .modal:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

 .modal-dialog { 
   display: inline-block; 
   text-align: left; 
   vertical-align: middle; 
 } 
</style>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
        <h2 class="modal-title text-center" id="myModalLabel" >選單</h2>
      </div>
      <div class="modal-body">
      		<br />
			<button id="people" type="button" class="btn btn-warning btn-lg btn-block">入座資訊</button><br />
			
			<form id="peopleform" role="form" action='formatTable.do' style="display:none;height:100px">
				    <div class="form-group">
					    <label for="table_numP" class="col-sm-2 control-label">人數</label>
					    <div class="col-sm-10">
					    <input type="text" class="form-control" id="table_numP" name="table_numP" placeholder="輸入本桌客人數量">
					    </div>
					</div><input style='display:none' name='table' value="numP" />
					<p></p>
					<div class="col-sm-offset-10 col-sm-10 form-group">
				  		<button type="submit" class="btn btn-secondary ">送出</button>
				  	</div>
			</form>
			<br />
			<a href="formatTable.do" id="paymoney" class="btn btn-primary btn-lg btn-lg btn-block" role="button">結帳</a><br /><br />
			<a href="formatTable.do" id="clear" class="btn btn-danger btn-lg  btn-lg btn-block" role="button">清空</a><br /><br />
			

<!-- 			<!-- 提供額外視覺上的重量和識別一組按鈕中主要的操作項目 --> 
<!-- 			<button type="button" class="btn btn-primary btn-lg btn-block">結帳</button><br /><br /> -->
<!-- 			<!-- 指出危險或潛在負面作用的行動 --> 
<!-- 			<button type="button" class="btn btn-danger btn-lg btn-block">清空</button><br /><br /> -->
      </div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"> -->
<!--   Launch demo modal -->
<!-- </button> -->
<div id="main">
	<a href="../index.jsp" class="btn btn-default btn-lg active" role="button">回主頁</a>
	<h1 style="color:pink;float:right" id="xx">${time}</h1>
	<h3 style="color:red;float:right;width:400px"> ${errorMsgs}</h3>
	
	<div id="second">
		<c:forEach var="table" items="${AllTable}" varStatus="xx">
			<c:choose>
				<c:when test="${table.table_status=='空桌'}">
					<c:set var="color" value="a" />
				</c:when>
				<c:when test="${table.table_status=='未點餐'}">
					<c:set var="color" value="b" />
				</c:when>
				<c:when test="${table.table_status=='用餐中'}">
					<c:set var="color" value="c" />
				</c:when>
				<c:when test="${table.table_status=='菜上齊'}">
					<c:set var="color" value="d" />
				</c:when>
			</c:choose>
			<div class="xx ${table.table_shape}" style="left:${table.table_x}px;top:${table.table_y}px" data-toggle="modal" data-target="#myModal">
				<p name="a">${table.table_name}</p>
				<p class='${color}'>${table.table_status}</p>
				<p>${table.table_paid}</p>
				<p>${table.table_numP}/${table.table_maxP}</p>
				<p>${table.table_time}</p>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>