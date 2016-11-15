<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>查詢場地配置</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script src="../js/jquery-3.1.1.min.js"></script> 
<link href="../css/font-awesome.css" rel="stylesheet"> 
<script src="../js/jquery.magnific-popup.js" type="text/javascript"></script>
<script src="../js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/sweetalert.css">
<script>
$(document).ready(function() {
	$('.popup-with-zoom-anim').magnificPopup({
		type: 'inline',
		fixedContentPos: false,
		fixedBgPos: true,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in'
	});
	
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
		
	});
																
});
</script>
<!--pop up end here-->
<style>
/* .sidebar-icon{ */
/* 	background-color:pink; */
/* } */
body,.inner-block{
	background-color:#F5F6CE;
}
.clerfix{
	border-style:solid;
}
.titlebar{
	background-color:black;
}
#menu span{
	position:absolute;
}
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
</head>
<body>	
<div class="page-container sidebar-collapsed">	
   <div class="left-content">
	   <div class="mother-grid-inner">
            <!--header start here-->
				<div class="header-main titlebar fixed">
					<div class="header-left">
							<div class="logo-name">
									 <a href="../index.jsp" >
									<img src="../img/title3.png" alt="Logo"/> 
								  </a> 								
							</div>
							<div class="clearfix"> </div>
						 </div>
						 <div class="header-right">
							
							<!--notification menu end -->
							<div class="profile_details">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
<!-- 												<span class="prfil-img"><img src="images/p1.png" alt=""> </span>  -->
												<div class="user-name">
													<p>顯示是經理還是員工</p>
													<p>顯示姓名</p>
												</div>
												<i class="fa fa-angle-down lnr"></i>
												<i class="fa fa-angle-up lnr"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-sign-in"></i> Logout</a> </li>
											<li> <a href="#"><i class="fa fa-sign-out"></i> Login</a> </li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="clearfix"> </div>				
						</div>
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
<!--inner block start here-->
<div class="inner-block">
    <div class="price-block-main">
<jsp:useBean id="spacetotal" class="com.space.model.SpaceService" scope="page"/>
<select id="selectspace">
	<option value="0">請選擇場地</option>
	<c:forEach var="space" items="${spacetotal.all}">
		<option value="${space.space_id}">${space.space_name}</option>
	</c:forEach>
</select>


<!-- <table width="500px"> -->
<!-- <tr> -->
<!-- 	<td><div id="dragThis"> -->
<!-- 			<div hidden>桌號<input type="text" name="table_name" /></div> -->
<!-- 			<div hidden>人數<input type="text" name="table_maxP" /></div> -->
<!-- 	    	<div hidden><input type="text" name="table_x" /></div> -->
<!-- 	        <div hidden><input type="text" name="table_y" /></div> -->
<!-- 	        <div hidden><input type="text" name="table_size" value="small" /></div> -->
<!-- 	        <div hidden><input type="button" value="delete" /></div> -->
<!-- 	</div></td> -->
<!-- 	<td><div id="dragBigx"> -->
<!-- 			<div hidden>桌號<input type="text" name="table_name" /></div> -->
<!-- 			<div hidden>人數<input type="text" name="table_maxP" /></div> -->
<!-- 	    	<div hidden><input type="text" name="table_x" /></div> -->
<!-- 	        <div hidden><input type="text" name="table_y" /></div> -->
<!-- 	        <div hidden><input type="text" name="table_size" value="Bigx" /></div> -->
<!-- 	        <div hidden><input type="button" value="delete" /></div> -->
<!-- 	</div></td> -->
<!-- 	<td><div id="dragBigy"> -->
<!-- 			<div hidden>桌號<input type="text" name="table_name" /></div> -->
<!-- 			<div hidden>人數<input type="text" name="table_maxP" /></div> -->
<!-- 	    	<div hidden><input type="text" name="table_x" /></div> -->
<!-- 	        <div hidden><input type="text" name="table_y" /></div> -->
<!-- 	        <div hidden><input type="text" name="table_size" value="Bigy" /></div> -->
<!-- 	        <div hidden><input type="button" value="delete" /></div> -->
<!-- 	</div></td> -->
<!-- </tr> -->
<!-- </table> -->

	<div id="dropHere" ></div>
	
	<button id="submit" type="submit" class="btn btn-secondary ">用此配置為監控畫面</button>
	<button id="delSpace" type="submit" class="btn btn-secondary ">刪除此配置</button>
<br/>
<br/>
<br/>
<br/>
<br/>



</div>
</div>

<!--pop-up-grid-->

</div>
</div>
<!--slider menu-->
    <div class="sidebar-menu">
		  	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
<!-- 			      <img id="logo" src="" alt="Logo"/>  -->
			  </a> </div>		  
		    <div class="menu">
		      <ul id="menu" >
		      
		        <li><a href="../table/formatTable.do?table=index"><i class="fa fa-eye"></i><span>監控畫面</span></a></li>
		        <li id="menu-comunicacao" ><a><i class="fa fa-phone-square"></i><span>預約</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-comunicacao-sub" >
		          	<li><a href="../reserve/reserveC.jsp">新增預約</a></li>
		            <li><a href="../reserve/reserveQ.jsp">查詢預約</a></li>
		          </ul>
		        </li>
		        <li><a><i class="fa fa-free-code-camp"></i><span>內場狀態</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	 <ul id="menu-academico-sub" >
			            <li><a href="../InsideView/Inside.jsp">內場</a></li>
			         	<li><a href="../Outsideview/Outside.jsp">出餐口</a></li>
		             </ul>
		        </li>
		        <li><a><i class="fa fa-id-badge"></i><span>員工</span><span class="fa fa-angle-right" style="float: right"></span></a>
		        	 <ul id="menu-academico-sub" >
			            <li><a href="../emp/EmpRegister.jsp">註冊</a></li>
			         	<li><a href="../emp/all_emp.jsp">修改</a></li> 
		             </ul>
		        </li>
		        <li><a><i class="fa fa-calendar"></i><span>班表</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	<ul id="menu-academico-sub" >
			            <li><a href="../index.jsp">新增</a></li>
			         	<li><a href="../index.jsp">修改</a></li>
		             </ul>
		        </li>
		        <li id="menu-academico" ><a><i class="fa fa-cutlery"></i><span>菜單</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-academico-sub" >
			          <li><a href="../product/listAllPro.jsp">菜色查詢</a></li>
			          <li><a href="../product/one_select_page.jsp">單一菜色查詢</a></li>
			          <li><a href="../product/addSinglePro.jsp">新增菜色</a></li>
			          <li><a href="../Package/AddPack.jsp">新增套餐</a></li>
			          <li><a href="../Package/UpdatePro.jsp">套餐查詢修改</a></li>           
		          </ul>
		        </li>
		        <li><a><i class="fa fa-sort-numeric-desc"></i><span>折扣</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul>
		            <li><a href="../discount/add_discount.jsp">新增折扣</a></li>
		            <li><a href="../discount/all_discount.jsp">查詢折扣</a></li>		            
		          </ul>
		        </li>
		        <li><a><i class="fa fa-braille"></i><span>場地配置</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul>
		            <li><a href="../space/spaceC.jsp">新增場地</a></li>
		            <li><a href="../space/spaceQ.jsp">查詢場地</a></li>
		            <li><a href="../space/spaceU.jsp">修改場地</a></li>		            
		          </ul>
		        </li>
		        <li id="menu-academico" ><a><i class="fa fa-bar-chart"></i><span>統計圖</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-academico-sub" >
			          <li><a href="../chart/chartPcg.jsp">套餐</a></li>
			          <li><a href="../chart/chartDish.jsp">菜色</a></li>
			          <li><a href="../chart/chartMoney.jsp">營收</a></li>      
		          </ul>
		        </li> 
		      
		      </ul>
		    </div>
	 </div>
	<div class="clearfix"> </div>
</div>
<!--slide bar menu end here-->
<script>
var toggle = false;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
   		$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    	$("#menu span").css({"position":"absolute"});
  }
  else{
    	$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    	setTimeout(function() {
      		$("#menu span").css({"position":"relative"}); }, 400);
  }               
  toggle = !toggle;
});
</script>
<!--scrolling js-->
		<script src="../js/jquery.nicescroll.js"></script>
		<script src="../js/scripts.js"></script>
		<script src="../js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>
