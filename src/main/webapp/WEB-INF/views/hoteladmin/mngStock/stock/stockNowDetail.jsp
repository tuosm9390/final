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
			
			 var checkRow = "";
			  $( "input[name='checkRow']:checked" ).each (function (){
			    checkRow = checkRow + $(this).parent().parent().children("td").eq(1).text()+"," ;
			    $(this).parent().parent().children("td").eq(9).html("<input type='text' style='width:70px;'>");
			    $(this).parent().parent().children("td").eq(10).html("<input type='text' style='width:70px;'>");
			    $(this).parent().parent().children("td").eq(11).html("<input type='text' style='width:60px;'>");
			  });
			  checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
			  $("#detailBody").children().children().eq(0).show();
			  $("#detailBody").children().children().children().eq(0).show();
			  
			console.log(checkRow);
		});
      	
		
		//수정완료버튼
		$("#detail-ok-btn").click(function(){
			$("#detail-modify-btn").show();
			$("#detail-ok-btn").hide();
			//체크값가져오기
			 var checkRow = "";
			  $( "input[name='checkRow']:checked" ).each (function (){
			    checkRow = checkRow + $(this).parent().parent().children("td").eq(1).text()+"," ;
			    $(this).parent().parent().children("td").eq(9).html("<input type='text' style='width:70px;'>");
			    $(this).parent().parent().children("td").eq(10).html("<input type='text' style='width:70px;'>");
			    $(this).parent().parent().children("td").eq(11).html("<input type='text' style='width:60px;'>");
			  });
			  checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
			console.log(checkRow);
		})
		
		//삭제버튼클릭시
		$("#delete").click(function(){
			//체크값 가져오기
			 var checkRow = "";
			  $( "input[name='checkRow']:checked" ).each (function (){
			    checkRow = checkRow + $(this).parent().parent().children("td").eq(1).text()+"," ;
			    $(this).parent().parent().children("td").eq(9).html("<input type='text' style='width:70px;'>");
			    $(this).parent().parent().children("td").eq(10).html("<input type='text' style='width:70px;'>");
			    $(this).parent().parent().children("td").eq(11).html("<input type='text' style='width:60px;'>");
			  });
			  checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
			console.log(checkRow);
			  
			  if(checkRow==''){
				  alert("삭제할 대상을 섡택하세요.");
				  return false
			  }
			  
			  
			  $.ajax({
				url:"deleteStock.sto",
				type:"post",
				data:{checkRow:checkRow},
			  	success:function(data){
			  		console.log(data);
			  		alert("삭제성공")
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