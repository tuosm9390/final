<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.topSec {
	display: inline-flex;
}

.topSec select {
	height: 25px;
	width: 100px;
	margin-top: 25px;
	margin-left: 20px;
	border: 1px solid lightgrey;
}

.searchSec {
	margin-top: 10px;
	float: right;
	display: inline;
	margin-right: 38px;
}

.searchSec select {
	height: 25px;
	width: 80px;
	border: 1px solid lightgrey;
}

.searchContent {
	height: 19px;
	width: 200px;
	border: 1px solid lightgrey;
}

#searchBtn {
	height: 25px;
	width: 60px;
	border: 1px solid #3498DB;
}

#openNewMD {
	margin-top: 10px;
	width: 100px;
	margin-left: 10px;
	border: 1px solid #3498DB;
	border-radius: 5px;
	background-color: #3498DB;
	color: white;
	font-weight: bold;
} 

.qList {
	margin-left: 10px;
	margin-top: 10px;
	width: 1250px;
	height: 392px;
	max-height: 520px;
	overflow-y: auto;
}

.qList th, .qList td {
	border: 1px solid darkgray;
	text-align: center;
	padding: 5px;
}

.qList th {
	background-color: #f7f7f7;
	color: #005B9E;
	border: 1px solid lightgray;
	height:30px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="viewQuestionNewModal.jsp"></jsp:include>
		<jsp:include page="viewQuestionNewModal2.jsp"></jsp:include>
		<jsp:include page="../common/cmsMenubar.jsp"></jsp:include>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
	</header>
	<section>
		<div class="topSec">
			<h1 style="margin-left: 10px; margin-bottom:0px;">고객문의</h1>
			<c:if test="${ empty filterType }">
				<select name="filterOption" style="width:140px;" id="quefilter">
					<option value="" selected="selected">검색조건</option>
					<option value="all">전체 문의</option>
					<option value="online">온라인 문의</option>
					<option value="offline">오프라인 문의</option>
					<option value="unQue">미답변 문의</option>
				</select>
			</c:if>
			<c:if test="${ !empty filterType }">
				<select name="filterOption" style="width:140px;" id="quefilter">
					<option value="${ filterType }" selected="selected">
						<c:if test="${ filterType.equals('on') }">
						온라인 문의
						</c:if>
						<c:if test="${ filterType.equals('off') }">
						오프라인 문의
						</c:if>
						<c:if test="${ filterType.equals('unQue') }">
						미답변 문의
						</c:if>
						<c:if test="${ filterType.equals('all') }">
						전체 문의
						</c:if>
					</option>
					<option value="all">전체 문의</option>
					<option value="online">온라인 문의</option>
					<option value="offline">오프라인 문의</option>
					<option value="unQue">미답변 문의</option>
				</select>
			</c:if>
		</div>
		<hr style="width:100px; margin-right:1195px;"> 
		
		<button id="openNewMD">신규</button>
		<!-- searchSec -->
		<form action="searchQue.cl" method="post">
		<div class="searchSec">
			<select name="searchOption" >
				<option value="">검색조건</option>
				<option value="clientName">고객명</option>
				<option value="clientPhone">전화번호</option>
				<option value="queTitle">문의제목</option>
				<option value="queType">문의유형</option>
			</select>
			<input type="text" name="searchContent" class="searchContent">
			<button id="searchBtn" type="submit" onclick="return searchQue();">검색</button>
		</div>
		</form>
		<!-- searchSec end -->
		
		<div class="qList">
			<table style="border-collapse: collapse;" class="queTable">
				<tr>
					<th width="50px">No</th>
					<th width="550px">문의제목</th>
					<th width="100px">문의유형</th>
					<th width="100px">문의고객명</th>
					<th width="200px">연락처</th>
					<th width="150px">문의일자</th>
					<th width="100px">답상태</th>
				</tr>
				<c:forEach var="queList" items="${ queList }">
					<tr>
						<td class="qno"><input type="hidden" value="${ queList.qno }">${ queList.qno }</td>
						<td>${ queList.qtitle }</td>
						<td>${ queList.qtype }</td>
						<td class="mno"><input type="hidden" value="${ queList.mno }"> ${ queList.userName }</td>
						<td>${ queList.phone }</td>
						<td>${ queList.qdateView }</td>
						<td>${ queList.ansStatus }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="pagingSec">
		<c:if test="${ empty check }">
		<div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <=  1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:if test="${ !empty filterType }">
					<c:url var="clistBack" value="queFilter.cl">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						<c:param name="filterType" value="${ filterType }"/>
					</c:url>
					<a href="${ clistBack }">[이전]</a>&nbsp;
				</c:if>
				<c:if test="${ empty filterType }">
					<c:url var="clistBack" value="question.cl">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ clistBack }">[이전]</a>&nbsp;
				</c:if>
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>${ p }</b></font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:if test="${ !empty filterType }">
						<c:url var="clistCheck" value="queFilter.cl">
							<c:param name="currentPage" value="${ p }"/>
							<c:param name="filterType" value="${ filterType }"/>
						</c:url>
						<a href="${ clistCheck }">${ p }</a>
					</c:if>
					<c:if test="${ empty filterType }">
						<c:url var="clistCheck" value="question.cl">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ clistCheck }">${ p }</a>
					</c:if>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:if test="${ !empty filterType }">
					<c:url var="clistEnd" value="queFilter.cl">
						<input type="hidden" name="currentPage" value="${ pi.currentPage + 1 }"/>
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						<c:param name="filterType" value="${ filterType }"/>
					</c:url>
					&nbsp;<a href="${ clistEnd }">[다음]</a>
				</c:if>
				<c:if test="${ empty filterType }">
					<c:url var="clistEnd" value="question.cl">
						<input type="hidden" name="currentPage" value="${ pi.currentPage + 1 }"/>
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
					&nbsp;<a href="${ clistEnd }">[다음]</a>
				</c:if>
			</c:if>
		</div>
		</c:if>
		<!-- pagingArea end -->
		<!-- pagingArea -->
		<c:if test="${ !empty check }">
		<div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <=  1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="clistBack" value="searchQue.cl">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
					<c:param name="searchOption" value="${ sessionScope.searchOption }"/>
				</c:url>
				<a href="${ clistBack }">[이전]</a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>${ p }</b></font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="clistCheck" value="searchQue.cl">
						<c:param name="currentPage" value="${ p }"/>
						<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
						<c:param name="searchOption" value="${ sessionScope.searchOption }"/>
					</c:url>
					<a href="${ clistCheck }">${ p }</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="clistEnd" value="searchQue.cl">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
					<c:param name="searchOption" value="${ sessionScope.searchOption }"/>
				</c:url>
				&nbsp;<a href="${ clistEnd }">[다음]</a>
			</c:if>
		</div>
		</c:if>
		</div>
	</section>
	<script>
		var searchCheck = "";
		
		function searchQue(){
			
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
		
		
		$(function(){
			
			$("#openNewMD").click(function(){
				$(".queNewModal").fadeIn();
			});
			
			
			$(".queTable td").parent().mouseenter(function(){
				$(this).css("background","lightgray");
				$(this).css("cursor","pointer");
			}).mouseleave(function(){
				$(this).css("background","white");
				$(this).css("cursor","pointer");
			});
			$(".queTable td").parent().click(function(){
				var qno = $(this).children(".qno").children().val();
				var mno = $(this).children(".mno").children().val();
				$.ajax({
					url:"queDetail.cl",
					type:"post",
					data:{
						qno:qno,
						mno:mno
					},
					success:function(data){
						//data.queModal
						console.log(data.queModal);
						$(".queModalName").val(data.queModal.userName);
						if(data.queModal.email == null){
							console.log("비었다");
						}
						$(".queModalPhone").val(data.queModal.phone);
						$(".queModalQtype").val(data.queModal.qtype);
						$(".queModalQdate").val(data.queModal.qdate);
						$(".queModalQtitle").val(data.queModal.qtitle);
						$(".queModalQcontent").val(data.queModal.qcontent);
						$(".queModalQno").val(data.queModal.qno);
						if(data.queModal.acontent != null){
							$(".queModalAcontent").val(data.queModal.acontent);
						}
						
					},
					error:function(data){
						
					}
				});
				$(".queModal").fadeIn();
			});
			
			$("#quefilter").on("change",function(){
				if($("#quefilter").val() == "all"){
					location.href="queFilter.cl?filterType=all";
				}
				if($("#quefilter").val() == "online"){
					location.href="queFilter.cl?filterType=on";
				}
				if($("#quefilter").val() == "offline"){
					location.href="queFilter.cl?filterType=off";
				}
				if($("#quefilter").val() == "unQue"){
					location.href="queFilter.cl?filterType=unQue";
				}
			});
				
			
		});
	</script>
</body>
</html>