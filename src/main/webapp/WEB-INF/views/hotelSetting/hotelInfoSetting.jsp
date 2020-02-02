<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
	.Area1{
		font-weight: bold;
	}
	.menubar{
		height:1250px;
	}
	.contentArea{
		width:1600px;
		height:900px;
	}
	.titleArea{
		width:1250px;
		height:50px;
		border-bottom-width: 1px;
		border-bottom-color: darkgray;
		border-bottom-style: solid;
		margin-top:-18px;
	}
	
	.rightArea{
		float:right;
		width:1290px;
		height:900px;
		margin-left:10px;
	}
	input{
		border-radius:5px 5px 5px 5px;
		border:1px solid lightgray;
		width:200px;
		height:25px;
	}
	select{
		border-radius:5px 5px 5px 5px;
		border:1px solid lightgray;
		width:200px;
		height:30px;
	}
	.basicInfoArea{
		width:1300px;
		height: auto;
		margin-left:70px;
	}
	.basicInfoArea table tr td:nth-child(2){
		padding-right:160px;
	}
	.basicInfoArea tr td{
		padding-right:58px;
		padding-bottom:10px;
	}
	.basicInfoArea label{
		font-weight: bold;
	}
	.systemInfoArea{
		width:1300px;
		height: auto;
		margin-left:70px;
	}
	.systemInfoArea tr td{
		padding-bottom:10px;
	}
	.systemInfoArea label{
		font-weight: bold;
	}
	.systemInfoArea input{
		text-align:center;
	}
/* 	.secondBox{
		padding-left:51px;
	}  */

	.hotelNotice{
		width:840px;
	
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

	.basicInfoArea{
	}
	body{
		overflow-x:hidden;
	}
	.offSeason table{
		width:890px;
	}
	.offSeason td:nth-child(1), .offSeason td:nth-child(3){
		padding-right:0;
	}
	.peakSeason table{
		width:890px;
	}
	.peakSeason td:nth-child(1), .peakSeason td:nth-child(3){
		padding-right:0;
	}
	.offSeason td input{
		text-align:center;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<form action="goRoomTypePage.set" method="post">
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea">
			<div class="titleArea">
				<h1 class="titleAreaSub">§ 호텔 정보 설정</h1>
			</div>
			<div>
				<h3 style="margin-left:30px; color:#060E33;">기본 정보</h3>
			</div>
			<div class="basicInfoArea"><!-- 기본정보 영역 -->
				<table>
					<tr>
						<td>
							<label>* 호텔명</label>
						</td>
						<td class="secondBox">
							<input type="text" name="hname" id="hnameInput" class="inputBox">
						</td>
						<td>
							<label>* 대표자</label>
						</td>
						<td>
							<input type="text" name="owner" id="ownerInput" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 이메일</label>
						</td>
						<td class="secondBox">
							<input type="email" name="hemail" id="hemailInput" class="inputBox">
						</td>
						<td>
							<label>* 휴대폰</label>
						</td>
						<td>
							<input type="tel" name="hphone" id="hphoneInput" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>사업자 명</label>
						</td>
						<td class="secondBox">
							<input type="text" name="bizName" id="bizNameInput" class="inputBox">
						</td>
						<td>
							<label>사업자 번호</label>
						</td>
						<td>
							<input type="text" name="bizNo" id="bizNoInput" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>호텔 전화</label>
						</td>
						<td class="secondBox">
							<input type="tel" name="htel" id="htelInput" class="inputBox">
						</td>
					</tr>
				</table>
			</div><!-- 기본정보 영역 끝 -->
			<div>
				<h3 style="margin-left:30px; color:#060E33;">시스템 정보</h3>
			</div>
			<div class="systemInfoArea"><!-- systemInfoArea -->
				<table>
					<tr>
						<td>
							<label>* 입실시간</label>
						</td>
						<td>
							<select class="checkInTime" name="chkIn">
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
							<select class="checkOutTime" name="chkOut">
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
							<select class="rentedRoom" name="lentUnit">
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
							<input type="text" name="svcRate" id="svcRateInput" class="inputBox">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 자동 마감 시간</label>
						</td>
						<td>
							<input type="text" name="calTime" id="calTimeInput" class="inputBox">
						</td>
						<td>
							<label>* 부가세 구분</label>
						</td>
						<td>
							<select class="vatSelect" name="vatType">
								<option value="">== 선택 ==</option>
								<option value="Y">부가세 포함</option>
								<option value="N">부가세 미포함</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>* 호텔 정책</label>
						</td>
						<td colspan="3">
							<input type="tel" name="rcontent" class="inputBox hotelNotice">
						</td>
					</tr>
					<tr>
						<td>
							<label>* 노쇼 정책</label>
						</td>
						<td colspan="3">
							체크인 예정시간 
							<select class="checkInScheduledTime" style="width:100px;" name="nsUnit">
								<option value="">== 시간 ==</option>
								<option value="1">1시간</option>
								<option value="2">2시간</option>
								<option value="3">3시간</option>
								<option value="4">4시간</option>
								<option value="5">5시간</option>
								<option value="6">6시간</option>
							</select>
							후 까지 입실하지 않을 경우, <input type="text" style="width:100px;" name="nsRate" class="recInput"> % 의 수수료가 발생합니다.
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
							<div class="offSeason">
								<table>
									<tr>
										<td><b>주중</b> 2 일전</td>
										<td><input type="text" name="offSeasonWeek2" class="offSeasonWeek2" value="100" placeholder="100% 환불 / 이하는 불가능합니다"> % 환불</td>
										<td><b>주말</b> 2 일전</td>
										<td><input type="text" name="offSeasonWeekend2" class="offSeasonWeekend2" value="100" placeholder="100% 환불 / 이하는 불가능합니다"> % 환불</td>
									</tr>
									<tr>
										<td><b>주중</b> 1 일전</td>
										<td><input type="text" name="offSeasonWeek1" class="offSeasonWeek1" value="90" placeholder="90% 환불 / 이하는 불가능합니다"> % 환불</td>
										<td><b>주말</b> 1 일전</td>
										<td><input type="text" name="offSeasonWeekend1" class="offSeasonWeekend1" value="80" placeholder="80% 환불 / 이하는 불가능합니다"> % 환불</td>
									</tr>
									<tr>
										<td><b>주중</b> 당일</td>
										<td><input type="text" name="offSeasonWeek0" class="offSeasonWeek0" value="80" placeholder="80% 환불 / 이하는 불가능합니다"> % 환불</td>
										<td><b>주말</b> 당일</td>
										<td><input type="text" name="offSeasonWeekend0" class="offSeasonWeekend0" value="70" placeholder="70% 환불 /  이하는 불가능합니다"> % 환불</td>
									</tr>
								</table>
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
							<div class="peakSeason">
								<table>
									<tr>
										<td><b>주중</b> 10 일전</td>
										<td><input type="text" name="seasonWeek10" class="seasonWeek10" value="100" placeholder="100% 환불 / 이하는 불가능합니다"> % 환불</td>
										<td><b>주말</b> 10 일전</td>
										<td><input type="text" name="seasonWeekend10" class="seasonWeekend10" value="100" placeholder="100% 환불 / 이하는 불가능합니다"> % 환불</td>
									</tr>
									<tr>
										<td><b>주중</b> 7 일전</td>
										<td><input type="text" name="seasonWeek7" class="seasonWeek7" value="90" placeholder="90% 환불 / 이하는 불가능합니다"> % 환불</td>
										<td><b>주말</b> 7 일전</td>
										<td><input type="text" name="seasonWeekend7" class="seasonWeekend7" value="80" placeholder="80% 환불 / 이하는 불가능합니다"> % 환불</td>
									</tr>
									<tr>
										<td><b>주중</b> 5 일전</td>
										<td><input type="text" name="seasonWeek5" class="seasonWeek5" value="70" placeholder="70% 환불 / 이하는 불가능합니다"> % 환불</td>
										<td><b>주말</b> 5 일전</td>
										<td><input type="text" name="seasonWeekend5" class="seasonWeekend5" value="60" placeholder="60% 환불 / 이하는 불가능합니다"> % 환불</td>
									</tr>
									<tr>
										<td><b>주중</b> 3 일전</td>
										<td><input type="text" name="seasonWeek3" class="seasonWeek3" value="50" placeholder="50% 환불 / 이하는 불가능합니다"> % 환불</td>
										<td><b>주말</b> 3 일전</td>
										<td><input type="text" name="seasonWeekend3" class="seasonWeekend3" value="40" placeholder="40% 환불 / 이하는 불가능합니다"> % 환불</td>
									</tr>
									<tr>
										<td><b>주중</b> 1 일전</td>
										<td><input type="text" name="seasonWeek1" class="seasonWeek1" value="0" placeholder="0% 환불 / 환불 불가능합니다"> % 환불</td>
										<td><b>주말</b> 1 일전</td>
										<td><input type="text" name="seasonWeekend1" class="seasonWeekend1" value="0" placeholder="0% 환불 / 환불 불가능합니다"> % 환불</td>
									</tr>
									<tr>
										<td><b>주중</b> 당일</td>
										<td><input type="text" name="seasonWeek0" class="seasonWeek0" value="0" placeholder="0% 환불 / 환불 불가능합니다"> % 환불</td>
										<td><b>주말</b> 당일</td>
										<td><input type="text" name="seasonWeekend0" class="seasonWeekend0" value="0" placeholder="0% 환불 / 환불 불가능합니다"> % 환불</td>
									</tr>
								</table>
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
			<hr width="1250px" style="float: left;"><br>
				<div align="right" style="margin-right:40px;margin-bottom:20px;">
					<button type="submit" class="nextBtn" onclick="return goNextPage();"><b>다음</b></button>			
				</div>
		</div>
	</div>
	</form>
	<script type="text/javascript">
		function goNextPage(){

			if($("#hnameInput").val() == ""){
				
				alert("호텔명을 입력해주세요");
				$("#hnameInput").focus();
				$("#hnameInput").select();
				return false;
				
			}
			if($("#ownerInput").val() == ""){
				
				alert("대표자명을 입력해주세요");
				$("#ownerInput").focus();
				$("#ownerInput").select();
				return false;
			}
			if($("#hemailInput").val() == ""){
				
				alert("이메일을 입력해주세요");
				$("#hemailInput").focus();
				$("#hemailInput").select();
				return false;
			}
			if($("#hphoneInput").val() == ""){
				
				alert("휴대폰 번호를 입력해주세요");
				$("#hphoneInput").focus();
				$("#hphoneInput").select();
				return false;
			}
			if($("#bizNameInput").val() == ""){
				
				alert("사업자 명을 입력해주세요");
				$("#bizNameInput").focus();
				$("#bizNameInput").select();
				return false;
			}
			if($("#bizNoInput").val() == ""){
				
				alert("사업자 번호를 입력해주세요");
				$("#bizNoInput").focus();
				$("#bizNoInput").select();
				return false;
			}
			if($("#htelInput").val() == ""){
				
				alert("호텔 전화번호를 입력해주세요");
				$("#htelInput").focus();
				$("#htelInput").select();
				return false;
			}
			if($(".checkInTime").val() == ""){
				
				alert("입실 시간을 입력해주세요");
				return false;
			}
			if($(".checkOutTime").val() == ""){
				
				alert("퇴실 시간을 입력해주세요");
				return false;
			}
			if($(".rentedRoom").val() == ""){
				
				alert("대실 시간을 입력해주세요");
				return false;
			}
			// 정규식 필요
			if($("#svcRateInput").val() == ""){
				
				alert("봉사료율을 입력해주세요");
				return false;
			}
			// 정규식 필요
			if($("#calTimeInput").val() == ""){
				
				alert("자동마감시간을 입력해주세요");
				return false;
			}
			if($(".vatSelect").val() == ""){
				
				alert("부가세 구분을 선택해주세요.");
				return false;
			}
			if($(".hotelNotice").val() == ""){
				
				alert("호텔 정책을 입력해주세요.");
				return false;
			}
			if($(".checkInScheduledTime").val() == ""){
				
				alert("노쇼 정책을  확인해주세요.");
				return false;
			}
			if($(".recInput").val() == ""){
				
				alert("노쇼 정책을  확인해주세요.");
				return false;
			}
			
			return true;
			
		}
	</script>
</body>
</html>