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
				
				<td>
				<select class="dtTd" name="bankName">
					<option value='기업은행'>기업은행</option>
					<option value='국민은행'>국민은행</option>
					<option value='외환은행'>외환은행</option>
					<option value='수협'>수협</option>
					<option value='농협'>농협</option>
					<option value='우리은행'>우리은행</option>
					<option value='제일은행'>제일은행</option>
					<option value='씨티은행'>씨티은행</option>
					<option value='대구은행'>대구은행</option>
					<option value='부산은행'>부산은행</option>
					<option value='광주은행'>광주은행</option>
					<option value='제주은행'>제주은행</option>
					<option value='전북은행'>전북은행</option>
					<option value='경남은행'>경남은행</option>
					<option value='새마을금고'>새마을금고</option>
					<option value='신협'>신협</option>
					<option value='우체국'>우체국</option>
					<option value='하나은행'>하나은행</option>
					<option value='신한은행'>신한은행</option>
				</select>
				</td>
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