<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.searchSec {
	float: right;
	display: inline;
	margin-right: 293px;
}

.searchSec select {
	height: 25px;
	width: 80px;
	border: 1px solid lightgrey;
	border-radius: 2px;
}

.searchContent {
	height: 19px;
	width: 200px;
	border: 1px solid lightgrey;
	border-radius: 2px;
}

#searchBtn {
	height: 25px;
	width: 50px;
	border: 1px solid #3498DB;
	background-color: #3498DB;
	color: white;
	font-weight: bold;
	border-radius: 2px;
}

.clientList {
	margin-top: 10px;
	width: 1000px;
	height: 461px;
}
.clientList th, .clientList td {
	border: 1px solid darkgray;
	text-align: center;
	padding: 8px;
}

.clientList th {
	background-color: #f7f7f7;
    color: #005B9E;
}

#openClientMD {
	margin-top: 10px;
	width: 100px;
	margin-left: 0px;
	border: 1px solid #3498DB;
	border-radius: 5px;
	background-color: #3498DB;
	color: white;
	font-weight: bold;
} 
#deleteClientMD {
	margin-top: 10px;
	width: 100px;
	margin-left: 0px;
	border: 1px solid tomato;
	border-radius: 5px;
	background-color: tomato;
	color: white;
	font-weight: bold;
} 

.pagingSec {
	text-align: center;
	width: 400px;
	height: 30px;
	margin-left: 300px;
	margin-top: 20px;
}
</style>
</head>
<body style="overflow-y: hidden;">
	<header>
		<jsp:include page="../common/cmsMenubar.jsp"></jsp:include>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
		<jsp:include page="modalInsertClient.jsp"></jsp:include>
		<jsp:include page="modalDetailClient.jsp"></jsp:include>
	</header>
	<section>

		<h1 style="margin-left: 10px; margin-bottom:0px;">고객관리</h1>
		<hr style="width:100px; margin-right:1195px;"> 
		
		<div style="margin-left:10px">
		<button id="openClientMD">신규</button>
		<button id="deleteClientMD" onclick="deleteClient();">삭제</button>
		<!-- searchSec -->
		<div class="searchSec">
			<label style="margin-right: 20px;">총 고객 수 : ${ clientCount }</label>
			<select name="searchOption">
				<option selected disabled hidden>검색조건</option>
				<option value="clientName">고객명</option>
				<option value="clientPhone">전화번호</option>
				<option value="clientEmail">이메일</option>
			</select>
			<input type="text" name="searchContent" class="searchContent">
			<button id="searchBtn">검색</button>
		</div>
		<!-- searchSec end -->
			
		<div class="clientList">
			<table style="border-collapse: collapse;" class="clientTabel">
				<tr>
					<th width="50px;" class="checkClient"><input type="checkbox"></th>
					<th width="175px;">고객번호</th>
					<th width="175px;">고객명</th>
					<th width="225px;">전화번호</th>
					<th width="375px;">이메일</th>
				</tr>
				<c:forEach var="client" items="${ clientList }">
					<tr>
						<td class="checkClient"><input type="checkbox"></td>
						<td class="clientMno">${ client.mno }<input type="hidden" value="${ client.mno }"></td>
						<td>${ client.userName }</td>
						<td>${ client.phone }</td>
						<td>${ client.email }</td>
					</tr> 
				</c:forEach>
			</table>
		</div>
		<div class="pagingSec">
			<!-- pagingArea -->
		<div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <=  1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="clistBack" value="viewList.cl">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ clistBack }">[이전]</a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>${ p }</b></font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="clistCheck" value="viewList.cl">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ clistCheck }">${ p }</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="clistEnd" value="viewList.cl">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
				</c:url>
				&nbsp;<a href="${ clistEnd }">[다음]</a>
			</c:if>
		</div>
		<!-- pagingArea end -->

		</div>
		</div>
	</section>
	<script>
		$(function(){
			$("#openClientMD").click(function(){
				$(".modalplus").fadeIn();
			});
			
			$(".clientTabel td").parent().mouseenter(function(){
				$(this).css("background","lightgray");
				$(this).css("cursor","pointer");
			}).mouseleave(function(){
				$(this).css("background","white");
				$(this).css("cursor","pointer");
			});
			
			$(".clientTabel td:not(.checkClient)").click(function(){
				
				var mno = $(this).siblings(".clientMno").children().val();
				
				$.ajax({
					url:"clientDetail.cl",
					type:"post",
					data:{
						mno:mno
					},
					success:function(data){
						console.log(data.hmap.clientInfo);
						$(".clientDetailMno").val(data.hmap.clientInfo.mno);
						$(".clientDetailName").val(data.hmap.clientInfo.userName);
						$(".clientDetailPhone").val(data.hmap.clientInfo.phone);
						$(".clientDetailEmail").val(data.hmap.clientInfo.email);
						$(".clientDetailVisitCount").val(data.hmap.visitCount);
						$(".clientDetailTotalPrice").val(data.hmap.price);
						$(".clientDetailStayDay").val(data.hmap.stayDay);
						$(".clientDetailLastVisit").val(data.hmap.lastVisit);
						$(".modalDetail").fadeIn();
					},
					error:function(data){
						
					}
					
				});
			});
			
		});
		
		function deleteClient(){
			  var checkRow = "";
			  $("input[type='checkbox']:checked").each (function (){
			   	checkRow = checkRow + $(this).val()+"," ;
			  });
				checkRow = checkRow.substring(0,checkRow.lastIndexOf( ","));
			 
			  if(checkRow == ''){
			    alert("삭제할 대상을 선택하세요.");
			    return false;
			  };
			 
			  if(confirm("정보를 삭제 하시겠습니까?")){
				  var mno = "";
				  var count = 0;
				  $("input[type='checkbox']:checked").each (function (){
					  mno = mno + $(this).parent().siblings(".clientMno").children().val() + ",";
					  count = count + 1;
				  });
				  console.log(count);
			  	  console.log(mno);
			  	  
				  if(confirm(count + " 명의 정보를 삭제하시겠습니까? ")){
					  $("input[type='checkbox']:checked").parent().parent().remove();  
					  
					  location.href="deleteClient.cl?mno="+mno;
				  }
			  };
		};
	</script>
</body>
</html>