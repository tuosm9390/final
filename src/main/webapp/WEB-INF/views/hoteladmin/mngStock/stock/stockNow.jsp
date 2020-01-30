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
	width:85.1%;
	height: 83px; 
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
	#searchZone{
	float: right;
	}
	#stockTb{
	width: 1000px;
	height: 380px;
	border-collapse: collapse;
	border: 1px solid lightgray;
	}
	td,th{
		border: 1px solid lightgray;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	color: #005B9E;
	}

	
	#hrDiv{
	border-bottom: 1px solid lightgray;
	width: 1000px;
	
	}
	
	
	.btns{
	    margin-top: 10px;
    float: right;
    margin-right: 298px; 
 	

	}
	.tabClass{
	display: inline-block;
	width: 120px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 10px 10px 0px 0px;
	border-bottom: none;
	font-weight: bold;
	margin-top: 20px;

	}
	#rclass{
	background-color: lightgray; 
	}
	#sbtn{
	margin-right: 110px;
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	}
 
	<!-- -->
	
#myTab{
	line-height: 30px;
	}
	#mailText:hover{
	cursor: pointer;
	background-color: #3498DB;
	color: white;
	} 
	#mailtText{
	color: #3498DB;
	}
	#mailSet:hover{
	cursor: pointer;
	}
	.tabb{
	display: inline-block;
	width: 80px;
	height: 31px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	}
	
	#filter{
	background: #FFFFFF;
	border: 1px solid #919191;
	box-sizing: border-box;
	}
#new{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
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
}
#mainMsg{
	font-size: 25px;
	font-weight: bold;
}

#pager_wrap {
width:1000px;
	padding: 60px 0;
	text-align: center;
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
		
		<jsp:include page="../modal/mStockNowDetail.jsp"/>
		<jsp:include page="../modal/mStockNowEnroll.jsp"/>
		
	</header>
	<section>
		
		<!-- <div class="tabClass" id="tclass" align="center">물품현황
		</div>
		<div class="tabClass" id="rclass" align="center">수리현황
		</div> -->
		
		<!-- 수정 -->
	<div>
		<div id="myTab">
			<div class="tabb" style="background-color: #3498DB; color: white;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailSet">물품현황</div>
			<div class="tabb" style="margin-left: 10px;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailText">수리현황</div>
			<div id="hrDiv" style="background-color: lightgray; color: lightgray"></div>
		</div>
	</div>
		<!--  -->
		<div id="hidden">
		</div>
	<div class="top-div">
			<div id="titlemsg"><label id="mainMsg">물품현황</label></div>
		<div id="searchZone">
			<select style="width:80px;height:25px;" id="filter" class="searchCondition" >
			
				<option value="default" hidden="hidden">검색조건</option>
<!-- 				<option value="money">금액</option> -->
 	 			<option value="check">수령</option>
			</select>
			<input type="text" name="serachCondition" class="searchCondition" style="height: 20px;width: 150px;"> 
			<button class="searchCondition" style="width: 50px; height: 25px; width: 56px;" id="sbtn" >검색</button>
		</div>
	</div><!-- top div end -->
		<div id="stockTb">
			<table style="border-collapse: collapse; width: 100%;">  
				<tr>  
					<th><input type="checkbox"></th>
					<th width="250px;">품목명</th>
					<th>재고수량</th>
					<th>품목구분</th>
				</tr>
				<c:forEach var="i" items="${stockList }">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="${i.sCategory}"/></td>
						<td><c:out value="${i.cnt }"/></td>
						<td><c:out value="${i.type }"/></td>
					</tr>
				</c:forEach>
			</table>
		<div id="hrDiv"></div>
		</div>
			<div class="btns">
			<button id="delete">선택삭제</button>
			<button id="excel">Excel</button>
			<button id="new">신규</button>&nbsp;
			</div>
	
	<!-- ddddddddddddddddddddddddddd  -->
	<!-- 페이저 시작 -->
			<!-- 페이징 영역 시작 -->
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="blistBack" value="selectStock.sto">
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

							<c:url var="blistCheck" value="selectStock.sto">
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
				
				var sCategory = $(this).parent().children("td").eq(1).text();
				console.log(sCategory);
				$.ajax({
					url:"selectStockDetail.sto",
					type:"post",
					data:{sCategory:sCategory},
					success:function(data){
						console.log(data)
						$("#stockTbb").empty();
						$("#stockTbb").append("<tbody id='detailBody'></tbody>")
						if(data.stockDetailList[0].type=="EQUIP"){
							$("#detailBody").append("<tr><th><input type='checkbox'></th><th>물품코드</th><th>물품명</th>"+
						"<th>공급가액</th><th>부가세</th><th>단가</th><th>제조사</th><th>매입처</th><th>창고명</th><th>위치</th></tr>")
						}else{
							$("#detailBody").append("<tr><th><input type='checkbox'></th><th>물품코드</th><th>물품명</th><th>개별수량</th>"+
						"<th>공급가액</th><th>부가세</th><th>단가</th><th>제조사</th><th>매입처</th><th>객실번호</th></tr>")
						}
						for(var i=0;i<data.stockDetailList.length;i++){
							if(data.stockDetailList[0].type=="EQUIP"){
							$("#detailBody").append(
									"<tr><td><input type='checkbox'></td><td>"+
									data.stockDetailList[i].ino+"</td><td>"+data.stockDetailList[i].iName+"</td><td>"+
									data.stockDetailList[i].vos+"</td><td>"+data.stockDetailList[i].vat+"</td><td>"+
									data.stockDetailList[i].up+"</td><td>"+data.stockDetailList[i].mfg+"</td><td>"+
									data.stockDetailList[i].cnName+"</td><td>"+data.stockDetailList[i].strgName+"</td><td>"+
									data.stockDetailList[i].areaName+"</td></tr>");
							}else{
								$("#detailBody").append(
									"<tr><td><input type='checkbox'></td><td>"+
									data.stockDetailList[i].ino+"</td><td>"+data.stockDetailList[i].iName+"</td><td>"+
									data.stockDetailList[i].cnt+"</td><td>"+
									data.stockDetailList[i].vos+"</td><td>"+data.stockDetailList[i].vat+"</td><td>"+
									data.stockDetailList[i].up+"</td><td>"+data.stockDetailList[i].mfg+"</td><td>"+
									data.stockDetailList[i].cnName+"</td><td>"+data.stockDetailList[i].rmNo+"</td>+</tr>");
							}
						
						}
					
					},error:function(status){
						console.log(status)
					}
					
				});
				
				
				
				
				
				
				$(".modal").fadeIn();
			});
		});
		

		
		//수리현황탭
		$("#mailText").click(function(){
			location.href='selectRepair.sto';
		})
		
		//신규등록
		$("#new").click(function(){
			$(".modalEnroll").fadeIn();
		});
		
		
		
		
	</script>
	
</body>
</html>