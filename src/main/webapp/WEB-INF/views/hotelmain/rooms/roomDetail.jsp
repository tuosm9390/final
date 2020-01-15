<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 좌우 방향 버튼 */
.carousel-control{
	width: 100px !important;
}
/* 중앙 표시 버튼 */
.carousel-indicators li:not(:first-child){
	margin-left: 5px;
}

.reservation{
	position: absolute;
	width: 1200px;
	height: 69px;
	left: 200px;
	top: 490px;
	background: #9A8975;
	display: inline-block;
}

.reservation-inner{
	margin-top: 8px;
	margin-right: 2px;
	padding: 15px;
	height: 50px;
	color: #6F6F6F;
	background: white;
}

.reservation-box{
	display: inline-flex;
}

.reservation-checkIn, .reservation-checkOut{
	width: 250px;
}

.reservation-text{
	width: 200px;
	padding: 13px !important;
	background: none !important;
	color: white;
	font-size: 15px;
	font-style: oblique;
}

input[type=text], select{
	border: none;
}

input[type=text]:active, select:active{
	border: none;
}
input[type=text]{
	width: 120px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />
	</header>
	<section>
		<!-- 상단 이미지 -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		      <li data-target="#myCarousel" data-slide-to="3"></li>
		      <li data-target="#myCarousel" data-slide-to="4"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" role="listbox">
		      <div class="item active">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
		
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
		    
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
		      
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
		      
		      <div class="item">
		        <img src="${ contextPath }/resources/images/hotelmain.png" style="width: 100%; height: 480px;">
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</div>
		
		<!-- 중앙 예약메뉴 -->
		<div id="reservationMenu" class="reservation">
			<div class="reservation-box">
				<div class="reservation-text">
					ROOM <br>
					RESERVATION
				</div>
				<div class="reservation-inner reservation-checkIn">
					<table>
						<tr>
							<td width="50%">체크인</td>
							<td><input type="text" id="checkIn" name="checkIn"></td>
						</tr>
					</table>
				</div>
				<div class="reservation-inner reservation-checkOut">
					<table>
						<tr>
							<td width="50%">체크아웃</td>
							<td><input type="text" id="checkOut" name="checkOut"></td>
						</tr>
					</table>
					
				</div>
				<div class="reservation-inner reservation-adultselect">
					<table>
						<tr>
							<td>성인</td>
							<td>
								<select>
									<option selected>1</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div class="reservation-inner reservation-childrenselect">
					<table>
						<tr>
							<td>어린이</td>
							<td>
								<select>
									<option selected></option>
								</select>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<!-- 하단 세부 내용 -->
		<h1>asd</h1>
		<h1>asd</h1>
		<h1>asd</h1>
		<h1>asd</h1>
		<h1>asd</h1>
		<h1>asd</h1>
		<h1>asd</h1>
		<h1>asd</h1>
		<h1>asd</h1>
		<h1>asd</h1>
		<h1>asd</h1>
	</section>
	<footer>
	</footer>
	
	<script>
		//datepicker
		$(function() {
			var date = new Date();

			$(".reservation-checkIn").click(function(){
				
				var checkIn = $("#checkIn").datepicker({
					autoClose : true,
					//선택한 날짜를 가져옴
					onSelect : function(date) {
						var endNum = date;
						//종료일 datepicker에 최소날짜를 방금 클릭한 날짜로 설정
						$("#checkOut").datepicker({
							minDate : new Date(endNum),
						});
					}
				}).data('datepicker');
			});

			var checkOut = $("#checkOut").datepicker({
				autoClose : true,
				//선택한 날짜를 가져옴
				onSelect : function(date) {
					var startNum = date;
					$('#checkIn').datepicker({
						//시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
						maxDate : new Date(startNum),
					});
				}
			}).data('datepicker');
		});
	</script>
</body>
</html>