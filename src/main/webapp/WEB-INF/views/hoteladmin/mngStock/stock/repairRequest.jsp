<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
	 .top-div{
	width: 63.7%;
	height: 100px; 
	margin-top: -50px;
	}

	.searchCondition{

	margin-top: -50px;
	display: inline-block; 
	width: 100px;
	
	}

	#titlemsg{
		width: 220px;
		height: 50px;
		margin-top: 60px;
	}
	#mainMsg{
	font-size: 30px;
	font-weight: bold;
	}
	#searchZone{
	float: right;
	}
	#stockTb{
	width: 700px;
	height: 364px;
	border-collapse: collapse;
	border: 1px solid lightgray;
	margin-top: -22px;
	}
	td,th{
		border: 1px solid lightgray;
		align-content: center;
		text-align: center;
		height: 30px;
	}
	th{
	background-color: #f7f7f7;
	height: 30px;
	}
	#hrDiv{
	border-bottom: 1px solid lightgray;
	width: 700px;
	}
	.btns{
	 margin-top: 8px;
    margin-left: 48.1%
	}
	.tabClass{
	display: inline-block;
	width: 120px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 10px 10px 0px 0px;
	border-bottom: none;
	font-weight: bold;
	
	}
	#tclass{
		margin-top: 20px; 
	}

<!-- -->
.tabb{
	display: inline-block;
	
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	width: 80px;
	height: 31px;
	
	}
	#myTab{
	line-height: 30px;
	}
	#mailSet:hover{
	cursor: pointer;
	color: white;
	background-color: #3498DB;
	} 
	#mailText{
	background-color: #3498DB;
	color:white;
	}
	#mailText:hover{
	cursor: pointer;
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

#delete{
	background : white;
	color:red;
	border: 1px solid red;
	font-weight: bold;
	width: 68px;
	height: 25px;
	border-radius: 2px;
	margin-left: 5px;
}

#pager_wrap {
width:700px;
	padding: 40px 0;
	text-align: center;
	height: 5px;
}

#pager_wrap .pager_com {
	display: inline-block;
	width: 40px;
	margin: 0 2px;
	background-color: #f1f1f1;
}

#pager_wrap .pager_num.on {
	background-color: #171f57;
}

#pager_wrap .pager_com a {
	padding: 10px 0;
	text-align: center;
	color: #171f57;
	font-size:5px; 
	font-weight:none;
	
}

#pager_wrap .pager_num.on a {
	color: #fff;
}
	
</style>
</head>
<body>
	
	

	<header>	
		<jsp:include page="../../common/menubar.jsp"/>
		<jsp:include page="../../common/productMenubar.jsp"/>
		 <jsp:include page="../modal/mRepairDetail.jsp"/> 
	</header>
	<section>
		
		<!-- <div class="tabClass" id="tclass" align="center">물품현황
		</div>
		<div class="tabClass" id="rclass" align="center">수리현황
		</div> -->
		<div>
		<div id="myTab">
			<div class="tabb" style="box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailSet">물품현황</div>
			<div class="tabb" style="margin-left: 10px;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailText">수리현황</div>
			<div id="hrDiv"></div>
		</div>
	</div>
		<div id="hidden">
		</div>
	<div class="top-div">
			<div id="titlemsg"><label id="mainMsg">수리현황</label></div>
			<select style="width: 80px; height: 25px; float: right;
  	  margin-right: 131px;">
				<option value="default" hidden="hidden">필터</option>
				<option>상태</option>
				<option>상태</option>
			</select>
	</div><!-- top div end -->
		<div id="stockTb">
			<table style="border-collapse: collapse; width: 100%">  
				<tr>  
					<th><input type="checkbox"></th>
					<th style="color: #005B9E">수리번호</th>
					<th style="color: #005B9E">개요</th>
					<th style="color: #005B9E">상태</th>
				
				</tr>
				<c:forEach var="i" items="${repairList}">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="${i.rptNo} "/></td>
						<td style="color: #005B9E"><c:out value="${i.rptTitle}"/></td>
						<td><c:out value="${i.rptStatus}"/></td>
					</tr>
				</c:forEach>
			</table>
		<div id="hrDiv"></div>
		</div>
			<div class="btns">
			<button id="delete">선택삭제</button>
			</div> 
	<!-- 페이저 시작 -->
			<!-- 페이징 영역 시작 -->
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="blistBack" value="selectRepair.sto">
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

							<c:url var="blistCheck" value="selectRepair.sto">
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
						<c:url var="blistEnd" value="selectStock.sto">
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
			$("#stockTb").find("td").mouseenter(function(){
				$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent("tr").css({"background":"white"});
			}).click(function(){
				var rptNo = $(this).parent().children("td").eq(1).text();
				
				$(".modal").fadeIn();
				console.log(rptNo);
			});
		});
		
		//물품현황탭
		$("#mailSet").click(function(){
			location.href='selectStock.sto';
		});
		
		
	</script>
	
</body>
</html>