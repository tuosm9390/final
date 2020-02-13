<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
<style>
.categoryTop{
margin-left: 5px;
margin-top: 16px;
border: 1px solid gray;
height: 350px;
}
.category{
margin-top: 50px;
margin-left: 50px;
}

</style>
</head>
<body>
	<header>
	</header>
	
	<div class=categoryTop>
	<form action="insertCategory.sto" method="post" id="insertCategory">
		<div class="category" id="lcategory">
			<label style="margin-left: 50px;">대분류   :   </label>
			<select style="height: 27px; width:150px; margin-left: 50px;" id="lselect" name="lselect">
				<option hidden="hidden">대분류</option>
				<option value="select">직접입력</option>
			</select>
			<input type="text" class="categoryText" style="margin-left: 50px; height: 20px;" id="lcategoryText">
		</div>
		<div class="category" id="mcategory">
			<label style="margin-left: 50px;">중분류   :   </label>
			<select style="height: 27px; width:150px; margin-left: 50px;" id="mselect" name="mselect">
				<option value="default" hidden="hidden">중분류</option>
				<option value="select">직접입력</option>
			</select>
			<input type="text" class="categoryText" style="margin-left: 50px; height: 20px;" id="mcategoryText">
		</div>
		<div class="category" id="scategory">
			<label style="margin-left: 50px;">소분류   :   </label>
		
			<input type="text" class="categoryText" style="margin-left: 50px; height: 20px; width: 146px;" id="scategoryText">
		</div>
		<div class="category" id="categoryType">
		<label style="margin-left: 65px;">구분     :   </label>
							<label for="EQUIP" style="margin-left: 55px;">비품</label><input id="EQUIP" type="radio" name="type" value="EQUIP" onclick="textChange(this.id)">
							<label for="CONS" style="margin-left: 20px;">소모품</label><input id="CONS" type="radio" name="type" value="CONS"  onclick="textChange(this.id)">
				
		</div>
		</form>
	</div>
	<div>
		<button id="insertCategoryBtn" style="float: right; margin-top: 20px;">저장</button>
	</div>
<script>



	$(function(){
		$("#lcategoryText").hide();
 		$("#mcategoryText").hide();
	})
	
	$("#lselect").change(function(){
		if($(this).val()=="select"){
			$("#mselect").attr('disabled',true);
			$("#lcategoryText").show();
			$("#mcategoryText").show();
		}else{
			$("#lcategoryText").hide();
			$("#lcategoryText").val("");
			$("#mcategoryText").hide();
			$("#mcategoryText").val("");
			$("#mselect").attr('disabled',false);
			category();
		}	
	})
	
	$("#mselect").change(function(){
		if($(this).val()=="select"){
			$("#mcategoryText").show();
			$("#scategoryText").show();
		}else{
			$("#mcategoryText").hide();
			$("#mcategoryText").val("");
		}	
	})
	
		var type;
		function textChange(thisEl) {
			console.log(thisEl);
			type = thisEl;
			console.log("type : " + type)
		}
	
	//물품등록 ajax
	$("#insertCategoryBtn").click(function(){
		
		
		var lcategory ="";
		var mcategory ="";
		var scategory =$("#scategoryText").val();
		
		console.log($("#lselect").val());
		console.log($("#select").val());
		
		//대분류에서 직접입력일떄
		if($("#lselect").val()=="select"){
			lcategory = $("#lcategoryText").val();
			mcategory = $("#mcategoryText").val();
		}else{
			lcategory = $("#lselect").val();
			mcategory = $("#mselect").val();
		}
		
		//중분류에서 직접입력일때
		if($("#mselect").val()=="select"){
			lcategory = $("#lselect").val();
			mcategory = $("#mcategoryText").val();
		}else{
			lcategory = $("#lselect").val();
			mcategory = $("#mselect").val();
		}
		var typee = type;
		console.log("out : " + type);
		
		if($("#lselect").val()==''){
			alert("입력되지 않았습니다.");
		}
		if($("#mselect").val()==''){
			alert("입력되지 않았습니다");
		}
	
		
		$.ajax({
			url:"insertCategory.sto",
			type:"post",
			data:{lcategory:lcategory,
				mcategory:mcategory,
				scategory:scategory,
				type:typee
			},
			success:function(data){
				console.log(data);
				alert("등록되었습니다.");
				location.reload(true);
			},error:function(status){
				console.log(status);
				alert("등록에 실패하셨습니다.");
			}
		});
		
	})
	
</script>
</body>
</html>