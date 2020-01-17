<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* div설정 */
.room-img{
	border: 6px solid black;
	display: inline-table;
	width: 33.1% !important;
}

/* img설정 */
.room-img img{
	width: 100%;
	height: 482px;
}

/* a태그설정 */
.room-img a{
	position: relative;
    display: block;
    overflow: hidden;
    padding: 0;
    color: white;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<c:set var="roomCount" value="6"/>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<div class="room-img-box" style="background: black; border: 6px solid black; padding: 6px;">
			<c:forEach var="i" begin="1" end="${ roomCount }">
				<div class="room-img">
					<a href="roomdetail.hmain">
						<img src="${ contextPath }/resources/images/room${ i }.png">
					</a>
				</div>
			</c:forEach>
		</div>
	</section>
	<footer></footer>
	
	<script>
// 		$(".room-img").mouseover(function(){
// 			$(".box").css("display", "block");
// 		}).mouseout(function(){
// 			$(".box").css("display", "none");
// 		});
	</script>
</body>
</html>