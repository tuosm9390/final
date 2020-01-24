<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>

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
   margin-top:-40px;
}
.title {
   margin-top:20px;
   width:80px;
   height:35px;
   border-bottom:1px solid lightgray;
}

.approval .category {
   width: auto;
   height: 30px;
   display: inline-block;
   margin: 1px;
}

.approval .category .btl {
   border: 1px solid white;
   background:white;
   color:#3498DB;
   width:70px;
   
   box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.tbl_wrap {
   margin-top:20px;
}
.tbl_wrap .tbl {
   
    border-collapse: collapse;
    width:100%;
    text-align: center;
	   
}

.tbl_wrap .tbl tr:not (:last-child ) {
   border-bottom: 1px solid #aaa;
}



.tbl_wrap .tbl td, th {
   	border: 1px solid lightgray;
      text-align: center;
      padding:7px; 
      
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

.writeDocu {
   float: right;
   margin-bottom: 10px;
   height: 30px;
}

.write {
   height: 30px;
   border: 2px solid royalblue;
   background:royalblue;
   color:white;
   font-weight:bold;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<header>
<jsp:include page="../../common/menubar.jsp" />
   </header>
   <%-- <c:set var="contextPath"
      value="${pageContext.servletContext.contextPath }" scope="application" /> --%>
      <section>
      <jsp:include page="../approveModal/purchaseApproveModal.jsp"></jsp:include>
   
   <div class="approval">
   <div class="title">
      <h2>결재함</h2>
   </div><br><br>
      <div class="category">


			<button class="category btl total">전체</button>
			<!-- <button class="category btl">기안중</button> -->
			<button class="category btl">진행중</button>
			<button class="category btl">반려</button>
			<button class="category btl">승인</button>
		</div>
		<div class="writeDocu">
			<button class="write" onclick="location.href='writeAllApprove.ap'">기안서
				작성</button>
		</div>



      
      
      
      
      <div class="tbl_wrap">
         <table class="tbl">
            <colgroup>
               <col width="7%">
               <col width="20%">
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
               <th>결재자</th>
               <th>진행상태</th>
               <th>결재</th>
            </tr>
            <c:forEach var="b" items="${list }">
            <tr class="tbl_tit">
               <td><c:out value="${b.RNUM }"/></td>
               <td><c:out value="${b.RPTDATE }"/></td>
               <td><c:out value="${b.RPTITLE }"/></td>
               <td><c:out value="${b.RPTYPE }"/></td>
               <td><c:out value="${b.MNAME }"/></td>
               <td><c:out value="${b.RNAME }"/></td>
               <td><c:out value="${b.RPSTATUS }"/></td>
               <td><a>보기</a></td>
            </tr>
            </c:forEach>
         </table>
      </div>
      <!-- 페이저 시작 -->
      <!-- 페이징 영역 시작 -->
		<div id="pagingArea" align="center">
			<c:if test="${pi.currentPage <= 1 }">
			[이전] &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1 }">
				<c:url var="blistBack" value="/documentApproval.ap">
					<c:param name="currentPage" value="${pi.currentPage - 1 }" />
				</c:url>
				<a href="${blistBack }">[이전]</a>&nbsp;
			</c:if>

			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<font color="red" size="4"><b>${p }</b></font>
				</c:if>
				<c:if test="${p ne pi.currentPage }">

					<c:url var="blistCheck" value="documentApproval.ap">
						<c:param name="currentPage" value="${p }" />
					</c:url>
					<a href="${blistCheck }">${p }</a>
				</c:if>
			</c:forEach>


			<c:if test="${pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${pi.currentPage < pi.maxPage }">
				<c:url var="blistEnd" value="documentApproval.ap">
					<c:param name="currentPage" value="${pi.currentPage + 1 }" />
				</c:url>
				&nbsp; <a href="${blistEnd }">[다음]</a>
			</c:if>

		</div>

		<!-- 페이징 영역 종료 -->


   </div>
   </section>
    <script>
    $(document).ready(function(){
       console.log("??");
       $(".category.btl.total").css({"background-color":"#3498DB", "box-shadow":"0px 0px 0px", "color":"white"});
    })
      
       $(".tbl_tit").mouseenter(function(){
          $(this).css({"background":"lightgray", "cursor":"pointer"})
       }).mouseout(function(){
          $(this).css({"background":"white"})
       }).click(function(){
          $(".modal").fadeIn();
       });
    
    
       $(".category.btl").click(function(){
          $except = $(this);
          console.log("??");
           $(this).css({"box-shadow":"0px 0px 0px", "border":"1px solid lightgray", "background":"#3498DB", "color":"white"});
           $(".category.btl").not($except).css({"color":"#3498DB", "background":"white","border":"1px solid white", "box-shadow":"0px 4px 4px rgba(0, 0, 0, 0.25)"});
           
            var cate = $(this).text();
           var scurrentPage = ${pi.currentPage}; 
           console.log(cate);
           
           
           
         
        	    $.ajax({
        		   url:"docuFilter.ap",
        		   type:"get",
        		   data:{
        			   cate:cate,
        			   scurrentPage:scurrentPage
        			   
        			   
        		   },
        		   success:function(data) {
        			 
        			   },
        		   
        		   error:function(status) {
        			   alert(status);
        		   }
               });    
            	   
          
           
           
          
          
       })
      
   
      
      
      
   </script> 

</body>
</html>