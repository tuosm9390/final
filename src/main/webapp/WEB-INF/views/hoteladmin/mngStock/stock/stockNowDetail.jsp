<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
	 .top-divv{
	width: 63.7%;

	height: 70px; 
/* 	margin-left: 20px; */
	}



	#titlemsgg{
		width: 220px;
		height: 50px;
		margin-top: 40px;

	}
	
	#stockTbb{
	width: 100%;
	border-collapse: collapse;

	}
	td{
	height: 30px;
	}
	
	.hrDivv{
	border-bottom: 1px solid black;
	width: 1000px;
	margin-top: 20px;
	}
	.btnss{
	margin-top: 10px;
	margin-right: 59px;
	float: right;
	
	
	}
	#zonee{
	border-bottom: 1px solid black;
	margin-bottom: 10px;
	width: 128px;  
	}
	#hdivv{
/* 	margin-bottom: 20px; */
	margin-left: 20px;
	}
	section{
	padding-left: none !important;
	}
	
	#marginDiv{
	margin-left: 55px;
	overflow-y: auto;
	max-height: 400px;
	margin-top: 21px;
	width: 1000px;
	height: 400px;
	border: 1px solid lightgray;
	} 
	#detail-modify-btn,#detail-ok-btn{
	color:white;
	background : royalblue;
	border: 1px solid royalblue;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	}
	#detail-modify-btn:hover,#detail-ok-btn:hover{
	cursor: pointer;
	}
</style>
</head>
<body>
	
		
	

	<header>	
		
	
	</header>
		<div id="marginDiv">
		<form action="updateReal.sto" id="updateReal" method="post">
			<table id="stockTbb">  
				<tr>  
					<th><input type="checkbox"></th>
					<th>물품코드</th>
					<th>물품명</th>
					<th>공급가액</th>
					<th>부가세</th>
					<th>단가</th>
					<th>제조사</th>
					<th>매입처</th>
					<th>창고명</th>
					<th>위치</th>
				</tr>
				
			
			</table>
		</form>
		</div>
			<div class="btnss">
			<button id="delete">삭제</button>
			<button id="detail-modify-btn">수정</button>&nbsp;
			<button id="detail-ok-btn" hidden="hidden">수정완료</button>&nbsp;
			</div> 
	
	 
	
	
	
	<script>
	
		
		$(function(){
			$("#stockTbb").find("td").mouseenter(function(){
				$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent("tr").css({"background":"white"});
			}).click(function(){
				var bid = $(this).parent().children("td").eq(1).text();
				console.log(bid);
			});
		});
		
		//수정버튼클릭시
		$("#detail-modify-btn").click(function(){
			
			$("#detail-modify-btn").hide();
			$("#detail-ok-btn").show();
			$("#delete").hide();
		
			$.ajax({
				url:"updateStock.sto",
				type:"post",
				data:{},
				success:function(data){
					console.log(data);
					
			 	var checkRow = "";
			    $( "input[name='checkRow']:checked" ).each(function(){
			    checkRow = checkRow + $(this).parent().parent().children("td").eq(1).text()+"," ;
			    var ix =$(this).parent().parent().children("td").eq(1).text();
			    var originAmount = $(this).parent().parent().children("td").eq(3).text();
			    $(this).parent().parent().children("td").eq(3).html("<input type='number' name='amount' id='AMOUNT"+ix+"' value='"+originAmount+"' style='width:70px;'>");
			    $(this).parent().parent().children("td").eq(9).html("<select id='STRG"+ix+"' name='strgNo' ><option value='창고명' hidden='hidden' style='width:100px;'>창고명</option></selcet>");
			    $(this).parent().parent().children("td").eq(10).html("<select id='AREA"+ix+"' name='areaNo'><option value='없음' hidden='hidden'>위치</option></selcet>");
			    $(this).parent().parent().children("td").eq(11).html("<select id='RM_NO"+ix+"' name='rmNo'><option value='객실번호' hidden='hidden'>객실번호</option></selcet>");
			    checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
			    
			    console.log("ix : " + ix);
			    
			    //기본옵션
			    $("#STRG"+ix+"").append("<option selected='selected'>없음</option>");
		    	$("#RM_NO"+ix+"").append("<option value='0' hidden='hidden'>객실번호</option><option value='0' selected='selected'>없음</option>");
			    //정보에따른옵션
			    for(var i=0;i<data.strgList.length;i++){
			    	//StrgNo를넣어야함 
			    	$("#STRG"+ix+"").append("<option value='"+data.strgList[i].strgNo+"'>"+data.strgList[i].strgName+"</option>")
			    	//rmNo를 넣어야함
			    	$("#RM_NO"+ix+"").append("<option value='"+data.rmNoList[i].rmNo+"'>"+data.rmNoList[i].rmNum+"</option>")
			    }
			    
			    //창고명이 바뀔때//
				$("#STRG"+ix+"").change(function(){
						var strgNo = $(this).val();
						var ino =  $(this).parent().parent().children("td").eq(1).text();
						
						 $.ajax({
							url:"selectAreaList.war",
							type:"post",
							data:{strgNo:strgNo},
							success:function(data){
								console.log(data);
					//		console.log($(this).val()+"아아아ㅏ앙") 
								$("#AREA"+ix+"").empty();
								console.log("ino  : " + ino);
								//$("#stockTbb").
								//$(".AREA").append("<option value='창고명'>창고명</option>")
								//areaNo 넣기
								 for(var i=0;i<data.areaList.length;i++){
									 $("#AREA"+ix+"").append("<option value='"+data.areaList[i].areaNo+"'>"+data.areaList[i].areaName+"</option>")
								 }
								
							},
							error:function(status){
								console.log(status);
							}
							
						}) 
				  });
						
				});
			  
				},
				error:function(status){
					console.log(status);
				}
			});
			if($( "input[name='checkRow']:checked" ).length==0){
				alert("선택해주세요.");
				$("#detail-ok-btn").hide();
				$("#detail-modify-btn").show();
				$("#delete").show();
				return false;
				
			}
			
			  $(".hide input[type=checkbox]").attr('disabled',true);
	    
		});
      	
		////////
	
		/////
		
		////////////////////수정완료버튼///////////////////////////////////////////////////////
		$("#detail-ok-btn").click(function(){
			$("#detail-modify-btn").show();
			$("#detail-ok-btn").hide();
			$(".hide").show();
			//체크값가져오기
			var checkRow = "";
			var itemList = [];
			
		
			  $("input[name='checkRow']:checked").each (function (){
			    checkRow = checkRow + $(this).parent().parent().children("td").eq(1).text()+",";
			    var rmNo;
			console.log( $(this).parent().parent().children("td").eq(1).text()+"테스트");    
			var	 ino=$(this).parent().parent().children("td").eq(1).text()*1;
			var	amount=$("#AMOUNT"+ino+"").val();
			var	strgNo=$("#STRG"+ino+"").val();
			var	areaNo=$("#AREA"+ino+"").val();
			console.log(amount);
			console.log("///////");
			if($("#RM_NO"+ino+"").val()=='없음'){
				  rmNo=0;
			}else{
				  rmNo=$("#RM_NO"+ino+"").val();				
			}
			
			console.log("ino : " + ino+ "amount : "+amount+" strgNo : "+strgNo+" areaNo : "+areaNo+" rmNo : "+rmNo);
			console.log(strgNo)
			console.log(areaNo)
			console.log(rmNo)
			if(strgNo=="없음"&&strgNo=="없음"&&rmNo==0){
				alert("위치를 선택해주세요.")
				return false;
			}
			if(strgNo=="없음"&&strgNo=="없음"){
				alert("위치를 선택해주세요.")
				return false;
			}
			
				
			
			   //itemList 넘기는 ajax
			  $.ajax({
				 url:"updateStockOk.sto",
				 type:"post", 
				 dataType:"json",
				 data:{	 ino:ino,
						 amount:amount,
						 strgName:strgNo,
						 areaNo:areaNo,
						 rmNo:rmNo,
						 zino:$("#zino"+ino+"").val(),
						 zamount:$("#zamount"+ino+"").val(),
						 zstrgName:$("#zstrgNo"+ino+"").val(),
						 zareaNo:$("#zareaNo"+ino+"").val(),
						 zrmNo:$("#zrmNo"+ino+"").val()
					 },
			  	 success:function(data){
			  		 console.log(data);
			  		location.reload(true);
			  	 },
			  	 error:function(status){
			  		 console.log(status);
			  	 }
			  }); 
			  /////////
			var data = {
				   ino:ino,
				   amount:amount,
		   		   strgNo:strgNo,
		   		   areaNo:areaNo,
		   		   rmNo:rmNo
			   };
		   	  itemList.push(data);
			  });  
			  
			  jQuery.ajaxSettings.traditional = true;

			  
			  checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
			console.log(checkRow);
			//$("#updateReal").submit();  
		});
		
		
		
		
		
		
		
		
		//////////////////////////////////////////////////////////////////////////////////////
		//삭제버튼클릭시
		$("#delete").click(function(){
			//체크값 가져오기
			 var checkRow = "";
			  $( "input[name='checkRow']:checked" ).each(function(){
			    checkRow = checkRow + $(this).parent().parent().children("td").eq(1).text()+"," ;
			   
			  });
			  checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
			console.log(checkRow);
			  
			  if(checkRow==''){
				  alert("삭제할 대상을 선택하세요.");
				  return false
			  }
			  
			  
			  $.ajax({
				url:"deleteStock.sto",
				type:"post",
				data:{checkRow:checkRow},
			  	success:function(data){
			  		console.log(data);
			  		alert("삭제성공")
			  		location.reload(true);
			  	},
			  	error:function(status){
			  		console.log(status);
			  		alert("삭제실패")
			  	}
			  });
			  
			  
		});
	</script>
	
</body>
</html>