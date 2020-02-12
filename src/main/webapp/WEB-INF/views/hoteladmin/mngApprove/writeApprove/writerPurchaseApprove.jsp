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
.vos, .totalPrice {
   border-radius:3px;
   height:22px;
   border:1px solid lightgray;
   width:110px;
   text-align:center;
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
#btn {
   width:60px;
   height:35px;
   border-radius:2px;
   border:1px solid lightgray;
}
#docuNo {
   border-radius:2px;
   height:30px;
   text-align:center;
   border:1px solid lightgray;
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
      
      <form action="insertPurchase.ap" method="get" >
      
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
               <td colspan="3"style="text-align:center;"><input type="text" name="docno" id="docuNo" readonly></td>
               
               
            </tr>
            <tr class="tbl_tit">
               <td>기안부서</td>
               <td >구매팀</td>
               <td>기안자</td>
               <td><c:out value="${sessionScope.loginUser.userName }"/><input type="hidden" value="${sessionScope.loginUser.mno }" name="mname">
               </td>
               
            </tr>
            
            <tr class="tbl_tit">
               <td>기안일</td>
               <td><input type="text" id="txt" placeholder="SYSDATE" name="rptDate" style="text-align:center;" readonly></td>
               <td >수신자</td>
               <td colspan="">
               
                  <select id="receiver" name="sname">
                     <option selected disabled hidden>수신자를 선택하세요</option>
                     <c:forEach var="b" items="${list }">
                 
                     <option><c:out value="${b. NAME}"/> (<c:out value="${b.STF_ID}"/>)</option>
                     </c:forEach>
                  </select>
               </td>
               
            </tr>
            <tr>
               <td>제목</td>
               <td colspan="3"><input type="text" id="txtLong" name="title" style="text-align:center;"></td>
            </tr>
            <tr>
               <td>내용</td>
               <td colspan="3">
                  <textarea style="resize:none; text-align:center;" id="content" name="content"></textarea>
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
               <th>제조사</th>
               <th>믈픔명</th>
               <th>공급가액</th>
               <th>수량</th>
               <th>금액</th>
            </tr>
            <tr class="insertArea">
               <td><!-- <input type="text" id="anoTxt_cate" placeholder="항목"> -->
                  <select class="anoTxt_cate" name="type">
                     <option selected disabled hidden>선택해주세요</option>
                     <option value="EQUIP">비품</option>
                     <option value="CONS">소모품</option>
                  </select>
               </td>
               <td><!-- <input type="text" id="noTxt" placeholder="매입처"> -->
                  <select class="noTxt" name="cname">
                     <option selected disabled hidden>선택해주세요</option>
                     
                  </select>
               </td>
               <td><!-- <input type="text" id="anoTxt_name" placeholder="품목명"> -->
                  <select class="anoTxt_name" name="iname">
                     <option selected disabled hidden>선택해주세요</option>
                     
                  </select>
               
               </td>
               <td><!-- <input type="text" id="anoTxt_amount" placeholder="수량"> -->
                  <select class="anoTxt_amount" name="mfg">
                     <option selected disabled hidden>선택해주세요</option>
                     
                  </select>
               </td>
               <td >
               <input type="text" class="vos" name="vosprice"><input type="hidden" name='ino' class='ino'>
               </td>
               <td><input type="text" class="anoTxt_price" placeholder="수량" name="amount"></td>
               <td><input type="text" name="price" class="totalPrice"></td>
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
               <td colspan="3" style="text-align:center;"><input type="text" id="txtLong_price" style="text-align:center;" name="totPrice"></td>
               <td><button type="button" id="btn">보기</button></td>
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
   var random = Math.floor(Math.random() * 1000000) + 1;
   var docuNum = today.concat(random);
   //var docuNum = 
   
   
   
   //$(".tbl tr").children().find(".txt_docu").val(docuNum);
   //$(".txt_docu").text(docuNum);
         
   startDate();
   $(".tbl tr:nth-child(2)").children().eq(1).find("#docuNo").val(docuNum);
   //$(this).itemPur(cntTable);
   
   var plus = 1;
   
   $("#btn").click(function(){
      var tblCount = $(".payTbl.purchase tr").length;
      var lprice = (tblCount-1);
      
      var totalCount = "";
      var totalPrice = "";
      for(var i = 0; i < lprice; i++) {
         if(i == 0) {
            totalPrice = $(".payTbl.purchase tr").eq(i+1).children().find('.totalPrice').val()*1;
         }else {
            totalPrice += $(".payTbl.purchase tr").eq(i+1).children().find('.totalPrice').val()*1;
         }
         
      }
         
      $(".payTbl.Area tr").children().find("#txtLong_price").val(totalPrice);
      
      
      
      
      
   
   
   }) 
      
      $("#plusBtn2").click(function() {
         
         cntTable = $(".payTbl.purchase tr").length;
               
               
         var plusType = "";
         if(type == "EQUIP") {
            plusType = "비품";
            
         }
         var tblVal = $(".payTbl.purchase tr:nth-child(2)").children().eq(0).find('select').val();
         
         
            if(tblVal == null) {
               var plusTable = "<tr class='insertArea'>";
               plusTable += "<td></td>"
               plusTable += "<td> <select class='noTxt' name='cname'><option selected disabled hidden>선택해주세요</option></select></td>"
               plusTable += "<td> <select class='anoTxt_name' name='iname'><option selected disabled hidden>선택해주세요</option></select></td>"
               plusTable += "<td><select class='anoTxt_amount' name='mfg'><option selected disabled hidden>선택해주세요</option></select></td>"
               
               plusTable += "<td><input type='text' name='vosprice' class='vos'><input type='hidden' name='ino' class='ino'></td>"
               plusTable += "<td><input type='text' class='anoTxt_price' placeholder='수량' name='amount'></td>"
               plusTable += "<td><input type='text' name='price' class='totalPrice'></td>"
               plusTable += "</tr>"
               var n = $(".payTbl.purchase");
               
               n.append(plusTable);
            }else {
               /* console.log("option1 : " + option1);
               console.log("이거다진짜 : " + (cntTable-1));
               var plusTable = "<tr class='insertArea'>";
               plusTable += "<td> <select class='anoTxt_cate'><option selected disabled value="+ plusType +">" + plusType + "</td>"
               plusTable += option2;
               plusTable += "<td> <select class='anoTxt_name'><option selected disabled hidden>선택해주세요</option></select></td>"
               plusTable += "<td><select class='anoTxt_amount'><option selected disabled hidden>선택해주세요</option></select></td>"
               plusTable += "<td></td>"
               plusTable += "<td><input type='text' class='anoTxt_price' placeholder='금액'></td>"
               plusTable += "<td></td>"
               plusTable += "</tr>"
               var n = $(".payTbl.purchase");
               n.append(plusTable); */
               //anoTxt_price, vos, totalPrice
               var tblVal2 = "";
               if(tblVal == "EQUIP") {
                  tblVal2 = "비품";
               }else {
                  tblVal2 = "소모품";
               }
               
               var tblClone =  $(".payTbl.purchase tr:nth-child(2)").clone();
               
               //tblClone.children().eq(0).find('.anoTxt_cate').text(tblVal2);
               tblClone.children().eq(0).find('select').replaceWith(tblVal2);
               //tblClone.children().eq(0).find('select').
               tblClone.children().eq(0).css({'text-align':'center','font-weight':'nomal', 'font-size':'13px'})
               tblClone.children().eq(5).find('input').val("");
               tblClone.children().eq(6).find('input').val("");
               tblClone.children().eq(4).find('input').val("");
               $(".payTbl.purchase").append(tblClone);
               
               
            }
         
         
               
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
var option1 = "<td><select>";
var option2 = "";

$(document).on("change", ".anoTxt_cate", function() {
   var value = $(this).val();
   type = value;
   
   
   
   var idx1 = $(this).parent("td").parent("tr").index();
   var cntTable = $(".payTbl.purchase").children().length;
   
   
   //select박스 변경시 전체 리셋
   
   /* $(".noTxt").find("option:not(:first-child)").remove();
   $(".noTxt").append($("<option selected disalbed hidden>선택 해주세요</option>")); 
   $(".anoTxt_name").find("option:not(:first-child)").remove();
   $(".anoTxt_name").append($("<option selected disalbed hidden>선택 해주세요</option>"));
   $(".anoTxt_amount").find("option:not(:first-child)").remove();
   $(".anoTxt_amount").append($("<option selected disalbed hidden>선택 해주세요</option>")); */
   
    $(".payTbl.purchase").children().find('.noTxt').find("option:not(:first-child)").remove();
    $(".payTbl.purchase").children().find('.noTxt').append($("<option selected disalbed hidden>선택 해주세요</option>"));
   $(".payTbl.purchase").children().find('.anoTxt_name').find("option:not(:first-child)").remove();
    $(".payTbl.purchase").children().find('.anoTxt_name').append($("<option selected disalbed hidden>선택 해주세요</option>"));
   $(".payTbl.purchase").children().find('.anoTxt_amount').find("option:not(:first-child)").remove(); 
    $(".payTbl.purchase").children().find('.anoTxt_amount').append($("<option selected disalbed hidden>선택 해주세요</option>"));
   $(".payTbl.purchase tr").children().find(".vos").val("");
   $(".payTbl.purchase tr").children().find(".anoTxt_price").val("");
   $(".payTbl.purchase tr").children().find(".totalPrice").val("");
   $(".payTbl.Area tr").children().find("#txtLong_price").val("");
   
   var tblVal = $(".payTbl.purchase tr:nth-child(2)").children().eq(0).find('select').val();
    $( ".payTbl.purchase tr:nth-child(n+3)").remove();
   
   /* 여기부터 */
   /* console.log("tblVal : " + tblVal);
   if(tblVal == null) {
      console.log("null입니다");
   }else {
      
   }
   
   
   
    /* $(".payTbl.purchase tr:not(:first-child)").children().eq(4).text(""); 
   $(".payTbl.purchase tr:not(:first-child)").children().eq(5).find('.anoTxt_price').val("");
   $(".payTbl.purchase tr:not(:first-child)").children().eq(6).text(""); 
   $(".payTbl.purchase tr").children().find('.vos').text("");  */ 
   
   
   
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
         var option = "";
         for(var i = 0; i < data.value.length; i++) {
            if(i == (data.value.length-1)) {
               var option = $("<option>" + data.value[i].CN_NAME + "</option></select>");
               //option2 =$("<option>" + data.value[i].CN_NAME + "</option>")
               //option1 = option1.append(option);
            }else {
               var option = $("<option>" + data.value[i].CN_NAME + "</option>");
               //option2 =$("<option>" + data.value[i].CN_NAME + "</option>")
               //option1 = option1.append(option);
            }
            
            
            
            //$(".noTxt").append(option);
            for(var j = 0; j < idx1; j++) {
               $(".payTbl.purchase").children().eq(j+1).find('.noTxt').append(option);
               
               //console.log("여기요 : " + option1);
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
var notax = "";
$(document).on("change", ".noTxt", function() {
   var value = $(this).val();
   notax = value;
   var idx4 = $(this).parent("td").parent("tr").index();
   console.log(idx4);
   // $(".payTbl.purchase tr").eq(idx4).children().find('.anoTxt_name').find("option:not(:first-child)").find("option").remove();
    $(".payTbl.purchase tr").eq(idx4).children().find('.anoTxt_name').append($("<option selected disabled hidden>선택 해주세요</option>"));
    $(".payTbl.purchase tr").eq(idx4).children().find('.anoTxt_name').find("option:not(:first-child)").find("option").remove();
    $(".payTbl.purchase tr").eq(idx4).children().find('.anoTxt_amount').append($("<option selected disabled hidden>선택 해주세요</option>"));
   
    
   $.ajax({
      url:"madeComName.ap",
      type:"get",
      data:{
         value:value,
         type:type
      },
      success:function(data){
     	 console.log(data.list);
     	
             $(".payTbl.purchase tr").eq(idx4).children().find('.anoTxt_name').find("option").remove();
             $(".payTbl.purchase tr").eq(idx4).children().find('.anoTxt_name').append($("<option selected disabled hidden>선택 해주세요</option>"));
         for(var i = 0; i < data.list.length; i++) {
            option = $("<option>" + data.list[i].MFG + "</option>");
            //madeComName = data.list[i].MFG;
            
            
            //$(".anoTxt_amount").append(option);
            //$(".payTbl.purchase").find("tr").eq(idx).find(".anoTxt_amount").append(option);
            
            $(".payTbl.purchase tr").eq(idx4).children().find('.anoTxt_name').append(option);
            var option = "";
         }
         console.log(madeComName);
      },
      error:function(data) {
         
      }
   })
})
/* 3 */
$(document).on("change", ".anoTxt_name", function() {
   var value = $(this).val();
   madeComName = value;
      
      
      var idx2 = $(this).closest('tr').prevAll().length;
      var tr2 = $(this).closest('tr').prevAll();
      //$(".anoTxt_name").find("option:not(:first-child)").remove();
      //$(".anoTxt_name").append($("<option selected disalbed hidden>선택 해주세요</option>"));
       

      //송기준 여기!!!!
      $(".payTbl.purchase tr").eq(idx2).children().find('option:not(:first-child)').find("option").remove();
      $(".payTbl.purchase tr").eq(idx2).children().find('.anoTxt_amount').find("option").remove();
      $(".payTbl.purchase tr").eq(idx2).children().find('.anoTxt_amount').append($("<option selected disabled hidden>선택 해주세요</option>"));
      //$(".noTxt").append($("<option selected disalbed hidden>선택 해주세요</option>")); 
      
      //$(".payTbl.purchase tr").eq(idx2).children().find('.anoTxt_name').find("option").remove();
      //$(".payTbl.purchase tr").eq(idx2).children().find('.anoTxt_name').append($("<option selected disabled hidden>선택 해주세요</option>"));
      //select박스 변경시 전체 리셋
      console.log(type);
      $.ajax({
         url:"itemName.ap",
         type:"get",
         data:{
            mfg:value,
            cname:notax,
            type:type
         },
         success:function(data) {
            //console.log($(".payTbl.purchase tr").eq(1).children().eq(3).find('.anoTxt_amount').find('option:').text());
            for(var i = 0; i < data.list.length; i++) {
                console.log(compare);
                     var option = $("<option>" + data.list[i].iname + "</option>");
                     
                  
               $(".payTbl.purchase tr").eq(idx2).children().find('.anoTxt_amount').append(option);
               
            }
            
            for(var j = 1; j < idx2; j++) {
               var compare = $(".payTbl.purchase tr").eq(j).children().eq(3).find('.anoTxt_amount').val();
	               $(".payTbl.purchase tr").eq(idx2).children().eq(3).find('.anoTxt_amount option').each(function() {
	            	   console.log($(this).val() == compare);
	            	   console.log($(this).val());
	            	   if($(this).val() == compare) {
	            		   console.log($(this).remove())
	            	   }
	               });
            }
            
         },
         error:function(data) {
            
         }
         
      })
   });
   
  /* $(".payTbl.purchase tr").children().find(".anoTxt_amount").click(function(){
   console.log("클릭되었습니다.");
   var idx = $(this).parent("td").parent("tr").index();
   var thisVal = $(this).val();
   console.log(thisVal);
   for(var i = 0; i < idx; i++) {
  	 var compare = $(".payTbl.purchase tr").eq(i+1).children().eq(3).find('.anoTxt_amount').val();
   	
  	 if(thisVal == compare) {
  		 thisVal.remove();
  	 }
  	 
   }
  // console.log(compare);
   
    $(this).find('option').each(function(){
         
   }); 

      
      
   
});   */
   
   
/* 4 */
 $(document).on("change", ".anoTxt_amount", function() {
	   console.log("선택되었습니다.");
   var option2 = "";
   var iname = $(this).val();
   var con = $(this).parent().eq(4).text();
   var idx = $(this).parent("td").parent("tr").index();
   
   for(var i = 0; i < idx; i++) {
      
   var compare = $(".payTbl.purchase tr").eq(i+1).children().eq(3).find('.anoTxt_amount').val();
   var now = $(this).val();
   //console.log(now);
  // console.log(now);
    if(now == compare) {
      console.log(now);
   } 
   
  // console.log(iname);
   
   }
   console.log("----------------")
   console.log(madeComName)
   console.log(type)
   console.log(notax)
   console.log(iname)
   console.log("----------------")
   
   
   $.ajax({
      url:"selectVos.ap",
      type:"get",
      data:{
         type:type,
         cnName:notax,
         iname:iname,
         madeComName:madeComName
      },
      success:function(data) {
            
         for(var i = 0; i < data.list.length; i++) {
            var test = data.list[i].VOS.toString();
            console.log(data.list[i].INO);
            $(".payTbl.purchase tr").eq(idx).children().eq(4).find('.vos').val(test);
            
            option2 = $("<input type='hidden' name='ino' value='" + data.list[i].INO + "'>")
         
            $(".payTbl.purchase tr").eq(idx).children().eq(4).find('.ino').val(data.list[i].INO);
         }
         
      },
      error:function(data) {
         
      }
   })

}); 


$(document).on("keyup", ".anoTxt_price" , function(){
   var idx = $(this).parents("tr").index();
   //var count = $(this).val();
   //var vos = $(".anoTxt_amount").parents("tr").find("td:nth-child(5)").text();
   var count = $(".payTbl.purchase").find("tr").eq(idx).children().find(".anoTxt_price").val();
   var vos = $(".payTbl.purchase").find("tr").eq(idx).children().find(".vos").val();
   
   
   
   $(".payTbl.purchase tr").eq(idx).find("td:nth-child(7)").find(".totalPrice").val((count * vos));
   
})



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



   /* insert하기 */
   function insertPur() {
       clearInterval(startDate());
      
      $(".tbl tr:nth-child(4)").children().eq(1).find("#txt").val(dateString);
      
      
      $("#submit").attr("type","submit");
      
      var cnt = $(".payTbl.purchase tr:not(:first)").length;
      if($("#txtLong").val() == "" || $("#content").val() == "" || $("#noTxt").val() == "" ||
            $("#anoTxt_cate").val() == "" || $("#anoTxt_name").val() == "" || $("#anoTxt_amount").val() == "" || 
            $("#anoTxt_vos").val() == "" || $("#anoTxt_price").val() == "" || $(".payTbl.purchase tr:not(:first) td").find('input').val() == "") {
         alert("내용을 채워주세요!");
      }
      var p = $(".payTbl.purchase tr:not(:first)").find('input').val();
   
   
          
          
          
      
   }
   
   


var iname = "";
var madeComName = "";
//민석 

   
      
   
         
      
      
      
</script>



</body>
</html>