<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.modalz {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 3;
}

.modal_contentz {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
	width:460px;
	height:480px;
	max-height: 600px;
	background-color: white;
	overflow: hidden;
}

.modal_content_real {
	width:100%;
	height:100%;

	margin:0 auto;
	overflow: hidden;
}

.btn_close {
position: absolute;
top:-4%;
left:96.5%;
font-size:40px;
float: right;
color:darkgray;
}

.btn_close:hover {
cursor: pointer;
}
.btn_close_plusz {
   position: absolute;
   top: -1%;
   left: 92.5%;
   font-size: 40px;
   float: right;
   color: white;
}

.btn_close_plusz:hover {
   cursor: pointer;
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
</style>
</head>
<body>
	<div class="modalz">
		<div class="modal_contentz">
		<div class="titleBarplus">
            <h2>이체정보등록</h2>
            <a class="btn_close_plusz">×</a>
         </div>
			
			<div class="modal_content_real">
				<jsp:include page="../account/accountDetailEnroll.jsp"/>
				
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close_plusz").click(function() {
				$(".modalz").fadeOut();
			});
		});
	</script>
</body>
</html>