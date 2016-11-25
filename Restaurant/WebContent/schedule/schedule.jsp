<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>班表</title>
<link rel="stylesheet" href="../css/fullcalendar.css">

<!-- <script src="../js/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
   <script src="../js/event.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/moment.min.js"></script>
<script src="../js/fullcalendar.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.0.1/fullcalendar.min.j"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.0.1/fullcalendar.min.css"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.0.1/fullcalendar.print.css"> -->
<script>
$(document).ready(function() {

    var selectmonth=$('#prevselmonth').val();
    if(selectmonth!=""){
    	$('#calendar').fullCalendar({
    		header: {
    			left: 'prev,next',
    			center: 'title',
    			right: null
    		},
    		defaultDate:selectmonth,
    		views:{
    			month:{
    				titleFormat:'YYYY-MM'
    			}
    		},
    		fixedWeekCount:false
    	});
    }else{
    	$('#calendar').fullCalendar({
    		header: {
    			left: 'prev,next',
    			center: 'title',
    			right: null
    		},
    		views:{
    			month:{
    				titleFormat:'YYYY-MM'
    			}
    		},
    		fixedWeekCount:false
    	});
    }
	
	var monthDate=$("#calendar h2").text();
	$.getJSON("schedule.do",{"action":"getAllByMonth","monthDate":monthDate},function(datass){
		var divv = $('div[class="fc-bg"]');
		$.each(datass,function(index,value){
			var datediv = divv.find('td[data-date="'+datass[index].date+'"]');
			var timeperioddiv = datediv.find('div[name="'+datass[index].timeperiod+'"]');
			var array = timeperioddiv.text().split(" ");
			if((array.length-1)%2==0){
				if((array.length-1)==0){
					timeperioddiv.text("");
				}else{				
					timeperioddiv.append("<br />");
				}
			}
			timeperioddiv.append(datass[index].name+" ");
		})
	});
	
	$('div[class="fc-bg"] td').css("border","2px solid gray").html('<div style="height:50%;background-color:yellow" name="午班">&nbsp;</div><div style="height:50%;background-color:lightblue" name="晚班">&nbsp;</div>');
	$('div[class="fc-bg"] td div').attr("data-toggle","modal").attr("data-target","#myModal");
	$('div[class="fc-bg"] td[class*=" fc-other-month"]').empty().css("background-color","lightgray");
	
	$('div[class="fc-bg"] td div').click(function(){
		$('input[name="emps"]').prop("checked",false);
		var prevemps=$(this).text().split(" ");
		var empslabel=$('#empform label');
		$.each(prevemps,function(i,v){
// 			console.log(i+"----->"+prevemps[i]);
			$.each(empslabel,function(ii,vv){
				if(prevemps[i].trim()==empslabel[ii].innerHTML){
					($(this).prev()).prop("checked",true);
// 					console.log(ii+"/////////"+$(this).text());
				}
			});
		});
		$("#scheduledate").val(($(this).parent('td')).attr("data-date"));
		$("#timeperiod").val($(this).attr("name"));
		$('#myModalLabel').html(($(this).parent('td')).attr("data-date")+","+$(this).attr("name"));
	});
	
// 	$('div[class="fc-bg"] td div').hover(function(){
// 			$(this).css("overflow-y","auto");
// 		},function(){
// 			$(this).css("overflow-y","hidden");
// 	});
	
	
<%--按下往下一月和上一月的button會執行的程式碼--%>
	
	$('div[class="fc-button-group"] button').click(function(){
		$('div[class="fc-bg"] td').css("border","2px solid gray").html('<div style="height:50%;background-color:yellow" name="午班">&nbsp;</div><div style="height:50%;background-color:lightblue" name="晚班">&nbsp;</div>');
		$('div[class="fc-bg"] td div').attr("data-toggle","modal").attr("data-target","#myModal");
		$('div[class="fc-bg"] td[class*=" fc-other-month"]').empty().css("background-color","lightgray");
		
		var monthDate=$("#calendar h2").text();
		$.getJSON("schedule.do",{"action":"getAllByMonth","monthDate":monthDate},function(datass){
			var divv = $('div[class="fc-bg"]');
			$.each(datass,function(index,value){
				var datediv = divv.find('td[data-date="'+datass[index].date+'"]');
				var timeperioddiv = datediv.find('div[name="'+datass[index].timeperiod+'"]');
				var array = timeperioddiv.text().split(" ");
// 				if(array.length%2==0){
// 					timeperioddiv.append("<br />");
// 				}
				if((array.length-1)%2==0){
					if((array.length-1)==0){
						timeperioddiv.text("");
					}else{				
						timeperioddiv.append("<br />");
					}
				}
				timeperioddiv.append(datass[index].name+" ");
			})
		});
		
		$('div[class="fc-bg"] td div').click(function(){
			$('input[name="emps"]').prop("checked",false);
			var prevemps=$(this).text().split(" ");
			var empslabel=$('#empform label');
			$.each(prevemps,function(i,v){
// 				console.log(i+"----->"+prevemps[i]);
				$.each(empslabel,function(ii,vv){
					if(prevemps[i].trim()==empslabel[ii].innerHTML){
						($(this).prev()).prop("checked",true);
//	 					console.log(ii+"/////////"+$(this).text());
					}
				});
			});
			$("#scheduledate").val(($(this).parent('td')).attr("data-date"));
			$("#timeperiod").val($(this).attr("name"));
			$('#myModalLabel').html(($(this).parent('td')).attr("data-date")+","+$(this).attr("name"));
		});
		
// 		$('div[class="fc-bg"] td div').click(function(){
// 			$("#scheduledate").val(($(this).parent('td')).attr("data-date"));
// 			$("#timeperiod").val($(this).attr("name"));
// 			$('#myModalLabel').html(($(this).parent('td')).attr("data-date")+","+$(this).attr("name"));
// 		});

	});

	
});	
	
</script>
<style>
body {
/* 	margin: 10px 10px; */
	padding: 0;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	font-size: 14px;
}

#calendar {
	width: 1100px;
/* 	height:1000px  */
	margin: 0 auto;
}
	
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
 
span[class="fc-day-number"]{
 	font-size: 15px;
 	font-weight: bold;
}
div[class="fc-bg"] td div{
 	font-size: 15px;
 	font-weight: bold;
}
div[class="fc-row fc-week fc-widget-content"]{
	height: 200px;
}
div[name="午班"],div[name="晚班"]{ 
 	overflow-y: auto; 
 	padding: 8px 13px;
} 

</style>
</head>


<body>

<div id="calendar"></div>

<input hidden id="prevselmonth" value="${calendar}" />

<jsp:useBean id="empvo" class="com.emp.model.EmpService" />
<!-- 	<div style="height: 50%;"></div> -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
        <h2 class="modal-title text-center" id="myModalLabel" ></h2>
      </div>
      <div class="modal-body">
      		<br />
<!-- 			<button id="people" type="button" class="btn btn-warning btn-lg btn-block">入座資訊</button><br /> -->
			
			<form id="empform" role="form" action='schedule.do' style="height:100px">
				   <input hidden id="scheduledate" name="scheduledate" value="" />
				   <input  hidden name="action" value="insertschedule" />
<!-- 				   <select id="timeperiod" name="timeperiod"> -->
<!-- 				   		<option value="午班">午班</option> -->
<!-- 				   		<option value="晚班">晚班</option> -->
<!-- 				   </select> -->
<!-- 				   <select multiple="multiple" name="emps"> -->
<%-- 				   <c:forEach var="empx" items="${empvo.getAll2()}"> --%>
<%-- 				   		<option value="${empx.emp_id}">${empx.emp_name}</option> --%>
<%-- 				   </c:forEach> --%>
<!-- 				   </select> -->
					<input hidden id="timeperiod" name="timeperiod" value="" />
					<c:forEach var="empx" items="${empvo.getAll2()}"> 
						<span>
							<input id="${empx.emp_id}" type="checkbox" value="${empx.emp_id}" name="emps" /><label for="${empx.emp_id}">${empx.emp_name}</label>
				   		</span>
				   </c:forEach>
					<br />
					<br />
			<button type="submit" class="btn btn-primary btn-lg btn-block">確認</button><br /><br />
			</form>
			
<!-- 			<a href="formatTable.do" id="paymoney" class="btn btn-primary btn-lg btn-lg btn-block" role="button">確認</a><br /><br /> -->
<!-- 			<a href="formatTable.do" id="clear" class="btn btn-danger btn-lg  btn-lg btn-block" role="button">清空</a><br /><br /> -->
			

<!-- 			<!-- 提供額外視覺上的重量和識別一組按鈕中主要的操作項目 --> 
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
	
</body>
</html>