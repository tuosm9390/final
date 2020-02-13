<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.blackListArea{
		width: 1200px;
		height: 461px;
		border: 1px solid darkgray;
		margin-left: 10px;
	}
	.blackListArea table{
		width: 1200px;
		text-align:center;
		border:1px solid lightgray;
	}
	.blackListArea th{
		background-color: #f7f7f7;
    	color: #005B9E;
	}
	
	.blackListArea th, .blackListArea td {
		border: 1px solid darkgray;
		text-align: center;
		padding: 10px;
	}
	.searchSec {
		float: right;
		display: inline;
		margin-top: 10px;
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
	.newBlackList, .deleteBlackList{
		width:100px;
		height:25px;
		border-radius:2px;
		background:#E9F3FF;
		cursor:pointer;
		font-weight: bold;
	}
	
	.newBlackList {
		border:1px solid #3498DB;
		background-color: #3498DB;
		color: white;
	}
	
	.deleteBlackList {
		border:1px solid lightgrey;
		background-color: lightgrey;
	}
	
	.btnGroup {
		margin-top: 20px;
		margin-bottom: 10px;
		margin-left: 10px;
	}
	
	.pagingSec {
	text-align: center;
	width: 400px;
	height: 30px;
	margin-left: 350px;
	}
	a{
	color:black;
	text-decoration:none;
}
	section{
		width:1200px;
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
<body>
	<header>
		<jsp:include page="../common/cmsMenubar.jsp"></jsp:include>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
		<jsp:include page="blackListAddModal.jsp"></jsp:include>
		<jsp:include page="modalBlackListDetail.jsp"></jsp:include>
	</header>
	<section>
		<h1 style="margin-left:10px; margin-bottom:0px;">블랙리스트</h1>
		<hr style="width:1170px;/*  margin-right:125px; */"> 
		
		<!-- searchSec -->
		<div class="searchSec">
			<form action="searchBlackList.cl" method="post">
				<select name="searchOption" class="searchOption">
					<option value="">검색조건</option>
					<option value="blackListName">고객명</option>
					<option value="blackListPhone">전화번호</option>
					<option value="blackListEmail">이메일</option>
				</select>
				<input type="text" name="searchContent" class="searchContent">
				<button id="searchBtn" onclick="return searchBlackList();">검색</button>
			</form>
		</div>
		<!-- searchSec end -->
		<div class="btnGroup">
				<button class="newBlackList" onclick="openBlackListModal();">등록</button>
				<button class="deleteBlackList" onclick="deleteClient();">삭제</button>
			</div>
			
		<div class="blackListArea">
			<table style="border-collapse: collapse;" class="blackListTable">
				<tr>
					<th width="50px;"></th>
					<th width="100px;">No</th>
					<th width="150px;">고객명</th>
					<th width="150px;">고객번호</th>
					<th width="200px;">전화번호</th>
					<th width="350px;">이메일</th>
				</tr>
				<c:forEach var="blackList" items="${ blackLists }">
				<tr>
					<td class="checkBlackList"><input type="checkbox" class="checkBlackList"></td>
					<td>${ blackList.blackNo }</td>
					<td>${ blackList.name }</td>
					<td class="blackListMnoTd"><input class="blackListMno" type="hidden" value="${ blackList.mno }">${ blackList.mno }</td>
					<td>${ blackList.phone }</td>
					<td>${ blackList.email }</td>
				</tr> 
				</c:forEach>
			</table>
		</div>
		<div class="pagingSec">
		
				<c:if test="${ empty check }">
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="clistBack" value="viewBlackList.cl">
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
							<c:url var="clistCheck" value="viewBlackList.cl">
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
						<c:url var="clistEnd" value="viewBlackList.cl">
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
						<c:url var="clistBack" value="viewBlackList.cl">
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
							<c:url var="clistCheck" value="viewBlackList.cl">
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
						<c:url var="clistEnd" value="viewBlackList.cl">
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
	</section>
	<script>
	var searchCheck = "";
	
	$(function(){
		
	
		$(".blackListTable td").parent().mouseenter(function(){
			$(this).css("background","lightgray");
			$(this).css("cursor","pointer");
		}).mouseleave(function(){
			$(this).css("background","white");
			$(this).css("cursor","pointer");
		});
		
		$(".blackListTable td:not(.checkBlackList)").click(function(){
			
			var mno = $(this).parent().children().siblings(".blackListMnoTd").children(".blackListMno").val();
			
			$.ajax({
				url:"blackListDetail.cl",
				type:"post",
				data:{
					mno:mno
				},
				success:function(data){
					console.log(data.hmap.clientInfo);
					$(".blackListDetailMno").val(data.hmap.blackListInfo.mno);
					$(".blackListDetailName").val(data.hmap.blackListInfo.userName);
					$(".blackListDetailPhone").val(data.hmap.blackListInfo.phone);
					$(".blackListDetailEmail").val(data.hmap.blackListInfo.email);
					$(".blackListDetailVisitCount").val(data.hmap.visitCount);
					$(".blackListDetailTotalPrice").val(data.hmap.price);
					$(".blackListDetailStayDay").val(data.hmap.stayDay);
					$(".blackListDetailLastVisit").val(data.hmap.lastVisit);
					
					$.each(data.hmap.blackListContent, function(index, blackListContent) {
						$('.blackListContentTable:last').append("<tr><td colspan='2' style='font-weight: bold'>"+blackListContent.regDate2+"</td></tr><tr><td style='font-weight: bold'>등록사유 | </td><td>"+blackListContent.regRsn+"</td></tr><tr><td style='font-weight: bold'>직원대응 | </td><td>"+blackListContent.response+"</td></tr>");
					});
					
					
					$(".modalplus").fadeIn();
				},
				error:function(data){
					
				}
				
			});
		});
		
	});
	function openBlackListModal(){
		$(".modalBlackListAdd").fadeIn();
	}
	function findClientClk(obj){
		var mno = obj.substr(3,4);
		for(var i = 0; i < clientList.length; i++) {
			if(clientList[i].mno == mno) {
				$(".blackListName").val(clientList[i].userName);
				$(".blackListPhone").val(clientList[i].phone);
				$(".blackListMno").val(mno);
			}
		}
		$(".findClientList").hide();
		$(".findClientList div").remove();
	}
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
				  mno = mno + $(this).parent().siblings(".blackListMnoTd").children().val() + ",";
				  count = count + 1;
			  });
			  console.log(count);
		  	  console.log(mno);
		  	  
			  if(confirm(count + " 명의 정보를 삭제하시겠습니까? ")){
				  $("input[type='checkbox']:checked").parent().parent().remove();  
				  
				  location.href="deleteBlackList.cl?mno="+mno;
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
	</script>
</body>
</html>