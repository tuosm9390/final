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
	z-index: auto;
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
	text-align: center;
	height: 300px;
}
.priceArea{
	border: 1px solid black;
	border-radius: 6px;
	width: 30%;
	display: inline-block;
}

.bottom-menu{
	display: flex;
	padding-top: 50px;
}

.Nwagon_column{
	width: 100%;
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
				<div id="total" class="tap-item ${ Condition eq 'total' ? 'active' : '' }" onclick="moveTop();">전체</div>
				<div id="daily" class="tap-item ${ Condition eq 'daily' ? 'active' : '' }" onclick="fnMove('2');">일별</div>
				<div id="monthly" class="tap-item ${ Condition eq 'monthly' ? 'active' : '' }" onclick="fnMove('3');">월별</div>
			</div>
		</div>
		<div class="bottom-menu">
			<!-- 전체 / 일별 -->
			<!-- 좌측 영역 -->
			<div id="total" class="left">
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
				<div id="chartArea" class="chartArea">
					
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
				<div class="div2"></div>
				<br><br><br><br><br><br><br><br><br><br>
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
				<div id="chartArea2" class="chartArea">
					
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
				<div id="chartArea3" class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div style="height: 150px;"></div>
				<!-- 금액 영역 끝 -->
				<br><br><br><br><br><br><br><br><br><br>
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
				<div id="chartArea4" class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div class="priceOuterArea" align="center">
					<div class="priceArea">
						<div style="float: left;">
							<label><c:out value="수리"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="69,083,116"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="비품구입"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="1,100,000"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="소모품구입"></c:out></label>
						</div>
						<div style="float: right;">
							<label><c:out value="1,100,000"></c:out></label>
						</div>
						<br>
						<div style="float: left;">
							<label><c:out value="기타"></c:out></label>
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
		<!-- 전체/일별 영역 끝 -->
		<br><br><br><br><br><br><br><br><br><br>
		<!-- 월별 영역 -->
		<div id="monthly" class="monthly div3">
			<label style="font-weight: bold; font-size: 20px; line-height: 17px; color: #72B8E6;">| 월 별 객실 타입 별 매출</label>
			<!-- 검색 영역 -->
			<div class="filterArea">
				<label>기준 : 원</label>
				<input type="text" id="datepicker5">
				<button><</button>
				<button>></button>
			</div>
			<!-- 검색 영역 끝 -->
			<div id="chartArea5" align="center" class="chartArea">
				
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
			$(this).css({"background":"white", "color":"black"});
			$(this).nextAll().css({"background":"black", "color":"white"});
			$(this).prevAll().css({"background":"black", "color":"white"});
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
		
		var chart1 = {
			'legend': {
				names: ['객실','대실'],
			},
			'dataset': {
				title: 'Playing time per day',
				values: [${ roomprice }, ${ rentprice }],
				colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
			},
			'chartDiv': 'chartArea',
			'chartType': 'column',
			'chartSize': { width: 600, height: 300 },
			'maxValue': 800000,
			'increment': 100000
		};
		Nwagon.chart(chart1);
				
		var chart2 = {
				'dataset':{
					title: 'Web accessibility status',
					values:[69083116, 1100000, 1100000, 101100000],
					colorset: ['#2EB400', '#2BC8C9', "#666666", '#f09a93'],
					fields: ['신용카드', '현금', '계좌이체', '후불', '환불'],
				},
				'donut_width' : 50,
				'core_circle_radius':70,
				'chartDiv': 'chartArea2',
				'chartType': 'donut',
				'chartSize': {width:700, height:400}
			};
			Nwagon.chart(chart2);
			
		var chart3 = {
				'dataset':{
					title: 'Web accessibility status',
					values:[25, 3],
					colorset: ['#2EB400', '#2BC8C9', "#666666", '#f09a93'],
					fields: ['대실', '투숙'],
				},
				'donut_width' : 50,
				'core_circle_radius':70,
				'chartDiv': 'chartArea3',
				'chartType': 'donut',
				'chartSize': {width:700, height:400}
			};
			Nwagon.chart(chart3);
		
		var chart4 = {
				'dataset':{
					title: 'Web accessibility status',
					values:[69083116, 1100000, 1100000, 101100000],
					colorset: ['#2EB400', '#2BC8C9', "#666666", '#f09a93'],
					fields: ['수리', '비품구입', '소모품구입', '기타'],
				},
				'donut_width' : 50,
				'core_circle_radius':70,
				'chartDiv': 'chartArea4',
				'chartType': 'donut',
				'chartSize': {width:700, height:400}
			};
			Nwagon.chart(chart4);
		
		var chart5 = {
				'legend': {
					names: ['스위트더블', '스위트 패밀리', '디럭스 트윈', '디럭스 더블', '스탠다드'],
				},
				'dataset': {
					title: 'Playing time per day',
					values: [1840000, 0, 200000, 240000, 80000],
					colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
				},
				'chartDiv': 'chartArea5',
				'chartType': 'column',
				'chartSize': { width: 1200, height: 300 },
				'maxValue': 2000000,
				'increment': 200000
			};
			Nwagon.chart(chart5);
			
		function fnMove(seq){
	        var offset = $(".div" + seq).offset();
	        $('html, section').animate({scrollTop : offset.top}, 400);
	    };
	    
	    function moveTop(){
	    	$('html, body').animate({scrollTop: '0'}, 400);
	    };
	</script>
</body>
</html>