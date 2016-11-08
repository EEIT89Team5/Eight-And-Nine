<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>場地配置</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="../js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/sweetalert.css">

<style type="text/css">
	.show {
    padding: 0.5em;
    border: 3px solid #ccc;
/*     border-radius: 0 1em 1em 1em; */
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
// 	sweetAlert("Oops...", "Something went wrong!", "error");	

		sweetAlert({   title: "場地名稱!",   
// 			text: "Write something interesting:",   
			type: "input",   
			showCancelButton: false,   
			closeOnConfirm: false,   
			animation: "slide-from-top",   
			inputPlaceholder: "Write something" }, 
			function(inputValue){   
				if (inputValue === false) {
					return false;
				}if (inputValue === "") {     
					sweetAlert.showInputError("You need to write something!");     
					return false 
				}
				if (inputValue.trim() === "") {     
					sweetAlert.showInputError("請輸入非空白字元!");     
					return false 
				}
// 				}else {
// 					$('#space_name').val(inputValue);
// 					$.post("spacename.do",{"space_name":$('#space_name').val(),"whatdo":"addspace"},function(data){
// 						console.log(data);
// 						if(data=="falsex"){
// 							sweetAlert.showInputError("You need to write something!!!");     
// 							return false
// // 							setTimeout(window.location.href='spaceC.jsp',1000);
// // 							sweetAlert.showInputError("!!!!!!!");     
// // 							return false 
// // 							sweetAlert("場地名稱已存在", "剛剛輸入的場地名稱 : " + inputValue, "error");
// // 							return false
// 						}else if(data=="truex"){
// 							sweetAlert("Nice!", "場地名稱 : " + inputValue, "sucess"); 
// // 							$('#space_name').val(inputValue);
// 						}
// 					});
// 				}
				
				$('#space_name').val(inputValue);
				
				$.post("spacename.do",{"space_name":$('#space_name').val(),"whatdo":"addspace"},function(data){
					console.log(data);
					
					if(data=="falsex"){
// 						console.log("this is false");
// 						sweetAlert("場地名稱已存在", "剛剛輸入的場地名稱 : " + inputValue, "error");
// 						alert("輸入的場地名稱 :"+inputValue+",已存在");
						sweetAlert.showInputError("場地名稱已存在!!!!");     
						return false
					
					}else{
							sweetAlert("Nice!", "場地名稱 : " + inputValue, "success"); 
						}
				});
// 				sweetAlert("Nice!", "場地名稱 : " + inputValue, "success");
				
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
						appenTo:'#dropHere',
						drag:function(event,ui){
							$(this).find('input:eq(2)').val(ui.position.left);
				            $(this).find('input:eq(3)').val(ui.position.top);
						},
				        stop: function(event,ui){
// 				            var copy = $(ui.helper.clone());
// 				            $(this).find('div:lt(4)').removeAttr("hidden");
// 				            $(this).find('input:eq(2)').val(ui.position.left);
// 				            $(this).find('input:eq(3)').val(ui.position.top);
// 				            $('#dropHere').append(copy);
				        }
				    });
	 	});
		
		
		$('#dropHere').droppable(
		    {
		        accept: '.show',
// 		        tolerance:'fit',
		        start : function(){
// 		            $(this).animate({'border-width' : '5px',
// 		                             'border-color' : '#0f0'
// 		                            }, 500);
		            $('#dragThis').draggable('option','containment',$(this));
		        }
		    });
		
// 		var count=0;
		$('#submitx').click(function(){
			if($('#dropHere').html()!=""){
				var arrary = $('.show');
				$.each(arrary,function(index,value){
					var text = "";
					var arr = $(this).find('input');
					$.each(arr,function(idx,va){
						if(idx==(arr.length-1))
							text+=$(this).val();
						else
							text+=$(this).val()+",";
	// 					console.log(text);
					});
					$.post("spacename.do",{"text":text,"whatdo":"addspaceX","spacename":$('#space_name').val()}
									,function(){
						location.replace("../index.jsp");
					});
				});
			}else{
				sweetAlert("請新增桌子");
			}
		});
		
// 		$('#deletex').click(function(){
// 			$.post("spacename.do",{"whatdo":"delNullSpace","spacename":$('#space_name').val()},funcion(){
// 				location.replace("index.jsp");
// 			});
// 		});
		
		$(document).on('click','input[value="delete"]',function(){
			$(this).parent().parent().remove();
// 			$('#dropHere').remove();
// 			$(this).parent('.show').addClass("bbbbbb");
		});
		
});

</script>
</head>
<body>
<!-- 	<a href="index.jsp" class="btn btn-default btn-lg active" role="button">回主頁</a> -->
&nbsp;&nbsp;&nbsp;<input type="text" id="space_name" disabled="disabled"/>

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
	
	<button id="submitx" type="submit" class="btn btn-secondary ">送出</button>
	<a href="../index.jsp">回首頁</a>
</body>
</html>