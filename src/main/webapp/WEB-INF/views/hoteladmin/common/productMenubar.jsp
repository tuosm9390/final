<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.productMenubarArea{
		width:250px;
		height:800px;
		float:left;
		border-right-width:1px;
		border-right-style:solid;
		border-right-color:lightgray;
	}
	.productMenubar{
		list-style: none;
		padding-left:15px;
	}
	.productMenubar ul{
		padding-bottom:10px;
	}
	.productMenubar li{
		padding-bottom:20px;
	}
	.productMenubar li ul li{
		padding-bottom:10px;
		padding-left:30px;
	}
	.productMenubar label{
		padding-left:30px;
	}
	.productMenubar .company:hover{
		background:#C7C0C0;
	}
	.productMenubar .factory:hover{
		background:#C7C0C0;
	}
	.product li:hover{
		background:#C7C0C0;
		cursor:pointer;
	}
	section{
		padding-left:280px;
	}
</style>
</head>
<body>
<div class="productMenubarArea">
	<ul class="productMenubar">
		<li>
			<img alt="" src="${ contextPath }/resources/images/productMain.png" width="30px" height="30px" style="margin-right:10px;">물품관리
		<br>
		<br>
			<ul class="productMenubar subNavv product">
				<li class="stockNow"><img alt="" src="${ contextPath }/resources/images/productSub.png" width="30px" height="30px" style="margin-right:10px;">물품현황</li>
				<li class="purchaseHis"><img alt="" src="${ contextPath }/resources/images/productSub.png" width="30px" height="30px" style="margin-right:10px;">구매내역</li>
				<li class="stockHis"><img alt="" src="${ contextPath }/resources/images/productSub.png" width="30px" height="30px" style="margin-right:10px;">재고변동이력</li>
			</ul>
		</li>
		<li class="company account">
			<img alt="" src="${ contextPath }/resources/images/company.png" width="30px" height="30px" style="margin-right:10px;">거래처관리
		</li>
		<li class="factory warehouse">
			<img alt="" src="${ contextPath }/resources/images/factory.png" width="30px" height="30px" style="margin-right:10px;">창고관리
		</li>
	</ul>
</div>
<script>
		$(function(){
			$(".stockNow").click(function(){
				location.href='goStockNow.st';
			});
		});
		
		$(function(){
			$(".purchaseHis").click(function(){
				location.href='goPurchaseHis.st';
			});
		});
		
		$(function(){
			$(".stockHis").click(function(){
				location.href='goStockHis.st';
			});
		});
		
		$(function(){
			$(".account").click(function(){
				location.href='goAccount.st';
			});
		});
		
		$(function(){
			$(".warehouse").click(function(){
				location.href='goWarehouse.st';
			});
		});
</script>
</body>
</html>