<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
	 .top-div{
	width: 78%;
	height: 100px; 

	} 
	#Table{
	width:100%;
	border-collapse: collapse;
	}
	
	#filter{
	position: relative;
    bottom: 28px;
	}
	
	#Table td, #Table th{
	border: 1px solid lightgray;
		text-align: center;
		height: 33.1px;  
	}
	#Table th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	.searchCondition{
	margin-top: 32px;
	}
	.term{
	float:right;
	}
	#termId{
	margin-left: 10px;
	}
	#titlemsg{
		width: 220px;
		height: 36px;
	    margin-top: 17px;
	}
	#filterDiv{
	margin-top: -20px;
	}
	#searchBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	}
	#purSearch{
	border: 1px solid #919191;
	}
	#excel{
	background : white;
	color:green;
	border: 1px solid green;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	}
	#print{
	color:#3498DB;
	background : white;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	font-weight: bold;
	}
	.btns{
	margin-top: 5px;
	margin-left: 67.9%;
	}
	#purDivv{
	height: 395.7px;
	border: 1px solid lightgray;
	width: 1000px;
	margin-top: 2px;
	}
	#line{
		width: 145px;
		border-bottom: 1px solid black;
	}
	#pagingArea{
		width: 1000px;
		margin-top:30px;
	}
</style>
</head>
<body>
	
	<header>	
	<jsp:include page="../../common/menubar.jsp"/>
	<jsp:include page="../../common/productMenubar.jsp"/>
	 <jsp:include page="../modal/mPurchaseHisDetail.jsp"/> 
	 <jsp:include page="../modal/mPurchaseHisStatement.jsp"/> 
	</header>
	<section id="sbody">

		<div class="top-div">
		<div id="titlemsg"><label style="font-size: 25px; font-weight: bold;">구매내역조회</label></div>
		<div id=line></div>
		<div id="searchZone" style="width: 1000px;"> 
		<div style="width: 1010px;">
			<select class="searchCondition"  id="purSearch" style="margin-left:70% ; height: 26px;">
				<option value="default">기본옵션</option>
			</select>
		<input type="text" name="serachCondition" class="searchCondition" style=";height: 20px;width: 150px;">
		<button class="searchCondition" id="searchBtn" style="width: 56px;">검색</button>
		<select style="width:80px;height:27px;" id="filter">
			<option value="">검색조건</option>
			<option value="Y">수령</option>
 	 		<option value="N">미수령</option>
		</select> 
		</div>
		
		</div>
		</div><!-- top div end -->
		
	<div id="purDivv">
	<table id="Table">
		<tr>
			<th>발주서 번호</th>
			<th>입고 요청 일자</th>
			<th>금액합계</th>
			<th>수령</th>
			<th></th>
		</tr>
		
		
		 <c:forEach var="list" items="${ orderHisList }">
		<tr>
			<td>${ list.orderNo } <input type="hidden" value="${ list.rptNo }" class="rptNo" name="rptNo"></td>
			<td>${ list.rcvReqDate }</td>
			<td>${ list.totPrice }</td>
			<td>${ list.rcvStatus }</td>
			<c:if test="${ list.rcvStatus.equals('N') }">
				<td style="width:100px;" class="buttonTd"><button type="button" style="border:0;cursor:pointer;background:#3498DB;color:white;" id="btnbtn" onclick="return productCheck(this);">물품수령</button></td>
			</c:if>
			<c:if test="${ list.rcvStatus.equals('Y') }">
				<td style="width:100px;" class="buttonTd"><button type="button" style="border:0;cursor:pointer;background:#3498DB;color:white;" id="btnbtn">수령완료</button></td>
			</c:if>
		</tr> 
		</c:forEach>
	
	</table>
	</div><!-- purDivv end -->
		<!-- pagingArea -->
		<c:if test="${ empty check }">
		<div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <=  1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="clistBack" value="goPurchaseHis.st">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ clistBack }">[이전]</a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>${ p }</b></font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="clistCheck" value="goPurchaseHis.st">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ clistCheck }">${ p }</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="clistEnd" value="goPurchaseHis.st">
					<input type="hidden" name="currentPage" value="${ pi.currentPage + 1 }"/>
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
				</c:url>
				&nbsp;<a href="${ clistEnd }">[다음]</a>
			</c:if>
		</div>
		</c:if>
		<!-- pagingArea end -->
	</section>
	
	
	<script>
	//테이블
	$(function(){
		$("#Table td:not(.buttonTd)").mouseenter(function(){
			$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent("tr").css({"background":"white"});
		}).click(function(){
			var rptNo = $(this).parent().children().children(".rptNo").val();
			
			$.ajax({
				url:"orderHisDetail.st",
				type:"post",
				data:{
					rptNo:rptNo
				},
				success:function(data){
					
					$("#day1").val(data.orderHisDetailList[0].rptDate);
					$("#person1").val(data.orderHisDetailList[0].name);
					
					$.each(data.orderHisDetailList, function(index, orderHisDetailList){
						$(".orderHisDetailTable tbody:last").append("<tr><td>"+orderHisDetailList.ino+"</td><td>"+orderHisDetailList.lcategory+"</td><td>"+orderHisDetailList.mcategory+"</td><td>"+orderHisDetailList.scategory+"</td><td>"+orderHisDetailList.iname+"</td><td>"+orderHisDetailList.up+"</td><td>"+orderHisDetailList.vos+"</td><td>"+orderHisDetailList.vat+"</td><td>"+orderHisDetailList.cnname+"</td></tr>");
					})
					
				},
				error:function(data){
					
				}
			});
			
			
			$(".modal").fadeIn();
		});
	});
	
	$("#mState").click(function(){
		$(".modalState").fadeIn();
	});
	
	function productCheck(obj){
		
		var rptNo = $(obj).parent().parent().children().children(".rptNo").val();
		
		if(confirm("수령 하시겠습니까?")){
			location.href="updateCheckProduct.st?rptNo="+rptNo;
		}
		
	}
	</script>
</body>
</html>