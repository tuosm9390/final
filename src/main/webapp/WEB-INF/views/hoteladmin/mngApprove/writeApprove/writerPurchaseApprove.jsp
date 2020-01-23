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


.tbl_wrap .tbl {
	
	 border-collapse: collapse;
	 width:1100px;
	 text-align: center;
	 height:250px;
	 margin-top:10px;
	 margin-left:auto;
	margin-right:auto;
}



.tbl_wrap .tbl td, th {
	  border: 1px solid lightgray;
      text-align: center;
}
.tbl_wrap .tbl th{
   background-color: #f7f7f7;
   color: #005B9E;
   }
.tbl_wrap .tbl td {
	padding:10px;
}
#txtLong {
	border-radius:3px;
	border:1px solid lightgray;
	height:30px;
	width:600px;
}
#txt {
	border-radius:3px;
	border:1px solid lightgray;
	height:24px;
	width:200px;
}
select {
	width:200px;
	height:24px;
	border-radius:3px;
}
textarea {
	width:600px;
	height:200px;
}

.tbl2_wrap {
	margin-top:-0px;
	width:1100px;
	margin-left:auto;
	margin-right:auto;
}
.tbl2_wrap .payTbl {
	
	 border-collapse: collapse;
	 width:1100px;
	 text-align: center;
	 height:40px;
	 margin-top:14px;
	 margin-left:auto;
	 margin-right:auto;
}



.tbl2_wrap .payTbl td, th {
	  border: 1px solid lightgray;
      text-align: center;
}
.tbl2_wrap .payTbl th{
   background-color: #f7f7f7;
   color: #005B9E;
   }
.tbl2_wrap .payTbl td {
	padding:10px;
}
#noTxt {
	width:50px;
}
#anoTxt {
	border-radius:3px;
	height:17px;
	border:1px solid lightgray;
	width:150px;
}
#plusBtn2 {
	width:80px;
	height:30px;
	border-radius:2px;
	border:1px solid #3498DB;
	background:#3498DB;
	color:white;
	float:right;
}
.tbl2_wrap .payTbl .Area {
	width:1100px;
	margin-left:auto;
	margin-right:auto;
}
 #submit {
	border:1px solid #3498DB;
	background:#3498DB;
	color:white;
	height:35px;
	width:70px;
	border-radius:2px;
}
#pre {
	border:1px solid lightgray;
	background:lightgray;
	color:white;
	height:35px;
	width:70px;
	border-radius:2px;
}
.resultBtnPur {
	float:right;
	
}
.inArea {
	width:1100px;
	height:auto;
	margin-left:auto;
	margin-right:auto;
	margin-top:45px;
}



</style>
</head>
<body>
<header>
			<jsp:include page="../../common/menubar.jsp" />
	
</header>

	<section>
	
	<div class="tbl_wrap purchase">
		<div class="inArea">
	<div class="resultBtnPur">
				<button id="pre" onclick="preWatch();">미리보기</button>
				<button id="submit">기안하기</button>
			</div>
	
	<table class="tbl">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
					
				</colgroup>

				<tr>
					<th colspan="4">구매 요청서</th>
					
					
				</tr>
				<tr class="tbl_tit">
					<td>문서번호</td>
					<td colspan="3"><input type="text" id="txt" placeholder="2020-01" style="text-align:center;"></td>
					
					
				</tr>
				<tr class="tbl_tit">
					<td>기안부서</td>
					<td><input type="text" id="txt" placeholder="구매팀"></td>
					<td>기안자</td>
					<td><input type="text" id="txt" placeholder="이름을 입력하세요"></td>
					
				</tr>
				
				<tr class="tbl_tit">
					<td>기안일</td>
					<td><input type="text" id="txt" placeholder="SYSDATE"></td>
					<td >수신자</td>
					<td colspan="">
						<select id="receiver">
							<option selected disabled hidden>수신자를 선택하세요</option>
							<option>부서명(부서장)</option>
							<option>부서명(부서장)</option>
						</select>
					</td>
					
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" id="txtLong"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea style="resize:none;"></textarea>
					</td>
				</tr>
				
			</table><br><br>
			
			<div class="tbl2_wrap">
				<button id="plusBtn2">+ 추가</button><br>
			<table class="payTbl purchase">
				<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="30%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
				</colgroup>
				<tr>
					<th>No</th>
					<th>항목</th>
					<th>품목명</th>
					<th>수량</th>
					<th>공급가액</th>
					<th>금액</th>
				</tr>
				<tr >
					<td><input type="text" id="noTxt" placeholder="No"></td>
					<td><input type="text" id="anoTxt" placeholder="항목"></td>
					<td><input type="text" id="anoTxt" placeholder="품목명"></td>
					<td><input type="text" id="anoTxt" placeholder="수량"></td>
					<td><input type="text" id="anoTxt" placeholder="공급가액"></td>
					<td><input type="text" id="anoTxt" placeholder="금액"></td>
				</tr>
				
			</table>
			<table class="payTbl Area">
			<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="30%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
				</colgroup>
				<tr>
					<td colspan="2" id="total">총금액</td>
					<td colspan="4"><input type="text" id="txtLong"></td>
				</tr>
			</table>
			</div>
			</div>
</div>
<div style="height:200px;">
	
</div>
</section>
<script>
	$(function(){
		console.log("purchase")
		$("#plusBtn2").click(function() {
			console.log("1");

					var plusTable = "<tr>";
					plusTable += "<td> <input type='text' id='noTxt' placeholder='No'></td>"
					plusTable += "<td> <input type='text' id='anoTxt' placeholder='항목'> </td>"
					plusTable += "<td> <input type='text' id='anoTxt' placeholder='품목명'> </div> </td>"
					plusTable += "<td> <input type='text' id='anoTxt' placeholder='수량'> </td>"
					plusTable += "<td> <input type='text' id='anoTxt' placeholder='공급가액'> </td>"
					plusTable += "<td> <input type='text' id='anoTxt' placeholder='금액'> </td>"
					plusTable += "</tr>"
					var n = $(".payTbl.purchase").eq(0);
					
					console.log("2");
					n.append(plusTable);

				})
				
		function preWatch() {
			
		}		
	});
</script>



</body>
</html>