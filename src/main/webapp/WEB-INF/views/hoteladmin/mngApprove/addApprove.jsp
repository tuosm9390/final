<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	width:300px;
	height:20px;
}
.txt4 {
	width:200px;
	
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





</style>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.js"></script>

</head>
<body>
	<div class="secondTbl">
				<table id="gg" class="ui celled table sec">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="30%">
						<col width="10%">
						<col width="10%">
						<col width="10%">

					</colgroup>
					<tr style="background:lightgray">
						<td>
						<button id="plusBtn">+</button>
						<label style="margin-left:0px">NO</label>
						</td>
						<td>항목</td>
						<td>품목명</td>
						<td>수량</td>
						<td>공급가액</td>
						<td>금액</td>
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
								<input class="txt2" type="text">
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
					</table>
			</div>
</body>
</html>