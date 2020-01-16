<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 .top-div{

	width: 66.4%;
	margin-left: 17%
	}
	.search-btn{
		float: right;
	}
	#selectBox{
	size: 100px;
	}
	#right-set{
	float: right;
	}
	#Table{
	width: 1000px;
	}
	#sbody{
	margin-left: 17%;
	}
	.day{
	float:right;
	}
	#searchbox{
	margin-bottom: 5%;
	}
	#filter{
	margin-top:13px;
	}
	#textbar{
	margin-left: 10px;
	}
	td{
	text-align: center;
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/settingMenubar.jsp"/>
	

	<header>	
		<div class="top-div">
		
		<h1>구매내역조회</h1>
		<div id="searchbox"><input type="text" name="searchCondition" id="searchArea" class="search-btn">
		<button class="search-btn">Search</button></div>
	
		<select style="width:80px;height:27px;" id="filter">
			<option value="money">금액</option>
 	 		<option value="check">수령</option>
		</select>
		<p class="day">기간<input type="text" class="day" id="textbar">&nbsp;&nbsp;&nbsp;<input type="text" class="day"></p>
	
		
	
		
		
		</div> <!-- top-div end -->
		
	
	</header>
	<section id="sbody">
	<table id="Table">
		<tr>
			<th><input type="checkbox" name="box-1"></th>
			<th>일자</th>
			<th>거래처명</th>
			<th>품목명</th>
			<th>금액합계</th>
			<th>수령</th>
			<th>xx</th>
			<th>xx</th>
			<th>xx</th>
		</tr>
		
		
		 <c:forEach var="list" begin="1" end="10">
		<tr>
		<td><input type="checkbox" name="box-1"></td>
		<td>2020</td>
		<td>김상찬주식회사</td>
		<td>김상찬품목</td>
		<td>50000</td>
		<td>수령완료</td>
		<td>ㅌㅌ</td>
		<td>ㅌㅌ</td>
		<td>ㅌㅌ</td>
		</tr>
		</c:forEach>
	
	</table>
	<div class="btns"><button>Excel</button>&nbsp;<button>인쇄</button></div>

	
	
	</section>
	
	
	
</body>
</html>