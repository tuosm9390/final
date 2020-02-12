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
	width: 1200px;
	height: 35px;
}
.clientTabel{
	width:1200px;
}
.backPageBtn{
	width:30px;
	height:30px;
	background:lightgray;
	margin-left:5px;
}
a{
	color:black;
	text-decoration:none;
}
.pagingArea{
	text-align:center;
	margin-left:300px;
}
#pager_wrap {
	padding: 60px 0;
	text-align: center;
	margin-top: -45px;
}

#pager_wrap .pager_com {
	display: inline-block;
	width: 35px;
	margin: 0 2px;
	background-color: #f7f7f7;
	height:35px;
	padding:auto;
	border:1px solid lightgray;
	border-radius:2px;
}

#pager_wrap .pager_num.on {
	background-color: #171f57;
	border:1px solid white;
	color:black;
	
}

#pager_wrap .pager_com .pager_num a {
	padding:auto;
	text-align: center;
	
}

#pager_wrap .pager_num.pager_num.on a {
	color: white;
}
#pager_wrap .pager_com.pager_num a{
	color:black;
}
#pager_wrap .pager_com.pager_arr.prev.on a{
	color:black;
}
#pager_wrap .pager_com.pager_arr.next on a {
	color:black;
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
		<hr style="width:1195px; margin-right:1195px;"> 
		
		<div style="margin-left:10px; width:1200px;">
		<button id="deleteClientMD" onclick="deleteClient();">삭제</button>
		<!-- searchSec -->
		<div class="searchSec">
			<form action="searchClient.cl" method="post">
			<c:if test="${ empty check }">
				<label style="margin-right: 20px;">총 고객 수 : ${ clientCount }</label>
			</c:if>
			<c:if test="${ !empty check }">
				<label style="margin-right: 20px;">검색 고객 수 : ${ clientCount }</label>
			</c:if>
				<select name="searchOption" class="searchOption">
					<option value="">검색조건</option>
					<option value="clientName">고객명</option>
					<option value="clientPhone">전화번호</option>
					<option value="clientEmail">이메일</option>
				</select>
				<input type="text" name="searchContent" class="searchContent">
				<button id="searchBtn" onclick="return searchClient();">검색</button>
			</form>
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
		
		
		
	
		<div class="pagingSec" align="center">
		<c:if test="${ empty check }">
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="clistBack" value="viewList.cl">
							<c:param name="currentPage" value="${pi.currentPage - 1 }" />
						</c:url>
						<li class="pager_com pager_arr prev "><a href="${clistBack }">&#x003C;</a></li>
					</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<li class="pager_com pager_num on"><a
								href="javascript: void(0);">${p }</a></li>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="clistCheck" value="viewList.cl">
								<c:param name="currentPage" value="${p }" />
							</c:url>
							<li class="pager_com pager_num"><a href="${clistCheck }">${p }</a></li>
						</c:if>
					</c:forEach>


					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="pager_com pager_arr next on"><a
							href="javascript: void(0);">&#x003E;</a></li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="clistEnd" value="viewList.cl">
							<c:param name="currentPage" value="${pi.currentPage + 1 }" />
						</c:url>
						<li class="pager_com pager_arr next"><a href="${clistEnd }">&#x003E;</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<c:if test="${ !empty check }">
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="clistBack" value="viewList.cl">
							<c:param name="currentPage" value="${pi.currentPage - 1 }" />
							<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
							<c:param name="searchOption" value="${ sessionScope.searchOption }"/>	
						</c:url>
						<li class="pager_com pager_arr prev "><a href="${clistBack }">&#x003C;</a></li>
					</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<li class="pager_com pager_num on"><a
								href="javascript: void(0);">${p }</a></li>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="clistCheck" value="viewList.cl">
								<c:param name="currentPage" value="${p }" />
								<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
								<c:param name="searchOption" value="${ sessionScope.searchOption }"/>	
							</c:url>
							<li class="pager_com pager_num"><a href="${clistCheck }">${p }</a></li>
						</c:if>
					</c:forEach>


					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="pager_com pager_arr next on"><a
							href="javascript: void(0);">&#x003E;</a></li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="clistEnd" value="viewList.cl">
							<c:param name="currentPage" value="${pi.currentPage + 1 }" />
							<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
							<c:param name="searchOption" value="${ sessionScope.searchOption }"/>	
						</c:url>
						<li class="pager_com pager_arr next"><a href="${clistEnd }">&#x003E;</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<!-- pagingArea end -->

		</div>
		</div>
	</section>
	<c:if test="${ !empty sessionScope.searchContent }">
		<input type="hidden" name="searchContent" value="${ sessionScope.searchContent }">	
	</c:if>
	<c:if test="${ !empty sessionScope.searchOption }">
		<input type="hidden" name="searchOption" value="${ sessionScope.searchOption }">	
	</c:if>
	<script>
		var searchCheck = ""; 
		var clientMno;
		var clientName;
		var clientPhone;
		var clientEmail;
		
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
						
						$.each(data.hmap.queModalList, function(index, queModalList) {
							$('.clientDetailQueTable:last').append("<tr><td colspan='2' style='font-weight: bold'>"+queModalList.qdate+"</td></tr><tr><td style='font-weight: bold'>문의제목 : </td><td>"+queModalList.qtitle+"</td></tr><tr><td style='font-weight: bold'>문의유형 : </td><td>"+queModalList.qtype+"</td></tr><tr><td style='font-weight: bold'>문의내용 : </td><td>"+queModalList.qcontent+"</td></tr><tr><td style='font-weight: bold'>답변내용 : </td><td></td></tr>");
						});
						
						$.each(data.hmap.sarList, function(index, sarList) {
							
						var checkInYear = sarList.checkIn.substr(0, 4);
						var checkInMonth = sarList.checkIn.substr(5, 2);
						var checkInDay = sarList.checkIn.substr(8, 2);
						var checkInDate = new Date(checkInYear,checkInMonth-1,checkInDay);
						
						var checkOutYear = sarList.checkOut.substr(0, 4);
						var checkOutMonth = sarList.checkOut.substr(5, 2);
						var checkOutDay = sarList.checkOut.substr(8, 2);
						var checkOutDate = new Date(checkOutYear,checkOutMonth-1,checkOutDay);
						
						var tempStatus = "";
						switch(sarList.status){
						case "REFUND" : tempStatus = "예약취소";break;
						case "Y" : tempStatus = "체크아웃";break;
						case "N" : tempStatus = "체크인";break;
						case "OK" : tempStatus = "예약완료";break;
						}
						
							$('.stayAndRsvTabel tbody:last').after("<tr><td>"+sarList.checkIn+"</td><td>"+sarList.checkOut+"</td><td>"+
									(checkOutDate-checkInDate)/(24 * 60 * 60 * 1000)
									+"</td><td>"+sarList.rmNum+"</td><td>"+sarList.price+"</td><td>"+sarList.rsvDate.substr(0,10)+"</td><td>"+tempStatus+"</td></tr>");
						});
						
						clientMno = $("#clientDetailMno").val();
						clientName = $("#clientDetailName").val();
						clientPhone = $("#clientDetailPhone").val();
						clientEmail = $("#clientDetailEmail").val();
						
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
		function searchClient(){
			
			if($(".searchOption").val() == ""){
				alert("검색 조건을 선택해주세요.");
				return false;
			}
			if($(".searchContent").val() == ""){
				alert("검색 내용을 입력해주세요.");
				return false;
			}
			
			searchCheck = "ok";
			return true;
		}
		function clientUpdate(){
			
			console.log(clientMno);
			console.log(clientName);
			console.log(clientPhone);
			console.log(clientEmail);
			
			if($(".clientDetailName").val() == ""){
				alert("이름을 확인 해주세요.");
				return false;
			}	
			if($(".clientDetailPhone").val() == ""){
				alert("번호를 확인 해주세요.");
				return false;
			}	
			if($(".clientDetailEmail").val() == ""){
				alert("이메일을 확인 해주세요.");
				return false;
			}	
			
			if(clientName == $(".clientDetailName").val() && clientPhone == $(".clientDetailPhone").val() && clientEmail == $(".clientDetailEmail").val() ){
				alert("변경사항이 존재하지않습니다.");
				return false;
			}
			
			if(confirm( clientName +" 님의 정보를 변경하시겠습니까 ? ")){
				$(".clientInfoForm").submit();
				return true;
			}
		}
	</script>
</body>
</html>