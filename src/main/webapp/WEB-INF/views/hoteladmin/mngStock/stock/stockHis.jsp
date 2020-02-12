<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	height: 397.3px;
	border: 1px solid lightgray;
	width: 1000px;
	margin-top: 2px;
	}
	#line{
		width: 145px;
		border-bottom: 1px solid black;
	}
	#pager_wrap {
width:1000px;
	padding: 60px 0;
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
</header>
	<section id="sbody">

		<div class="top-div">
		<div id="titlemsg"><h1>재고변동이력</h1></div>
		<div id=line></div>
		<div id="searchZone" style="width: 1000px;"> 
		<div style="width: 1010px;">
			<select class="searchCondition"  id="purSearch" style="margin-left:70% ; height: 26px;">
				<option value="default">검색조건</option>
			</select>
		<input type="text" name="serachCondition" class="searchCondition" style=";height: 20px;width: 150px;">
		<button class="searchCondition" id="searchBtn" style="width: 56px;">검색</button>
		<select style="width:80px;height:27px;" id="filter">
			<option value="money">금액</option>
 	 		<option value="check">수령</option>
		</select> 
		</div>
		
		</div>
		</div><!-- top div end -->
		
	<div id="purDivv">
	
	<table id="Table">
		<tr>
			<th><input type=checkbox></th>
			<th>구분</th>
			<th>물품코드</th>
			<th>물품명</th>
			<th>수량</th>
			<th>변동일자</th>
			<th>창고</th>
			<th>구역명</th>
			<th>객실번호<th>
		</tr>
		
		
		 <c:forEach var="i"  items="${stockHisList}">
		<tr>
		<td><input type=checkbox></td>
		<td><c:out value="${i.type}"/></td>
		<td><c:out value="${i.ino}"/></td>
		<td style="color: #005B9E"><c:out value="${i.iname}"/></td>
		<td><c:out value="${i.amount}"/></td>
		<td><c:out value="${i.modDate}"/></td>
		<td><c:out value="${i.aftStrgName}"/></td>
		<td><c:out value="${i.aftName}"/></td>
		<td><c:out value="${i.aftRmNum}"/></td>
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
						<c:url var="blistBack" value="selectStockHis.sto">
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

							<c:url var="blistCheck" value="selectStockHis.sto">
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
						<c:url var="blistEnd" value="selectStockHis.sto">
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
		$("#Table").find("td").mouseenter(function(){
			$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent("tr").css({"background":"white"});
		}).click(function(){
			var bid = $(this).parent().children("td").eq(1).text();
			$(".modal").fadeIn();
			console.log(bid);
		});
	});
	
	$("#mState").click(function(){
		$(".modalState").fadeIn();
	});
	</script>
</body>
</html>