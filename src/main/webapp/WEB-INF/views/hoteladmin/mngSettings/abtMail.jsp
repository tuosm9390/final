<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#myTab{
	line-height: 30px;
	}
	#mailText:hover{
	cursor: pointer;
	background-color: #3498DB;
	color: white;
	} 
	#mailtText{
	color: #3498DB;
	} 
	#mailSet:hover{
	cursor: pointer;
	}
	.tabb{
	display: inline-block;
	width: 110px;
	height: 35px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	}
	.hrDivv{
	width: 800px;
	margin-top: 10px;
	border-bottom: 1px solid lightgray;
	}
	input[type=text]{
	margin-top: 20px;
	border-radius: 4px;
	margin-left: 20px;
	height: 25px;
	border: 1px solid lightgray;
	}
	.lb{
	margin-left: 20px;
	}
	
</style>
</head>
<body>

	<header>
		<jsp:include page="../common/settingMenubar.jsp"/>
		<jsp:include page="../common/menubar.jsp"/>
	</header>
	<section>
	
	<div>
		<div id="myTab">
			<div class="tabb" style="background-color: #3498DB; color: white;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailSet">메일설정</div>
			<div class="tabb" style="margin-left: 10px;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailText">메일문구설정</div>
			<div class="hrDivv" style="width: 1200px;"></div>
		</div>
	</div>
	
	<div>
		<div id="mailSet">
			<h2>호텔 대표 연락 정보</h2>
			<label class="lb">호텔 대표 이메일</label><br>
			<input type="text"><br>
			<label class="lb" style="margin-top: 20px">호텔 대표 연락처</label><br>
			<select style="height: 30px; margin-left: 20px"> 
				<option>+82(대한민국)</option>
				<option>02</option>
				<option>031</option>
				<option>011</option>
				<option>010</option>
				<option>019</option>
				<option>070</option>
			</select>
			<input type="text" style="margin-left: 10px">
			<pre style="color: gray; font-weight: bold;">
			
  - 기본 수신 메일주소는 noreply@wings-allegro.com 이며 변경이 불가능합니다. 호텔 대표 연락 정보는 고객에게 보내지는 예약 확인서에 기입됩니다.
			
  자동 메일 발송
  - 자동 메일 발송에 체크되면, 빠른 예약창에서 예약이 생성된 경우 확인 및 취소 메일이 자동 발송됩니다. (최초 예약 확정 및 취소 시에만 자동 전송)
  - 예약 변경 시 예약 상세 화면에서 수동으로만 메일 전송이 가능합니다.
  - 알레그로에서 전송되는 모든 메일은 대실예약 / 채널 매니저를 통한 예약은 제외하고 전송됩니다.
			</pre> 
			<div class="hrDivv" style="width:1200px;"></div>
		</div>
	</div>
	
	
	</section>
	<script>
		$("#mailText").click(function(){
			location.href='goReserv.st';
		})
	</script>
</body>
</html>