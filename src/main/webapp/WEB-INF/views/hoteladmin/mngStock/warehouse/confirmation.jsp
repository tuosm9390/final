<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrapp{
	width: 800px;
	height: 520px;
	border-radius: 5px;
	border: 1px solid black;
	margin-top: 30px;
	}
	#imgDivv{
	margin-left: 320px; 
	margin-top: 10px;
	
	
	}
	.samee{
	display: inline-table;
	width: 150px;
	height: 150px;
	margin-left: 10px;
	position: relative;
	margin-bottom: 60px;
	
	}
	#rightBtnn{
	margin-top: 10px;
	}
	.hrDivv{
	width: 800px;
	margin-top: 10px;
	border-bottom: 1px solid lightgray;
	}
	.bodyEqq{
	border-bottom: 1px solid lightgray;
	width: 370px; 
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	font-size: 17px;
	font-weight: bold;
	margin-top: 10px;
	}
	
	
	#botDivv{
	width: 763px;
	border-bottom: 1px solid lightgray;
	height: 30px;
	margin-left: 10px;
	margin-top: 10px;
	font-size: 17px;
	font-weight: bold;
	} 
	
	.btnsss{
	margin-left: 30%;
	margin-top: 5px;
	}
	#wrapdivv{
	height: 100px;
	}
	
	.tabb{
	display: inline-block;
	width: 110px;
	height: 35px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	}
	#myTab{
	line-height: 30px;
	}
	#mailSet:hover{
	cursor: pointer;
	color: white;
	background-color: #3498DB;
	} 
	#mailText{
	background-color: #3498DB;
	color:white;
	}
	#mailText:hover{
	cursor: pointer;
	}
	<!-- -->
	.wrap{
	width: 800px;
	height: 680px;
	border-radius: 5px;
	margin-left: 30%;
	border: 1px solid black;
	margin-top: 50px; 
	}
	#imgDiv{
	margin-left: 320px; 
	margin-top: 10px;
	
	
	}
	.same{
	display: inline-table;
	width: 150px;
	height: 150px;
	margin-left: 10px;
	position: relative;
	margin-bottom: 60px;
	
	}
	#rightBtn{
	margin-top: 10px;
	}
	.hrDiv{
	width: 800px;
	margin-top: 10px;
	border-bottom: 1px solid black;
	}
	.bodyEq{
	border-bottom: 1px solid lightgray;
	width: 370px; 
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	font-size: 17px;
	font-weight: bold;
	margin-top: 10px;
	}
	.valueEq{
		margin-left: 20px;
		
	}
	input[type=text]{
	width: 260px;
	}
	#botDiv{
	width: 763px;
	border-bottom: 1px solid lightgray;
	height: 30px;
	margin-left: 10px;
	margin-top: 10px;
	font-size: 17px;
	font-weight: bold;
	} 

	 
	th{
	background-color: #f7f7f7;
	color: #005B9E;
	height: 40px;
	}
	
	.botText{
	width: 760px;
	height: 100px;
	margin-left: 10px;
	margin-top: 10px;
	}
	.botEq{
	height: 90px;
	display: inline-table;
	}
	.btnss{
	margin-left: 30%;
	margin-top: 5px;
	}
	#wrapdiv{
	height: 100px;
	}
	
	.productMenubarArea{
		height:1600px !important; 
	} 
</style>
</head>
<body>
	<header>
		<jsp:include page="../../common/menubar.jsp"/>
		<jsp:include page="../../common/productMenubar.jsp"/>
	</header>
	<section>
	
	<div>
		<div id="myTab">
			<div class="tabb" style="box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailSet">메일설정</div>
			<div class="tabb" style="margin-left: 10px;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailText">메일문구설정</div>
			<div class="hrDivv" style="width: 1200px;"></div>
		</div>
	</div>
	
	
	<div class="wrapp">
	<div id="wrapdivv">
		<div id="imgDivv" class="samee"><img src="${contextPath }/resources/images/NoImg.png" width="150px"></div>
		<div class="samee" style="position: relative; bottom: 67px;">
		
		
		<div><button class="ui primary basic button" id="addBtn">추가</button>
			<input type="file" style="display: none;" id="addBtn2">
		</div>
		<div><button id="rightBtnn" class="ui primary basic button">삭제</button></div></div>
	</div>
	
		<div align="center" style="height: 50px; margin-top: 10px; font-weight: bold"><label style="color: blue;font-size: 20px; margin-top: 10px;"><u>예약취소 확인서</u></label></div>
		<div style="margin-left: 10px;margin-bottom: 10px;"><label><b><U>홍길동님</U></b></label></div>
		<div class="hrDivv"></div>
		
		<div id="botDivv">예약일자<label style="width: 500px; margin-left: 72px;" >서울 금천구 디지털로 9길 대룡포스트타워 5차 1501호</label></div>
		<!-- 반복 -->
		<div class="bodyEqq">고객명<label style="margin-left: 89px;">홍길동</label></div>
		<div class="bodyEqq" id="rightEq">예약번호<label style="margin-left: 83px;">123455</label></div> 
		<!-- ㅇㅇ -->
		<div class="bodyEqq">입실일자<label style="margin-left: 74px;">Sanha Tour</label></div>
		<div class="bodyEqq" id="rightEq">퇴실일자<label style="margin-left: 84px;">501-2</label></div>
		
		<div class="bodyEqq">객실수<label style="margin-left: 91px;">2018-03-12</label></div> 
		<div class="bodyEqq" id="rightEq">인원수(성인/아동)<label style="margin-left: 17px;">2018-03-12</label></div>
		
		<div class="bodyEqq">객실타입<label style="margin-left: 74px;">2018-03-12</label></div> 
		<div class="bodyEqq" id="rightEq">객실요금<label style="margin-left: 85px;">2018-03-12</label></div>
		
		<div class="bodyEqq">입금일자<label style="margin-left: 74px;">2018-03-12</label></div> 
		<div class="bodyEqq" id="rightEq">서비스요금<label style="margin-left: 69px;">2018-03-12</label></div>
		
		<div class="bodyEqq">예약금<label style="margin-left: 92px;">2018-03-12</label></div> 
		<div class="bodyEqq" id="rightEq">요금합계<label style="margin-left: 86px;">2018-03-12</label></div>
		<div style="margin-left: 10px; font-weight: bold;margin-top: 10px;">호텔에서 지불해야할 금액은 <label>1,000,000</label>원 입니다.</div>
		
		
		
	
	
	</div>
	<div class="btnsss">
		<button>저장</button><button>미리보기</button>
	</div>
		<div class="hrDivv" style="width: 1200px; margin-left: 17%; margin-top: 100px;"></div>
	<!-- ------------
	 -->
	 <div class="wrap">
	<div id="wrapdiv">
		<div id="imgDiv" class="same"><img src="${contextPath }/resources/images/NoImg.png" width="150px"></div>
		<div class="same" style="position: relative; bottom: 67px;">
	
		
		<div><button class="ui primary basic button" id="addBtn3">추가</button>
			<input type="file" style="display: none;" id="addBtn4">
		</div>
		<div><button id="rightBtn" class="ui primary basic button">삭제</button></div></div>
	</div>
	
		<div align="center" style="height: 50px; margin-top: 10px; font-weight: bold"><label style="color: blue;font-size: 20px; margin-top: 10px;"><u>예약확인서</u></label></div>
		<div style="margin-left: 10px;margin-bottom: 10px;"><label><b><U>홍길동님</U></b></label></div>
		<div><label style="color: blue;font-size: 10px;margin-left: 10px;">님의 예약은 아래와 같습니다.</label></div>
		<div class="hrDiv"></div>
		
		<div id="botDiv">예약일자<label style="width: 500px; margin-left: 72px;" >서울 금천구 디지털로 9길 대룡포스트타워 5차 1501호</label></div>
		<!-- 반복 -->
		<div class="bodyEq">고객명<label style="margin-left: 89px;">홍길동</label></div>
		<div class="bodyEq" id="rightEq">예약번호<label style="margin-left: 83px;">123455</label></div> 
		<!-- ㅇㅇ -->
		<div class="bodyEq">입실일자<label style="margin-left: 74px;">Sanha Tour</label></div>
		<div class="bodyEq" id="rightEq">퇴실일자<label style="margin-left: 84px;">501-2</label></div>
		
		<div class="bodyEq">객실수<label style="margin-left: 91px;">2018-03-12</label></div> 
		<div class="bodyEq" id="rightEq">인원수(성인/아동)<label style="margin-left: 17px;">2018-03-12</label></div>
		
		<div class="bodyEq">객실타입<label style="margin-left: 74px;">2018-03-12</label></div> 
		<div class="bodyEq" id="rightEq">객실요금<label style="margin-left: 85px;">2018-03-12</label></div>
		
		<div class="bodyEq">입금일자<label style="margin-left: 74px;">2018-03-12</label></div> 
		<div class="bodyEq" id="rightEq">서비스요금<label style="margin-left: 69px;">2018-03-12</label></div>
		
		<div class="bodyEq">예약금<label style="margin-left: 92px;">2018-03-12</label></div> 
		<div class="bodyEq" id="rightEq">요금합계<label style="margin-left: 86px;">2018-03-12</label></div>
		<div style="margin-left: 10px; font-weight: bold;margin-top: 10px;">호텔에서 지불해야할 금액은 <label>1,000,000</label>원 입니다.</div>
		<div>
			<pre style="color: blue;font-size: 12px;">
  공지사항 
  1.요금에는 10% 세금이 포함되어 있습니다.
  2.체크인시간은 15시이며 체크아웃시간은 12시 입니다.
  3.호텔은 투숙객에게 숙박 서비스를 제공하기 위해 고객의 전화번호,이메일 등을 포함한 개인정보를 보관할 수 있습니다.
  4.기타 요청 사항은 제공되지 않을 수 잇습니다.
			</pre>
		</div>
		
		
	
	
	</div>
	<div class="btnss">
		<button>저장</button><button>미리보기</button>
	</div>
	</section>
	
	<script> 
	$(function(){
		$("#addBtn").click(function(){
			$("#addBtn2").click();
		})
	})
	
		$(function(){
		$("#addBtn3").click(function(){
			$("#addBtn4").click();
		})
	})
	</script>
	
</body>
</html>