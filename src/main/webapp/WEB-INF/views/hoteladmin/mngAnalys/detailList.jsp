<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.site-outer{
	width: 90%;
	margin-left: 5%;
}

.searchArea{
	background: #F3F3F3;
	width: 100%;
}

.spend{
	margin-left: 10px;
}

.price{
	text-align: right;
}

.date{
	text-align: center;
}
.list-table{
	text-align: center;
	border-collapse: collapse;
	position: relative;
}

.list-table td, th{
	padding: 10px;
}
.list-table tr{
	height: 30px;
}

.list-table th{
	background: #F3F3F3;
}

.list-table tr td:nth-child(3){
	text-align: left;
}

.list-table th:nth-child(4){
	width: 200px;
}

.list-table th:nth-child(7){
	width: 150px;
}

.list-table td:not(:last-child), .list-table th:not(:last-child){
	border-right: 1px solid #D9D9D9;
}

.list-table tbody tr:last-child th{
	border: none;
}

.list-table thead th{
	position: sticky;
	top: 0;
}

.list-table tbody th{
	position: sticky;
	bottom: 0;
}

.analysMenubar div {
	display: inline-block;
	width: 80px;
	height: 31px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	background-color: white;
	color: black;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.analysMenubar>div:hover{
	background: #3498DB;
	color: white;
	cursor: pointer;
}

.analys-item{
	line-height: 30px;
}

#hrDiv{
	border-bottom: 1px solid lightgray;
	width: 100%;
}

.excel-btn{
	background: white;
    color: green !important;
    width: 68px;
    height: 25px;
    border-radius: 2px;
    line-height: 30px;
}

.excel-btn:hover{
	background: green !important;
	color: white !important;
}

input[type=text], select{
	width: 100px;
	border: 1px solid lightgray;
	padding: 0;
	border-radius: 3px;
	height:23px;
}

.anlys-btn{
	width:80px;
	height:25px;
	border-radius:5px;
	border:0;
	background-color: #3498DB;
   	color: white;
   	cursor:pointer;
}

.anlys-btn:focus{
	outline: none;
}
</style>
</head>
<body>
	<header>
<%-- 		<jsp:include page="../common/analysMenubar.jsp"/> --%>
		<jsp:include page="../common/menubar.jsp"/>
	</header>
	<section>
		<c:set var="sum" value="0"/>
		<div class="site-outer">
			<div class="analysMenubarArea">
				<div class="analysMenubar">
					<div id="sales"
						class="analys-item sales ${ Condition eq 'sales' ? '_active' : '' }">매출
						상세</div>
					<div id="spend"
						class="analys-item spend ${ Condition eq 'spend' ? '_active' : '' }">지불
						상세</div>
					<div class="excel-btn" style="float: right;">엑셀</div>
					<input id="excel" type="file" style="display: none;">
				</div>
				<div id="hrDiv" style="background-color: lightgray; color: lightgray"></div>
			</div>
			<br>
			<!-- 매출 상세 -->
			<c:if test="${ Condition eq 'sales' }">
			<!-- 검색 영역 -->
			<form id="searchForm" action="searchDetail.an?Condition=sales" method="post">
				<div class="searchArea" align="right">
					<c:if test="${ view eq 'view' }">
						<select class="searchCondition" name="searchCondition">
							<option value="sales" selected>매출일자</option>
							<option value="checkIn">입실일자</option>
							<option value="checkOut">퇴실일자</option>
						</select>
					</c:if>
					<c:if test="${ view eq 'search' }">
						<select class="searchCondition" name="searchCondition">
							<option value="sales">매출일자</option>
							<option value="checkIn">입실일자</option>
							<option value="checkOut">퇴실일자</option>
						</select>
					</c:if>
					
					<c:if test="${ view eq 'view' }">
						<input type="text" name="startDate" class="date" id="startDate" readonly> - 
					</c:if>
					<c:if test="${ view eq 'search' }">
						<input type="text" name="startDate" class="date" id="startDate" value="${ startDate }" readonly> - 
					</c:if>
					<c:if test="${ view eq 'view' }">
						<input type="text" name="endDate" class="date" id="endDate" readonly>
					</c:if>
					<c:if test="${ view eq 'search' }">
						<input type="text" name="endDate" class="date" id="endDate" value="${ endDate }" readonly>
					</c:if>
					<button type="submit" class="anlys-btn">검색</button>
				</div>
			</form>
			<!-- 검색 영역 끝 -->
			<br>
			<!-- 테이블 영역 -->
			<div style="max-height: 530px; overflow: auto;">
				<table class="list-table" style="width: 100%;">
					<thead>
						<tr>
							<th>객실번호</th>
							<th>예약번호</th>
							<th>고객명</th>
							<th>결제일자</th>
							<th>입실일자</th>
							<th>퇴실일자</th>
							<th>매출 금액</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${ sdList }" varStatus="st">
						<tr>
							<td>${ list.rmNum }</td>
							<td>${ list.rsvNo }</td>
							<td>${ list.name }</td>
							<td>${ list.rsvDate }</td>
							<td>${ list.checkIn }</td>
							<td>${ list.checkOut }</td>
							<td align="right"><fmt:formatNumber value="${ list.stayPrice }" pattern="#,###"/> 원</td>
							<td></td>	
						</tr>
						<c:set var="sum" value="${ sum + list.stayPrice }"></c:set>
						</c:forEach>
						<tr>
							<th colspan="5"></th>
							<th>총 매출 금액</th>
							<th align="right"><fmt:formatNumber value="${ sum }" pattern="#,###"/> 원</th>
							<th></th>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 테이블 영역 끝 -->
			</c:if>
			<!-- 지불 상세 -->
			<c:if test="${ Condition eq 'spend' }">
			<!-- 검색 영역 -->
			<form id="searchForm" action="searchDetail.an?Condition=spend" method="post">
				<div class="searchArea" align="right">
					<label>지불 일시</label>
					
					<input type="text" name="startDate" class="date" id="startDate" readonly> - 
					<input type="text" name="endDate" class="date" id="endDate" readonly>
					<button type="submit" class="anlys-btn">검색</button>
				</div>
			</form>
			<!-- 검색 영역 끝 -->
			<br>
			<!-- 테이블 영역 -->
			<div style="max-height: 530px; overflow: auto;">
				<table class="list-table" style="width: 100%;">
					<tr>
						<th>분류</th>
						<th>소분류</th>
						<th>거래담당자</th>
						<th>지불수단</th>
						<th>지불일시</th>
						<th>담당직원</th>
						<th>지불 금액</th>
						<th>비고</th>
					</tr>
					<c:forEach var="i" begin="1" end="10" step="1">
					<tr>
						<td>고객</td>
						<td>환불</td>
						<td>남윤진</td>
						<td>계좌이체</td>	
						<td>2020-01-09</td>
						<td>송기준</td>
						<td align="right"><fmt:formatNumber value="${ price }" pattern="#,###"/> 원</td>
						<td>예약번호 : 2001806</td>
					</tr>
					<c:set var="sum" value="${ sum + price }"></c:set>
					</c:forEach>
					<tr>
						<th colspan="5"></th>
						<th>총 매출 금액</th>
						<th align="right"><fmt:formatNumber value="${ sum }" pattern="#,###"/> 원</th>
						<th></th>
					</tr>
				</table>
			</div>
			<!-- 테이블 영역 끝 -->
			</c:if>
		</div>
	</section>
	<footer>
	</footer>
	<script>
		
		$(function() {
			date = new Date();

			startDate = $("#startDate").datepicker({
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					//종료일 datepicker에 최소날짜를 방금 클릭한 날짜로 설정
					startNum = date;
					$("#endDate").datepicker({
						minDate : new Date(startNum),
					});
				}
			}).data('datepicker');

			endDate = $("#endDate").datepicker({
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					endNum = date;
					$('#startDate').datepicker({
						//시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
						maxDate : new Date(endNum),
					});
				}
			}).data('datepicker');
		});
		
		$(function(){
			$("._active").css({"background":"#3498DB", "color":"white"});
		});
		
		$(".analys-item").click(function(){
			var Condition = $(this).attr('id');
			location.href='viewDetailList.an?Condition=' + Condition;
		});
		
		$(".excel-btn").click(function(){
			$("#excel").click();
		});
	</script>
</body>
</html>