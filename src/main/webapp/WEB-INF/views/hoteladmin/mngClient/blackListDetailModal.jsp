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
		z-index: 2;
	}
	
	.modal_content {
		position: absolute;
		left: 50%;
		top: 45%;
		transform: translate(-50%, -50%);
		width: 800px;
		height: 500px;
		max-height: 500px;
		background-color: white;
		overflow-y: auto;
	}
	
	.modal_content_real {
		width: 780px;
		height: 450px;
		margin: 0 auto;
		overflow: auto;
		display: inline-block;
	}
	
	.btn_close {
		position: absolute;
		top: -4%;
		left: 96.5%;
		font-size: 40px;
		float: right;
		color: darkgray;
	}
	
	.btn_close:hover {
		cursor: pointer;
	}
	.modalLeftArea{
		text-align:center;
	}
	.blackListInfo{
		padding-top:60px;
		padding-left:30px;
	}
	.modalRightArea{
		margin-top:45px;
		width:400px;
		height:220px;
		padding-top:40px;
	}
	.blackListInfoList{
		width:400px;
	}
	.blackListInfoListArea{
		width:400px;
		height:220px;
		border:1px solid lightgray;
		border-radius:10px;
	}
	.blackListInfoList th{
		height:30px;
		background-color:rgba(85, 115, 255, 0.24);
		color:black;
		font-size:10px;
	}
	.blackListModalTableArea{
		width:780px;
		height:450px;
	}
	.blackBtnGroup button{
		width:100px;
		height:30px;
		border:0;
		border-radius: 10px;
		
	}
</style>
</head>
<body>
	<div class="modalBlackListAdd">
		<div class="modal_content">
			<h3 style="margin:0 auto; background:#060E33; color:white;">블랙리스트 등록</h3>
			<a class="btn_close">×</a>
			<div class="modal_content_real">
			<div class="blackListModalTableArea">
				<table>
					<tr>
						<td>
							<div class="modalLeftArea">
								<table class="blackListInfo">
									<tr>
										<td>고객명</td>
										<td><input type="text" style="width:230px;"></td> 
									</tr>
									<tr>
										<td>사유</td>
										<td><textarea rows="8" cols="30" style="resize: none;"></textarea></td>
									</tr>
									<tr>
										<td>대응내용</td>
										<td><textarea rows="8" cols="30" style="resize: none;"></textarea></td>
									</tr>
								</table>
							</div>
						</td>
						<td>
							<div class="modalRightArea">
								<select>
									<option>==선택==</option>
									<option value="">고객명</option>
									<option value="">전화번호</option>
									<option value="">이메일</option>
								</select>
								<input type="text">
								<button>검색</button>
								<div class="blackListInfoListArea">
								<table class="blackListInfoList" border="1" style="border-collapse: collapse;">
									<tr>
										<th width="15%">고객번호</th>
										<th width="15%">이름</th>
										<th width="25%">전화번호</th>
										<th width="30%">이메일</th>
										<th width="15%">추가</th>
									</tr>
								</table>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			</div>
			<div align="center" class="blackBtnGroup" style="margin-top:-30px;">
				<button>취소</button>
				<button>등록</button>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".modalBlackListAdd").fadeOut();
			});
		});
	</script>
</body>
</html>