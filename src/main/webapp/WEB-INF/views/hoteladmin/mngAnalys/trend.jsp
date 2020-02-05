<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.top-menu{
	position: fixed;
	background: white;
	width: 28%;
}
.topSec{
	display: inline-flex;
}
.top-menu hr {
	width: 130px;
	margin-right: 1410px;
	margin-bottom: 10px;
}
.tap-menu{
	margin-left: 10px;
	display: inline-flex;
}
.tap-menu div{
	background-color: white;
    color: #3498DB;
	margin-top: 10px;
	width: 80px;
	height: 25px;
	text-align: center;
	border: 1px solid #3498DB;
	border-radius: 2px;
	cursor: pointer;
	margin-left: 10px;
	padding-top: 2px;
}

.tap-menu div:hover{
	background: #3498DB;
	color: white;
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
	margin-right: 70px;
}

.chartArea{
	text-align: center;
	height: 300px;
}

.chartArea>ul{
	display: none;
}

.priceArea{
	border: 2px solid darkgray;
	border-radius: 20px;
	width: 400px;
	height: 150px;
	padding: 20px;
	display: inline-block;
}

.bottom-menu{
	display: flex;
	padding-top: 80px;
}

.Nwagon_column{
	width: 100%;
}

input[type=text] {
	width: 130px;
	border: 1px solid lightgrey;
    border-radius: 2px;
    text-align: center;
}
.priceInfo{
	margin-bottom: 5px;
	width: 440px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp"/>
	</header>
	<section>
		<div class="top-menu">
			<div class="topSec">
				<h1 style="margin-bottom: 0px; margin-top: 10px; margin-left: 20px;">영업 트렌드</h1>
				<div class="tap-menu">
					<div id="total" class="tap-item ${ Condition eq 'total' ? 'active' : '' }" onclick="moveTop();">전체</div>
					<div id="daily" class="tap-item ${ Condition eq 'daily' ? 'active' : '' }" onclick="moveTop();">일별</div>
					<div id="monthly" class="tap-item ${ Condition eq 'monthly' ? 'active' : '' }" onclick="fnMove('3');">월별</div>
				</div>
			</div>
			<hr>
		</div>
		
		<div class="bottom-menu" >
			<!-- 전체 / 일별 -->
			<!-- 좌측 영역 -->
			<div id="total" class="left">
				<label style="font-weight: bold; font-size: 20px; line-height: 17px; color: #72B8E6;">| 일별 매출</label>
				
				<!-- 검색 영역 -->
				<div class="filterArea">
					<input type="text" id="dailySales" readonly placeholder="날짜를 선택해주세요.">
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 차트 영역 -->
				<div id="chartArea" class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div class="priceOuterArea" align="center">
					<c:set var="dailyRsvSales" value="${ dailyRsvSales }"></c:set>
					<c:set var="dailyStaySales" value="${ dailyStaySales }"></c:set>
					<c:set var="totalprice" value="${ dailyRsvSales + dailyStaySales }"/>
					<div class="priceInfo" align="right"><label>기준 : 원</label></div>
					<div class="priceArea">
						<div style="float: left;" class="type-room">
							<label>객실</label>
						</div>
						<div style="float: right;" class="type-room-sales">
							<label>${ dailyRsvSales }</label>
						</div>
						<br><br>
						<div style="float: left;" class="type-rent">
							<label>대실</label>
						</div>
						<div style="float: right;" class="type-rent-sales">
							<label>${ dailyStaySales }</label>
						</div>
						<br><br><br><br>
						<div style="float: left;" class="type-total">
							<label style="font-weight: bold;">총 매출액</label>
						</div>
						<div style="float: right;" class="type-total-sales">
							<label style="font-weight: bold;">${ totalprice }</label>
						</div>
					</div>
				</div>
				<!-- 금액 영역 끝 -->
				<div class="div2"></div>
				<br><br><br><br>
				<label style="font-weight: bold; font-size: 20px; line-height: 17px; color: #72B8E6;">| 일별 지불 (고객)</label>
				<!-- 검색 영역 -->
				<div class="filterArea">
					<input type="text" id="dailySalesCst" placeholder="날짜를 선택해주세요.">
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 차트 영역 -->
				<div id="chartArea2" class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div class="priceOuterArea" align="center">
				<div class="priceInfo" align="right"><label>기준 : 원</label></div>
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
				<label style="font-weight: bold; font-size: 20px; line-height: 17px; color: #72B8E6;">| 일별 객실 현황</label>
				
				<!-- 검색 영역 -->
				<div class="filterArea" style="margin-right: 150px;">
					<input type="text" id="dailyRoomStatus" placeholder="날짜를 선택해주세요.">
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 차트 영역 -->
				<div id="chartArea3" class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div class="priceOuterArea" align="center">
				<c:set var="totalprice" value="0"/>
				<c:set var="deluxeprice" value="0"/>
				<c:set var="spaprice" value="0"/>
				<c:set var="standardprice" value="0"/>
				<c:set var="suiteprice" value="0"/>
				<c:forEach var="list" items="${ list }">
					<c:if test="${ list.rtName eq '디럭스' }">
						${ deluxeprice } = ${ list.price }
					</c:if>
					<c:if test="${ list.rtName eq '스파' }">
						${ spaprice } = ${ list.price }
					</c:if>
					<c:if test="${ list.rtName eq '스탠다드' }">
						${ standardprice } = ${ list.price }
					</c:if>
					<c:if test="${ list.rtName eq '스위트' }">
						${ suiteprice } = ${ list.price }
					</c:if>
					${ totalprice } += ${ list.price }
				</c:forEach>
				<div class="priceInfo" align="right"><label>기준 : 원</label></div>
					<div class="priceArea">
						<div style="float: left;">
							<label>디럭스</label>
						</div>
						<div style="float: right;" class="deluxe-price">
							<label>${ deluxeprice }</label>
						</div>
						<br>
						<div style="float: left;">
							<label>스파</label>
						</div>
						<div style="float: right;" class="spa-price">
							<label>${ spaprice }</label>
						</div>
						<br>
						<div style="float: left;">
							<label>스탠다드</label>
						</div>
						<div style="float: right;" class="standard-price">
							<label>${ standardprice }</label>
						</div>
						<br>
						<div style="float: left;">
							<label>스위트</label>
						</div>
						<div style="float: right;" class="suite-price">
							<label>${ suiteprice }</label>
						</div>
						<br><br><br>
						<div style="float: left;">
							<label style="font-weight: bold;">총 매출액</label>
						</div>
						<div style="float: right;" class="total-price">
							<label style="font-weight: bold;">${ totalprice }</label>
						</div>
					</div>
				</div>
				<!-- 금액 영역 끝 -->
				<br><br><br><br>
				<label style="font-weight: bold; font-size: 20px; line-height: 17px; color: #72B8E6;">| 일별 지불 (재고)</label>
				
				<!-- 검색 영역 -->
				<div class="filterArea" style="margin-right: 150px;">
					<input type="text" id="dailySpendStrg" placeholder="날짜를 선택해주세요.">
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 차트 영역 -->
				<div id="chartArea4" class="chartArea">
					
				</div>
				<!-- 차트 영역 끝 -->
				<!-- 금액 영역 -->
				<div class="priceOuterArea" align="center">
				<div class="priceInfo" align="right"><label>기준 : 원</label></div>
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
		<br><br><br><br><br><br>
		<!-- 월별 영역 -->
		<div id="monthly" class="monthly div3">
			<label style="font-weight: bold; font-size: 20px; line-height: 17px; color: #72B8E6; margin-left:20px;">| 월 별 객실 타입 별 매출</label>
			<!-- 검색 영역 -->
			<div class="filterArea" style="margin-right: 180px;">
				<input type="text" id="monthlySalesPerRoomType" placeholder="날짜를 선택해주세요.">
			</div><br><br>
			<div class="priceInfo" align="right" style="width: 1385px;"><label>기준 : 원</label></div>
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
			$(this).css({"background":"#3498DB", "color":"white"});
			$(this).nextAll().css({"background":"white", "color":"#3498DB"});
			$(this).prevAll().css({"background":"white", "color":"#3498DB"});
		});
		
		// 일별 매출 차트
		chart1 = {
			'legend': {
				names: ['객실','대실'],
			},
			'dataset': {
				title: 'Playing time per day',
				values: [${ dailyRsvSales }, ${ dailyStaySales }],
				colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
			},
			'chartDiv': 'chartArea',
			'chartType': 'column',
			'chartSize': { width: 600, height: 300 },
			'maxValue': 800000,
			'increment': 100000
		};
		Nwagon.chart(chart1);
		
		$("#dailySales").datepicker({
			autoClose : true,
			onSelect: function(){
	            dailySales = $("#dailySales").val();
	  			$.ajax({
	  				type : "post",
	  				url : "searchTrend.an?Condition=dailySales",
	  				data : {dailySales:dailySales},
	  				success:function(data){
	  					$("#chartArea").children().remove();
	  					$(".type-room-sales").children().remove();
	  					$(".type-room-sales").append("<label>" + data.dailyRsvSales + "</label>");
	  					$(".type-rent-sales").children().remove();
	  					$(".type-rent-sales").append("<label>" + data.dailyStaySales + "</label>");
	  					$(".type-total-sales").children().remove();
	  					$(".type-total-sales").append("<label style='font-weight: bold;'>" + (data.dailyRsvSales + data.dailyStaySales) + "</label>")
	  					chart1 = {
	  						'legend': {
	  							names: ['객실','대실'],
	  						},
	  						'dataset': {
	  							values: [data.dailyRsvSales, data.dailyStaySales],
	  							colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
	  							},
	  						'chartDiv': 'chartArea',
	  						'chartType': 'column',
	  						'chartSize': { width: 600, height: 300 },
	  						'maxValue': 800000,
	  						'increment': 100000
	  					};
	  					Nwagon.chart(chart1);
	  				},
	  				error:function(data){
	  					console.log(data);
	  					console.log("에러");
	  				}
	  			});
		     }
		});
		
		// 일별지불 (고객)
		chart2 = {
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
		
		$("#dailySalesCst").datepicker({
			autoClose : true,
		});
		
		// 일별 객실 현황 차트
		chart3 = {
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
		
		$("#dailyRoomStatus").datepicker({
			autoClose : true,
			onSelect: function(){
				dailyRoomStatus = $("#dailyRoomStatus").val();
	  			$.ajax({
	  				type : "post",
	  				url : "searchTrend.an?Condition=dailyRoomStatus",
	  				data : {dailyRoomStatus : dailyRoomStatus},
	  				success:function(data){
	  					// 객실 유형별 매출액
	  					var pricelist = [];
	  					$.each(data.list, function(index, list){
	  						pricelist.push(list.price);
	  					});
	  					
	  					var deluxe = 0;
	  					var spa = 0;
	  					var standard = 0;
	  					var suite = 0;
	  					// 객실 유형 이름
	  					var namelist = [];
	  					$.each(data.list, function(index, list){
	  						namelist.push(list.rtName);
	  						if(list.rtName == '디럭스'){
	  							deluxe = list.price;
	  						} else if(list.rtName == '스파'){
	  							spa = list.price;
	  						} else if(list.rtName == '스탠다드'){
	  							standard = list.price;
	  						} else {
	  							suite = list.price;
	  						}
	  					});
	  					
	  					$("#chartArea3").children().remove();
	  					$(".deluxe-price").children().remove();
	  					$(".deluxe-price").append("<label>" + deluxe + "</label>");
	  					$(".spa-price").children().remove();
	  					$(".spa-price").append("<label>" + spa + "</label>");
	  					$(".standard-price").children().remove();
	  					$(".standard-price").append("<label>" + standard + "</label>");
	  					$(".suite-price").children().remove();
	  					$(".suite-price").append("<label>" + suite + "</label>");
	  					$(".total-price").children().remove();
	  					$(".total-price").append("<label>" + (deluxe+spa+standard+suite) + "</label>");
	  					chart3 = {
	  						'dataset':{
	  							title: 'Web accessibility status',
	  							values : pricelist,
	  							colorset: ['#2EB400', '#2BC8C9', "#666666", '#f09a93'],
	  							fields: namelist,
	  						},
	  						'donut_width' : 50,
	  						'core_circle_radius':70,
	  							'chartDiv': 'chartArea3',
	  						'chartType': 'donut',
	  						'chartSize': {width:700, height:400}
	  					};
	  					Nwagon.chart(chart3);
	  				},
	  				error:function(data){
	  					console.log(data);
	  					console.log("에러");
	  				}
	  			});
		     }
		});
		
		// 일별지불(재고)
		chart4 = {
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
		
		$("#dailySpendStrg").datepicker({
			autoClose : true,
		});
		
		
		// 월별 객실 타입별 매출
		chart5 = {
			'legend': {
				names: ${RoomList},
			},
			'dataset': {
				title: 'Playing time per day',
				values: [1840000, 0, 200000, 240000],
				colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
			},
			'chartDiv': 'chartArea5',
			'chartType': 'column',
			'chartSize': { width: 1200, height: 300 },
			'maxValue': 2000000,
			'increment': 200000
		};
		Nwagon.chart(chart5);
		
		$("#monthlySalesPerRoomType").datepicker({
			autoClose : true,
		});
		
		// 탭 클릭시 이동
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