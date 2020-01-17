<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매전표</title>
<style>
	table{
	border-collapse: collapse;
	} 
	div {
        width: 50%; 
        height: 200px;
    }
    div.left {
        width: 35%;
        float: left;
        box-sizing: border-box;
    }
 
    .borderDiv{
    display:inline-block;
    width:15%;
    height:100px;
    }
    
    #leftDiv{
    margin-top: 50px;
    }
    .top-bot{
    	width:70%;
    	height:270px;
    }
    #ttable{
    height: 90px;
    width: 250px;
       margin-top: 30px;
    }
    .sametb{
    display: inline-block;
    }
    #btable{
    margin-top: 
    }
    #bodyTable{
    width:70%;
    }
    #resultTable{
    width:70%;
    }
     th,td {
    border: 1px solid black;
    
    }
</style>
</head>
<body> 
	<header>
	<div class="left" align="center">
		<div id="leftDiv"><h1><u>구 매 전 표</u></h1></div>
	</div>
	<div class="left" align="right">
		<table id="ttable">
			<tr>
				<th rowspan="2" style="width: 12px;">결재</th>
				<th style="height:20px">결재</th>
				<th>라인</th>
				<th>설정</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<div class="top-bot">
		<table  class="sametb">
			<tr>
				<td><b>전표번호</b></td>
				<td style="width:440px;"><c:out value="dddd"/></td>
			</tr>
			<tr>
				<td><b>DATE</b></td>
				<td><c:out value="dddd"/></td>
			</tr>
		</table>
			<table class="sametb" align="right">
			<tr>
				<td><b>구매창고</b></td>
				<td style="width:440px;"><c:out value="dddd"/></td>
			</tr>
			<tr>
				<td><b>구매처</b></td>
				<td><c:out value="dddd"/></td>
			</tr>
		</table>
	</div>
	</header>
	<section>
	<table id="bodyTable">
		<tr>
			<th>일자</th>
			<th>품목명[규격명]</th>
			<th>수량</th>
			<th>단가</th>
			<th>공급가액</th>
			<th>부가세</th>
		</tr>
			<c:forEach var="i" begin="1" end="10">
		<tr>
			<td><c:out value="02/03"></c:out></td>
			<td><c:out value="건축용석재"></c:out></td>
			<td><c:out value="10EA"></c:out></td>
			<td><c:out value="5,000"></c:out></td>
			<td><c:out value="50,000"></c:out></td>
			<td><c:out value="5,000"></c:out></td>
		</tr>
			</c:forEach>
	</table>
	<table id="resultTable">
		<tr>
			<td><b>수량</b></td>
			<td><b><c:out value="20"/></b></td>
			<td><b>공급가액</b></td>
			<td><b><c:out value="공급가액값"/></b></td>
			<td><b>VAT</b></td>
			<td><b><c:out value="VAT"/>값</b></td>
			<td><b>합계</b></td>
			<td><b><c:out value="합계값"/></b></td>
		</tr>
	</table>
		<div class="btns"><button>인쇄</button>&nbsp;<button>닫기</button></div>
	</section>
	<footer>
	</footer>
</body>
</html>