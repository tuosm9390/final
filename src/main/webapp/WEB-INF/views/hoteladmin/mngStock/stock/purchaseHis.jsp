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
	width: 63.8%;
	margin-left: 17%;
	height: 100px; 
	} 
	#Table{
	width: 1000px;
	border-collapse: collapse;
	}
	#sbody{
	margin-left: 17%;
	}
	#filter{
	margin-top:13px;
	width: 50px;
	height: 30px;
	}
	
	td,th{
	text-align: center;
	height: 40px;
	border: 1px solid black;
	}
	tr{
	border: 1px solid black;
	}
	.searchCondition{
	float: right;
	margin-top: -50px;
	border: 1px solid black;
	}
	.term{
	float:right;
	}
	#termId{
	margin-left: 10px;
	}
	#titlemsg{
		width: 220px;
		height: 50px;
		margin-top: 40px;
	}
	#filterDiv{
	margin-top: -20px;
	}
</style>
</head>
<body>
	
	<jsp:include page="../../common/menubar.jsp"/>
	<jsp:include page="../../common/productMenubar.jsp"/>
	 

	<header>	
		<div class="top-div">
		<div id="titlemsg"><h1>구매내역조회</h1></div>
		<input type="text" name="serachCondition" class="searchCondition">
		<button class="searchCondition">Search</button>
		<div id="filterDiv">
		<select style="width:80px;height:27px;" id="filter">
			<option value="money">금액</option>
 	 		<option value="check">수령</option>
		</select>
		<p class="term">기간&nbsp;&nbsp;<input type="text" class="term" id="termId"><input type="text" class="term"></p>
		</div><!-- filterDiv -->
		</div><!-- top div end -->
		
	
	</header>
	<section id="sbody">
	<table id="Table">
		<tr>
			<th>No</th>
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
		<td>${list }</td>
		<td><c:out value="2020/01/12"/></td>
		<td><c:out value="김상찬주식회사"/></td>
		<td><c:out value="김상찬품목"/></td>
		<td><c:out value="500,000"/></td>
		<td><c:out value="수령완료"/></td>
		<td><c:out value="발주"/></td>
		<td><c:out value="상태"/></td>
		<td><c:out value="ㅁㅁ"/></td>
		</tr>
		</c:forEach>
	
	</table>
	<div class="btns"><button>Excel</button>&nbsp;<button>인쇄</button></div>

	</section>
	
	
	
</body>
</html>