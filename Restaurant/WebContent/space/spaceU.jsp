<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改場地配置</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="../js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/sweetalert.css">
<style type="text/css">
.show {
padding: 0.5em;
border: 3px solid #ccc;
background-color: #fff;
background-color: rgba(255,255,255,0.5);
text-align:center;
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
#dragThis{
	width: 50px;
    height: 50px;
    border: 3px solid #ccc;
}
#dragBigx{
	width: 100px;
    height: 50px;
    border: 3px solid #ccc;
}
#dragBigy{
	width: 50px;
    height: 100px;
    border: 3px solid #ccc;
}
div input{
	width: 80px;
	margin:10px 10px;
}

#dropHere {
    width: 1600px;
    height: 800px;
    padding: 0.5em;
    border: 3px solid #f90;
    border-radius: 1em;
    margin: 0 auto;
    position:relative;
}
</style>
<script>
$(function(){
	
	$('#selectspace').change(function(){
		var aa=$(this).find("option:selected");
		var drop = $('#dropHere');
		drop.empty();
		$.getJSON("spacename.do",{"whatdo":"showSpaceX"},function(data){
// 			var datas=JSON.parse(data);
			$.each(data,function(){
				if(aa.val()==this.space_id){
				var div1 = $("<div class='show "+this.table_shape +"' style='position:absolute;;left:"+this.table_x+"px;top:"+this.table_y+"px'></div>");
				var div21 = $("<div></div>");
					div21.html('桌號<input type="text"  name="table_name" value="'+this.table_id+'" />');
				var div22 = $("<div></div>");
					div22.html('人數<input type="text"  name="table_maxP" value="'+this.table_maxP+'"/>')
				var div23 = $("<div></div>");
					var input3 = $('<input type="text" hidden name="table_x" value="'+this.table_x+'"/>');
					div23.append(input3);
				var div24 = $("<div></div>");
					var input4 = $('<input type="text" hidden name="table_y" value="'+this.table_y+'"/>');
					div24.append(input4);
				var div25 = $("<div></div>");
					var input5 = $('<input type="text" hidden name="table_size" value="'+this.table_shape+'"/>');
					div25.append(input5);
				var div26 = $("<div></div>");
					var input6 = $('<input type="button" value="delete" />');
					div26.append(input6);
				 div1.append(div21);
				 div1.append(div22);
				 div1.append(div23);
				 div1.append(div24);
				 div1.append(div25);
				 div1.append(div26);          
				 drop.append(div1);		
				 
				}
			});	
		});
		
	});
	
	$('#dragThis,#dragBigx,#dragBigy').draggable(
		    {
		        containment: $('#dropHere'),
		        cursor:'crosshair',
				helper:'clone',
				appenTo:'#dropHere',
				start:function(event,ui){
					if($(this).attr("id")=="dragThis")
						ui.helper.addClass("show").addClass("small");
					if($(this).attr("id")=="dragBigx")
						ui.helper.addClass("show").addClass("bigx");
					if($(this).attr("id")=="dragBigy")
						ui.helper.addClass("show").addClass("bigy");
				},
		        stop: function(event,ui){
		            var copy = $(ui.helper.clone());
		            copy.find('div:lt(2),div:eq(5)').removeAttr("hidden");
		            copy.find('input:eq(2)').val(ui.position.left);
		            copy.find('input:eq(3)').val(ui.position.top);
		            $('#dropHere').append(copy);
		        }
		    });
	
	$(document).on('mouseover','.show',function(){
		$(this).draggable(
			    {
			        containment: $('#dropHere'),
			        cursor:'crosshair',
// 					appenTo:'#dropHere',
					drag:function(event,ui){
						$(this).find('input:eq(2)').val(ui.position.left);
			            $(this).find('input:eq(3)').val(ui.position.top);
					},
			        stop: function(event,ui){
			        }
		});
 	});
	
	$('#dropHere').droppable(
		    {
		        accept: 'div',
// 		        tolerance:'fit',
		        start : function(){
// 		            $(this).animate({'border-width' : '5px',
// 		                             'border-color' : '#0f0'
// 		                            }, 500);
// 		            $('#dragThis').draggable('option','containment',$(this));
		        }
		    });
	
	$(document).on('click','input[value="delete"]',function(){
		$(this).parent().parent().remove();
	});
	
	
	$('#updatexx').click(function(){
		var valuex = $('#selectspace').find("option:selected") ;
//			console.log(value.text());
		if(valuex.val() != 0){
			$.post("spacename.do",{"space_id":valuex.val(),"whatdo":"deleteSpaceX"},function(){
	// 			alert("delete success");
			});
			var arrary = $('.show');
			$.each(arrary,function(index,value){
				var text = "";
				var arr = $(this).find('input');
				$.each(arr,function(idx,va){
					if(idx==(arr.length-1))
						text+=$(this).val();
					else
						text+=$(this).val()+",";
				});
// 				console.log(text);
				$.post("spacename.do",{"text":text,"whatdo":"addspaceX","spacename":valuex.text()}
								,function(){
					sweetAlert("修改成功!");
// 					location.replace("spaceQ.jsp");
				});
			});
		}else{
			sweetAlert("請選擇場地名稱!");
		}
	});


});
	
</script>
</head>
<body>

<!-- &nbsp;&nbsp;&nbsp;<input type="text" id="space_name" disabled="disabled"/> -->
<%-- <jsp:useBean id="spaceXall" class="spaceX.model.SpaceXService" scope="page"/> --%>
<jsp:useBean id="spacetotal" class="com.space.model.SpaceService" scope="page"/>
<select id="selectspace">
	<option value="0">請選擇場地</option>
	<c:forEach var="space" items="${spacetotal.all}" varStatus="xx">
<%-- 		<c:if test="${xx.first}"> --%>
<%-- 			<option selected value="${space.space_id}">${space.space_name}</option> --%>
<%-- 		</c:if> --%>
		<option value="${space.space_id}">${space.space_name}</option>
	</c:forEach>
</select>


<table width="500px">
<tr>
	<td><div id="dragThis">
			<div hidden>桌號<input type="text" name="table_name" /></div>
			<div hidden>人數<input type="text" name="table_maxP" /></div>
	    	<div hidden><input type="text" name="table_x" /></div>
	        <div hidden><input type="text" name="table_y" /></div>
	        <div hidden><input type="text" name="table_size" value="small" /></div>
	        <div hidden><input type="button" value="delete" /></div>
	</div></td>
	<td><div id="dragBigx">
			<div hidden>桌號<input type="text" name="table_name" /></div>
			<div hidden>人數<input type="text" name="table_maxP" /></div>
	    	<div hidden><input type="text" name="table_x" /></div>
	        <div hidden><input type="text" name="table_y" /></div>
	        <div hidden><input type="text" name="table_size" value="bigx" /></div>
	        <div hidden><input type="button" value="delete" /></div>
	</div></td>
	<td><div id="dragBigy">
			<div hidden>桌號<input type="text" name="table_name" /></div>
			<div hidden>人數<input type="text" name="table_maxP" /></div>
	    	<div hidden><input type="text" name="table_x" /></div>
	        <div hidden><input type="text" name="table_y" /></div>
	        <div hidden><input type="text" name="table_size" value="bigy" /></div>
	        <div hidden><input type="button" value="delete" /></div>
	</div></td>
</tr>
</table>

	<div id="dropHere" ></div>
	
	<button id="updatexx" type="submit" class="btn btn-secondary ">更改配置</button>
<!-- 	<button id="delSpace" type="submit" class="btn btn-secondary ">刪除此配置</button> -->
</body>
</html>