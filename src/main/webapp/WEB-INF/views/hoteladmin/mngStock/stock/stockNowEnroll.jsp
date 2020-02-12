<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bodyDiv{
	margin-top:5px;
	width: 760px;
	height: 420px;
	} 
	.same{
	display: inline-block;

	margin-top: 20px;
	}
	#sam{
	width: 540px; 
	}
	#ssam{
	width:100px;
	}
	#search{
	width:100px;
	margin-left: 110px;
	color: blue;
	}
	#textArea{
	margin-left: 65px; 
	border-radius: 3px;
	}
	input[type=text]{
	}
	.btnsc{
	border-radius: 2px; 
	float: right;
	}
	.imgDiv{
	font-size: 20px;
	}
	.divhr{
	width: 760px;
	border-bottom: 1px solid black;
	margin-top: 3px;
	}
	#wrap{
	margin-left: 20px;
	}
	#enrollBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	margin-right: 72px;
	   position: relative;
    bottom: 24px;
	}
</style>
</head>
<body>
	<header>
	</header>
		<div id="wrap">
		<form action="insertStock.sto" method="post" id="insertStock">
		<div class="bodyDiv">
		<div>	<div class="same" id="ssam">물품명</div>  <div class="same"><input type="text" class="space" style="width:600px" id="iName" name="iName"></div>  </div>
		<div>	<div class="same" id="ssam">품목그룹</div>  <div class="same"><select style="width: 150px; height: 24px" id="sCategoryFilter" name="typeNo"><option hidden="hidden">검색조건</option></select></div>
		<div>	<div class="same" id="ssam">매입처</div>  <div class="same"></div><select style="width: 150px; height: 24px" id="cnName" name="cnCode"><option hidden="hidden">검색조건</option></select>  </div>
		 <div>	<div class="same" id="ssam">제조사</div>  <div class="same"><input type="text" class="space" style="width:600px" id="mfg" name="mfg"></div></div>
		 <div>	<div class="same" id="ssam">단가</div>  <div class="same"><input type="text" class="space" style="width:600px" id="up" name="up"></div>  </div>
		 <div>	<div class="same" id="ssam">부가세</div>  <div class="same"><input type="text" class="space" style="width:600px" id="vat" name="vat"></div>  </div>
		 <div>	<div class="same" id="ssam">공급가액</div>  <div class="same"><input type="text" class="space" style="width:600px" id="vos" name="vos"></div>  </div>
		 <div>	<div class="same" id="ssam">개수</div>  <div class="same"><input type="number" min="0" class="space" style="width:100px" id="unit" name="unit"></div>  </div>
		 </div>
		</div><!-- end -->
		</form>
		<div class="btnsc"><button id="enrollBtn">저장</button></div> 
		</div>
</body>
<script>
$(function(){
	$("#enrollBtn").click(function(){
		var x = $("#cnName").val();
		var y = $("#sCategoryFilter").val();
		console.log("cnName : " + x + " sCategory : " + y);
		
		if($("#iName").val()==""){
			alert("물품명을 입력해주세요.");
			return false;
		}
		if($("#sCategoryFilter").val()=="품목그룹"){
			alert("물품명을 입력해주세요.");
			return false;
		}
		if($("#cnName").val()=="검색조건"){
			alert("품목을 선택해주세요.");
			return false;
		}
		else if($("#mfg").val()==""){
			alert("제조사를 입력해주세요.");
			return false;
		}
		else if($("#up").val()==""){
			alert("단가를 입력해주세요.");
			return false;
		}
		else if($("#vat").val()==""){
			alert("부가세를 입력해주세요.");
			return false;
		}
		else if($("#vos").val()==""){
			alert("공급가액을 입력해주세요.");
			return false;
		}
		else if($("#unit").val()==""){
			alert("개수를 입력해주세요.");
			return false;
		}else{
			$("#insertStock").submit();
		}
		
	})
})

/////////////매입처 
$("#sCategoryFilter").change(function(){
	var typeNo = $(this).val()*1;
	console.log("진짜로 : "+ typeNo);
	
	$.ajax({
		url:"selectCnName.sto",
		type:"post",
		data:{typeNo:typeNo},
		success:function(data){
			console.log(data);
			$("#cnName").empty();
			$("#cnName").append("<option hidden='hidden'>매입처</option>");
			for(var i=0;i<data.Conn.length;i++){
				$("#cnName").append("<option value='"+data.Conn[i].cnCode+"'>"+data.Conn[i].cnName+"</option>");
			}
			
		},error:function(status){
			console.log(status);
		}
		
	})
})
		

</script>
</html>