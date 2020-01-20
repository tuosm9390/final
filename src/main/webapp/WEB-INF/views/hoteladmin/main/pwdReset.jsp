<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		width:1600px;
		height:900px;
		margin:0 auto;
		background:#060E33;
	}
	.loginArea{
		text-align:center;
		margin-top:200px;
	}
	.logoImg{
		width:300px;
		height:70px;
	}
	.pwdInput, .pwdInput2{
		width:300px;
		height:40px;
		border-radius: 10px;
		background:#23295F;
		color:white;
		border: 0;
		outline: 0;
		padding-left:5px;
	}
	table button{
		width:300px;
		height:40px;
		border-radius: 10px;
		background:#232434;
		border:0;
		font-weight:bold;
		color:white;
		cursor:pointer;
		outline: 0;
	}
	table button:hover{
		background:darkgray;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div class="loginArea">
	<form action="pwdReset.me" method="post">
		<table align="center">
			<tr>
				<td>
					<img alt="" src="${ contextPath }/resources/images/logo.png" class="logoImg">
				</td>
			</tr>
			<tr>	
				<td>
					<input type="password" placeholder="  New PASSWORD" class="pwdInput" name="userPwd">
				</td>
			</tr>
			<tr>	
				<td>
					<input type="password" placeholder="  New PASSWORD CHECK" class="pwdInput2" name="">
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" name="mno" value="${ sessionScope.loginUser.mno }">
					<button onclick="return pwdCheck();">DONE</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<script type="text/javascript">
		function pwdCheck(){
			
			if($(".pwdInput").val() == ""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			if($(".pwdInput2").val() == ""){
				alert("비밀번호확인을 입력해주세요.");
				return false;
			}
			if($(".pwdInput").val() == "0000"){
				alert("초기비밀번호로 변경 불가능 합니다.");
				return false;
			}
			
			var pwd1 = $(".pwdInput").val();
			var pwd2 = $(".pwdInput2").val();
			
			if(pwd1 != pwd2){
				alert("비밀번호를 확인해주세요.");
				return false;
			}
			
			var regExpName = /^[0-9]{4,}/;
			if (!regExpName.test($(".pwdInput").val())) {
				alert("비밀번호를 4자리 이상 입력해주세요.");
				return false;
			}
			
		};
	</script>
</body>
</html>