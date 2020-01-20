<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.site-outer{
	width: 82%;
	float: right;
	margin-right: 1%;
}

.searchArea{
	background: #F3F3F3;
	width: 100%;
	height: 50px;
}

.list-table{
	text-align: center;
	border-collapse: collapse;
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

.list-table tr td:nth-child(6){
	text-align: right;
}

.list-table td:not(:last-child), .list-table th:not(:last-child){
	border-right: 1px solid #D9D9D9;
}

.list-table tr:last-child{
	background: #DBDBDB;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/analysMenubar.jsp"/>
		<jsp:include page="../common/menubar.jsp"/>
	</header>
	<section>
		<c:set var="price" value="300000"></c:set>
		<c:set var="sum" value="0"></c:set>
		<div class="site-outer">
			<div class="excelArea" align="right">
				<button>엑셀</button>
			</div>
			<br>
			<!-- 매출 상세 -->
			<c:if test="${ Condition eq 'sales' }">
			<!-- 검색 영역 -->
			<div class="searchArea" align="right">
				<select class="searchCondition">
					<option value="sales">매출일자</option>
					<option value="checkIn">입실일자</option>
					<option value="checkOut">퇴실일자</option>
				</select>
				
				<input type="text" id="datepicker"> - 
				<input type="text" id="datepicker2">
			</div>
			<!-- 검색 영역 끝 -->
			<br>
			<!-- 테이블 영역 -->
			<table class="list-table" style="width: 100%;">
				<tr>
					<th>객실번호</th>
					<th>예약번호</th>
					<th>고객명</th>
					<th>입실일자</th>
					<th>퇴실일자</th>
					<th>매출 금액</th>
					<th>매출 일자</th>
					<th>비고</th>
				</tr>
				<c:forEach var="i" begin="1" end="10" step="1">
				<tr>
					<td>0701</td>
					<td>20200118</td>
					<td>남윤진</td>
					<td>2020-01-19</td>
					<td>2020-01-12</td>
					<td><input type="text" class="price" value="${ price }" readonly></td>
					<td>2020-01-10</td>
					<td></td>
				</tr>
				<c:set var="sum" value="${ sum + price }"></c:set>
				</c:forEach>
				<tr>
					<td>합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><input type="text" class="summary" 
						value="${ sum }" readonly></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<!-- 테이블 영역 끝 -->
			</c:if>
			<!-- 지불 상세 -->
			<c:if test="${ Condition eq 'spend' }">
			<!-- 검색 영역 -->
			<div class="searchArea" align="right">
				<label>지불 일시</label>
				<input type="text" id="datepicker"> - 
				<input type="text" id="datepicker2">
			</div>
			<!-- 검색 영역 끝 -->
			<br>
			<!-- 테이블 영역 -->
			<table class="list-table" style="width: 100%;">
				<tr>
					<th>분류</th>
					<th>소분류</th>
					<th>거래담당자</th>
					<th>지불수단</th>
					<th>지불일시</th>
					<th>지불 금액</th>
					<th>담당직원</th>
					<th>비고</th>
				</tr>
				<c:forEach var="i" begin="1" end="10" step="1">
				<tr>
					<td>고객</td>
					<td>환불</td>
					<td>남윤진</td>
					<td>계좌이체</td>	
					<td>2020-01-09</td>
					<td><input type="text" class="price" value="${ price }" readonly></td>
					<td>송기준</td>
					<td>예약번호 : 2001806</td>
				</tr>
				<c:set var="sum" value="${ sum + price }"></c:set>
				</c:forEach>
				<tr>
					<td>합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><input type="text" class="summary"
					value="${ sum }" readonly></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<!-- 테이블 영역 끝 -->
			</c:if>
		</div>
	</section>
	<footer>
	</footer>
	<script>
		$("#datepicker").datepicker();
		$("#datepicker2").datepicker();
		
		
	</script>
</body>
</html>