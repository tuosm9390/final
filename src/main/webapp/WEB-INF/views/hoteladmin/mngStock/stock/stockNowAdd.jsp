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
				<option value="default" hidden="hidden">대분류</option>
				<option value="select">직접입력</option>
				<option value="전자제품">전자제품</option>
			</select>
			<input type="text" class="categoryText" style="margin-left: 50px; height: 20px;" id="lcategoryText">
		</div>
		<div class="category" id="mcategory">
			<label style="margin-left: 50px;">중분류   :   </label>
			<select style="height: 27px; width:150px; margin-left: 50px;" id="mselect" name="mselect">
				<option value="default" hidden="hidden">중분류</option>
				<option value="select">직접입력</option>
				<option value="tv">tv</option>
			</select>
			<input type="text" class="categoryText" style="margin-left: 50px; height: 20px;" id="mcategoryText">
		</div>
		<div class="category" id="scategory">
			<label style="margin-left: 50px;">소분류   :   </label>
			<select style="height: 27px; width:150px; margin-left: 50px;" id="sselect" name="sselect">
				<option value="default" hidden="hidden">소분류</option>
				<option value="select">직접입력</option>
				<option value="36인치tv">36인치tv</option>
			</select>
			<input type="text" class="categoryText" style="margin-left: 50px; height: 20px;" id="scategoryText">
		</div>
		<div class="category" id="categoryType">
		<label style="margin-left: 65px;">구분     :   </label>
							<label style="margin-left: 55px;">비품</label><input type="radio" name="type" value="equip">
							<label style="margin-left: 20px;">소모품</label><input type="radio" name="type" value="cons">
				
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
		$("#scategoryText").hide();
	})
	
	$("#lselect").change(function(){
		if($(this).val()=="select"){
			$("#mselect").attr('disabled',true);
			$("#sselect").attr('disabled',true);
			$("#lcategoryText").show();
			$("#mcategoryText").show();
			$("#scategoryText").show();
		}else{
			$("#lcategoryText").hide();
			$("#mcategoryText").hide();
			$("#scategoryText").hide();
			$("#mselect").attr('disabled',false);
			$("#sselect").attr('disabled',false);
		}	
	})
	
	$("#mselect").change(function(){
		if($(this).val()=="select"){
			$("#sselect").attr('disabled',true);
			$("#mcategoryText").show();
		
			$("#scategoryText").show();
		}else{
			$("#mcategoryText").hide();
			$("#scategoryText").hide();
			$("#sselect").attr('disabled',false);
		}	
	})
	
	$("#sselect").change(function(){
		if($(this).val()=="select"){
			$("#scategoryText").show();
		}else{
			$("#scategoryText").hide();
		}	
	})
	
	$("#insertCategoryBtn").click(function(){
		$("#insertCategory").submit();
	})
	
</script>
</body>
</html>