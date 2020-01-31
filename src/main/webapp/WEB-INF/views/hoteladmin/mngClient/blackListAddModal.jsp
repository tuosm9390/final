<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.modalBlackListAdd {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 5;
}

.modal_content {
	position: absolute;
	left: 47%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 740px;
	height: 540px;
	max-height: 500px;
	background-color: white;
}

.modal_content_real {
	margin-top: 10px;
	width: 740px;
	height: 440px;
}

.titleBarplus {
	padding-top: 10px;
	padding-bottom: 10px;
	color: white;
	background-color: royalblue;
}

.titleBarplus h2 {
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 10px;
}

.btn_close {
	position: absolute;
	top: -1%;
	left: 95.5%;
	font-size: 40px;
	float: right;
	color: white;
}

.btn_close:hover {
	cursor: pointer;
}

.modalLeftArea {
	text-align: center;
}

.blackListInfo {
	padding-top: 10px;
	padding-left: 30px;
}

.modalRightArea {
	margin-top: 45px;
	width: 400px;
	height: 220px;
	padding-top: 40px;
}

.blackListInfoList {
	width: 400px;
}

.blackListInfoListArea {
	width: 400px;
	height: 220px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

.blackListInfoList th {
	height: 30px;
	background-color: rgba(85, 115, 255, 0.24);
	color: black;
	font-size: 10px;
}

.blackListModalTableArea {
	width: 740px;
	height: 380px;
}

.blackBtnGroup {
	margin-left: 350px;
}
#cancelBtn {
	width: 100px;
	height: 25px;
	border: 0;
	border-radius: 2px;
	background-color: darkgray;
}
#okBtn {
	width: 100px;
	height: 25px;
	border: 0;
	border-radius: 2px;
	background-color: royalblue;
	color: white;
}

.blackListInfo td {
	padding: 10px;
	font-weight: bold;
}
.findClientList {
	width: 234px;
	height: 85px;
	position: fixed;
	background-color: #E4E2E2;
	margin-top: 3px;
	max-height: 85px;
	overflow-y: auto;
	overflow-x: hidden;
	text-align:left;
}
.findClientPer {
	font-size: 14px;
	margin-left: 10px;
	width: 220px;
	overflow-x: hidden;
	background-color: none;
}

.findClientPer:hover {
	cursor: pointer;
	background-color: darkgray;
}
</style>
</head>
<body>
	<div class="modalBlackListAdd">
		<div class="modal_content">
			<div class="titleBarplus">
				<h2>블랙리스트 등록</h2>
				<a class="btn_close">×</a>
			</div>
			<form action="addBlackList.cl" method="post">
			<div class="modal_content_real">
			<div class="blackListModalTableArea">
				<table>
					<tr>
						<td>
							<div class="modalLeftArea">
								<table class="blackListInfo">
									<tr>
										<td>고객명</td>
										<td><input autocomplete="off" type="text" style="width:210px;" class="blackListName" name="blackListName"><div class="findClientList"></div></td> 
										<td>연락처<input type="hidden" value="" class="blackListMno" name="blackListMno"></td>
										<td><input type="text" style="width:210px;" class="blackListPhone" name="blackListPhone"></td> 
									</tr>
									<tr>
										<td>사유</td>
										<td colspan="3"><textarea rows="8" cols="70" style="resize: none;" class="blackListContent" name="blackListContent"></textarea></td>
									</tr>
									<tr>
										<td>대응내용</td>
										<td colspan="3"><textarea rows="8" cols="70" style="resize: none;" class="blackListRes" name="blackListRes"></textarea></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
				<div align="center" class="blackBtnGroup">
					<button type="reset" id="cancelBtn" onclick="closeBtn();">취소</button>
					<button id="okBtn" onclick="return appendblackList();">등록</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	<script>
	function closeBtn(){
		$(".modalBlackListAdd").fadeOut();
	}
	$(function(){
		$(".btn_close").click(function() {
			$(".modalBlackListAdd").fadeOut();
		});
			
		$(".findClientList").hide();
			
		$(".blackListName").keyup(function(){
				
			var searchName = $(this).val();
				
			$.ajax({
				url:"ajxFindClient.ro",
				data:{searchName:searchName},
				type:"post",
				success:function(data){
					clientList = data.clientList;
					if(clientList.length == 0) {
						$(".findClientList").hide();
						$(".findClientList div").remove();
					} else {
						for(var i = 0; i < clientList.length; i++) {
							$infoClient = "<div class='findClientPer' id='per" + clientList[i].mno + "' onclick='findClientClk(this.id);' value='"+clientList[i].mno+"'><input type='hidden' value='"+clientList[i].mno+"' class='mno'>" + clientList[i].userName + " | " + clientList[i].phone + "</div>";
							$(".findClientList").append($infoClient);
							
						}
						$(".findClientList").show();
					}
				},
				error:function(error, status){
					alert("SYSTEM ERROR!");
				}
			});
		}).keydown(function(){
			$(".findClientList").hide();
			$(".findClientList div").remove();
		});;
	});
	function appendblackList(){
		console.log($(".blackListMno").val());
		if($(".blackListName").val() == ""){
			alert("고객을 선택해주세요");
			return false;
		}
		if($(".blackListContent").val() == ""){
			alert("사유를 입력해주세요.");
			return false;
		}
		if($(".blackListRes").val() == ""){
			alert("대응내용을 입력해주세요.");
			return false;
		}
		if($(".blackListMno").val() == ""){
			return false;
		}
			
		return true;
	}
	</script>
</body>
</html>