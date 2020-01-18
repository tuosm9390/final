<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.writeApprove {
	max-width: 1000px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	layout:fixed;
}

.empty {
	margin-top: 30px;
	width: 100%;
	height: 40px;
	background: #F7F7F7;
}


.ui.selection.dropdown {
	padding: 0px !important;
}

.totalDiv {
	layout:fixed;
	width: 1000px;
	height: 1200px;
	overflow:hidden;
}

.documentTbl {
	border: 1px solid black;
}

.ui.table {
	border: 1px solid black !important;
	border-bottom:0px !important;
	text-align: center !important;
}

.ui.table td {
	border: 1px solid black !important;
}

.ui .input .title {
	width: 400px !important;
}

.ui.table:last-child {
	padding: -20px;
}

.tbl_tit {
	 background-color:lightgray; 
}
.ui .celled .table {
	max-width:1000px;
}
.ui .celled .table .sec{
	max-width:1000px;
}
.txt {
	width:600px;
}
.txt2 {
	width:100px;
	height:20px;
}
.txt3 {
	width:150px;
	height:20px;
}
.txt4 {
	width:200px;
	
}
.txt5 {
	width:300px;
	height:20px;
}
.ui .input .Ch {
	width:10px;
}
#plusBtn {
	
	float:left;
	border:1px solid lightgray;
	background:white;
	color:black;
}
.txtArea {
	margin-left:auto;
	margin-right:auto;
	border:1px solid lightgray;
	width:700px;
	height:400px;
	text-align:center;
}
a {
	color:black !important;
}
.sub {
	height:30px;
	float:right;
	border:1px solid lightgray;
	background:#F7F7F7;
}





</style>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.js"></script>

</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<div class="writeApprove">


		<div class="empty"></div>
		<br>
		<div class="ui action input">
			<select id="category" class="ui compact selection dropdown">
				<option>구매 요청서</option>
				<option >발주 요청서</option>
				<option selected>수리 요청서</option>
			</select>
		</div>
		<h2 align="center">수리 요청서</h2>
		<br>
		
		<div class="totalDiv">
		<form action="" method="">
			<button type="submit" class="sub">기안하기</button>
			<div class="">

				<!-- <tr>
					<td>기안부서</td>
					<td><input type="text" name="team"></td>
					<td rowspan="2"></td>
					<td rowspan="2"></td>
				</tr> -->
				<table class="ui celled table">
					<colgroup>
						<col width="20%">
						<col width="40%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">

					</colgroup>
					<tr>
						<td>문서번호</td>
						<td>
							<div class="ui input">
								<input type="text">
							</div>
						</td>
						<td colspan="2">부서장</td>
						<td colspan="2">총지배인</td>
					</tr>
					<tr>
						<td>기안부서</td>
						<td>
							<div class="ui input">
								<input type="text">
							</div>
						</td>
						<td rowspan="2" colspan="2"></td>
						<td rowspan="2" colspan="2"></td>
					</tr>
					<tr>
						<td>기안부서</td>
						<td>
							<div class="ui input">
								<input type="text">
							</div>
						</td>

					</tr>
					<tr>
						<td>기안자</td>
						<td>
							<div class="ui input">
								<input type="text">
							</div>
						</td>
						<td colspan="4" rowspan="2"></td>
					</tr>
					<tr>
						<td>수신자</td>
						<td>
							<div class="ui input">
								<input type="text" width="400px">
							</div>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="5">
							<div class="ui input title">
								<a>수리 요청서</a>
							</div>
						</td>
					</tr>

				</table>
			</div>
			<div class="secondTbl">
				<table id="gg" class="ui celled table sec">
					<colgroup>
						<col width="5%">
						<col width="15%">
						<col width="20%">
						<col width="15%">
						<col width="10%">
						<col width="30%">

					</colgroup>
					<tr style="background:lightgray">
						<td>
						<label style="margin-left:0px">NO</label>
						</td>
						<td>제품코드</td>
						<td>제품 명</td>
						<td>수리 업체명</td>
						<td>금액</td>
						<td>수리 사유</td>
					</tr>
					<tr id="tbl_ch">
						<td >
							<label>1</label>
						</td>
						<td>
							<div class="ui input">
								<input class="txt2" type="text">
							</div>
						</td>
						<td>
							<div class="ui input">
								<input class="txt3" type="text">
							</div>
						</td>
						<td>
							<div class="ui input">
								<input class="txt2" type="text">
							</div>
						</td>
						<td>
							<div class="ui input">
								<input class="txt2" type="text">
							</div>
						</td>
						<td>
							<div class="ui input">
								<input class="txt5" type="text">
							</div>
						</td>
					</tr>
					
					</table>
					<table class="ui celled table sec">
						<tr>
						<td colspan="2">총금액</td>
						<td  colspan="4">
							<div class="ui input pay" style="float:right">
								<input class="txt4" type="text">
							</div>
						</td>
						</tr>
						<tr>
							<td colspan="6" rowspan="6">
							<div class="txtArea">
								<a>아래와 같이 보고 하오니 검토후 재가 바랍니다.</a> <br><br><br><br>
								<a>-아 래-</a><br><br><br>
								<a>SYSDATE</a>&nbsp; 
								<a>OOOO</a>
								<a>수리를 요청하오니&nbsp;
								검토후 재가하여 주시기 바랍니다.</a>								
							
							</div>
							
							
							</td>
						</tr>
					</table>
			</div>

			</form>
		</div>
	</div>
	<script>
		$(function(){
			$("#plusBtn").click (function(){
				
				var cnt = $("#gg tr").last().children().text();
				cnt *= 1;
				cnt += 1;
				console.log(cnt);
				
				var plusTable = "<tr>";
				plusTable += "<td>" + cnt + "</td>"
				plusTable += "<td> <div class='ui input'> <input class='txt2' type='text'> </div> </td>"
				plusTable += "<td> <div class='ui input'> <input class='txt3' type='text'> </div> </td>"
				plusTable += "<td> <div class='ui input'> <input class='txt2' type='text'> </div> </td>"
				plusTable += "<td> <div class='ui input'> <input class='txt2' type='text'> </div> </td>"
				plusTable += "<td> <div class='ui input'> <input class='txt2' type='text'> </div> </td>"
				plusTable += "</tr>"
				var n = $("#gg");
				
				
				n.append(plusTable);
				
			})
			$("#category").change(function(){
				var str = $(this).val();
				
				console.log(str);
				
				if(str == "수리 요청서") {
					location.href="writeFixApprove.ap";
				}
				
			})
			
		});
	</script>


</body>
</html>