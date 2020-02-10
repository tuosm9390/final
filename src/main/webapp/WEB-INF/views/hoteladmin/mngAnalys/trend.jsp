<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	position: relative;
	z-index: -1;
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
							<label><fmt:formatNumber value="${ dailyRsvSales }" pattern="#,###"/></label>
						</div>
						<br><br>
						<div style="float: left;" class="type-rent">
							<label>대실</label>
						</div>
						<div style="float: right;" class="type-rent-sales">
							<label><fmt:formatNumber value="${ dailyStaySales }" pattern="#,###"/></label>
						</div>
						<br><br><br><br>
						<div style="float: left;" class="type-total">
							<label style="font-weight: bold;">총 매출액</label>
						</div>
						<div style="float: right;" class="type-total-sales">
							<label style="font-weight: bold;"><fmt:formatNumber value="${ totalprice }" pattern="#,###"/></label>
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
				<c:set var="refund" value="0"/>
				<c:set var="card" value="0"/>
				<c:set var="cash" value="0"/>
				<c:set var="account" value="0"/>
				<c:forEach var="dailyPaymentList" items="${dailyPaymentList}" varStatus="st">
					<c:if test="${dailyPaymentList.payStatus eq '환불'}">
						<c:set var="refund" value="${dailyPaymentList.price}"/>
					</c:if>
					<c:if test="${dailyPaymentList.pway eq '카드'}">
						<c:set var="card" value="${dailyPaymentList.price}"/>
					</c:if>
					<c:if test="${dailyPaymentList.pway eq '현금'}">
						<c:set var="cash" value="${dailyPaymentList.price}"/>
					</c:if>
					<c:if test="${dailyPaymentList.pway eq '계좌이체' && dailyPaymentList.payStatus ne 'REFUND'}">
						<c:set var="account" value="${dailyPaymentList.price}"/>
					</c:if>
				</c:forEach>
				<div class="priceInfo" align="right"><label>기준 : 원</label></div>
					<div class="priceArea">
						<div style="float: left;">
							<label>신용카드</label>
						</div>
						<div style="float: right;" class="card-value">
							<label><fmt:formatNumber value="${ card }" pattern="#,###"/></label>
						</div>
						<br>
						<div style="float: left;">
							<label>현금</label>
						</div>
						<div style="float: right;" class="cash-value">
							<label><fmt:formatNumber value="${ cash }" pattern="#,###"/></label>
						</div>
						<br>
						<div style="float: left;">
							<label>계좌이체</label>
						</div>
						<div style="float: right;" class="account-value">
							<label><fmt:formatNumber value="${ account }" pattern="#,###"/></label>
						</div>
						<br><br>
						<div style="float: left;">
							<label>환불</label>
						</div>
						<div style="float: right;" class="refund-value">
							<label><fmt:formatNumber value="${ refund }" pattern="#,###"/></label>
						</div>
						<br><br>
						<div style="float: left;">
							<label style="font-weight: bold;">총 지불액</label>
						</div>
						<div style="float: right;" class="total-value">
							<label style="font-weight: bold;"><fmt:formatNumber value="${ (card + cash + account + refund) }" pattern="#,###"/></label>
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
				<c:set var="deluxeprice" value="0"/>
				<c:set var="spaprice" value="0"/>
				<c:set var="standardprice" value="0"/>
				<c:set var="suiteprice" value="0"/>
				<c:forEach var="list" items="${ list }">
					<c:if test="${ list.rtName eq '디럭스' }">
						<c:set var="deluxeprice" value="${ list.price }"/>
					</c:if>
					<c:if test="${ list.rtName eq '스파' }">
						<c:set var="spaprice" value="${ list.price }"/>
					</c:if>
					<c:if test="${ list.rtName eq '스탠다드' }">
						<c:set var="standardprice" value="${ list.price }"/>
					</c:if>
					<c:if test="${ list.rtName eq '스위트' }">
						<c:set var="suiteprice" value="${ list.price }"/>
					</c:if>
				</c:forEach>
				<div class="priceInfo" align="right"><label>기준 : 원</label></div>
					<div class="priceArea">
						<div style="float: left;">
							<label>디럭스</label>
						</div>
						<div style="float: right;" class="deluxe-price">
							<label><fmt:formatNumber value="${ deluxeprice }" pattern="#,###"/></label>
						</div>
						<br>
						<div style="float: left;">
							<label>스파</label>
						</div>
						<div style="float: right;" class="spa-price">
							<label><fmt:formatNumber value="${ spaprice }" pattern="#,###"/></label>
						</div>
						<br>
						<div style="float: left;">
							<label>스탠다드</label>
						</div>
						<div style="float: right;" class="standard-price">
							<label><fmt:formatNumber value="${ standardprice }" pattern="#,###"/></label>
						</div>
						<br>
						<div style="float: left;">
							<label>스위트</label>
						</div>
						<div style="float: right;" class="suite-price">
							<label><fmt:formatNumber value="${ suiteprice }" pattern="#,###"/></label>
						</div>
						<br><br><br>
						<div style="float: left;">
							<label style="font-weight: bold;">총 매출액</label>
						</div>
						<div style="float: right;" class="total-price">
							<label style="font-weight: bold;"><fmt:formatNumber value="${ (deluxeprice + spaprice + standardprice + suiteprice) }" pattern="#,###"/></label>
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
				<c:set var="repair" value="0"/>
				<c:set var="purequip" value="0"/>
				<c:set var="purcons" value="0"/>
				<c:forEach var="purlist" items="${ dailySpendStrgList }">
					<c:if test="${ purlist.rptType eq 'REPAIR' }">
						<c:set var="repair" value="${ purlist.totalPrice }"/>
					</c:if>
					<c:if test="${ purlist.rptType eq 'PURCHASE' }">
						<c:if test="${ purlist.type eq 'EQUIP' }">
							<c:set var="purequip" value="${ purlist.totalPrice }"/>
						</c:if>
						<c:if test="${ purlist.type eq 'CONS' }">
							<c:set var="purcons" value="${ purlist.totalPrice }"/>
						</c:if>
					</c:if>
				</c:forEach>
				<div class="priceInfo" align="right"><label>기준 : 원</label></div>
					<div class="priceArea">
						<div style="float: left;">
							<label>수리</label>
						</div>
						<div style="float: right;" class="repair-price">
							<label><fmt:formatNumber value="${ repair }" pattern="#,###"/></label>
						</div>
						<br>
						<div style="float: left;">
							<label>비품구입</label>
						</div>
						<div style="float: right;" class="purequip-price">
							<label><fmt:formatNumber value="${ purequip }" pattern="#,###"/></label>
						</div>
						<br>
						<div style="float: left;">
							<label>소모품구입</label>
						</div>
						<div style="float: right;" class="purcons-price">
							<label><fmt:formatNumber value="${ purcons }" pattern="#,###"/></label>
						</div>
						<br><br><br><br>
						<div style="float: left;">
							<label style="font-weight: bold;">총 지불액</label>
						</div>
						<div style="float: right;" class="purtotal-price">
							<label style="font-weight: bold;"><fmt:formatNumber value="${ (repair + purequip + purcons) }" pattern="#,###"/></label>
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
		
		////////////////////////////////////////////////////////////////////////////////////////////
		var deluxe = 0;		// 디럭스 가격
	  	var spa = 0;		// 스파 가격
	  	var standard = 0;	// 스탠다드 가격
	  	var suite = 0;		// 스위트 가격
	  	
	  	var selectMaxList = [${ dailyRsvSales }, ${ dailyStaySales }];
		var max = Math.max.apply(null, selectMaxList);
		var increment = 0;
		if(max >= 10000 && max < 100000){
			max = (Math.ceil(max / 10000) * 10000);
			increment = (Math.ceil(max / 10000) * 1000);
		} else if(max >= 100000 && max < 1000000){
			max = (Math.ceil(max / 100000) * 100000);
			increment = (Math.ceil(max / 100000) * 10000);
		} else if(max >= 1000000 && max < 10000000){
			max = (Math.ceil(max / 1000000) * 1000000);
			increment = (Math.ceil(max / 1000000) * 100000);
		} else if(max >= 10000000 && max < 100000000){
			max = (Math.ceil(max / 10000000) * 10000000);
			increment = (Math.ceil(max / 10000000) * 1000000);
		}
		
		if(max != 0){
			// 일별 매출 차트
			chart1 = {
				'legend': {
					names: ['객실','대실'],
				},
				'dataset': {
					title: 'Playing time per day',
					values: selectMaxList,
					colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
				},
				'chartDiv': 'chartArea',
				'chartType': 'column',
				'chartSize': { width: 600, height: 300 },
				'maxValue': max,
				'increment': increment
			};
			Nwagon.chart(chart1);
		} else {
			$("#chartArea").append("<div style='display: inline-block;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'>내역이 존재하지 않습니다.</div>");
		}
		
		$("#dailySales").datepicker({
			autoClose : true,
			onSelect: function(){
	            dailySales = $("#dailySales").val();
	  			$.ajax({
	  				type : "post",
	  				url : "searchTrend.an?Condition=dailySales",
	  				data : {dailySales:dailySales},
	  				success:function(data){
	  					selectMaxList = [];
	  					selectMaxList = [data.dailyRsvSales, data.dailyStaySales];
	  					console.log(selectMaxList);
	  					max = 0;
	  					max = Math.max.apply(null, selectMaxList);

	  					increment = 0;
	  					if(max >= 10000 && max < 100000){
	  						max = (Math.ceil(max / 10000) * 10000);
	  						increment = (Math.ceil(max / 10000) * 1000);
	  					} else if(max >= 100000 && max < 1000000){
	  						max = (Math.ceil(max / 100000) * 100000);
	  						increment = (Math.ceil(max / 100000) * 10000);
	  					} else if(max >= 1000000 && max < 10000000){
	  						max = (Math.ceil(max / 1000000) * 1000000);
	  						increment = (Math.ceil(max / 1000000) * 100000);
	  					} else if(max >= 10000000 && max < 100000000){
	  						max = (Math.ceil(max / 10000000) * 10000000);
	  						increment = (Math.ceil(max / 10000000) * 1000000);
	  					}
	  					
	  					$("#chartArea").children().remove();
	  					$(".type-room-sales").children().remove();
	  					$(".type-room-sales").append("<label>" + data.dailyRsvSales.toLocaleString() + "</label>");
	  					$(".type-rent-sales").children().remove();
	  					$(".type-rent-sales").append("<label>" + data.dailyStaySales.toLocaleString() + "</label>");
	  					$(".type-total-sales").children().remove();
	  					$(".type-total-sales").append("<label style='font-weight: bold;'>" + (data.dailyRsvSales + data.dailyStaySales).toLocaleString() + "</label>")
	  					if(max != 0){
		  					chart1 = {
		  						'legend': {
		  							names: ['객실','대실'],
		  						},
		  						'dataset': {
		  							values: selectMaxList,
		  							colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
		  							},
		  						'chartDiv': 'chartArea',
		  						'chartType': 'column',
		  						'chartSize': { width: 600, height: 300 },
		  						'maxValue': max,
		  						'increment': increment
		  					};
		  					Nwagon.chart(chart1);
	  					} else {
	  						$("#chartArea").append("<div style='display: inline-block;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'>내역이 존재하지 않습니다.</div>");
	  					}
	  				},
	  				error:function(data){
	  					console.log(data);
	  					console.log("에러");
	  				}
	  			});
		     }
		});
		
		////////////////////////////////////////////////////////////////////////////////////////////
		// 일별지불 (고객)
		var cash = 0;
		var card = 0;
		var account = 0;
		var refund = 0;
		var pricelist = [];
		var dailyPaymentList = JSON.parse('${dailyPaymentList}');
		$.each(dailyPaymentList, function(index, dailyPaymentList){
			pricelist.push(dailyPaymentList.price);
		});
		
		var namelist = [];
		$.each(dailyPaymentList, function(index, dailyPaymentList){
			namelist.push(dailyPaymentList.pway);
			if(dailyPaymentList.pway == '현금'){
				cash = dailyPaymentList.price;
			} else if(dailyPaymentList.pway == '카드'){
				card = dailyPaymentList.price;
			} else if(dailyPaymentList.pway == '계좌이체'){
				account = dailyPaymentList.price;
			} else {
				refund = dailyPaymentList.price;
			}
		});
		
		if(card == 0 && cash == 0 && account == 0 && refund == 0){
			$("#chartArea2").append("<div style='display: inline-block;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'>내역이 존재하지 않습니다.</div>");
		} else {
			chart2 = {
				'dataset':{
					title: 'Web accessibility status',
					values: pricelist,
					colorset: ['#2EB400', '#2BC8C9', "#666666", '#f09a93'],
					fields: namelist,
				},
				'donut_width' : 50,
				'core_circle_radius':70,
				'chartDiv': 'chartArea2',
				'chartType': 'donut',
				'chartSize': {width:700, height:400}
			};
			Nwagon.chart(chart2);
		}
		
		$("#dailySalesCst").datepicker({
			autoClose : true,
			onSelect: function(){
				dailySalesCst = $("#dailySalesCst").val();
				$.ajax({
					type : "post",
	  				url : "searchTrend.an?Condition=dailySalesCst",
	  				data : {dailySalesCst : dailySalesCst},
	  				success:function(data){
	  					cash = 0;
	  					card = 0;
	  					account = 0;
	  					refund = 0;
	  					
	  					pricelist = [];
	  					$.each(data.dailyPaymentList, function(index, dailyPaymentList){
	  						pricelist.push(dailyPaymentList.price);
	  					});
	  					
	  					namelist = [];
	  					$.each(data.dailyPaymentList, function(index, dailyPaymentList){
	  						namelist.push(dailyPaymentList.pway);
	  						if(dailyPaymentList.pway == '현금'){
	  							cash = dailyPaymentList.price;
	  						} else if(dailyPaymentList.pway == '카드'){
	  							card = dailyPaymentList.price;
	  						} else if(dailyPaymentList.pway == '계좌이체'){
	  							account = dailyPaymentList.price;
	  						} else {
	  							refund = dailyPaymentList.price;
	  						}
	  					});
	  					
	  					$("#chartArea2").children().remove();
	  					$(".card-value").children().remove();
	  					$(".card-value").append("<label>" + card.toLocaleString() + "</label>");
	  					$(".cash-value").children().remove();
	  					$(".cash-value").append("<label>" + cash.toLocaleString() + "</label>");
	  					$(".account-value").children().remove();
	  					$(".account-value").append("<label>" + account.toLocaleString() + "</label>");
	  					$(".refund-value").children().remove();
	  					$(".refund-value").append("<label>" + refund.toLocaleString() + "</label>");
	  					$(".total-value").children().remove();
	  					$(".total-value").append("<label style='font-weight: bold;'>" + (card + cash + account + refund).toLocaleString() + "</label>");
	  					if(card == 0 && cash == 0 && account == 0 && refund == 0){
	  						$("#chartArea2").append("<div style='display: inline-block;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'>내역이 존재하지 않습니다.</div>");
	  					} else {
		  					chart2 = {
		  						'dataset':{
		  							title: 'Web accessibility status',
		  							values: pricelist,
		  							colorset: ['#2EB400', '#2BC8C9', "#666666", '#f09a93'],
		  							fields: namelist,
		  						},
		  						'donut_width' : 50,
		  						'core_circle_radius':70,
		  						'chartDiv': 'chartArea2',
		  						'chartType': 'donut',
		  						'chartSize': {width:700, height:400}
		  					};
		  					Nwagon.chart(chart2);
	  					}
	  					
	  				},
	  				error:function(data){
	  					console.log(data);
	  				}
				});
			}
		});
		
		////////////////////////////////////////////////////////////////////////////////////////////
		// 일별 객실 현황 차트
		var dailyRoomStatus = JSON.parse('${list}');
		deluxe = 0;
		spa = 0;
		standard = 0;
		suite = 0;
		pricelist = [];
		namelist = [];
		$.each(dailyRoomStatus, function(index, dailyRoomStatus){
			pricelist.push(dailyRoomStatus.price);
			namelist.push(dailyRoomStatus.rtName);
			if(dailyRoomStatus.rtName == '디럭스'){
				deluxe = dailyRoomStatus.price;
			} else if(dailyRoomStatus.rtName == '스파'){
				spa = dailyRoomStatus.price;
			} else if(dailyRoomStatus.rtName == '스탠다드'){
				standard = dailyRoomStatus.price;
			} else {
				suite = dailyRoomStatus.price;
			}
		});
		
		if(deluxe == 0 && spa == 0 && standard == 0 && suite == 0){
			$("#chartArea3").append("<div style='display: inline-block;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'>내역이 존재하지 않습니다.</div>");
		} else {
			chart3 = {
				'dataset':{
					title: 'Web accessibility status',
					values: pricelist,
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
		}
		
		$("#dailyRoomStatus").datepicker({
			autoClose : true,
			onSelect: function(){
				dailyRoomStatus = $("#dailyRoomStatus").val();
	  			$.ajax({
	  				type : "post",
	  				url : "searchTrend.an?Condition=dailyRoomStatus",
	  				data : {dailyRoomStatus : dailyRoomStatus},
	  				success:function(data){
	  					deluxe = 0;
	  					spa = 0;
	  					standard = 0;
	  					suite = 0;
	  					// 객실 유형별 매출액
	  					pricelist = [];
	  					// 객실 유형 이름
	  					namelist = [];
	  					$.each(data.list, function(index, list){
	  						pricelist.push(list.price);
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
	  					$(".deluxe-price").append("<label>" + deluxe.toLocaleString() + "</label>");
	  					$(".spa-price").children().remove();
	  					$(".spa-price").append("<label>" + spa.toLocaleString() + "</label>");
	  					$(".standard-price").children().remove();
	  					$(".standard-price").append("<label>" + standard.toLocaleString() + "</label>");
	  					$(".suite-price").children().remove();
	  					$(".suite-price").append("<label>" + suite.toLocaleString() + "</label>");
	  					$(".total-price").children().remove();
	  					$(".total-price").append("<label style='font-weight: bold;'>" + (deluxe+spa+standard+suite).toLocaleString() + "</label>");
	  					if(deluxe == 0 && spa == 0 && standard == 0 && suite == 0){
	  						$("#chartArea3").append("<div style='display: inline-block;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'>내역이 존재하지 않습니다.</div>");
	  					} else {
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
	  					}
	  				},
	  				error:function(data){
	  					console.log(data);
	  					console.log("에러");
	  				}
	  			});
		     }
		});
		
		////////////////////////////////////////////////////////////////////////////////////////////
		// 일별지불(재고)
		var dailySpendStrgList = JSON.parse('${dailySpendStrgList}');
		pricelist = [];
		namelist = [];
		$.each(dailySpendStrgList, function(index, dailySpendStrgList){
			pricelist.push(dailySpendStrgList.totalPrice);
			if(dailySpendStrgList.rptType == "REPAIR"){
				namelist.push("수리");
			} else if(dailySpendStrgList.rptType == "PURCHASE"){
				if(dailySpendStrgList.type == 'EQUIP'){
					namelist.push("비품구입");
				} else if(dailySpendStrgList.type == "CONS"){
					namelist.push("소모품구입");
				}
			}
		});
		if(namelist != null){
			chart4 = {
				'dataset':{
					title: 'Web accessibility status',
					values: pricelist,
					colorset: ['#2EB400', '#2BC8C9', "#666666", '#f09a93'],
					fields: namelist,
				},
				'donut_width' : 50,
				'core_circle_radius':70,
				'chartDiv': 'chartArea4',
				'chartType': 'donut',
				'chartSize': {width:700, height:400}
			};
			Nwagon.chart(chart4);
		} else {
			$("#chartArea4").append("<div style='display: inline-block;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'>내역이 존재하지 않습니다.</div>");
		}
		
		$("#dailySpendStrg").datepicker({
			autoClose : true,
			onSelect: function(){
				dailySpendStrg = $("#dailySpendStrg").val();
				$.ajax({
					type : "post",
	  				url : "searchTrend.an?Condition=dailySpendStrg",
	  				data : {dailySpendStrg : dailySpendStrg},
	  				success:function(data){
	  					var repair = 0;
	  					var purequip = 0;
	  					var purcons = 0;
	  					pricelist = [];
	  					namelist = [];
	  					$.each(data.dailySpendStrgList, function(index, dailySpendStrgList){
	  						pricelist.push(dailySpendStrgList.totalPrice);
	  						if(dailySpendStrgList.rptType == "REPAIR"){
	  							namelist.push("수리");
	  							repair = dailySpendStrgList.totalPrice;
	  						} else if(dailySpendStrgList.rptType == "PURCHASE"){
	  							if(dailySpendStrgList.type == "EQUIP"){
	  								namelist.push("비품구입");
	  								purequip = dailySpendStrgList.totalPrice;
	  							} else if(dailySpendStrgList.type == "CONS"){
	  								namelist.push("소모품구입");
	  								purcons = dailySpendStrgList.totalPrice;
	  							}
	  						}
	  					});
	  					$("#chartArea4").children().remove();
	  					$(".repair-price").children().remove();
	  					$(".purequip-price").children().remove();
	  					$(".purcons-price").children().remove();
	  					$(".purtotal-price").children().remove();
	  					$(".repair-price").append("<label>" + repair.toLocaleString() + "</label>");
	  					$(".purequip-price").append("<label>" + purequip.toLocaleString() + "</label>");
	  					$(".purcons-price").append("<label>" + purcons.toLocaleString() + "</label>");
	  					$(".purtotal-price").append("<label style='font-weight: bold;'>" + (repair + purequip + purcons).toLocaleString() + "</label>");
	  					
	  					if(repair == 0 && purequip == 0 && purcons == 0){
	  						$("#chartArea4").append("<div style='display: inline-block;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'>내역이 존재하지 않습니다.</div>");
	  					} else {
	  						chart4 = {
	  							'dataset':{
	  								title: 'Web accessibility status',
	  								values: pricelist,
	  								colorset: ['#2EB400', '#2BC8C9', "#666666", '#f09a93'],
	  								fields: namelist,
	  							},
	  							'donut_width' : 50,
	  							'core_circle_radius':70,
	  							'chartDiv': 'chartArea4',
	  							'chartType': 'donut',
	  							'chartSize': {width:700, height:400}
	  						};
	  						Nwagon.chart(chart4);
	  					}
	  				},
	  				error:function(data){
	  					console.log("에러");
	  				}
				});
			}
		});
		
		////////////////////////////////////////////////////////////////////////////////////////////
		// 월별 객실 타입별 매출
		var monthlyRsvList = JSON.parse('${monthlyRsvList}');
		var monthlyStayList = JSON.parse('${monthlyStayList}');
		deluxe = 0;
		spa = 0;
		standard = 0;
		suite = 0;
		$.each(monthlyRsvList, function(index, monthlyRsvList){
			if(monthlyRsvList.rtName == '디럭스'){
				deluxe = monthlyRsvList.price;
			} else if(monthlyRsvList.rtName == '스파'){
				spa = monthlyRsvList.price;
			} else if(monthlyRsvList.rtName == '스탠다드'){
				standard = monthlyRsvList.price;
			} else {
				suite = monthlyRsvList.price;
			}
		});
		
		$.each(monthlyStayList, function(index, monthlyStayList){
			if(monthlyStayList.rtName == '디럭스'){
				deluxe += monthlyStayList.price;
			} else if(monthlyStayList.rtName == '스파'){
				spa += monthlyStayList.price;
			} else if(monthlyStayList.rtName == '스탠다드'){
				standard += monthlyStayList.price;
			} else {
				suite += monthlyStayList.price;
			}
		});
		selectMaxList = [standard, deluxe, suite, spa];
		max = Math.max.apply(null, selectMaxList);
		
		increment = 0;
		if(max >= 100000 && max < 1000000){
			max = (Math.ceil(max / 100000) * 100000);
			increment = (Math.ceil(max / 100000) * 10000);
		} else if(max >= 1000000 && max < 10000000){
			max = (Math.ceil(max / 1000000) * 1000000);
			increment = (Math.ceil(max / 1000000) * 100000);
		} else if(max >= 10000000 && max < 100000000){
			max = (Math.ceil(max / 10000000) * 10000000);
			increment = (Math.ceil(max / 10000000) * 1000000);
		} else if(max >= 100000000 && max < 1000000000){
			max = (Math.ceil(max / 100000000) * 100000000);
			increment = (Math.ceil(max / 100000000) * 10000000);
		}
		console.log(${RoomList});
		chart5 = {
			'legend': {
				names: ${RoomList},
			},
			'dataset': {
				title: 'Playing time per day',
				values: selectMaxList,
				colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
			},
			'chartDiv': 'chartArea5',
			'chartType': 'column',
			'chartSize': { width: 1200, height: 300 },
			'maxValue': max,
			'increment': increment
		};
		Nwagon.chart(chart5);
		
		$("#monthlySalesPerRoomType").datepicker({
			autoClose : true,
			onSelect: function(){
				monthlySalesPerRoomType = $("#monthlySalesPerRoomType").val();
				$.ajax({
					type : "post",
	  				url : "searchTrend.an?Condition=monthlySalesPerRoomType",
	  				data : {monthlySalesPerRoomType : monthlySalesPerRoomType},
	  				success:function(data){
	  					$("#chartArea5").children().remove();
	  					monthlyRsvList = data.monthlyRsvList;
	  					monthlyStayList = data.monthlyStayList;
	  					deluxe = 0;
	  					spa = 0;
	  					standard = 0;
	  					suite = 0;
	  					$.each(data.monthlyRsvList, function(index, monthlyRsvList){
	  						if(monthlyRsvList.rtName == '디럭스'){
	  							deluxe = monthlyRsvList.price;
	  						} else if(monthlyRsvList.rtName == '스파'){
	  							spa = monthlyRsvList.price;
	  						} else if(monthlyRsvList.rtName == '스탠다드'){
	  							standard = monthlyRsvList.price;
	  						} else if(monthlyRsvList.rtName == '스위트'){
	  							suite = monthlyRsvList.price;
	  						}
	  					});
	  					
	  					$.each(data.monthlyStayList, function(index, monthlyStayList){
	  						if(monthlyStayList.rtName == '디럭스'){
	  							deluxe += monthlyStayList.price;
	  						} else if(monthlyStayList.rtName == '스파'){
	  							spa += monthlyStayList.price;
	  						} else if(monthlyStayList.rtName == '스탠다드'){
	  							standard += monthlyStayList.price;
	  						} else if(monthlyStayList.rtName == '스위트'){
	  							suite += monthlyStayList.price;
	  						}
	  					});
	  					
	  					selectMaxList = [standard, deluxe, suite, spa];
	  					max = Math.max.apply(null, selectMaxList);
	  					
	  					increment = 0;
	  					if(max >= 100000 && max < 1000000){
	  						max = (Math.ceil(max / 100000) * 100000);
	  						increment = (Math.ceil(max / 100000) * 10000);
	  					} else if(max >= 1000000 && max < 10000000){
	  						max = (Math.ceil(max / 1000000) * 1000000);
	  						increment = (Math.ceil(max / 1000000) * 100000);
	  					} else if(max >= 10000000 && max < 100000000){
	  						max = (Math.ceil(max / 10000000) * 10000000);
	  						increment = (Math.ceil(max / 10000000) * 1000000);
	  					} else if(max >= 100000000 && max < 1000000000){
	  						max = (Math.ceil(max / 100000000) * 100000000);
	  						increment = (Math.ceil(max / 100000000) * 10000000);
	  					}
	  					
	  					chart5 = {
	  							'legend': {
	  								names: ${RoomList},
	  							},
	  							'dataset': {
	  								title: 'Playing time per day',
	  								values: selectMaxList,
	  								colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
	  							},
	  							'chartDiv': 'chartArea5',
	  							'chartType': 'column',
	  							'chartSize': { width: 1200, height: 300 },
	  							'maxValue': max,
	  							'increment': increment
	  						};
	  						Nwagon.chart(chart5);
	  				},
	  				error:function(data){
	  					
	  				}
				});
			}
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