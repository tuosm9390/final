<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.userInfo {
	width: 1200px;
	height: auto;
	margin-left: 0px;
	margin-top: -20px;
}

.addSearch {
	width: 1100px;
	height: 40px;
	color:black;
	    margin-top: 10px;
}

.searchArea {
	margin-left: -5px;
	padding: 7px;
	color:black;
	position:relative;
	top:10px;
}

#searchTxt {
	border-radius: 2px;
	border: 1px solid lightgray;
	height:25px;
}

.searchArea2 {
	
}

#subBtn {
	width: 70px;
	height: 27px;
	border: 1px solid white;
	background: white;
	border-radius: 2px;
}

#addUserBtn {
	margin-top:-30px;
	width: 100px;
	height: 30px;
	float: right;
	border: 1px solid #3498DB;
	border-radius: 2px;
	background: #3498DB;
	color:white;
	cursor:pointer;
}
.tbl_wrap {
	margin-top:20px;
	width:1095px;
	height:auto;
}
.tbl_wrap .tbl {
	
	 width:1095px;
	 border-collapse: collapse;
	 text-align: center;
}

.tbl_wrap .tbl tr:not (:last-child ) {
	border-bottom: 1px solid #aaa;
}

.tbl tr{
	height:30px;
}

.tbl_wrap .tbl td, th {
	border: 1px solid lightgray;
    text-align: center;
    
}
.tbl_wrap .tbl th{
   background-color: #f7f7f7;
   color: #005B9E;
   }

.tbl_wrap .tbl .squ_tbl {
	padding: 4px 8px;
	background-color: #ddd;
	font-size: 13px;
}

#searchBtn {
	border-radius:2px;
	background:#3498DB;
	color:white;
	width:60px;
	height:30px;
	border:1px solid #3498DB;
}

.titArea {
	margin-top:-70px;
	border-bottom:1px solid lightgray;
	width:1095px;
	height:36px;
	padding-bottom:10px;
}
select {
	height:28px;
}
.pagingArea{
	margin-top:20px;
	width:1100px;
	text-align:center;
}
a{
	color:black;
	text-decoration:none;
}
.pagingArea{
	text-align:center;
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
		<jsp:include page="../../common/menubar.jsp" />
		<jsp:include page="../../common/settingMenubar.jsp" />
		<jsp:include page="settingsModal/userDetailModal.jsp"/>
		<jsp:include page="settingsModal/userInsertModal.jsp"/>
	</header>
	<!-- content start -->
	<section style="padding-top:20px;">
	<div class="userInfo">
	<div class="titArea">
		<h2>사용자 등록</h2>
	</div>
		<!-- search Area -->
		<div class="addSearch">
			<div class="searchArea">
				<form action="searchStaff.st" method="post">
					<select name="searchOption" class="searchOption">
						<option value="">검색조건</option>
						<option value="staffName">사용자명</option>
						<option value="staffId">ID</option>
					</select>
					<input id="searchTxt" class="searchValue" type="text" name="searchValue">
					<button id="searchBtn" onclick="return searchStaff();">검색</button>
				</form>
				<button onclick="insertUser();" id="addUserBtn">+ 사용자 추가</button>
			</div>
		</div>
		<!-- searchArea end -->
		<div class="tbl_wrap">
			<table class="tbl">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<tr style="background: #F3F3F3;" class="tharea">
					<th>사용자명</th>
					<th>사용자ID</th>
					<th>권한</th>
					<th>부서</th>
					<th>전화</th>
					<th>이메일</th>
					<th>사용여부</th>
				</tr>
				<c:forEach var="staffList" items="${ staffList }">
					<tr id="tbl_tit">
						<td><input type="hidden" value="${ staffList.mno }" class="staffMno"> ${ staffList.userName }</td>
						<td>${ staffList.userId }</td>
						<c:if test="${ staffList.deptNo == 1 }">
							<td>총지배인</td>
						</c:if>
						<c:if test="${ staffList.deptNo == 2 }">
							<td>구매팀</td>
						</c:if>
						<c:if test="${ staffList.deptNo == 3 }">
							<td>시설관리팀</td>
						</c:if>
						<c:if test="${ staffList.deptNo == 4 }">
							<td>프론트</td>
						</c:if>
						<c:if test="${ staffList.authNo.equals('AUTH1') }">
							<td>부서장</td>
						</c:if>
						<c:if test="${ staffList.authNo.equals('AUTH2') }">
							<td>부서원</td>
						</c:if>
						<td>${ staffList.phone }</td>
						<td>${ staffList.email }</td>
						<c:if test="${ staffList.status.equals('Y') }">
							<td>사용중</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div class="pagingArea" align="left">
		<!-- pagingArea end -->
		<c:if test="${ empty check }">
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="clistBack" value="hotelUserInsert.st">
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
							<c:url var="clistCheck" value="hotelUserInsert.st">
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
						<c:url var="clistEnd" value="hotelUserInsert.st">
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
						<c:url var="clistBack" value="searchStaff.st">
							<c:param name="currentPage" value="${pi.currentPage - 1 }" />
							<c:param name="searchValue" value="${ sessionScope.searchContent }"/>
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
							<c:url var="clistCheck" value="searchStaff.st">
								<c:param name="currentPage" value="${p }" />
								<c:param name="searchValue" value="${ sessionScope.searchContent }"/>
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
						<c:url var="clistEnd" value="searchStaff.st">
							<c:param name="currentPage" value="${pi.currentPage + 1 }" />
							<c:param name="searchValue" value="${ sessionScope.searchContent }"/>
							<c:param name="searchOption" value="${ sessionScope.searchOption }"/>	
						</c:url>
						<li class="pager_com pager_arr next"><a href="${clistEnd }">&#x003E;</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
	
	</div>
	</section>
	<!-- content end -->
	<script>
	$(function(){
		$(".tbl tr:not(.tharea)").mouseenter(function(){
	 		$(this).css({"background":"lightgray", "cursor":"pointer"})
	 	}).mouseout(function(){
	 		$(this).css({"background":"white"})
	 	}).click(function(){
	 		
	 		var mno = $(this).children().children(".staffMno").val();
	 		
	 		$.ajax({
	 			url:"staffDetail.st",
	 			type:"post",
	 			data:{
	 				mno:mno	
	 			},
	 			success:function(data){
	 				
	 				$(".mnoStaffDetailModal").val(data.staff.mno);
	 				$(".userIdStaffDetailModal").val(data.staff.userId);
	 				$(".userNameStaffDetailModal").val(data.staff.userName);
	 				$(".phoneStaffDetailModal").val(data.staff.phone);
	 				$(".emailStaffDetailModal").val(data.staff.email);
	 				if(data.staff.deptNo == 1){
	 					$(".deptNoStaffDetailModal").val("1").prop("selected",true);
	 				}else if(data.staff.deptNo == 2){
	 					$(".deptNoStaffDetailModal").val("2").prop("selected",true);
	 				}else if(data.staff.deptNo == 3){
	 					$(".deptNoStaffDetailModal").val("3").prop("selected",true);
	 				}else if(data.staff.deptNo == 4){
	 					$(".deptNoStaffDetailModal").val("4").prop("selected",true);
	 				}
	 				if(data.staff.authNo == 'AUTH1'){
	 					$("#deptMember").prop("checked",true)
	 				}else if(data.staff.authNo == 'AUTH2'){
	 					$("#deptHeader").prop("checked",true)
	 				}
					if(data.staff.status == 'Y'){
						$("#yes").val('Y').prop("checked",true);
					}else if(data.staff.status == 'N'){
						$("#no").val('N').prop("checked",true);
					}
	 				
					userId = data.staff.userId;
					userName = data.staff.userName;
					phone = data.staff.phone;
					email = data.staff.email;
					
					
	 			},
	 			error:function(data){
	 				
	 			}
	 			
	 		});
	 		
	 		$(".detailModal").fadeIn();
	 	});
		
		
	})
	function insertUser() {
			$(".modal").fadeIn();
		}
	function updateMember() {
		
		if ( $(".userNameStaffDetailModal").val() == "" ) {
			alert("이름을 입력해주세요");
			$(".userNameStaffDetailModal").focus();
			return false;
		}
		
		var regExpName = /^[가-힣]{2,}/;
		if (!regExpName.test($(".userNameStaffDetailModal").val())) {
			alert("이름을 다시 입력해주세요");
			$(".userNameStaffDetailModal").focus();
			$(".userNameStaffDetailModal").select();
			return false;
		}

		
		if ($(".phoneStaffDetailModal").val() == "") {
			alert("전화번호를 입력해주세요.");
			$(".phoneStaffDetailModal").focus();
			return false;
		}
		var regExpName = /^[0-9]{9,}/;
		if (!regExpName.test($(".phoneStaffDetailModal").val())) {
			alert("전화번호를 다시 입력해주세요.");
			$(".phoneStaffDetailModal").focus();
			$(".phoneStaffDetailModal").select();
			return false;
		}
		
		if ($(".emailStaffDetailModal").val() == "") {
			alert("이메일을 입력해주세요");
			$(".emailStaffDetailModal").focus();
			return false;
		}
		var regExpEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		if (!regExpEmail.test($(".emailStaffDetailModal").val())) {
			alert("이메일을 다시 입력해주세요");
			$(".emailStaffDetailModal").focus();
			$(".emailStaffDetailModal").select();
			return false;
		}
		
		if($(".deptNoStaffDetailModal").val() == ""){
			alert("부서를 선택해주세요.");
			return false;
		}
		
		if($(".useStaffDetailModal").val() == ""){
			console.log($(".useStaffDetailModal").val());
			alert("사용여부를 선택해주세요.");
			return false;
		}
		
		if($(".authorityStaffDetailModal").val() == ""){
			alert("권한을 선택해주세요.");
			return false;
		}
		
		if(confirm("변경사항을 수정하시겠습니까 ?")){
			return true;
		}
	}	
	
	function searchStaff(){
		
		if($(".searchOption").val() == ""){
			alert("검색조건을 선택해주세요.");
			return false;
		}
		if($(".searchValue").val() == ""){
			alert("검색내용을 입력해주세요.");
			return false;
		}
		
		return true;
	}
	</script>


</body>
</html>