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
	.pagingArea{
	text-align:center;
	margin-left:300px;
}
#pager_wrap {
	padding: 60px 0;  
	text-align: center;
	margin-top: -45px;
	    margin-right: 206px;
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
a{
	color:black;
	text-decoration:none;
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
		<!-- 페이저 시작 -->
			<!-- 페이징 영역 시작 -->
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="blistBack" value="goPurchaseHis.st">
							<c:param name="currentPage" value="${pi.currentPage - 1 }" />
							<c:param name="scurrentPage" value=""/>
						</c:url>
						<li class="pager_com pager_arr prev "><a href="${blistBack }">&#x003C;</a></li>
					</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<li class="pager_com pager_num on"><a
								href="javascript: void(0);">${p }</a></li>
						</c:if>
						<c:if test="${p ne pi.currentPage }">

							<c:url var="blistCheck" value="goPurchaseHis.st">
								<c:param name="currentPage" value="${p }" />
							</c:url>
							<li class="pager_com pager_num"><a href="${blistCheck }">${p }</a></li>
						</c:if>
					</c:forEach>


					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="pager_com pager_arr next on"><a
							href="javascript: void(0);">&#x003E;</a></li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="blistEnd" value="goPurchaseHis.st">
							<c:param name="currentPage" value="${pi.currentPage + 1 }" />
						</c:url>
						<li class="pager_com pager_arr next"><a href="${blistEnd }">&#x003E;</a></li>
					</c:if>
				</ul>
			</div>

			<!-- 페이징 영역 종료 -->
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