<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bodyDiv{
	margin-top:-3px;
	width: 760px;
	height: 444px;
	 
	} 
	.same{
	display: inline-block;

	margin-top: 20px;
	}
	#sam{
	width: 540px; 
	}
	#ssam{
	width:100px;
	}
	#search{
	width: 100px;
    margin-left: 103px;
    color: blue;
	}
	#textArea{
	margin-left: 65px; 
	border-radius: 5px;
	}
	input[type=text]{
	border-radius: 2px;
	border: 1px solid gray;
	}
	.btnx{
    margin-top: 0px;
    border-radius: 5px;
    margin-left: 76.4%;
	}
	#enrollDiv{
	margin-left: 10px;
	margin-top: 5px;
	}
	#enrollBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	}
	#reBtn{
	background: white;
	border: 1px solid gray;
	color: 1px solid gray;
	}
	#addressDiv{
	    position: relative;
    bottom: 45px;
	}
	#searchId:hover{
	cursor: pointer;
	}
	.same input[type=text]{
	height: 20px;
	}
	#sample6_address{
	margin-left: 15px;
	}
	#sample6_detailAddress{
	margin-left:45px; 
	}
</style>
</head>
<body>
	<header>
	</header>
	<div id="enrollDiv">
	<form action="insertAcc.ac" id="insertAcc" method="post">
		<div class="bodyDiv">
			<div>	<div class="same" id="ssam">거래처코드</div>  <div class="same"><input type="text" class="space" style="width:100px;background: #f7f7f7" readonly="readonly" id="cnCode" name="cnCode"></div>  </div>
			<div>	<div class="same" id="ssam">상호(이름)</div>  <div class="same"><input type="text" class="space" style="width:600px" id="cnName" name="cnName"></div>  </div>
			<div>	<div class="same" id="ssam">대표자명</div>  <div class="same"><input type="text" class="space" style="width:600px" id="owerName" name="ownerName"></div>  </div>
			<div>	<div class="same" id="ssam">종목</div>  <div class="same"><input type="text" class="space" style="width:600px" id="cnItem" name="cnItem"></div>  </div>
			<div>	<div class="same" id="ssam">전화</div>  <div class="same"><input type="text" class="space" style="width:600px" id="cnPhone" name="cnPhone"></div>  </div>
			<div>	<div class="same" id="search"><label id="searchId">우편번호검색</label></div> <div class="same"><input type="text" class="space" style="width:100px" id="sample6_postcode" name="cnAdd"><input type="text" style="width: 380px;" id="sample6_address" name="cnAdd"></div>  </div>
			<div>	<div class="same" id="address"><label id="addressDiv">주소</label></div>  <div class="same"><label style="margin-left:-33px;">상세주소</label><input type="text" style="width: 600px; " id="sample6_detailAddress" name="cnAdd"><input type="text" id="sample6_extraAddress" hidden="hidden"></div>  </div>
			<div>	<div class="same" id="ssam">업체담당자</div>  <div class="same"><input type="text" class="space" style="width:600px" id="cnManager" name="cnManager"></div>  </div>
			<div>	<div class="same" id="ssam">Email</div>  <div class="same"><input type="text" class="space" style="width:600px" id="cnEmail" name="cnEmail"></div>  </div> 
		</div><!-- end -->
		</form> 
		<div class="btnx">
		<button id="reBtn">다시작성</button>&nbsp;
		<button id="enrollBtn">등록</button></div>
		</div>
<script>
   	$("#searchId").click(function(){
   	  new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ''; // 주소 변수
              var extraAddr = ''; // 참고항목 변수

              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              if(data.userSelectedType === 'R'){
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraAddr !== ''){
                      extraAddr = ' (' + extraAddr + ')';
                  }
                  // 조합된 참고항목을 해당 필드에 넣는다.
                  document.getElementById("sample6_extraAddress").value = extraAddr;
              
              } else {
                  document.getElementById("sample6_extraAddress").value = '';
              }

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('sample6_postcode').value = data.zonecode;
              document.getElementById("sample6_address").value = addr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("sample6_detailAddress").focus();
          }
      }).open();
   	});
   	
   	///거래처등록
   	$("#enrollBtn").click(function(){
   		
   		var address = $("#sample6_postcode").val()+","+$("#sample6_address").val()+","+$("#sample6_detailAddress").val();
   		
   		console.log(address);
   		if($("#cnCode").val()==''){
   			alert("거래처 코드를 입력해주세요.");
   			return false;
   		}
   		if($("#cnName").val()==''){
   			alert("거래처명을 입력해주세요");
   			return false;
   		}
   		if($("#owerName").val()==''){
   			alert("대표자명을 입력해주세요.");
   			return false;
   		}
   		if($("#cnItem").val()==''){
   			alert("거래항목을 입력해주세요.");
   			return false;
   		}
   		if($("#cnPhone").val()==''){
   			alert("전화번호를 입력해주세요.");
   			return false;
   		}
   		if($("#sample6_postcode").val()==''){
   			alert("주소를 입력해주세요.");
   			return false;
   		}
   		if($("#sample6_address").val()==''){
   			alert("주소를 입력해주세요.");
   			return false;
   		}
   		if($("#cnManager").val()==''){
   			alert("담당자를 입력해주세요");
   			return false;
   		}
   		if($("#cnEmail").val()==''){
   			alert("이메일을 입력해주세요");
   			return false;
   		}
   		
   		
   		
   		
   		
   		$("#insertAcc").submit();
   		
   	});
   	
   	//다시작성
   	$("#reBtn").click(function(){
   			$("#cnCode").val("");
   			$("#cnName").val("");
   			$("#owerName").val("");
   			$("#cnItem").val("");
   			$("#cnPhone").val("");
   			$("#sample6_postcode").val("");
   			$("#sample6_address").val("");
   			$("#cnManager").val("");
   			$("#cnEmail").val("");
   	})
</script>
</body>

</html>