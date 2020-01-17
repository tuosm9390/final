<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#header{
		background-color: skyblue;
		height: 30px;
	} 
	body {
		width: 60%;
		border: 1px solid black;
		height:600px;
	}
	#gg{
	margin-left: 100px;
	}
	#pid{ 
	margin-top: 1.2px;
	}
	#ptable,td{
	border-collapse: collapse;
	 background-color: C4C4C4;
	}


</style>
</head>
<body>
		
	<header>
	<div id="header"><p id="titleP" style="color: white"> 거래처등록</p></div>
	<div id="imgDiv">기본</div>
	<div id="tableDiv">
		<table id="ptable">
		
			<tr>
				<td style="width: 150px;"><c:out value="거래처코드"/></td>
				<td style="width: 750px;" colspan="2"><c:out value="12312512123"/></td>
				<td></td>
			</tr>
			<tr>
				<td><c:out value="상호(이름)"/></td>
				<td colspan="2"><c:out value="vvip거래처 10% 할인적용"/></td>
				<td></td>
			</tr>
			<tr>
				<td><c:out value="대표자명"/></td>
				<td colspan="2"><c:out value="대애표오자명"/></td>
				<td></td>
			</tr>
			<tr>
				<td><c:out value="종목"/></td>
				<td colspan="2"><c:out value="전자제품"/></td>
				<td></td>
			</tr>
			<tr>
				<td><c:out value="전화"/></td>
				<td colspan="2"><c:out value="010-1234-1234"/></td>
				<td></td>
			</tr>
			<tr>
				<td><c:out value="FAX"/></td>
				<td colspan="2"><c:out value="1566-1234"/></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td  style="width: 100px;"><p style="color: blue; height:2px;" id="pid">우편번호검색</p></td>
				<td colspan="2"><c:out value="주소1as dasds adas dasd sad asd asd as dasd asd asd asdasdasdasdasdg asdasdas asdasdas das"/></td>
			
			</tr>
			<tr>
				<td><c:out value="주소"/></td>
				<td colspan="2"><c:out value="경기도 의정부시 김상찬 asdas das dasd asd asd asd as dasd sad sad"/></td>
				<td></td>
			</tr>
			<tr>
				<td><c:out value="담당자"/></td>
				<td colspan="2"><c:out value="김상찬"/></td>
				<td></td>
			</tr>
			<tr>
				<td><c:out value="Email"/></td>
				<td colspan="2"><c:out value="helloWorld@kakao.co.kr"/></td>
				<td></td>
			</tr>
		 
		</table>
	</div>
	<div class="btns"><button>수정</button>&nbsp;<button>닫기</button></div> 
		
	</header>
	<section>
	
	</section>
</body>
</html>