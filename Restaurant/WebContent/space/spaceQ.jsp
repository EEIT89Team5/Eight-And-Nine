<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢場地配置</title>
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
    border: 3px solid white;
}
#dragBigx{
	width: 100px;
    height: 50px;
    border: 3px solid white;
}
#dragBigy{
	width: 50px;
    height: 100px;
    border: 3px solid white;
}
div input{
	width: 80px;
	margin:20px 10px;
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
// 			alert(data);
			$.each(data,function(){
				if(aa.val()==this.space_id){
				var div1 = $("<div class='show "+this.table_shape +"' style='position:absolute;;left:"+this.table_x+"px;top:"+this.table_y+"px'></div>");
				var div21 = $("<div></div>");
					div21.html('桌號<input type="text" readonly name="table_name" value="'+this.table_id+'" />');
				var div22 = $("<div></div>");
					div22.html('人數<input type="text" readonly name="table_maxP" value="'+this.table_maxP+'"/>')

				 div1.append(div21);
				 div1.append(div22);
         
				 drop.append(div1);		
				 
				}
			});	
		});
		
	});
	
// 	$('#selectspace').find('option:eq(1)').attr("color","red");
	

	$('#submit').click(function(){
		var valuex = $('#selectspace').find("option:selected") ;
		if(valuex.val() != 0){
			var value = $('#selectspace').find("option:selected") ;
			if(value.val()!=0){
				$.post("spacename.do",{"space_id":value.val(),"whatdo":"changeTable"},function(){
// 					alert("success!!!");
					location.replace("../table/formatTable.do?table=index");
				})
			}
		}else{
			sweetAlert("請選擇場地名稱!");
		}
	});
	
	$('#delSpace').click(function(){
		var valuex = $('#selectspace').find("option:selected") ;
		if(valuex.val() != 0){
			sweetAlert({   
				title: "Are you sure?",   
				text: "You will not be able to recover this imaginary file!",   
				type: "warning",   
				showCancelButton: true,   
				confirmButtonColor: "#DD6B55",   
				confirmButtonText: "Yes, delete it!",   
				cancelButtonText: "No, cancel plx!",   
				closeOnConfirm: false,   
				closeOnCancel: false }, 
				function(isConfirm){   
					if (isConfirm) {     
	// 					sweetAlert("Deleted!", "Your imaginary file has been deleted.", "success");
						var value = $('#selectspace').find("option:selected") ;
						if(value.val()!=0){
							$.post("spacename.do",{"space_id":value.val(),"whatdo":"deleteSpace"},function(){
				 				location.replace("spaceQ.jsp");
							})
						}}
					else {     
						sweetAlert("Cancelled", "Your imaginary file is safe :)", "error");   }
			});
		}else{
			sweetAlert("請選擇場地名稱!!");
		}
		
// 		var value = $('#selectspace').find("option:selected") ;
// 		if(value.val()!=0){
// 			$.post("spacename.do",{"space_id":value.val(),"whatdo":"deleteSpace"},function(){
// // 				alert("success!!!");

// // 				location.replace("spaceQ.jsp");
// 			})
// 		}
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
	<c:forEach var="space" items="${spacetotal.all}">
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
	        <div hidden><input type="text" name="table_size" value="Bigx" /></div>
	        <div hidden><input type="button" value="delete" /></div>
	</div></td>
	<td><div id="dragBigy">
			<div hidden>桌號<input type="text" name="table_name" /></div>
			<div hidden>人數<input type="text" name="table_maxP" /></div>
	    	<div hidden><input type="text" name="table_x" /></div>
	        <div hidden><input type="text" name="table_y" /></div>
	        <div hidden><input type="text" name="table_size" value="Bigy" /></div>
	        <div hidden><input type="button" value="delete" /></div>
	</div></td>
</tr>
</table>

	<div id="dropHere" ></div>
	
	<button id="submit" type="submit" class="btn btn-secondary ">用此配置為監控畫面</button>
	<button id="delSpace" type="submit" class="btn btn-secondary ">刪除此配置</button>
</body>
</html>