<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增預約</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <script src="js/jquery-ui.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- <script src="test/jquery-ui.min.datePicker.js"></script> -->
<!-- <link rel="stylesheet" href="test/jquery-ui.theme.min.css"> -->
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
<script src="../js/bootstrap-datepicker.min.js"></script>
<style>

form{
	border:3px double #7e85c4;
	border-radius:20px;
	width:500px;
/*  	text-align:center;  */
 	margin: 0px auto;
	}
fieldset {
/* 	margin: 0px auto; */
/* 	width:700px; */
/*     border:3px double #7e85c4; */
/*     border-radius:20px; */
	}
legend {
	text-align:center;
	font-size:30px;
	font-weight:bold;
	}
.stl {
    width:150px;
    float:left;
    text-align:right; 
	font-size:20px;
/*     padding-right:10px;  */
    }
.std {
	width:500px;
	height:50px;
/* 	margin:16px 100px; */
/* 	border-bottom:1px solid #d0cccc; */
	padding-bottom:16px;
	}
.again{
	color:red;
}

</style>
<script type="text/javascript">
$(function(){
	
	$('#submitx').click(function(){
		var count = 0;
		var date = $('#date');
		if(date.val()==""){
			$('#sp1').html("不可為空白");
			count++;
		}else
			$('#sp1').empty();
		var res_name = $('#res_name');
		if(res_name.val()==""){
			$('#sp2').html("不可為空白");
			count++;
		}else
			$('#sp2').empty();
		var res_phone = $('#res_phone');
		if(res_phone.val()==""){
			$('#sp3').html("不可為空白");
			count++;
		}else
			$('#sp3').empty();
		var res_nump = $('#res_numP');
		if(res_nump.val()==""){
			$('#sp4').html("不可為空白");
			count++;
		}else{
			if(isNaN(res_nump.val())){
				$('#sp4').html("請輸入數字");
				count++;
			}else
				$('#sp4').empty();
		}
		if(count==0){
// 			alert("success");
			$('#formx').submit();
		}
	});
// 	$('#submitx').click(function(){
// 		alert("ok");
// 		$('#formx').submit();
// 	});
	
	$('#date').datepicker({	
		autoclose: true,
		format: 'yyyy-mm-dd',
	    todayBtn: "linked",
	    todayHighlight: true
	});
});
</script>
</head>
<body>
	<form id="formx" class="form-inline" action="ReserveServlet.do?doWhat=createOne" method="post">
	    <fieldset>
	        <legend>預約資料<span class="again"></span></legend>
	        <div class="std">
	            <label class="stl" for="date">日期 :</label>
	            <input type="text" class="form-control" id="date" name="date" placeholder="yyyy-mm-dd" />
	            	<span id="sp1"></span>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="time">時間 :</label>
<!-- 	            <input type="text" id="time" name="time"  /> -->
	            <select id="time" name="time">
	            	<option value="11">11點</option>
	            	<option value="12">12點</option>
	            	<option value="13">13點</option>
	            	<option value="17">17點</option>
	            	<option value="18">18點</option>
	            	<option value="19">19點</option>
	            	<option value="20">20點</option>
	            </select>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="res_name">姓氏 :</label>
	            <input type="text" class="form-control" id="res_name" name="res_name" placeholder="請輸入姓氏" /><span id="sp2"></span>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="man">性別 :</label>
	            	<input type="radio" id="man" name="res_gender" value="先生" checked="checked"><label for="man">先生</label>
	            	<input type="radio" id="woman" name="res_gender" value="小姐"><label for="woman">小姐</label>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="res_phone">手機 :</label>
	            <input type="text" class="form-control" id="res_phone" name="res_phone" placeholder="請輸入電話號碼" /><span id="sp3"></span>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="res_numP">人數 :</label>
	            <input type="text" class="form-control" id="res_numP" name="res_numP" placeholder="請輸入人數" /><span id="sp4"></span>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="res_remark">特殊需求 :</label>
	            <input type="text" class="form-control" id="res_remark" name="res_remark" />
	            <br/>
	        </div>
	        <div class="std">
	            <input type="button" id="submitx" value="送出" />
	            <input type="reset" value="清除" />
	        </div>
	    </fieldset>
	</form>
	
</body>
</html>