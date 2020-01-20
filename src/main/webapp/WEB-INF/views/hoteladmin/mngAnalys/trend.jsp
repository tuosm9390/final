<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.top-menu{
	display: inline-flex;
	position: fixed;
	width: 100%;
	background: white;
}
.tap-menu{
	margin-left: 10px;
	display: inline-flex;
}
.tap-menu div{
	background: black;
	margin-top: 10px;
	width: 100px;
	text-align: center;
	border-radius: 10px;
	border: 3px solid black;
	cursor: pointer;
	color: white;
	font-size: 18px;
	margin-left: 10px;
}

.tap-menu div:hover{
	background: white;
	color: black;
}

.left{
	width: 50%;
	border-right: 1px solid lightgray;
	padding: 20px;
}
.right{
	width: 50%;
	padding: 20px;
}

.monthly{
	width: 100%;
}

.filterArea{
	float: right;
}

.chartArea{
	margin-top: 10px;
	width: 100%;
	height: 300px;
	border: 1px solid black;
}

.priceArea{
	border: 1px solid black;
	border-radius: 6px;
	width: 30%;
	display: inline-block;
}
.priceOuterArea{
	margin-top: 10px;
}

.bottom-menu{
	display: flex;
	padding-top: 50px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp"/>
	</header>
	<section>
		<div class="top-menu">
			<label style="margin-top: 5px; font-weight: bold; font-size: 24px; text-decoration: underline;">영업 트렌드</label>
			<div class="tap-menu">
				<div id="total" class="tap-item ${ Condition eq 'total' ? 'active' : '' }">전체</div>
				<div id="daily" class="tap-item ${ Condition eq 'daily' ? 'active' : '' }">일별</div>
				<div id="monthly" class="tap-item ${ Condition eq 'monthly' ? 'active' : '' }">월별</div>
			</div>
		</div>
		<div class="bottom-menu">
			<!-- 전체 / 일별 -->
			<!-- 좌측 영역 -->
			<div id="total" class="left">
				<a name="daily"></a>
				<label style="font-weight: bold; font-size: 20px; line-height: 17px;">일별 매출</label>
				
				<!-- 검색 영역 -->
				<div class="filterArea">
					<label>기준 : 원</label>
					<input type="text" id="datepicker">
					<button><</button>
					<button>></button>
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 차트 영역 -->
				<div class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div class="priceOuterArea" align="center">
					<c:set var="room" value="객실"/>	
					<c:set var="rent" value="대실"/>
					<c:set var="total" value="총 지불액"></c:set>
					<c:set var="roomprice" value="800000"></c:set>
					<c:set var="rentprice" value="200000"></c:set>
					<c:set var="totalprice" value="${ roomprice + rentprice }"></c:set>
					<div class="priceArea">
						<div style="float: left;">
							<label>${ room }</label>
						</div>
						<div style="float: right;">
							<label>${ roomprice }</label>
						</div>
						<br><br>
						<div style="float: left;">
							<label>${ rent }</label>
						</div>
						<div style="float: right;">
							<label>${ rentprice }</label>
						</div>
						<br><br><br><br>
						<div style="float: left;">
							<label style="font-weight: bold;">${ total }</label>
						</div>
						<div style="float: right;">
							<label style="font-weight: bold;">${ totalprice }</label>
						</div>
					</div>
				</div>
				<!-- 금액 영역 끝 -->
				<br><br>
				<label style="font-weight: bold; font-size: 20px; line-height: 17px;">일별 지불 (고객)</label>
				<!-- 검색 영역 -->
				<div class="filterArea">
					<label>기준 : 원</label>
					<input type="text" id="datepicker2">
					<button><</button>
					<button>></button>
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 차트 영역 -->
				<div class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div class="priceOuterArea" align="center">
					<div class="priceArea">
						<div style="float: left;">
							<label><c:out value="신용카드"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="69,083,116"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="현금"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="1,100,000"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="계좌이체"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="1,100,000"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="후불"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="101,100,000"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="환불"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="0"></c:out></label>
						</div>
						<br><br>
						<div style="float: left;">
							<label style="font-weight: bold;"><c:out value="총 지불액"></c:out></label>
						</div>
						<div style="float: right;">
							<label style="font-weight: bold;"><c:out value="172,383,116"></c:out></label>
						</div>
					</div>
				</div>
				<!-- 금액 영역 끝 -->
			</div>
			<!-- 좌측 영역 끝 -->
			<!-- 우측 영역 -->
			<div class="right">
				<label style="font-weight: bold; font-size: 20px; line-height: 17px;">일별 객실 현황</label>
				
				<!-- 검색 영역 -->
				<div class="filterArea">
					<label>기준 : 원</label>
					<input type="text" id="datepicker3">
					<button><</button>
					<button>></button>
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 차트 영역 -->
				<div class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div style="height: 149px; margin-top: 10px;"></div>
				<!-- 금액 영역 끝 -->
				<br><br>
				<label style="font-weight: bold; font-size: 20px; line-height: 17px;">일별 지불 (재고)</label>
				
				<!-- 검색 영역 -->
				<div class="filterArea">
					<label>기준 : 원</label>
					<input type="text" id="datepicker4">
					<button><</button>
					<button>></button>
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 차트 영역 -->
				<div class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div class="priceOuterArea" align="center">
					<div class="priceArea">
						<div style="float: left;">
							<label><c:out value="신용카드"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="69,083,116"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="현금"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="1,100,000"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="계좌이체"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="1,100,000"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="후불"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="101,100,000"></c:out></label>
						</div>
						<br><br><br>
						<div style="float: left;">
							<label style="font-weight: bold;"><c:out value="환불"></c:out></label>
						</div>
						<div style="float: right;">
							<label style="font-weight: bold;"><c:out value="0"></c:out></label>
						</div>
					</div>
				</div>
				<!-- 금액 영역 끝 -->
			</div>
			<!-- 우측 영역 끝 -->
		</div>
			<!-- 월별 영역 -->
			<div id="monthly" class="monthly">
			<a name="monthly"></a>
				<label style="font-weight: bold; font-size: 20px; line-height: 17px; color: #72B8E6;">| 월 별 객실 타입 별 매출</label>
				<!-- 검색 영역 -->
				<div class="filterArea">
					<label>기준 : 원</label>
					<input type="text" id="datepicker5">
					<button><</button>
					<button>></button>
				</div>
				<!-- 검색 영역 끝 -->
				<div class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
			</div>
			<!-- 월별 영역 끝 -->
	</section>
	<footer>
	</footer>
	
	<script>
		$(".tap-item").click(function(){
			var Condition = $(this).attr('id');
			$(this).addClass('active');
// 			location.href='viewTrendList.hadmin';
		});
		
// 		$("#total").click(function(){
// 			$(".movetotal").click();
// 		});
		
// 		$("#daily").click(function(){
// 			$(".movedaily").click();
// 		});
// 		$("#monthly").click(function(){
// 			$(".movemonthly").click();
// 		});
		
		$("#datepicker").datepicker();
		$("#datepicker2").datepicker();
		$("#datepicker3").datepicker();
		$("#datepicker4").datepicker();
		$("#datepicker5").datepicker();
		
		$(function(){
			$(".active").css({"background":"white", "color":"black"});
		});
	</script>
</body>
</html>