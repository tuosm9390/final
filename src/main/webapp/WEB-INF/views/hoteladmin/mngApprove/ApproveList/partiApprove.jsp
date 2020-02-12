<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.approval {
	width: 1200px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
	margin-top: -191px;
}

.title {
	margin-top: 20px;
	width: 130px;
	height: 35px;
	border-bottom: 1px solid lightgray;
}

.approval .category {
	width: auto;
	height: 30px;
	display: inline-block;
	margin: 1px;
}

.approval .category .btl {
	border: 1px solid white;
	background: white;
	color: #3498DB;
	width: 70px;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.tbl_wrap {
	margin-top: 20px;
}

.tbl_wrap .tbl {
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

.tbl_wrap .tbl tr:not(:last-child){
border-bottom:1px solid #aaa;
}
.tbl_wrap .tbl td, th {
	border: 1px solid lightgray;
	text-align: center;
	padding: 7px;
}

.tbl_wrap .tbl th {
	background-color: #f7f7f7;
	color: #005B9E;
}

.tbl_wrap .tbl .squ_tbl {
	padding: 4px 8px;
	background-color: #ddd;
	font-size: 13px;
}

.writeDocu {
	float: right;
	margin-bottom: 10px;
	height: 30px;
}

.write {
	height: 30px;
	border: 2px solid royalblue;
	background: royalblue;
	color: white;
	font-weight: bold;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<section>
		<jsp:include page="../approveModal/partiOrderApproveModal.jsp"></jsp:include>
		<jsp:include page="../approveModal/partiRepairApproveModal.jsp"></jsp:include>
		<jsp:include page="../approveModal/partiPurchaseApproveModal.jsp"></jsp:include>

		<c:set var="contextPath"
			value="${pageContext.servletContext.contextPath }"
			scope="application" />

		<div class="approval">
			<div class="title">
				<h2>참여 결재함</h2>
			</div>
			<br>
			<div class="category">

				<button class="category btl total">전체</button>
				<button class="category btl">진행중</button>
				<button class="category btl">반려</button>
				<button class="category btl">승인</button>
			</div>


			<div class="tbl_wrap">
				<table class="tbl">
					<colgroup>
						<col width="12%">
						<col width="15%">
						<col width="20%">
						<col width="13%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>

					<tr>
						<th>No</th>
						<th>기안일시</th>
						<th>제목</th>
						<th>구분</th>
						<th>기안자</th>
						<th>결재자<input type="hidden" value="${sessionScope.loginUser.authNo }" class="authNo"></th>
						<th>진행상태<input type="hidden" value="${sessionScope.loginUser.deptNo }" class="deptNo"></th>
						<th>결재<input type="hidden" value="${sessionScope.loginUser.mno }" class="mnoUser"></th>

					</tr>

					<c:forEach var="b" items="${list }">
						<tr class="tbl_tit">
							<input type="hidden" value="${b.RPT_NO}">
							<td><c:out value="${b.RNUM }" /></td>
							<td><c:out value="${b.RPTDATE }" /></td>
							<td><c:out value="${b.RPTITLE }" /></td>
							<td><c:out value="${b.RPTYPE }" /></td>
							<td><c:out value="${b.MNAME }" /></td>
							<c:choose>
							<c:when test="${b.RPSTATUS eq '반려' }">
 								<td><c:out value="${b.SNAME }" /></td>
							 </c:when>
							 <c:when test="${b.RPSTATUS eq '승인' }">
							 	<td><c:out value="${b.SNAME }" /></td>
							 </c:when>
							 <c:otherwise >
							 <td></td>
							 </c:otherwise> 
							 </c:choose>
							<td><c:out value="${b.RPSTATUS }" /></td>
							<td><a>보기</a></td>

						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- 페이징 영역 시작 -->
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="blistBack" value="/documentPartiApproval.ap">
							<c:param name="currentPage" value="${pi.currentPage - 1 }" />
							<c:param name="mno" value="${sessionScope.loginUser.mno }" />
						</c:url>
						<li class="pager_com pager_arr prev "><a href="${blistBack }">&#x003C;</a></li>
					</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<li class="pager_com pager_num on"><a
								href="javascript: void(0);">${p }</a></li>
						</c:if>
						<c:if test="${p ne pi.currentPage }">

							<c:url var="blistCheck" value="documentPartiApproval.ap">
								<c:param name="currentPage" value="${p }" />
								<c:param name="mno" value="${sessionScope.loginUser.mno }" />
							</c:url>
							<li class="pager_com pager_num"><a href="${blistCheck }">${p }</a></li>
						</c:if>
					</c:forEach>


					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="pager_com pager_arr next on"><a
							href="javascript: void(0);">&#x003E;</a></li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="blistEnd" value="documentPartiApproval.ap">
							<c:param name="currentPage" value="${pi.currentPage + 1 }" />
							<c:param name="mno" value="${sessionScope.loginUser.mno }" />
						</c:url>
						<li class="pager_com pager_arr next"><a href="${blistEnd }">&#x003E;</a></li>
					</c:if>
				</ul>
			</div>

			<!-- 페이징 영역 종료 -->


		</div>
	</section>

	<script>
		$(document).ready(function() {
			console.log("??");
			$(".category.btl.total").css({
				"background-color" : "#3498DB",
				"box-shadow" : "0px 0px 0px",
				"color" : "white"
			});
			startDate();
			
			
			

		})
		

		var dateString = "";
		function startDate() {
			//console.log("하이");

			var date;
			date = setInterval(function() {

				dateString = "";
				var newDate = new Date();

				//String.slice(-2) : 문자열을 뒤에서 2자리만 출력한다. (문자열 자르기) 
				dateString += newDate.getFullYear() + "/";
				dateString += ("0" + (newDate.getMonth() + 1)).slice(-2) + "/"; //월은 0부터 시작하므로 +1을 해줘야 한다. 
				dateString += ("0" + newDate.getDate()).slice(-2) + " ";
				dateString += ("0" + newDate.getHours()).slice(-2) + ":";
				dateString += ("0" + newDate.getMinutes()).slice(-2) + ":";
				dateString += ("0" + newDate.getSeconds()).slice(-2);
				//document.write(dateString); 문서에 바로 그릴 수 있다. 
				//console.log(dateString);
			}, 1000);

		}

		//승인 반려처리 
		var mno = $(".mnoUser").val();
		var deptNo = $(".deptNo").val();
		var authNo = $(".authNo").val();
		
		
		function submit() {
			
			
			clearInterval(startDate());
			
			console.log(mno);
			console.log(deptNo);
			console.log(authNo);
			
			var approveType = $(".approveTitle").val();
			var rpt = $(".rpt").val();
			
			console.log(approveType);
			console.log(rpt);
			
			if(deptNo == 1) {
				
				/* if(approveType == "수리") {
					
					if (window.confirm("승인 하시겠습니까?") == true) {
						
						var status = "APPR";
						//console.log(rptNo);
		
						location.href = "approveYn.ap?status="
								+ status + "&dateString=" + dateString + "&mno=" + mno + "&deptNo=" + deptNo + "&authNo=" + authNo + "&rpt=" + rpt;
		
					} else {
						return false;
					} 
				}else {
					
					
				}
				 */
				 
				if (window.confirm("승인 하시겠습니까?") == true) {
					
					var status = "APPR";
					//console.log(rptNo);
	
					location.href = "approveYn.ap?status="
							+ status + "&dateString=" + dateString + "&mno=" + mno + "&deptNo=" + deptNo + "&authNo=" + authNo + "&rpt=" + rpt;
	
				} else {
					return false;
				} 
				 
			 
		}else {
			var docuN = $(".tbl_modal.parti tr:first-child").children().eq(1).text();
			if (window.confirm("승인 하시겠습니까?") == true) {
				
				var rptNo = $(".tbl_modal.parti").find(".repeat").children().eq(0).val();
				var status = "APPR";
				//console.log(rptNo);

				location.href = "approveYn.ap?status="
						+ status + "&dateString=" + dateString + "&mno=" + mno + "&deptNo=" + deptNo + "&authNo=" + authNo + "&rpt=" + rpt;

			} else {
				return false;
			}
		}

	}

		function reject() {
		clearInterval(startDate());
			
			console.log(mno);
			console.log(deptNo);
			console.log(authNo);
			
			var approveType = $(".approveTitle").val();
			var rpt = $(".rpt").val();
			
			//총지배인
			if(deptNo == 1) {
				var docuN = $("#tbl_modal_order tr:first-child").children().eq(1).text();
				console.log(docuN);
				
				if (window.confirm("반려 하시겠습니까?") == true) {
					
					var rptNo = $("tbl_modal_order").find(".repeatOrder").children().eq(0).val();
					var status = "REJECT";
					//console.log(rptNo);
	
					location.href = "approveYn.ap?status="
						+ status + "&dateString=" + dateString + "&mno=" + mno + "&deptNo=" + deptNo + "&authNo=" + authNo + "&rpt=" + rpt;
	
				} else {
					return false;
				}
			
		}else {
			var docuN = $(".tbl_modal.parti tr:first-child").children().eq(1).text();
			if (window.confirm("반려 하시겠습니까?") == true) {
				
				var rptNo = $(".tbl_modal.parti").find(".repeat").children().eq(0).val();
				var status = "REJECT";
				//console.log(rptNo);

				location.href = "approveYn.ap?status="
					+ status + "&dateString=" + dateString + "&mno=" + mno + "&deptNo=" + deptNo + "&authNo=" + authNo + "&rpt=" + rpt;

			} else {
				return false;
			}
		}

	}
		//승인 반려처리 끝

		$(".tbl_tit").mouseenter(function() {
			$(this).css({
				"background" : "lightgray",
				"cursor" : "pointer"
			})
		}).mouseout(function() {
			$(this).css({
				"background" : "white"
			})
		}).click(
				function() {
					var rptNo = $(this).children().eq(0).val();
					var type = $(this).children().eq(4).text();
					//console.log(type);
					//$(".modal").fadeIn();
					if (type == "발주 요청서") {
						$.ajax({
							url : "allApproveModal.ap",
							type : "get",
							data : {
								rptNo : rptNo,
								type : type
							},
							success : function(data) {
								var totalPrice = 0;
								console.log(data.list);
								if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
									$("#reject").hide();
									$("#confirm").hide();
								}else {
									$("#reject").show();
									$("#confirm").show();
									
								} 

								$.each(data.list, function(index, list) {
									$('#tbl_modal_order .tempOrder').after(
											"<tr class='repeatOrder'><input type='hidden' value='" + list.RPT_NO + "' class='rpt'><td>"
													+ list.ITYPE + "</td><td><input type='hidden' value='발주' class='approveTitle'>"
													+ list.CNAME + "</td><td>"
													+ list.INAME + "</td><td>"
													+ list.MFG + "</td><td>"
													+ list.VOS + "</td><td>"
													+ list.AMOUNT + "</td><td>"
													+ list.VOS * list.AMOUNT
													+ "</td></tr>");

								});

								 $("#tbl_modal_order tr:first-child").children()
										.eq(1).text(data.list[0].DOCNO); 
								if (data.list[0].RSTATUS == 'WAIT') {

								} else {
									$("#tbl_modal_order tr")
											.find(".head").text(
													data.list[0].SNAME);
								}
	    				   			 	$("#tbl_modal_order tr:nth-child(4)").children().eq(3).text(data.list[0].REQDATE2);

								$("#tbl_modal_order tr:nth-child(2)")
										.children().eq(2).text(
												data.list[0].MNAME);

								$("#tbl_modal_order tr:nth-child(2)")
										.children().eq(1).text(
												data.list[0].DNAME);
								$("#tbl_modal_order tr:nth-child(3)")
										.children().eq(1).text(
												data.list[0].MNAME);
								$("#tbl_modal_order tr:nth-child(4)")
										.children().eq(1).text(
												data.list[0].RDATE);
								$("#tbl_modal_order tr:nth-child(5)")
										.children().eq(1).text(
												data.list[0].SNAME);
								$("#tbl_modal_order tr:nth-child(6)")
										.children().eq(1).text(
												data.list[0].RTITLE);
								$("#tbl_modal_order #totalPrice").text(data.list[0].TPRICE + "원");
								// console.log(list.PRSN)
								$("#tbl_modal_order tr").children().find(".txtArea").text(data.list[0].ORSN);

								$(".modal_order").fadeIn();
								

							},
							error : function(data) {
								alert("에러요");

							}
						});

					} else if (type == "수리 요청서") {
						$.ajax({
							url : "allApproveModal.ap",
							type : "get",
							data : {
								rptNo : rptNo,
								type : type
							},
							success : function(data) {
								if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
									$(".approveBtn").hide();
								}else {
									$(".approveBtn").show();
								}
								console.log(data.list);
								var totalPrice = 0;
								console.log(data);
								$("#tbl_modal_repair tr:first-child")
										.children().eq(1).text(
												data.list[0].DOCNO);
								$("#tbl_modal_repair tr:nth-child(2)")
										.children().eq(2).text(
												data.list[0].MNAME);

								if (data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
									$("#tbl_modal_repair tr:nth-child(2)")
											.children().eq(3).text(
													data.list[0].SNAME);
								}

								//$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
								$("#tbl_modal_repair tr:nth-child(2)")
										.children().eq(1).text(
												data.list[0].DNAME);
								$("#tbl_modal_repair tr:nth-child(3)")
										.children().eq(1).text(
												data.list[0].MNAME);
								$("#tbl_modal_repair tr:nth-child(4)")
										.children().eq(1).text(
												data.list[0].RDATE);
								$("#tbl_modal_repair tr:nth-child(5)")
										.children().eq(1).text(
												data.list[0].SNAME);
								$("#tbl_modal_repair tr:nth-child(6)")
										.children().eq(1).text(
												data.list[0].RTITLE);

								$.each(data.list, function(index, list) {
									$('#tbl_modal_repair .repeatRepair').after(
											"<tr class='repairTr'><input type='hidden' value='" + list.RPT_NO + "' class='rpt'><td>"
													+ list.RNUM + "</td><td>"
													+ list.INO + "</td><td><input type='hidden' value='수리' class='approveTitle'>"
													+ list.INAME + "</td><td>"
													+ list.CNAME + "</td><td>"
													+ list.RPRICE + "</td><td>"
													+ list.RSN + "</td></tr>");

								});

								$("#tbl_modal_repair #totalPrice").text(
										data.list[0].TPRICE + "원");
								//console.log(list.PRSN)
								$("#tbl_modal_repair tr")
										.children().find(".txtArea").text(
												data.list[0].RSN);

								$(".modal_repair").fadeIn();

							},
							error : function(data) {
								alert("에러요");

							}
						});
					} else {
						$.ajax({
							url : "allApproveModal.ap",
							type : "get",
							data : {
								rptNo : rptNo,
								type : type
							},
							success : function(data) {
								console.log(type);
								console.log(data.list);
								var totalPrice = 0;
								if(data.list[0].RSTATUS == 'REJECT' || data.list[0].RSTATUS == 'APPR') {
									$(".approveBtn").hide();
								}else {
									$(".approveBtn").show();
								}

								$.each(data.list, function(index, list) {
									$('.tbl_modal.parti .temp').after(
											"<tr class='repeat'><input type='hidden' value='"+list.RPT_NO+"' class='rpt'><td>"
													+ list.ITYPE + "</td><td>"
													+ list.CNAME + "</td><td>"
													+ list.INAME + "</td><td>"
													+ list.MFG + "</td><td>"
													+ list.VOS + "</td><td>"
													+ list.AMOUNT + "</td><td>"
													+ list.VOS * list.AMOUNT
													+ "</td></tr>");

								});

								console.log("들어오니?1");

								$(".tbl_modal.parti tr:first-child").children()
								.eq(1).text(data.list[0].DOCNO);
								if (data.list[0].RSTATUS == 'WAIT') {
									$(".tbl_modal.parti tr:nth-child(2)")
											.children().eq(2).text("");

								} else {
									$(".tbl_modal.parti tr:nth-child(2)")
											.children().eq(2).text(
													data.list[0].SNAME);
								}

								//$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
								$(".tbl_modal.parti tr:nth-child(2)")
										.children().eq(1).text(
												data.list[0].DNAME);
								$(".tbl_modal.parti tr:nth-child(3)")
										.children().eq(1).text(
												data.list[0].MNAME);
								$(".tbl_modal.parti tr:nth-child(4)")
										.children().eq(1).text(
												data.list[0].RDATE);
								$(".tbl_modal.parti tr:nth-child(5)")
										.children().eq(1).text(
												data.list[0].SNAME);
								$(".tbl_modal.parti tr:nth-child(6)")
										.children().eq(1).text(
												data.list[0].RTITLE);
								$(".tbl_modal.parti tr")
										.children("#totalPrice").text(
												data.list[0].TPRICE + "원");
								// console.log(list.PRSN)
								$(".tbl_modal.parti #content").children()
										.children().text(data.list[0].PRSN);

								$(".modal_parti").fadeIn();

							},
							error : function(data) {
								alert("에러요");

							}
						});
					}

				});

		//2번 시작
		$(".category.btl")
				.click(
						function() {
							$except = $(this);
							$(this).css({
								"box-shadow" : "0px 0px 0px",
								"border" : "1px solid lightgray",
								"background" : "#3498DB",
								"color" : "white"
							});
							$(".category.btl")
									.not($except)
									.css(
											{
												"color" : "#3498DB",
												"background" : "white",
												"border" : "1px solid white",
												"box-shadow" : "0px 4px 4px rgba(0, 0, 0, 0.25)"
											});

							var cate = $(this).text();
							var scurrentPage = 1;
							var mno = $(".mnoUser").val();
							console.log(mno);

							$
									.ajax({
										url : "docuPartiFilter.ap",
										type : "post",
										data : {
											cate : cate,
											scurrentPage : scurrentPage,
											mno : mno

										},
										success : function(data) {
											var partiReportList = data.partiReportList;
											//console.log(data.reportList);

											$tableBody = $(".tbl");
											$pagingArea = $("#pager_wrap")
													.html('');

											$tableBody.find("tr:not(:first)")
													.remove();

											var item = data.partiReportList;
											var slistCount = data.pi.listCount;
											var scurrentPage = data.pi.currentPage;
											var smaxPage = data.pi.maxPage;
											var sstartPage = data.pi.startPage;
											var sendPage = data.pi.endPage;

											console.log(slistCount);
											console.log(scurrentPage);
											console.log(smaxPage);
											console.log(slistCount);
											console.log(sstartPage);
											console.log(sendPage);

											for (var i = 0; i < partiReportList.length; i++) {
												var $sumTr = $("<tr class='tbl_tit'>");
												var $ctr1 = "<input type='hidden' value='" + partiReportList[i].RPT_NO + "'>";
												var $ctr2 = "<td>"
														+ partiReportList[i].RNUM
														+ "</td>";
												var $ctr3 = "<td>"
														+ partiReportList[i].RPTDATE
														+ "</td>";
												var $ctr4 = "<td>"
														+ partiReportList[i].RPTITLE
														+ "</td>";
												var $ctr5 = "<td>"
														+ partiReportList[i].RPTYPE
														+ "</td>";
												var $ctr6 = "<td>"
														+ partiReportList[i].MNAME
														+ "</td>";
												if (partiReportList[i].RPSTATUS == "승인" || partiReportList[i].RPSTATUS == "반려") {
													var $ctr7 = "<td>"
															+ partiReportList[i].SNAME
															+ "</td>";
												} else {
													var $ctr7 = "<td></td>";
												}
												var $ctr8 = "<td>"
														+ partiReportList[i].RPSTATUS
														+ "</td>";
												var $ctr9 = "<td>  보기 <input type='hidden' value='${sessionScope.loginUser.mno }' class='mnoUser'> </td>"

												$sumTr.append($ctr1);
												$sumTr.append($ctr2);
												$sumTr.append($ctr3);
												$sumTr.append($ctr4);
												$sumTr.append($ctr5);
												$sumTr.append($ctr6);
												$sumTr.append($ctr7);
												$sumTr.append($ctr8);
												$sumTr.append($ctr9);
												$tableBody.append($sumTr);

												//$tableBody.append($total );
											}

											var $pageDiv = new Array();
											var $button = new Array();
											var $input2 = new Array();
											var $input10 = new Array();

											if (scurrentPage <= 1) {
												$pageDiv1 = $("<li class='pager_com pager_arr prev on'>");
												$button1 = $(
														"<a href='javascirpt: void(0);' style='color:black;'>")
														.text('<');
												$pageDiv1.append($button1);
												$pagingArea.append($pageDiv1);
											} else {
												$pageDiv1 = $("<li class='pager_com pager_arr prev '>");
												$button1 = $(
														"<a href='#' onclick='paging(this);' style='color:black;'}>")
														.text('<');
												$pageDiv1.append($button1);
												$pagingArea.append($pageDiv1);
											}

											for (var p = sstartPage; p <= sendPage; p++) {

												if (p == scurrentPage) {
													$pageDiv[p] = $("<li class='pager_com pager_num on'>");
													$button[p] = $(
															"<a href='javascript: void(0);'>")
															.text(p);
													//$input10[p] = $("<input type='hidden' id='hide2'>").val(p);
												} else {
													$pageDiv[p] = $(
															"<li class='pager_com pager_num'>")
															.val(p);
													$button[p] = $(
															"<a href='#' onclick='paging(this);' value='p'>")
															.text(p);
													$input2[p] = $(
															"<input type='hidden' id='hide'>")
															.val(cate);
													$input10[p] = $(
															"<input type='hidden' id='hide2'>")
															.val(p);
												}
												$pageDiv[p].append($button[p]);
												$pageDiv[p].append($button[p])
														.append($input2[p])
														.append($input10[p]);
												$pagingArea.append($pageDiv[p]);
											}

											if (scurrentPage < sendPage) {
												$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
												$button2 = $(
														"<a href='#' onclick='paging(this);' value='p' style='color:black;'>")
														.text('>');
												$input3 = $(
														"<input type='hidden' id='lastPage'>")
														.val(p);
												$pageDiv2.append($button2);
												$pageDiv2.append($input3);
												$pagingArea.append($pageDiv2);
											} else {
												$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
												$button2 = $(
														"<a href='javascript: void(0);''>")
														.text('>');
												$input3 = $(
														"<input type='hidden' id='lastPage'>")
														.val(sendPage);
												$pageDiv2.append($button2);
												$pageDiv2.append($input3);
												$pagingArea.append($pageDiv2);
											}

											//모달 ajax 시작
											$(".tbl_tit")
													.mouseenter(
															function() {
																$(this)
																		.css(
																				{
																					"background" : "lightgray",
																					"cursor" : "pointer"
																				})
															})
													.mouseout(
															function() {
																$(this)
																		.css(
																				{
																					"background" : "white"
																				})
															})
													.click(
															function() {
																var rptNo = $(
																		this)
																		.children()
																		.eq(0)
																		.val();
																var type = $(
																		this)
																		.children()
																		.eq(4)
																		.text();
																console
																		.log(type);

																if (type == "발주 요청서") {
																	$
																			.ajax({
																				url : "allApproveModal.ap",
																				type : "get",
																				data : {
																					rptNo : rptNo,
																					type : type
																				},
																				success : function(
																						data) {
																					console.log(data.list)
																					 if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
																						$(".approveBtn").hide();
																					}else {
																						$(".approveBtn").show();
																					} 
																					var totalPrice = 0;

																					$
																							.each(
																									data.list,
																									function(
																											index,
																											list) {
																										$(
																												'#tbl_modal_order .tempOrder')
																												.after(
																														"<tr class='repeatOrder'><input type='hidden' value='" + list.RPT_NO + "' class='rpt'><td>"
																																+ list.ITYPE
																																+ "</td><td><input type='hidden' value='발주' class='approveTitle'>"
																																+ list.CNAME
																																+ "</td><td>"
																																+ list.INAME
																																+ "</td><td>"
																																+ list.MFG
																																+ "</td><td>"
																																+ list.VOS
																																+ "</td><td>"
																																+ list.AMOUNT
																																+ "</td><td>"
																																+ list.VOS
																																* list.AMOUNT
																																+ "</td></tr>");

																									});

																					$(
																							"#tbl_modal_order tr:first-child")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].DOCNO);
																					if (data.list[0].RSTATUS == 'WAIT'
																							) {

																					} else {
																						$(
																								"#tbl_modal_order tr:nth-child(2)")
																								.children()
																								.eq(
																										3)
																								.text(
																										data.list[0].SNAME);
																					}
												    				   			 	$("#tbl_modal_order tr:nth-child(4)").children().eq(3).text(data.list[0].REQDATE2);

																					$(
																							"#tbl_modal_order tr:nth-child(2)")
																							.children()
																							.eq(
																									2)
																							.text(
																									data.list[0].MNAME);

																					//$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
																					$(
																							"#tbl_modal_order tr:nth-child(2)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].DNAME);
																					$(
																							"#tbl_modal_order tr:nth-child(3)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].MNAME);
																					$(
																							"#tbl_modal_order tr:nth-child(4)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].RDATE);
																					$(
																							"#tbl_modal_order tr:nth-child(5)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].SNAME);
																					$(
																							"#tbl_modal_order tr:nth-child(6)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].RTITLE);
																					$(
																							"#tbl_modal_order #totalPrice")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].TPRICE
																											+ "원");
																					$(
																							"#tbl_modal_order tr")
																							
																							.children().find(".txtArea")
																							.text(
																									data.list[0].ORSN);

																					$(".modal_order").fadeIn();
																							

																				},
																				error : function(
																						data) {
																					alert("에러요");

																				}
																			});

																} else if (type == "수리 요청서") {
																	$
																			.ajax({
																				url : "allApproveModal.ap",
																				type : "get",
																				data : {
																					rptNo : rptNo,
																					type : type
																				},
																				success : function(
																						data) {
																					if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
																						$(".approveBtn").hide();
																					}else {
																						$(".approveBtn").show();
																					}
																					console
																							.log(data.list.RSTATUS)
																					var totalPrice = 0;
																					$(
																							"#tbl_modal_repair tr:first-child")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].DOCNO);
																					$(
																							"#tbl_modal_repair tr:nth-child(2)")
																							.children()
																							.eq(
																									2)
																							.text(
																									data.list[0].MNAME);
																					if (data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
																						$(
																								"#tbl_modal_repair tr:nth-child(2)")
																								.children()
																								.eq(
																										3)
																								.text(
																										data.list[0].SNAME);
																					}else {
																						
																					}
																					$(
																							"#tbl_modal_repair tr:nth-child(2)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].DNAME);
																					$(
																							"#tbl_modal_repair tr:nth-child(3)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].MNAME);
																					$(
																							"#tbl_modal_repair tr:nth-child(4)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].RDATE);
																					$(
																							"#tbl_modal_repair tr:nth-child(5)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].SNAME);
																					$(
																							"#tbl_modal_repair tr:nth-child(6)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].RTITLE);

																					$
																							.each(
																									data.list,
																									function(
																											index,
																											list) {
																										$(
																												'#tbl_modal_repair .repeatRepair')
																												.after(
																														"<tr class='repairTr'><input type='hidden' value='" + list.RPT_NO + "' class='rpt'><td>"
																																+ list.RNUM
																																+ "</td><td><input type='hidden' value='수리' class='approveTitle'>"
																																+ list.INO
																																+ "</td><td>"
																																+ list.INAME
																																+ "</td><td>"
																																+ list.CNAME
																																+ "</td><td>"
																																+ list.RPRICE
																																+ "</td><td>"
																																+ list.RSN
																																+ "</td></tr>");

																									});

																					$(
																							"#tbl_modal_repair #totalPrice")
																							.text(
																									data.list[0].TPRICE
																											+ "원");
																					$(
																							"#tbl_modal_repair tr")
																							
																							.children().find(".txtArea")
																							.text(
																									data.list[0].RSN);

																					$(
																							".modal_repair")
																							.fadeIn();

																				},
																				error : function(
																						data) {
																					alert("에러요");

																				}
																			});
																} else {
																	$
																			.ajax({
																				url : "allApproveModal.ap",
																				type : "get",
																				data : {
																					rptNo : rptNo,
																					type : type
																				},
																				success : function(
																						data) {
																					if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
																						$(".approveBtn").hide();
																					}else {
																						$(".approveBtn").show();
																					}
																					var totalPrice = 0;
																					console
																							.log(data.list);

																					$.each(data.list, function(index,list) {
																						$('.tbl_modal.parti .temp').after(
																								"<tr class='repeat'><input type='hidden' value='"+list.RPT_NO+"' class='rpt'><td>" + list.ITYPE + "</td><td>"
																										+ list.CNAME + "</td><td>"
																										+ list.INAME + "</td><td>"
																										+ list.MFG + "</td><td>"
																										+ list.VOS + "</td><td>"
																										+ list.AMOUNT + "</td><td>"
																										+ list.VOS * list.AMOUNT
																										+ "</td></tr>");

																					});


																					$(
																							".tbl_modal.parti tr:first-child")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].DOCNO);
																					if (data.list[0].RSTATUS == 'APPR'
																							|| data.list[0].RSTATUS == 'REJECT') {
																						$(
																						".tbl_modal.parti tr:nth-child(2)")
																						.children()
																						.eq(
																								2)
																						.text(
																								data.list[0].SNAME);

																					} else {
																					
																								
																					}

																					$(
																							".tbl_modal.parti tr:nth-child(2)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].DNAME);
																					$(
																							".tbl_modal.parti tr:nth-child(3)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].MNAME);
																					$(
																							".tbl_modal.parti tr:nth-child(4)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].RDATE);
																					$(
																							".tbl_modal.parti tr:nth-child(5)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].SNAME);
																					$(
																							".tbl_modal.parti tr:nth-child(6)")
																							.children()
																							.eq(
																									1)
																							.text(
																									data.list[0].RTITLE);
																					$(
																							".tbl_modal.parti #content")
																							.children()
																							.children()
																							.text(
																									data.list[0].PRSN);
																					$(".tbl_modal.parti #totalPrice").text(data.list[0].TPRICE);

																					$(
																							".modal_parti")
																							.fadeIn();

																				},
																				error : function(
																						data) {
																					alert("에러요");

																				}

																			});
																}
															});
											//모달ajax끝

										},
										error : function(data) {
											alert("에러요");

										}

									});
						});

		//2
		function paging(val) {
			var cate = $("#hide").val();
			//console.log(val.text);
			var scurrentPage = val.text;
			var mno = $(".mnoUser").val()
			console.log(cate);

			var cu = $(this);
			
			if(scurrentPage == '>') {
				scurrentPage=  $("#lastPage").val();
			}
			

			$
					.ajax({
						url : "docuPartiFilter.ap",
						type : "post",
						data : {
							cate : cate,
							scurrentPage : scurrentPage,
							mno : mno

						},
						success : function(data) {
							var partiReportList = data.partiReportList;

							$tableBody = $(".tbl");
							$pagingArea = $("#pager_wrap").html('');

							$tableBody.find("tr:not(:first)").html('');

							var item = data.partiReportList;
							var slistCount = data.pi.listCount;
							var scurrentPage = data.pi.currentPage;
							var smaxPage = data.pi.maxPage;
							var sstartPage = data.pi.startPage;
							var sendPage = data.pi.endPage;

							/* console.log(slistCount);
							console.log(scurrentPage);
							console.log(smaxPage);
							console.log(slistCount);
							console.log(sstartPage);
							console.log(sendPage); */

							for (var i = 0; i < partiReportList.length; i++) {
								var $sumTr = $("<tr class='tbl_tit'>");
								var $ctr1 = "<input type='hidden' value='" + partiReportList[i].RPT_NO + "'>";
								var $ctr2 = "<td>" + partiReportList[i].RNUM
										+ "</td>";
								var $ctr3 = "<td>" + partiReportList[i].RPTDATE
										+ "</td>";
								var $ctr4 = "<td>" + partiReportList[i].RPTITLE
										+ "</td>";
								var $ctr5 = "<td>" + partiReportList[i].RPTYPE
										+ "</td>";
								var $ctr6 = "<td>" + partiReportList[i].MNAME
										+ "</td>";
								if (partiReportList[i].RPSTATUS == "승인") {
									var $ctr7 = "<td>"
											+ partiReportList[i].SNAME
											+ "</td>";
								} else {
									var $ctr7 = "<td></td>";
								}
								var $ctr8 = "<td>"
										+ partiReportList[i].RPSTATUS + "</td>";
								var $ctr9 = "<td>  보기 <input type='hidden' value='${sessionScope.loginUser.mno }' class='mnoUser'>  </td></tr>";
								$sumTr.append($ctr1);
								$sumTr.append($ctr2);
								$sumTr.append($ctr3);
								$sumTr.append($ctr4);
								$sumTr.append($ctr5);
								$sumTr.append($ctr6);
								$sumTr.append($ctr7);
								$sumTr.append($ctr8);
								$sumTr.append($ctr9);
								$tableBody.append($sumTr);

								//$tableBody.append($total );
							}

							//3. 페이저 시작
							var $pageDiv = new Array();
							var $button = new Array();
							var $input2 = new Array();
							var $input10 = new Array();

							if (scurrentPage <= 1) {
								$pageDiv1 = $("<li class='pager_com pager_arr prev on'>");
								$button1 = $("<a href='javascirpt: void(0);' style='color:black;'>")
										.text('<');
								$pageDiv1.append($button1);
								$pagingArea.append($pageDiv1);
							} else {
								$pageDiv1 = $("<li class='pager_com pager_arr prev '>");
								$button1 = $(
										"<a href='#' onclick='paging(this);'}>")
										.text('<');
								$pageDiv1.append($button1);
								$pagingArea.append($pageDiv1);
							}

							for (var p = sstartPage; p <= sendPage; p++) {

								if (p == scurrentPage) {
									$pageDiv[p] = $("<li class='pager_com pager_num on'>");
									$button[p] = $(
											"<a href='javascript: void(0);'>")
											.text(p);
									//$input10[p] = $("<input type='hidden' id='hide2'>").val(p);
								} else {
									$pageDiv[p] = $(
											"<li class='pager_com pager_num'>")
											.val(p);
									$button[p] = $(
											"<a href='#' onclick='paging(this);' value='p'>")
											.text(p);
									$input2[p] = $(
											"<input type='hidden' id='hide'>")
											.val(cate);
									$input10[p] = $(
											"<input type='hidden' id='hide2'>")
											.val(p);
								}
								$pageDiv[p].append($button[p]);
								$pageDiv[p].append($button[p]).append(
										$input2[p]).append($input10[p]);
								$pagingArea.append($pageDiv[p]);
							}

							if (scurrentPage < smaxPage) {
								$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
								$button2 = $(
										"<a href='#' onclick='paging(this);' value='p' style='color:black;'>")
										.text('>');
								$input3 = $(
										"<input type='hidden' id='lastPage'>")
										.val(p);
								$pageDiv2.append($button2);
								$pageDiv2.append($input3);
								$pagingArea.append($pageDiv2);
							} else {
								$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
								$button2 = $("<a href='javascript: void(0);''>")
										.text('>');
								$input3 = $(
										"<input type='hidden' id='lastPage'>")
										.val(p);
								$pageDiv2.append($button2);
								$pageDiv2.append($input3);
								$pagingArea.append($pageDiv2);
							}

							$(".tbl_tit")
									.mouseenter(function() {
										$(this).css({
											"background" : "lightgray",
											"cursor" : "pointer"
										})
									})
									.mouseout(function() {
										$(this).css({
											"background" : "white"
										})
									})
									.click(
											function() {
												var rptNo = $(this).children()
														.eq(0).val();
												var type = $(this).children()
														.eq(4).text();
												console.log(type);

												if (type == "발주 요청서") {
													$
															.ajax({
																url : "allApproveModal.ap",
																type : "get",
																data : {
																	rptNo : rptNo,
																	type : type
																},
																success : function(
																		data) {
																	 console.log(data.list);
																	if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
																		$(".approveBtn").hide();
																	}else {
																		$(".approveBtn").show();
																	} 
																	var totalPrice = 0;

																	$
																			.each(
																					data.list,
																					function(
																							index,
																							list) {
																						$(
																								'#tbl_modal_order .tempOrder')
																								.after(
																										"<tr class='repeatOrder'><input type='hidden' value='" + list.RPT_NO + "' class='rpt'><td>"
																												+ list.ITYPE
																												+ "</td><td><input type='hidden' value='발주' class='approveTitle'>"
																												+ list.CNAME
																												+ "</td><td>"
																												+ list.INAME
																												+ "</td><td>"
																												+ list.MFG
																												+ "</td><td>"
																												+ list.VOS
																												+ "</td><td>"
																												+ list.AMOUNT
																												+ "</td><td>"
																												+ list.VOS
																												* list.AMOUNT
																												+ "</td></tr>");

																					});

																	$(
																			"#tbl_modal_order tr:first-child")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].DOCNO);
																	if (data.list[0].RSTATUS == 'WAIT'
																			) {

																	} else {
																		$(
																				"#tbl_modal_order tr")
																				.children().find(".boss").val(data.list[0].SNAME);
																	}
								    				   			 	$("#tbl_modal_order tr:nth-child(4)").children().eq(3).text(data.list[0].REQDATE2);

																	$(
																			"#tbl_modal_order tr")
																			.children().find(".head").val(data.list[0].MNAME);

																	//$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
																	$(
																			"#tbl_modal_order tr:nth-child(2)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].DNAME);
																	$(
																			"#tbl_modal_order tr:nth-child(3)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].MNAME);
																	$(
																			"#tbl_modal_order tr:nth-child(4)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].RDATE);
																	$(
																			"#tbl_modal_order tr:nth-child(5)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].SNAME);
																	$(
																			"#tbl_modal_order tr:nth-child(6)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].RTITLE);
																	$(
																			"#tbl_modal_order #totalPrice")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].TPRICE
																							+ "원");
																	// console.log(list.PRSN)
																	$(
																			"#tbl_modal_order_order tr")
																			
																			.children().find(".txtArea")
																			.text(
																					data.list[0].ORSN);

																	$(
																			".modal_order")
																			.fadeIn();

																},
																error : function(
																		data) {
																	alert("에러요");

																}
															});

												} else if (type == "수리 요청서") {
													$
															.ajax({
																url : "allApproveModal.ap",
																type : "get",
																data : {
																	rptNo : rptNo,
																	type : type
																},
																success : function(
																		data) {
																	if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
																		$(".approveBtn").hide();
																	}else {
																		$(".approveBtn").show();
																	}
																	console
																			.log(data.list.RSTATUS)
																	var totalPrice = 0;
																	$(
																			"#tbl_modal_repair tr:first-child")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].DOCNO);
																	$(
																			"#tbl_modal_repair tr:nth-child(2)")
																			.children()
																			.eq(
																					2)
																			.text(
																					data.list[0].MNAME);
																	if (data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
																		$(
																				"#tbl_modal_repair tr:nth-child(2)")
																				.children()
																				.eq(
																						3)
																				.text(
																						data.list[0].SNAME);
																	}
																	//$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
																	$(
																			"#tbl_modal_repair tr:nth-child(2)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].DNAME);
																	$(
																			"#tbl_modal_repair tr:nth-child(3)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].MNAME);
																	$(
																			"#tbl_modal_repair tr:nth-child(4)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].RDATE);
																	$(
																			"#tbl_modal_repair tr:nth-child(5)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].SNAME);
																	$(
																			"#tbl_modal_repair tr:nth-child(6)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].RTITLE);

																	$
																			.each(
																					data.list,
																					function(
																							index,
																							list) {
																						$(
																								'#tbl_modal_repair .repeatRepair')
																								.after(
																										"<tr class='repairTr'><input type='hidden' value='" + list.RPT_NO + "' class='rpt'><td>"
																												+ list.RNUM
																												+ "</td><td><input type='hidden' value='수리' class='approveTitle'>"
																												+ list.INO
																												+ "</td><td>"
																												+ list.INAME
																												+ "</td><td>"
																												+ list.CNAME
																												+ "</td><td>"
																												+ list.RPRICE
																												+ "</td><td>"
																												+ list.RSN
																												+ "</td></tr>");

																					});
																	$(
																			"#tbl_modal_repair #totalPrice")
																			.text(
																					data.list[0].TPRICE
																							+ "원");
																	$(
																			"#tbl_modal_repair tr")
																			
																			.children().find(".txtArea")
																			.text(
																					data.list[0].RSN);

																	$(
																			".modal_repair")
																			.fadeIn();

																},
																error : function(
																		data) {
																	alert("에러요");

																}
															});
												} else {
													$
															.ajax({
																url : "allApproveModal.ap",
																type : "get",
																data : {
																	rptNo : rptNo,
																	type : type
																},
																success : function(
																		data) {
																	console.log(data.list);
																	if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
																		$(".approveBtn").hide();
																	}else {
																		$(".approveBtn").show();
																	}
																	var totalPrice = 0;

																	$
																			.each(
																					data.list,
																					function(
																							index,
																							list) {
																						$(
																								'.tbl_modal.parti .temp')
																								.after(
																										"<tr class='repeat'><input type='hidden' value='"+list.RPT_NO+"' class='rpt'><td>"
																												+ list.ITYPE
																												+ "</td><td>"
																												+ list.CNAME
																												+ "</td><td>"
																												+ list.INAME
																												+ "</td><td>"
																												+ list.MFG
																												+ "</td><td>"
																												+ list.VOS
																												+ "</td><td>"
																												+ list.AMOUNT
																												+ "</td><td>"
																												+ list.VOS
																												* list.AMOUNT
																												+ "</td></tr>");

																					});

																	$(
																			".tbl_modal.parti tr:first-child")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].DOCNO);
																	if (data.list[0].RSTATUS == 'APPR'
																			|| data.list[0].RSTATUS == 'REJECT') {
																		$(
																		".tbl_modal.parti tr:nth-child(2)")
																		.children()
																		.eq(
																				2)
																		.text(
																				data.list[0].SNAME);

																	} else {
																		
																	}

																	$(
																			".tbl_modal.parti tr:nth-child(2)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].DNAME);
																	$(
																			".tbl_modal.parti tr:nth-child(3)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].MNAME);
																	$(
																			".tbl_modal.parti tr:nth-child(4)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].RDATE);
																	$(
																			".tbl_modal.parti tr:nth-child(5)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].SNAME);
																	$(
																			".tbl_modal.parti tr:nth-child(6)")
																			.children()
																			.eq(
																					1)
																			.text(
																					data.list[0].RTITLE);
																	$(
																			".tbl_modal.parti #content")
																			.children()
																			.children()
																			.text(
																					data.list[0].PRSN);
																	$(".tbl_modal.parti #totalPrice").text(data.list[0].TPRICE);

																	$(".modal_parti")
																			.fadeIn();

																},
																error : function(
																		data) {
																	alert("에러요");

																}

															});
												}
											});

						},

						error : function(data) {
							alert("에러");
						}
					});

		}
	</script>

</body>
</html>                                                         