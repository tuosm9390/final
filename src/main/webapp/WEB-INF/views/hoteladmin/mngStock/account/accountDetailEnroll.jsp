<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#dtTableDiv{
	width: 400px;
	height: 360px;
	border-collapse: collapse;
	}
	#dtWrap{
	margin-left: 35px;
	margin-top: 10px;
	}
	.dtSame{
	display: inline-block;
	}
	#dtTable tr {
	margin-top: 130px;
	height: 90px;
	}
	.dtTd{
	margin-left: 50px;
	width: 269px;
	} 
	#acDetailEnrollBtn{
    margin-left: 76%;
    width: 63px;
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	}
</style>
</head>
<body>
<div id="dtWrap">
	<div id="dtTableDiv">
	<form action="accDetailEnroll.ac" method="post" id="accDetailEnroll">
		<table id="dtTable">
			<tr>
				<td>은행명</td>
				<td><input type="text" class="dtTd" name="bankName"></td>
				<td><input type="text" hidden='hidden' id="sendCnCode" name="cnCode"></td>			
			</tr>
			<tr>
				<td>계좌번호</td>
				<td><input type="text" class="dtTd" name="account"></td>			
			</tr>
			<tr>
				<td>예금주명</td>
				<td><input type="text" class="dtTd" name="accName"></td>			
			</tr>
			<tr>
				<td>비고</td>
				<td><input type="text" class="dtTd" name="accMemo"></td>
			</tr>
		</table>
		</form>
	</div>
	<div class="dtBtn"><button id="acDetailEnrollBtn">등록</button></div>
</div>
	
	<script>
		$("#acDetailEnrollBtn").click(function(){
			console.log("asdasdasdasdasd");
			$("#accDetailEnroll").submit();
		});
	</script>
</body>
</html>