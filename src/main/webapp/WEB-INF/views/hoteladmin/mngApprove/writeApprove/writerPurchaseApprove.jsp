<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>


.tbl_wrap .tbl {
	
	 border-collapse: collapse;
	 width:1100px;
	 text-align: center;
	 height:250px;
	 margin-top:10px;
	 margin-left:auto;
	margin-right:auto;
}



.tbl_wrap .tbl td, th {
	  border: 1px solid lightgray;
      text-align: center;
}
.tbl_wrap .tbl th{
   background-color: #f7f7f7;
   color: #005B9E;
   }
.tbl_wrap .tbl td {
	padding:10px;
}
#txtLong, #txtLong_price {
	border-radius:3px;
	border:1px solid lightgray;
	height:30px;
	width:600px;
}
#txt {
	border-radius:3px;
	border:1px solid lightgray;
	height:24px;
	width:200px;
}
select {
	width:200px;
	height:24px;
	border-radius:3px;
}
textarea {
	width:600px;
	height:200px;
}

.tbl2_wrap {
	margin-top:-0px;
	width:1100px;
	margin-left:auto;
	margin-right:auto;
}
.tbl2_wrap .payTbl {
	
	 border-collapse: collapse;
	 width:1100px;
	 text-align: center;
	 height:40px;
	 margin-top:14px;
	 margin-left:auto;
	 margin-right:auto;
}



.tbl2_wrap .payTbl td, th {
	  border: 1px solid lightgray;
      text-align: center;
}
.tbl2_wrap .payTbl th{
   background-color: #f7f7f7;
   color: #005B9E;
   }
.tbl2_wrap .payTbl td {
	padding:10px;
}
.noTxt {
	width:120px;
}
.anoTxt, .anoTxt_amount, .anoTxt_vos, .anoTxt_price, .anoTxt_name {
	border-radius:3px;
	height:22px;
	border:1px solid lightgray;
	width:110px;
}
.anoTxt_cate {
	border-radius:3px;
	height:22px;
	border:1px solid lightgray;
	width:110px;
}

#plusBtn2 {
	width:80px;
	height:30px;
	border-radius:2px;
	border:1px solid #3498DB;
	background:#3498DB;
	color:white;
	float:right;
}
.tbl2_wrap .payTbl .Area {
	width:1100px;
	margin-left:auto;
	margin-right:auto;
}
 #submit {
	border:1px solid #3498DB;
	background:#3498DB;
	color:white;
	height:35px;
	width:70px;
	border-radius:2px;
}
#pre {
	border:1px solid lightgray;
	background:lightgray;
	color:white;
	height:35px;
	width:70px;
	border-radius:2px;
}
.resultBtnPur {
	float:right;
	
}
.inArea {
	width:1100px;
	height:auto;
	margin-left:auto;
	margin-right:auto;
	margin-top:45px;
}
#selectVos {
	border-radius:2px;
	border:1px solid lightgray;
	background:white;
}



</style>
</head>
<body>
<header>
			<jsp:include page="../../common/menubar.jsp" />
	
</header>

	<section>
	
	<div class="tbl_wrap purchase">
		<div class="inArea">
		
		<form action="insertPurchase.ap" method="get">
		
			<div class="resultBtnPur">
				<button id="pre" onclick="preWatch();">미리보기</button>
				<button id="submit" type="button" onclick="insertPur();">기안하기</button>
			</div>
	
	<table class="tbl">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
					
				</colgroup>

				<tr>
					<th colspan="4">구매 요청서</th>
					
					
				</tr>
				<tr class="tbl_tit">
					<td>문서번호</td>
					<td colspan="3" id="txt_docu" style="text-align:center;"></td>
					
					
				</tr>
				<tr class="tbl_tit">
					<td>기안부서</td>
					<td>구매팀</td>
					<td>기안자</td>
					<td><c:out value="${sessionScope.loginUser.userName }"/><input type="hidden" value="${sessionScope.loginUser.mno }"></td>
					
				</tr>
				
				<tr class="tbl_tit">
					<td>기안일</td>
					<td><input type="text" id="txt" placeholder="SYSDATE"></td>
					<td >수신자</td>
					<td colspan="">
					
						<select id="receiver">
							<option selected disabled hidden>수신자를 선택하세요</option>
							<c:forEach var="b" items="${list }">
							<option><c:out value="${b. NAME}"/>(<c:out value="${b.DNAME }"/>)</option>
							</c:forEach>
						</select>
						<c:forEach var="c" items="${list }">
						<input type="hidden" value="${c.SMNO }">
						</c:forEach>
					</td>
					
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" id="txtLong"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea style="resize:none;" id="content"></textarea>
					</td>
				</tr>
				
			</table><br><br>
			
			<div class="tbl2_wrap">
				<button id="plusBtn2" type="button">+ 추가</button><br>
			<table class="payTbl purchase">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<tr>
					<th>구분</th>
					<th>매입처</th>
					<th>품목명</th>
					<th>제조사</th>
					<th>공급가액</th>
					<th>수량</th>
					<th>금액</th>
				</tr>
				<tr class="insertArea">
					<td><!-- <input type="text" id="anoTxt_cate" placeholder="항목"> -->
						<select class="anoTxt_cate">
							<option selected disabled hidden>선택해주세요</option>
							<option value="EQUIP">비품</option>
							<option value="CONS">소모품</option>
						</select>
					</td>
					<td><!-- <input type="text" id="noTxt" placeholder="매입처"> -->
						<select class="noTxt">
							<option selected disabled hidden>선택해주세요</option>
							
						</select>
					</td>
					<td><!-- <input type="text" id="anoTxt_name" placeholder="품목명"> -->
						<select class="anoTxt_name">
							<option selected disabled hidden>선택해주세요</option>
							
						</select>
					
					</td>
					<td><!-- <input type="text" id="anoTxt_amount" placeholder="수량"> -->
						<select class="anoTxt_amount">
							<option selected disabled hidden>선택해주세요</option>
							
						</select>
					</td>
					<td>
						
					</td>
					<td><input type="text" class="anoTxt_price" placeholder="금액"></td>
					<td></td>
				</tr>
				
			</table>
			<table class="payTbl Area">
			<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="30%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
				</colgroup>
				<tr>
					<td colspan="2" id="total">총금액</td>
					<td colspan="4"><input type="text" id="txtLong_price"></td>
				</tr>
			</table>
			
			</div>
			</form>
			</div>
</div>
<div style="height:200px;">
	
</div>
</section>
<script>
	
	
	var cntTable = "";
	$(document).ready(function(){
		//var docuNum = 
		var now = new Date();
	    var year = now.getFullYear();
	    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.

	    if((month + "").length < 2){        //2자리가 아니면 0을 붙여줌.
	        month = "0" + month;
	    }
	     // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.
	    var today = ""+year + month; 
		var random = Math.floor(Math.random() * 1000) + 1;
		var docuNum = today.concat(random);
		console.log(random);
		//var docuNum = 
	
		$(".txt_docu").text(docuNum);
				
		startDate();
		
		//$(this).itemPur(cntTable);
		
		console.log("purchase")
		var plus = 1;
	
		
		
			$("#plusBtn2").click(function() {
				
				cntTable = $(".payTbl.purchase tr").length;
						
						var plusTable = "<tr class='insertArea'>";
						plusTable += "<td> <select class='anoTxt_cate'><option selected disabled hidden>선택해주세요</option></select></td>"
						plusTable += "<td> <select class='noTxt'><option selected disabled hidden>선택해주세요</option></select></td>"
						plusTable += "<td> <select class='anoTxt_name'><option selected disabled hidden>선택해주세요</option></select></td>"
						plusTable += "<td><select class='anoTxt_amount'><option selected disabled hidden>선택해주세요</option></select></td>"
						
						plusTable += "<td></td>"
						plusTable += "<td><input type='text' class='anoTxt_price' placeholder='금액'></td>"
						plusTable += "<td></td>"
						plusTable += "</tr>"
						var n = $(".payTbl.purchase");
						
						n.append(plusTable);
						
						//selectType2();
						//selectCName();
						//$(this).stopPropagation();
						
						//$(this).itemPur(cntTable);
					})
		
				
		function preWatch() {
			
		}
		
	})
	//onload끝	
	
	
	/* 1 */
	var cnName = "";
	var type = "";
	var iname = "";
	var madeComName = "";
	$(document).on("change", ".anoTxt_cate", function() {
		console.log("11")
		var value = $(this).val();
		type = value;
		var idx1 = $(this).parent("td").parent("tr").index();
		var cntTable = $(".payTbl.purchase").children().length;
		
		
		//select박스 변경시 전체 리셋
		
		$(".noTxt").find("option:not(:first-child)").remove();
		$(".noTxt").append($("<option selected disalbed hidden>선택 해주세요</option>")); 
		//$(".anoTxt_name").find("option:not(:first-child)").remove();
		//$(".anoTxt_name").append($("<option selected disalbed hidden>선택 해주세요</option>"));
		//$(".anoTxt_amount").find("option:not(:first-child)").remove();
		//$(".anoTxt_amount").append($("<option selected disalbed hidden>선택 해주세요</option>"));
		/* $(".payTbl.purchase").children().find('.noTxt').find("option:not(:first-child)").remove();
		$(".payTbl.purchase").children().find('.anoTxt_name').find("option:not(:first-child)").remove();
		$(".payTbl.purchase").children().find('.anoTxt_amount').find("option:not(:first-child)").remove(); */
		$.ajax({
			url:"itemType.ap",
			type:"get",
			data:{
				value:value
			},
			success:function(data) {
				//console.log(data.value);
				//console.log(data.value.length);
				
				
				//$("#anoTxt_cate")
				
				for(var i = 0; i < data.value.length; i++) {
					var option = $("<option>" + data.value[i].CN_NAME + "</option>");
					
					
					//$(".noTxt").append(option);
					for(var j = 0; j < idx1; j++) {
						$(".payTbl.purchase").children().eq(j+1).find('.noTxt').append(option);
					}
					//$(".payTbl.purchase").children().eq(idx1).find('.noTxt').append(option);
					//$(".payTbl.purchase").find("tr").eq(idx1).find(".anoTxt_name").append(option);
				}
				
				
			},
			error:function(data) {
				
			}
			
		})
	})
	/* 2 */
	$(document).on("change", ".noTxt", function() {
		console.log("11")
		var value = $(this).val();
			console.log("vlae:"   +value)
			cnName = value;
			
			//var idx2 = $(this).parent("td").parent("tr").length;
			var idx2 = $(this).closest('tr').prevAll().length;
			var tr2 = $(this).closest('tr').prevAll();
			//console.log("idx " + idx2);
			//console.log("tr2 " + tr2);
			//console.log($(".payTbl.purchase").children().eq(idx2).find('.anoTxt_name').text());
			$(".anoTxt_name").find("option:not(:first-child)").remove();
			$(".anoTxt_name").append($("<option selected disalbed hidden>선택 해주세요</option>"));
			//$(".anoTxt_amount").find("option:not(:first-child)").remove();
			//$(".anoTxt_amount").append($("<option selected disalbed hidden>선택 해주세요</option>")); 
			
			//송기준 여기!!!!
			//$(".payTbl.purchase tr").eq(idx2).children().find('.anoTxt_name').find("option").remove();
			//$(".payTbl.purchase tr").eq(idx2).children().find('.anoTxt_amount').find("option").remove();
			
			//select박스 변경시 전체 리셋
			$.ajax({
				url:"itemName.ap",
				type:"get",
				data:{
					value:value
				},
				success:function(data) {
					for(var i = 0; i < data.list.length; i++) {
						var option = $("<option>" + data.list[i].INAME + "</option>");
						
						
						//console.log(data.value[i].CN_NAME);
						
						//$(".anoTxt_name").append(option);
						//$(".payTbl.purchase").children().eq(idx2).children().find('.anoTxt_name').append(option);
						//$(".payTbl.purchase").find("tr").eq(idx2).find(".anoTxt_name").append(option);
						//$(".payTbl.purchase").children().eq(idx2).find('.anoTxt_name').append(option);
						$(".payTbl.purchase tr").eq(idx2).children().find('.anoTxt_name').append(option);
					}
				},
				error:function(data) {
					
				}
				
			})
	})
	/* 3 */
	$(document).on("change", ".anoTxt_name", function() {
			var value = $(this).val();
			iname = value;
			var idx = $(this).parent("td").parent("tr").index();
			console.log("value : " + value);
			console.log("idx : " + idx)
			$(".anoTxt_amount").find("option:not(:first-child)").remove();
			$(".anoTxt_amount").append($("<option selected disalbed hidden>선택 해주세요</option>"));
			
			/* $(".payTbl.purchase").children().eq(idx).find('.anoTxt_amount').find("option:not(:first-child)").remove();
			$(".payTbl.purchase").children().eq(idx).find('.anoTxt_amount').find("option:not(:first-child)").remove(); */
			
			//$(".payTbl.purchase tr").eq(idx).children().find('.anoTxt_amount').find("option").remove();
			//$(".payTbl.purchase tr").eq(idx2).children().find('.anoTxt_amount').find("option:not(:first-child)").remove();
			console.log("12314")
			$.ajax({
				url:"madeComName.ap",
				type:"get",
				data:{
					value:value
				},
				success:function(data){
					console.log("cnNamedata : " + data);
					for(var i = 0; i < data.list.length; i++) {
						var option = $("<option>" + data.list[i].MFG + "</option>");
						madeComName = data.list[i].MFG;
						
						console.log("cnName : " + data.list[i].MFG);
						
						//$(".anoTxt_amount").append(option);
						//$(".payTbl.purchase").find("tr").eq(idx).find(".anoTxt_amount").append(option);
						
						$(".payTbl.purchase tr").eq(idx).children().find('.anoTxt_amount').append(option);
						
					}
				},
				error:function(data) {
					
				}
			})
		});
		
		
		
	/* 4 */
	$(document).on("change", ".anoTxt_amount", function() {
		iname = $(this).val();
		var con = $(this).parent().eq(4).text();
		var idx = $(this).parent("td").parent("tr").index();
		console.log("1 : " + type);
		console.log("2 : " + cnName);
		console.log("3 : " + iname);
		console.log("4 : " + madeComName);
		
		
		$.ajax({
			url:"selectVos.ap",
			type:"get",
			data:{
				type:type,
				cnName:cnName,
				iname:iname,
				madeComName:madeComName
			},
			success:function(data) {
				console.log(data);
				
				$(".payTbl.purchase tr").eq(idx).children().eq(4).text(data.vos);
			},
			error:function(data) {
				
			}
		})
	
	});
		
	
	
	//서큐일시 구하기
	  var dateString = ""; 
	function startDate() {
		//console.log("하이");
		var date;
		 date = setInterval(function () { 
	          
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
	
	
	
		
		function insertPur() {
			clearInterval(startDate());
			console.log("멈춘시간 : " + dateString);
			
			var cnt = $(".payTbl.purchase tr:not(:first)").length;
			if($("#txtLong").val() == "" || $("#content").val() == "" || $("#noTxt").val() == "" ||
					$("#anoTxt_cate").val() == "" || $("#anoTxt_name").val() == "" || $("#anoTxt_amount").val() == "" || 
					$("#anoTxt_vos").val() == "" || $("#anoTxt_price").val() == "" || $(".payTbl.purchase tr:not(:first) td").find('input').val() == "") {
				alert("내용을 채워주세요!");
			}
			var p = $(".payTbl.purchase tr:not(:first)").find('input').val();
			//console.log(p);
			
			console.log("??");
			var str = "";
			var tdArr = new Array();  //배열 선언
			var tr = new Array();
			var tr1 = $(".payTbl.purchase tr:not(:first)");
			//현재 클릭된 Row(<tr>)
			tdArr[0] = tr1.children().eq(0).find('input').val() + ", ";
			tdArr[0] += tr1.children().eq(1).find('input').val() + ", ";
			tdArr[0] += tr1.children().eq(2).find('input').val() + ", ";
			tdArr[0] += tr1.children().eq(3).find('input').val() + ", ";
			tdArr[0] += tr1.children().eq(4).find('input').val() + ", ";
			tdArr[0] += tr1.children().eq(5).find('input').val();
			//console.log("tdArr[0] : " + tdArr[0]);
			//console.log(cnt);
				for(var i = 1; i < cnt; i++) {
					
					//cnt : 행의 갯수
					if(cnt >= 2) {
						
						//find 추가하기
						tdArr[i] = $(".payTbl.purchase tr:nth-child(" + (i+2) + ")").children().eq(0).find('input').val() + ", ";
						tdArr[i] += $(".payTbl.purchase tr:nth-child(" + (i+2) + ")").children().eq(1).find('input').val() + ", ";
						tdArr[i] += $(".payTbl.purchase tr:nth-child(" + (i+2) + ")").children().eq(2).find('input').val() + ", ";
						tdArr[i] += $(".payTbl.purchase tr:nth-child(" + (i+2) + ")").children().eq(3).find('input').val() + ", ";
						tdArr[i] += $(".payTbl.purchase tr:nth-child(" + (i+2) + ")").children().eq(4).find('input').val() + ", ";
						tdArr[i] += $(".payTbl.purchase tr:nth-child(" + (i+2) + ")").children().eq(5).find('input').val();
						
						
					}
					
					
				}
				 /* console.log("길이 : " + tdArr.length);
				for(var i = 0; i < cnt; i++) {
					
					console.log(tdArr[i]);
				} */
				 
				var info = new Array();
				 
				var sName = $("#receiver option:selected").text();
				var sMno = $(".tbl tr:nth-child(4)").children().eq(3).find('input').val();
				/* var mMno = $(".tbl tr:nth-child(3)").find('input').val(); */
				var mMno = ${loginUser.mno};
				var title = $("#txtLong").val();
				var content = $("#content").val();
				var tblDocuNum = $("#txt_docu").text();
				var rptDate = dateString;
				var tblTeam = "구매팀";
				console.log("smno : " + sMno);
				console.log("mMno : " + mMno);
				location.href="insertPurchase.ap?&sMno=" + sMno + "&title="
								+ title + "&content=" + content + "&tblDocuNum=" + tblDocuNum + 
								"&rptDate=" + rptDate + "&mMno="+ mMno + "&tblTeam=" + tblTeam + "&tdArr=" + tdArr;
				
				
				

				 
				 
				 
			
		}
		
	
	
	var iname = "";
	var madeComName = "";
	//민석 
	
		
	
			
		
		
		function selectPrice() {
			//금액 띄우기
			$(".anoTxt_price").keyup(function(){
				var idx = $(this).parent("td").parent("tr").index();
				//var count = $(this).val();
				//var vos = $(".anoTxt_amount").parents("tr").find("td:nth-child(5)").text();
				var count = $(".payTbl.purchase").find("tr").eq(idx).find(".anoTxt_price").val();
				var vos = $(".payTbl.purchase").find("tr").eq(idx).find("td:nth-child(5)").text();
				
				$(this).parents("tr").find("td:nth-child(7)").text((count * vos));
				
				
			});
		}
</script>



</body>
</html>