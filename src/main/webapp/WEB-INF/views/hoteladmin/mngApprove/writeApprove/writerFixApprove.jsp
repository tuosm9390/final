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

	
.tbl_wrap {
	margin-top:20px;
	width:1100px;
	max-width:1000px;
	margin-left:auto;
	margin-right:auto;
}
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
#txtLong {
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

.tbl3_wrap {
	margin-top:-0px;
	width:1100px;
	margin-left:auto;
	margin-right:auto;
}
.tbl3_wrap .payTbl {
	
	  border-collapse: collapse;
	 width:1100px;
	 text-align: center;
	 height:40px;
	 margin-top:14px;
	 margin-left:auto;
	 margin-right:auto;
}



.tbl3_wrap .payTbl td, th {
	  border: 1px solid lightgray;
      text-align: center;
}
.tbl3_wrap .payTbl th{
   background-color: #f7f7f7;
   color: #005B9E;
   }
.tbl3_wrap .payTbl td {
	padding:10px;
}
.noTxt {
	width:70px;
}
.anoTxt {
	border-radius:3px;
	height:25px;
	border:1px solid lightgray;
}
.anoTxt_ino {
	border-radius:3px;
	height:20px;
	border:1px solid lightgray;
}
.anoTxt_price {
	border-radius:3px;
	height:25px;
	border:1px solid lightgray;
}
.anoTxt_iname {
	border-radius:3px;
	height:20px;
	border:1px solid lightgray;
}
.anoTxt_cname {
	border-radius:3px;
	height:20px;
	border:1px solid lightgray;
}
.anoTxt_rsn {
	border-radius:3px;
	height:20px;
	border:1px solid lightgray;
}
#plusBtn4 {
	width:80px;
	height:30px;
	border-radius:2px;
	border:1px solid #3498DB;
	background:#3498DB;
	color:white;
	float:right;
}
.tbl2_wrap .payTbl .Area {
	margin-top:-px;
}
.resultBtnFix {
	float:right;
	
}
#pre {
	border:1px solid lightgray;
	background:lightgray;
	color:white;
	height:35px;
	width:70px;
	border-radius:2px;
}
 #submit {
	border:1px solid #3498DB;
	background:#3498DB;
	color:white;
	height:35px;
	width:70px;
	border-radius:2px;
}
.inArea {
	width:1200px;
	height:auto;
	margin-left:auto;
	margin-right:auto;
	margin-top:45px;
}
.resultBtnPur {
	float:right;
	
}
#totalPrice {
	 width:60px;
   height:30px;
   border-radius:2px;
   border:1px solid lightgray;
}


</style>
</head>
<body>
<header>
			<jsp:include page="../../common/menubar.jsp" />
	
</header>
	<section>
	<div class="inArea">
	<form action="insertRepairRequest.ap" method="get">
	<div class="resultBtnFix">
				<button id="pre" onclick="preWatch();">미리보기</button>
				<button id="submit" type="button" onclick="insertRepair();">기안하기</button>
			</div>
	<div class="tbl_wrap fix">
	<table class="tbl">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
					
				</colgroup>

				<tr>
					<th colspan="4">수리 요청서</th>
					
					
				</tr>
				<tr class="tbl_tit">
					<td>문서번호</td>
					<td colspan="3"style="text-align:center;"><input type="text" name="docno" id="docuNo" style="text-align:center;" readonly></td>
					
					
				</tr>
				<tr class="tbl_tit">
					<td>기안부서</td>
					<td>시설관리팀</td>
					<td>기안자</td>
					<td><c:out value="${sessionScope.loginUser.userName }"/><input type="hidden" value="${sessionScope.loginUser.mno }" name="mmno"></td>
					
				</tr>
				
				<tr class="tbl_tit">
					<td>기안일</td>
					<td><input type="text" id="txt" placeholder="SYSDATE" name="rptDate" readonl"></td>
					<td >수신자</td>
					<td colspan="">
						<select id="receiver" name="sname">
							<option selected disabled hidden>수신자를 선택하세요</option>
							<c:forEach var="b" items="${list }">
								<option><c:out value="${b.NAME }"/>(총지배인)</option>
							</c:forEach>
						</select>
						<c:forEach var="c" items="${list }">
							<input type="hidden" value="${c.SMNO }" name="smno">
						</c:forEach>
					</td>
					
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" id="txtLong" name="title" style="text-align:center;"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea style="resize:none; text-align:center;" id="content" name="content" ></textarea>
					</td>
				</tr>
				
			</table><br><br>
			
			<div class="tbl3_wrap">
				<button id="plusBtn4" type="button">+ 추가</button><br>
			<table class="payTbl fix">
				<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="30%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
				</colgroup>
				<tr class="repairTr">
					<th>No</th>
					<th>수리 업체명</th>
					<th>제품코드</th>
					<th>제품 명</th>
					<th>금액</th>
					<th>수리사유</th>
				</tr>
				<tr class="repeat">
					<td>1</td>
					<td>
					<!-- <input type="text" class="anoTxt_price" placeholder="금액" style="text-align:center;" name="price"> -->
					
					
					<select class="anoTxt_price" name="price">
							<option selected disabled hidden>선택 해주세요</option>
							<c:forEach var="c" items="${listCon }">
								<option><c:out value="${c.CN_NAME }"/></option>
							</c:forEach>
							
						</select>
					</td>
					<td><input type="text" class="anoTxt_ino" style="text-align:center;" name="ino"></td>
					<td><input type="text" class="anoTxt_iname" placeholder="제품명" readonly style="text-align:center;" name="iname"></td>
						
						<td><input type="text" class="anoTxt_cname" placeholder="수리 업체명" style="text-align:center;" name="cnName"></td>
					
					<td><input type="text" class="anoTxt_rsn" placeholder="사유" style="text-align:center;" name="rsn"></td>
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
					<td colspan="3"><input type="text" id="txtLong" style="text-align:center;" name="totalPrice"></td>
					<td><button id="totalPrice" type="button" onclick="showTotalPrice();">보기</button></td>
				</tr>
			</table>
			</div>
</div>
</form>
</div>
<div style="height:200px;">
	
</div>
</section>
<script>
	$(function(){
		
		var now = new Date();
	       var year = now.getFullYear();
	       var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.

	       if((month + "").length < 2){        //2자리가 아니면 0을 붙여줌.
	           month = "0" + month;
	       }
	        // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.
	       var today = ""+year + month; 
	      var random = Math.floor(Math.random() * 100000) + 1;
	      var docuNum = today.concat(random);
	      //var docuNum = 
	      
	      
	      
	      //$(".tbl tr").children().find(".txt_docu").val(docuNum);
	      //$(".txt_docu").text(docuNum);
	            
	      startDate();
	      $(".tbl tr:nth-child(2)").children().eq(1).find("#docuNo").val(docuNum);
		
		
		
		
		
	});
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
	
	$(document).on("keyup", ".anoTxt_ino", function(){
		
		var idx = $(this).parents("tr").index();
		console.log(idx);
		var value = $(this).val();
		console.log(value)
		
		$.ajax({
			url:"repairIname.ap",
			type:"get",
			data:{
				value:value
			},
			success:function(data) {
				console.log(data);
				
				$(".payTbl.fix tr").eq(idx).find(".anoTxt_iname").val(data.iname);
				console.log(data.iname);
				
				
			},
			error:function(data) {
				
			}
		})
		
		
	});
	
	function showTotalPrice(){
		var Count = $(".payTbl.fix tr").length;
		var tblCount = (Count - 1);
		
		var totalPrice = "";
		for(var i = 0; i < tblCount; i++) {
			if(i == 0) {
				totalPrice = $(".payTbl.fix tr").eq(i+1).children().find(".anoTxt_cname").val()*1;
				
			}else {
				totalPrice += $(".payTbl.fix tr").eq(i+1).children().find(".anoTxt_cname").val()*1;
			}
		}
		$(".payTbl.Area tr").children().find("#txtLong").val(totalPrice);
		
	}
	/* $(document).on("keyup", ".anoTxt_price", function(){
		$(this).val();
		//console.log($(this).val());
		var idx = $(this).parents("tr").index();
		console.log(idx);
		var totalPrice = "";
		//var price = $(".payTbl.fix tr").find(".anoTxt_price").val();
		for(var i = 0; i < idx; i++) {
			var price = $(".payTbl.fix tr").eq(idx).find(".anoTxt_price").val();
			if(idx == 1) {
				totalPrice = price*1;				
			}else {
			totalPrice += price*1;
				
			}
		}
		$(".payTbl.Area tr").find("#txtLong").val(totalPrice);
		
		//$(".payTbl.Area tr")
		
	}); */
	
	
	$("#plusBtn4").click(function() {

		/* var plusTable = "<tr>";
		plusTable += "<td> <input type='text' class='noTxt' placeholder='구매팀'></td>"
		plusTable += "<td> <input type='text' class='anoTxt' placeholder='구매팀'> </td>"
		plusTable += "<td> <input type='text' class='anoTxt' placeholder='구매팀'> </div> </td>"
		plusTable += "<td> <input type='text' class='anoTxt' placeholder='구매팀'> </td>"
		plusTable += "<td> <input type='text' class='anoTxt' placeholder='구매팀'> </td>"
		plusTable += "<td> <input type='text' class='anoTxt' placeholder='구매팀'> </td>"
		plusTable += "</tr>"
		var n = $(".payTbl.fix").eq(0);

		n.append(plusTable); */
		
		var valueTd = $(".payTbl.fix tr:last-child").children().eq(0).text();
		console.log(valueTd);
		var tblClone = $(".payTbl.fix tr:last-child").clone();
		tblClone.children().children().val("");
		tblClone.children().eq(0).text((valueTd*1+1));
		
		
		$(".payTbl.fix").append(tblClone);
		//tblClone.children().eq(0).
		

	})
	function insertRepair() {
		clearInterval(startDate());
		
		console.log("기안하기");
		console.log(dateString);
		$(".tbl tr:nth-child(4)").children().eq(1).find("#txt").val(dateString);
		
		$("#submit").attr("type", "submit");
	}
</script>



</body>
</html>