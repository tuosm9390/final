<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.modalState {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 2;
}
 
.modal_contentState {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
	width: 1200px;
	height:870px;
	max-height: 630px;
	background-color: white;
}

.modal_content_realState {
	width:130%;
	height:100%;
	margin:0 auto;
}



.btn_close:hover {
cursor: pointer;
}

.btn_close_plus {
   position: absolute;
   top: -1%;
   left: 95.5%;
   font-size: 40px;
   float: right;
   color: white;
}

.btn_close_plus:hover {
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
	<div class="modalState">
		<div class="modal_contentState">
			<div class="titleBarplus">
            <h2>물품상세</h2>
            <a class="btn_close_plus">×</a>
         </div>
			
			<div class="modal_content_realState">
				<jsp:include page="../stock/purchaseHisStatement.jsp"/>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close_plus").click(function() {
				$(".modalState").fadeOut();
			});
		});
	</script>
</body>
</html>