<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style type="text/css">
	.Area1{
		font-weight: bold;
	}
	.contentArea{
		width:1600px;
		height:900px;
	}
	.titleArea{
		width:1300px;
		height:50px;
		border-bottom-width: 1px;
		border-bottom-color: black;
		border-bottom-style: solid;
		margin-top:-18px;
	}
	
	.rightArea{
		float:right;
		width:1300px;
		height:900px;
	}
	.inputBox{
		border-radius:5px 5px 5px 5px;
		width:200px;
		height:20px;
	}
	.basicInfoArea{
		width:1300px;
		height: auto;
		margin-left:40px;
	}
	.basicInfoArea tr td{
		padding-right:108px;
		padding-bottom:10px;
	}
	.basicInfoArea label{
		font-weight: bold;
	}
	.systemInfoArea{
		width:1300px;
		height: auto;
		margin-left:40px;
	}
	.systemInfoArea tr td{
		padding-right:90px;
		padding-bottom:10px;
	}
	.systemInfoArea label{
		font-weight: bold;
	}
	.secondBox{
		padding-left:51px;
	} 
	.vatSelect{
		width:205px;
		height:20px;
	}
	.hotelNotice{
		width:733px;
	}
	.checkInTime{
		height:20px;
	}
	.nextBtn{
		width:180px;
		height:50px;
		font-size: 25px;
		background:#060E33;
		border:0;
		color:#EAC064;
	}
	.nextBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
	.checkInTime{
		width:180px;
		height:30px;
	}
	.checkOutTime{
		width:180px;
		height:30px;
	}
	.rentedRoom{
		width:180px;
		height:30px;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
	<%-- <jsp:forward page="hotelRoomTypeSetting.jsp"/> --%>
		<div class="rightArea">
			<div class="titleArea">
				<h2 class="titleAreaSub">호텔 정보 설정</h2>
			</div>
			<div>
				<h3>기본 정보</h3>
			</div>
			<form action="">
			<div class="basicInfoArea"><!-- 기본정보 영역 -->
				<table>
					<tr>
						<td>
							<label>* 호텔명</label>
						</td>
						<td class="secondBox">
							<input type="text" name="hotelName" class="inputBox">
						</td>
						<td>
							<label>* 대표자</label>
						</td>
						<td>
							<input type="text" name="hotelOwner" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 이메일</label>
						</td>
						<td class="secondBox">
							<input type="email" name="hotelEmail" class="inputBox">
						</td>
						<td>
							<label>* 휴대폰</label>
						</td>
						<td>
							<input type="tel" name="ownerPhone" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>사업자 명</label>
						</td>
						<td class="secondBox">
							<input type="text" name="companyName" class="inputBox">
						</td>
						<td>
							<label>사업자 번호</label>
						</td>
						<td>
							<input type="text" name="companyNumber" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>호텔 전화</label>
						</td>
						<td class="secondBox">
							<input type="tel" name="hotelPhone" class="inputBox">
						</td>
					</tr>
				</table>
			</div><!-- 기본정보 영역 끝 -->
			<div>
				<h3>시스템 정보</h3>
			</div>
			<div class="systemInfoArea"><!-- systemInfoArea -->
				<table>
					<tr>
						<td>
							<label>* 입실시간</label>
						</td>
						<td>
							<select class="checkInTime">
								<option value="">==시간 선택==</option>
								<option value="12">12 : 00</option>
								<option value="13">13 : 00</option>
								<option value="14">14 : 00</option>
								<option value="15">15 : 00</option>
							</select>
						</td>
						<td>
							<label>* 퇴실시간</label>
						</td>
						<td>
							<select class="checkOutTime">
								<option value="">==시간 선택==</option>
								<option value="9">9 : 00</option>
								<option value="10">10 : 00</option>
								<option value="11">11 : 00</option>
								<option value="12">12 : 00</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>* 대실시간</label>
						</td>
						<td>
							<select class="rentedRoom">
								<option value="">==시간 선택==</option>
								<option value="4">4 시간</option>
								<option value="5">5 시간</option>
								<option value="6">6 시간</option>
								<option value="7">7 시간</option>
							</select>
						</td>
						<td>
							<label>* 봉사료(%)</label>
						</td>
						<td>
							<input type="tel" name="ownerPhone" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 자동 마감 시간</label>
						</td>
						<td>
							<input type="text" name="companyName" class="inputBox">
						</td>
						<td>
							<label>* 부가세 구분</label>
						</td>
						<td>
							<select class="vatSelect">
								<option value="">== 선택 ==</option>
								<option value="">부가세 포함</option>
								<option value="">부가세 미포함</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>* 호텔 정책</label>
						</td>
						<td colspan="3">
							<input type="tel" name="hotelPhone" class="inputBox hotelNotice">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 노쇼 정책</label>
						</td>
						<td colspan="3">
							체크인 예정시간 
							<select class="checkInTime">
								<option value="">== 시간 ==</option>
								<option value="1">1시간</option>
								<option value="2">2시간</option>
								<option value="3">3시간</option>
								<option value="4">4시간</option>
								<option value="5">5시간</option>
								<option value="6">6시간</option>
							</select>
							후 까지 예약하지 않을 시 <input type="text" style="width:100px;"> % 의 수수료가 발생합니다.
						</td>
					</tr>
					<tr>
						<td>
							<label>* 취소 정책</label>
						</td>
						<td colspan="3">
							<b>비성수기</b><hr>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3">
							<div>
								<span><b>주중</b></span>
								<span>2 일전</span>
								<span style="margin-right:200px;"><input type="text"></span>
								<span><b>주말</b></span>
								<span>2 일전</span>
								<span><input type="text"></span><br>
								<span><b>주중</b></span>
								<span>1 일전</span>
								<span style="margin-right:200px;"><input type="text"></span>
								<span><b>주말</b></span>
								<span>1 일전</span>
								<span><input type="text"></span><br>
								<span><b>주중</b></span>
								<span>당일</span>
								<span style="margin-right:200px;margin-left:15px;"><input type="text"></span>
								<span><b>주말</b></span>
								<span>당일</span>
								<span><input type="text" style="margin-left:15px;"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td colspan="3">
							<b>성수기</b><hr>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3">
							<div>
								<span><b>주중</b></span>
								<span>5 일전</span>
								<span style="margin-right:200px;"><input type="text"></span>
								<span><b>주말</b></span>
								<span>5 일전</span>
								<span><input type="text"></span><br>
								<span><b>주중</b></span>
								<span>4 일전</span>
								<span style="margin-right:200px;"><input type="text"></span>
								<span><b>주말</b></span>
								<span>4 일전</span>
								<span><input type="text"></span><br>
								<span><b>주중</b></span>
								<span>3 일전</span>
								<span style="margin-right:200px;"><input type="text"></span>
								<span><b>주말</b></span>
								<span>3 일전</span>
								<span><input type="text"></span><br>
								<span><b>주중</b></span>
								<span>2 일전</span>
								<span style="margin-right:200px;"><input type="text"></span>
								<span><b>주말</b></span>
								<span>2 일전</span>
								<span><input type="text"></span><br>
								<span><b>주중</b></span>
								<span>1 일전</span>
								<span style="margin-right:200px;"><input type="text"></span>
								<span><b>주말</b></span>
								<span>1 일전</span>
								<span><input type="text"></span><br>
								<span><b>주중</b></span>
								<span>당일</span>
								<span style="margin-right:200px;margin-left:15px;"><input type="text"></span>
								<span><b>주말</b></span>
								<span>당일</span>
								<span><input type="text" style="margin-left:15px;"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
						<b>기후변화 또는 천재지변시 : 전액 환급</b>
						</td>
					</tr>
				</table>
			</div><!-- 시스템 정보 영역 끝 -->
			<hr width="1020px" style="float: left;"><br>
				<div align="center">
					<button class="nextBtn" onclick="location.href='goHotelRoomTypePage.set'"><b>다음</b></button>			
				</div>
			</form>
		</div>
	</div>
</body>
</html>