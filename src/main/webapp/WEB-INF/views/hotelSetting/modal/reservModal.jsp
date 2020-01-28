<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	.formModal {
		display: none;
		position: fixed;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		background: rgba(0, 0, 0, 0.5);
		z-index: 2;
	}
	
	.modal_content {
		position: absolute;
		left: 50%;
		top: 45%;
		transform: translate(-50%, -50%);
		width: 820px;
		height:600px;
		max-height: 600px;
		background-color: white;
	}
	
	.modal_content_real {
		width:1200px;
		height:550px;
		margin:0 auto;
	}
	
	.btn_close {
		padding-top:10px;
		position: absolute;
		top:-4%;
		left:96.5%;
		font-size:40px;
		float: right;
		color:darkgray;
	}
	
	.btn_close:hover {
		cursor: pointer;
	}
	.wrap{
		width: 800px;
		height: 530px;
		border-radius: 5px;
		border: 1px solid black;
		margin-top: 50px;
		margin-left:10px;
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
</style>
</head>
<body>
	<div class="formModal">
	<div class="modal_content">
	<div class="wrap">
		<div align="center" style="height: 50px; margin-top: 10px; font-weight: bold">
			<label style="color: blue; font-size: 20px; margin-top: 10px;"><u>예약확인서</u></label>
			<a class="btn_close">×</a>
		</div>
		<div style="margin-left: 10px; margin-bottom: 10px;">
			<label><b><U>홍길동님</U></b></label>
		</div>
		<div>
			<label style="color: blue; font-size: 10px; margin-left: 10px;">님의
				예약은 아래와 같습니다.</label>
		</div>
		<div class="hrDiv"></div>

		<div id="botDiv">
			예약일자<label style="width: 500px; margin-left: 72px;">서울 금천구 디지털로 9길 대룡포스트타워 5차 1501호</label>
		</div>
		<!-- 반복 -->
		<div class="bodyEq">
			고객명<label style="margin-left: 89px;">홍길동</label>
		</div>
		<div class="bodyEq" id="rightEq">
			예약번호<label style="margin-left: 83px;">123455</label>
		</div>
		<!-- ㅇㅇ -->
		<div class="bodyEq">
			입실일자<label style="margin-left: 74px;">Sanha Tour</label>
		</div>
		<div class="bodyEq" id="rightEq">
			퇴실일자<label style="margin-left: 84px;">501-2</label>
		</div>

		<div class="bodyEq">
			객실수<label style="margin-left: 91px;">2018-03-12</label>
		</div>
		<div class="bodyEq" id="rightEq">
			인원수(성인/아동)<label style="margin-left: 17px;">2018-03-12</label>
		</div>

		<div class="bodyEq">
			객실타입<label style="margin-left: 74px;">2018-03-12</label>
		</div>
		<div class="bodyEq" id="rightEq">
			객실요금<label style="margin-left: 85px;">2018-03-12</label>
		</div>

		<div class="bodyEq">
			입금일자<label style="margin-left: 74px;">2018-03-12</label>
		</div>
		<div class="bodyEq" id="rightEq">
			서비스요금<label style="margin-left: 69px;">2018-03-12</label>
		</div>

		<div class="bodyEq">
			예약금<label style="margin-left: 92px;">2018-03-12</label>
		</div>
		<div class="bodyEq" id="rightEq">
			요금합계<label style="margin-left: 86px;">2018-03-12</label>
		</div>
		<div style="margin-left: 10px; font-weight: bold; margin-top: 10px;">
			호텔에서 지불해야할 금액은 <label>1,000,000</label>원 입니다.
		</div>
		<div>
			<p style="color: blue; font-size: 12px;">
			  공지사항<br>
			  1.요금에는 10% 세금이 포함되어 있습니다.<br>
			  2.체크인시간은 15시이며 체크아웃시간은 12시 입니다.<br>
			  3.호텔은 투숙객에게 숙박 서비스를 제공하기 위해 고객의 전화번호,이메일 등을 포함한 개인정보를 보관할 수 있습니다.<br>
			  4.기타 요청 사항은 제공되지 않을 수 잇습니다.<br>
			</p>
		</div>
	</div>
	</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".formModal").fadeOut();
			});
		});
	
	</script>
</body>
</html>