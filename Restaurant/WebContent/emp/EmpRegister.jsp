<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Login</title>

<style>
#Div1{
	width: 500px;
	height:570px;
	padding:20px;
	border-radius: 10px
	
}

.st1{
	margin: 10px
}
</style>
</head>
<body>
<br>
<br>
<br>
	<div align="center">
 <div id="Div1" align="left" style="border: 1px red solid">
              <br />
             <fieldset>
         <legend>員工註冊</legend>
         
         <form name="myform" id="form1" method="post" action="emp.do">
       
        <div class="st1">
            
           	 姓名:<input type="text" id="userName" name="emp_name" size="18" maxlength="10" placeholder="請輸入姓名" />
            <span id="idsp"></span>
          
            <br>
            <label style="color:gray; font-size:7px">(1.不可空白，2.至少兩個字以上，3.必須為中文或英文)</label> 
            
          
        </div>
        
         <div class="st1">
            
		 性別:	
		 		<input type="radio" name="emp_gender" value="男性">男
				<input type="radio" name="emp_gender" value="女性">女
                     
          
        </div>
        <!--<hr>-->
        <div class="st1">
            
		<label style="margin-right:  25px">職級:<select name="emp_title">
				<option value="員工">員工</option>
				<option value="領班">領班</option>
				<option value="經理">經理</option>
			</select>
		</label>
		<label style="margin-left: 25px">性質:<select name="emp_fulltime">
				<option value="全職">全職</option>
				<option value="兼職">兼職</option>
			</select>
		</label>
		       
       		<label style="margin-left: 25px">狀態:<select name="emp_status">
				<option value="在職中">在職中</option>
				<option value="已離職">已離職</option>
			</select>
		</label>
        
		
        </div>
        
          <div class="st1">
        <div>
       	到職日:<input type="text" id="Emphiredate" name="emp_hiredate">
        
    	</div>
	</div>
         <!--<hr>-->
        <div class="st1">
            
		薪資:<input type="text" id="salary" name="emp_salary" placeholder="請輸入薪資">
             <span id="sap"></span>
            
            <br> 
            <label style="color:gray; font-size:7px">(薪資欄不可空白)</label>
        </div>
        
        <!--<hr>-->
        <div class="st1">
		連絡電話:<input type="text" id="phone1" name="emp_phone" size="3" maxlength="4">
			-<input type="text"  id="phone2" name="emp_phone" size="2" maxlength="3">
			-<input type="text" id="phone3" name="emp_phone" size="2" maxlength="3">
            
        </div>
        <div class="st1">
       	 身分證號碼:<input type="text" id="emp_idnumber" name="emp_idnumber" size="15" maxlength="10">
        </div>
         <div class="st1">
		
         <div>
                  居住地:<select id="county" name="emp_addr">
            	<option value="" selected></option>
            	<option value="台灣">台灣</option>
            	<option value="日本">日本</option>
            </select>
            <select name="district1" hidden>
            	<option value="台北">台北</option>
            	<option value="基隆">基隆</option>
            	<option value="新北">新北</option>
            	<option value="宜蘭">宜蘭</option>
            	<option value="新竹">新竹</option>
            	<option value="桃園">桃園</option>
            	<option value="苗栗">苗栗</option>
            	<option value="台中">台中</option>
            	<option value="彰化">彰化</option>
            	<option value="南投">南投</option>
            	<option value="嘉義">嘉義</option>
            	<option value="雲林">雲林</option>
            	<option value="台南">台南</option>
            	<option value="高雄">高雄</option>
            	<option value="澎湖">澎湖</option>
            	<option value="屏東">屏東</option>
            	<option value="台東">台東</option>
            	<option value="花蓮">花蓮</option>
            	<option value="金門">金門</option>
            	<option value="連江">連江</option>
            </select>

         </div>
            
        </div>
         
     <div class="st1">
        <div>
       	生日:<input type="text" id="EmpBdate" name="emp_birthday">
        
    	</div>
	</div>
		
	<div class="st1">
        <div>
       	
       	信箱:<input type="email" id="EmpEmail" name="emp_email">
        
        </div>
	</div>
	
	<div class="st1">
        <div>    	
       	密碼:<input type="password" id="EmpPassword" name="emp_password">
        </div>
 
	</div>
	
	
        <div align="center">
        	<input type="hidden" name="action" value="insert">
			<input type="submit"value="送出" />
			<input type="reset" value="清除" />
     </div>
             </form>
                
    </fieldset>
 </div>        
		</div>
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
<script>
	$(function(){
		$("#userName").blur(function(){
			var un=$("#userName").val()
				
			if(un==1){
				$("#idsp").html("<img src='../icon/xx.png' /><span style='color:red;font-size:3px'>姓名至少要兩個字以上</span>")
				$("#userName").focus();
			}else if(un.trim()==""||un==null){
				$("#idsp").html("<img src='../icon/xx.png' /><span style='color:red;font-size:3px'>姓名不能空白</span>")
				$("#userName").focus();
			}else if(un.match(/[^\u3447-\uFA29 a-z A-Z]/ig)){
				$("#idsp").html("<img src='../icon/xx.png' /><span style='color:red;font-size:3px'>必須為中文或英文</span>")
				$("#userName").focus();
			}else{
				$("#idsp").html("<img src='../icon/oo.png' /><span style='color:red;font-size:3px'>格式正確</span>")
			}		
		})
			
		$("#salary").blur(function(){	
			var sal=$("#salary").val()
				
			if(sal==null||sal==""){
				$("#sap").html("<img src='../icon/xx.png' /><span style='color:red;font-size:3px'>薪資欄不能空白</span>")
				$("#salary").focus();
			}else if(sal<5000){
					$("#sap").html("<img src='../icon/xx.png' /><span style='color:red;font-size:3px'>薪資欄不能低於5000</span>")
					$("#salary").focus();
			}else{
				$("#sap").html("<img src='../icon/oo.png' /><span style='color:red;font-size:3px'>格式正確</span>")
			}
		})
		
		$("#county").click(function(){
			var cou=$("#county").val()
			console.log(cou)
			if(cou=="台灣"){
				$("select[name='district1']").removeAttr("hidden")
			}else{
				$("select[name='district1']").attr("hidden", "hidden")
			}
		})

		$('#EmpBdate').datepicker({	
			format: 'yyyy-mm-dd',
		    startView:'decade'		
		});
		
		$('#Emphiredate').datepicker({	
			format: 'yyyy-mm-dd',
			todayBtn: "linked"		
		});
		
		
		
	})
</script>
</body>
</html>