 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매품의서</title>
</head>
<body> 
	<div id="divCustomWrapper" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">  <!-- Embededd Style이 적용받는 범위 입니다. 상단의 스타일은 이 요소 안에서만 동작합니다. --> 
<!-- 1. Title Section (start) : 문서제목이 작성되는 영역입니다.-->
<div id="titleSection" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 19pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">구 매 신 청 서</div><!-- 1. Title Section (end) --><!-- 2. Draft Section (Start) : 결재정보가 작성되는 영역입니다. -->
<div class="partition" id="draftSection" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><!-- 2.1 Drafter Information (Start) -->
<div class="left" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
<table style="width:250px; height: 120px;"><colgroup><col width="80"><col width="170"></colgroup>
	<tbody>
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
기 안 자
			</td>
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">기안자</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
		</tr>
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
소 속
			</td>
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">기안부서</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
		</tr>
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
기 안 일
			</td>
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDate}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">기안일</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
		</tr>
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
문서번호
			</td>
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:docNo}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item">문서번호</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
		</tr>
	</tbody>
</table>
</div><!-- 2.1 Drafter Information (end) --><!-- 2.2 Draft Line (start) -->
<div class="inaRowRight" style="width: 800px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><!-- 결재선 1 Start--><span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper=""><span class="sign_type1_inline" data-group-seq="0" data-group-name="기안" data-group-max-count="1" data-group-type="type1" data-is-reception="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><!-- 결재선 이름 --><span class="sign_tit_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_tit" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><strong>기안</strong></span></span><!-- 결재방 1EA Start --><span class="sign_member_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_member" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_rank_wrap test2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_rank" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span><span class="sign_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span><span class="sign_date_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_date" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span></span></span><!-- 결재방 1EA End--><!-- 휴지통 컴포넌트 Start--></span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span><span contenteditable="false" class="comp_hover" data-content-protect-cover="true"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><!-- 휴지통 컴포넌트 End--><!-- 결재선 1 End--><!-- 결재선 2 Start--><span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper=""><span class="sign_type1_inline" data-group-seq="1" data-group-name="승인" data-group-max-count="3" data-group-type="type1" data-is-reception="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><!-- 결재선 이름 --><span class="sign_tit_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_tit" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><strong>승인</strong></span></span><!-- 결재방 Start--><!-- 결재방 1EA Start --><span class="sign_member_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_member" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_rank_wrap test2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_rank" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span><span class="sign_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span><span class="sign_date_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_date" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span></span></span><!-- 결재방 1EA End--><!-- 결재방 1EA Start --><span class="sign_member_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_member" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_rank_wrap test2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_rank" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span><span class="sign_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span><span class="sign_date_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_date" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span></span></span><!-- 결재방 1EA End--><!-- 결재방 1EA Start --><span class="sign_member_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_member" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_rank_wrap test2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_rank" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span><span class="sign_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span><span class="sign_date_wrap" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_date" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></span></span></span><!-- 결재방 1EA End--><!-- 결재방 End--><!-- 휴지통 컴포넌트 Start--></span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span><span contenteditable="false" class="comp_hover" data-content-protect-cover="true"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><!-- 휴지통 컴포넌트 End--><!-- 결재선 2 End--></div><!-- 2.2 Draft Line (end) --></div><!-- 2. Draft Section (end) --><!-- 3. Detail Section (start) : 내용이 작성되는 영역입니다. -->
<table id="dynamic_table" class="detailSection"><colgroup><!-- ### 테이블의 컬럼 너비는 colGroup을 통해 지정합니다. td에 지정 X ### --><col width="200"><col width="80"><col width="60"><col width="100"><col width="100"><col width="260"></colgroup>
 
	<tbody>
<!--기본 행 추가/삭제 + 자동 연산-->
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
소속
			</td>
			<td colspan="3" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{text}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
작 성 자
			</td>
			<td colspan="1" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{text}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
		</tr>
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
제 목
			</td>
			<td colspan="5" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{text:subject}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
		</tr>
		<tr>
			<td colspan="6" style="border:none !important;" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
		</tr>
		<tr>
			<td colspan="6" class="viewModeHiddenPart td_button dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<a class="button" id="plus" data-bypass="">추가</a><a class="button" id="minus" data-bypass="">삭제</a>
			</td>
		</tr>
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
품 명
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
규 격
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
수 량
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
단 가
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				
금 액
			</td>
			<td colspan="1" class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
비 고
			</td>
		</tr>
		<tr class="copyRow">
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{text}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
			<td class="detailColumn amount rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="9" data-dsl="{{currency_0$width:49$}}" data-wrapper="" style="width: 49px;" data-value="" data-autotype=""><input class="ipt_editor ipt_editor_currency" type="text" style="width: 49px;"><span contenteditable="false" class="comp_active" "="" style="display: none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
			<td class="detailColumn price rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px; text-align: right;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="10" data-dsl="{{currency_0$width:89$}}" data-wrapper="" style="width: 89px;" data-value="" data-autotype=""><input class="ipt_editor ipt_editor_currency" type="text" style="width: 89px;"><span contenteditable="false" class="comp_active" "="" style="display: none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="10"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
			<td class="detailColumn cur rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px; text-align: right;"><br></p>
			</td>
			<td colspan="1" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="11" data-dsl="{{text}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="11"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
		</tr>
		<tr>
			<td colspan="1" style="text-align:center; font-weight:bold !important;" class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
합 계
			</td>
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
			<td class="detailColumn total_amount rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
			<td class="detailColumn total_price rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px; text-align: right;"><br></p>
			</td>
			<td class="detailColumn total_cur rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px; text-align: right;"><br></p>
			</td>
			<td colspan="1" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
		</tr>
		<tr>
			<td style="text-align:center; font-weight:bold !important;" class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
기 타
			</td>
			<td colspan="5" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="12" data-dsl="{{textarea}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype=""><textarea class="txta_editor"></textarea><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="12"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
		</tr><!-- 합계 행 End-->
	</tbody><!-- 3. Detail Section (end) --><!-- Page Wrapping (end) --><!--Style Start----------------------------------------><!-- Common style (Don't modify) --><style type="text/css">
/* 1. Essential style : 반드시 적용되어야 하는 스타일입니다. 문서작성 시, Sample에서 제거불가 한 스타일 */
#divCustomWrapper { word-break: break-all;  font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; width:800px !important; }
#divCustomWrapper * { max-width: 800px !important; }
/* (1) Section(제목, 결재선, 내용) */
#divCustomWrapper #titleSection,
#divCustomWrapper #draftSection,
#divCustomWrapper .detailSection { width:800px !important; clear:both; margin-top: 20px !important; vertical-align: middle; }
#divCustomWrapper #titleSection { text-align: center; font-size: 25px; font-weight: bold; margin-bottom: 30px !important; margin-top: 20px !important; }
#divCustomWrapper #draftSection { display: inline-block; }
#divCustomWrapper .detailSection > * { margin-bottom: 10px; }
/* (2) Table */
#divCustomWrapper table { border-collapse: collapse; word-break:break-all; }
</style><style type="text/css">
/* 2. Option style : 용도에 따라 적용합니다.*/
/* (1) Table option : 2Type(subject / detail), Affacted elements(td), Range('divCustomWrapper' 하단요소) */
#divCustomWrapper td.subjectColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 1px 3px 1px;/*top right bottom left*/}
#divCustomWrapper td.detailColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 5px 3px 5px; vertical-align: middle;/*top right bottom left*/ }
#divCustomWrapper td.detailColumn { text-align: left; }
#divCustomWrapper td.subjectColumn { background: rgb(221, 221, 221); font-weight: bold; text-align: center; vertical-align: middle; }
/* (2) detailColumn :  3Type(center / right / high), Affacted elements(All), Range('detailColumn' 하단요소) */
/* 설명 : detailColumn 커스텀 시 사용 */
/* 사용방법 : 번호와 중앙정렬 텍스트 작성 시 'centerCol' CLASS 적용, 숫자와 금액 작성 시 'rightCol' CLASS 적용,
   editor 작성 시 'editorCol' CLASS 적용, textarea 작성 시 'areaCol' CLASS 적용 */
#divCustomWrapper td.detailColumn.centerCol { text-align: center; }
#divCustomWrapper td.detailColumn.rightCol { text-align: right; }
#divCustomWrapper td.detailColumn.editorCol { height: 300px; vertical-align: top;}
#divCustomWrapper td.detailColumn.areaCol { height: 120px; vertical-align: top; }
/* (3) Partition option : 2Type (left / right), Affacted elements(div), Range('partition'div영역 하단요소) */
/* 설명 : 좌,우로 분할되는 레이아웃 작성시 사용, 1라인에 1개 요소만 배치(줄바뀜 동반) */
/* 사용방법 : 분할할 영역에 partition CLASS를 적용 -> 분할배치하고자하는 하위요소에 'left, right' CLASS 적용 */
#divCustomWrapper div.partition .left { display: inline-block; clear: left; float: left; }
#divCustomWrapper div.partition .right { display: inline-block; clear: right; float: right; }
/* (4) In a row option : 2Type(left / right), Affacted elements(All), Range('inaRowRight or inRowLeft'div영역 하단요소) */
/* 설명 : 좌,우 끝에 정렬되는 레이아웃 작성 시 사용, 1라인에 여러개 요소 배치, Partition option과 조합(줄바뀜 없이 배치) */
/* 사용방법 : 나란히 정렬하고자 하는 요소들을, 'in a row'div 영역 내에 배치 */
#divCustomWrapper div.inaRowRight { text-align: right; }
#divCustomWrapper div.inaRowLeft { text-align: left; }
/* (5) button :  2Type(td / div), Affacted elements(All) */
/* 설명 : 행 추가, 행 삭제 버튼 작성 시 'viewModeHiddenPart'(기안 시 버튼 가려주는 클래스)와 조합해서 사용 */
/* 사용방법 : 테이블에 한줄로 사용 시 td에 'viewModeHiddenPart .td_button' CLASS 적용 -> 각 버튼에 'button' CLASS 적용 td 내 텍스트 아래에 쓰이거나 테이블 밖에서 사용 시 div에 viewModeHiddenPart .div_button CLASS 적용 -> 각 버튼에 button CLASS 적용 */
#divCustomWrapper .td_button { word-break:break-all; padding: 3px; border: none; width: 800px; height: 22px; text-align: right; vertical-align: middle; }
#divCustomWrapper .div_button { word-break:break-all; padding: 3px; border: none; margin-top:2px; margin-bottom:2px; height: 22px; vertical-align: middle;}
#divCustomWrapper a.button { background: rgb(102, 102, 102); color: rgb(255, 255, 255); padding: 2px 5px; border-radius: 3px; margin-right: 0px; margin-left: 0px; font-size: 9pt !important; }
/* (6) p :  2Type(titleP / freeP), Affacted elements(All) */
/* 설명 : 테이블 별 소제목과 테이블 아래 설명 작성 시 사용*/
p.titleP{font-weight: bold; font-size: 12px; margin: 15px 1px 5px 5px;/*top right bottom left*/}
p.freeP{font-weight: normal; font-size: 12px; margin: 1px 1px 3px 5px;/*top right bottom left*/}
</style><!-- Common style (Don't modify) --><!-- Print style (Don't modify) --><style type="text/css">
/* 인쇄시에만 적용되는 스타일입니다. 순서대로 1.양식 인쇄 시 중앙으로 위치 2.테이블 테두리 고정 3.버튼 가리기 */
@media print {
.viewModeHiddenPart {display: none;}
h1, h2, h3, h4, h5, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, div,body { -webkit-print-color-adjust:exact; }}
</style><!-- Print style (Don't modify)--><style><!-- Custom style -->
/* 추가적인 스타일이 필요한 경우, 하단의 style에서 정의하여야 합니다. 상단의 Common style은 변경하지 않습니다. */
/* (스타일이 중복되는 경우, 기본적으로 하단에 작성한 style이 우선적으로 적용됩니다.) */
</style><!-- Custom style -->
</table>
</div>
<script>
var $ = require("jquery");
var app = require("app");
var Backbone = require("backbone");
var _ = require('underscore');


/* ------------------------------------------ PlusMinusRow.js Start ------------------------------------------ */

var PlusMinusRow = function (options) {
  // 사용자가 정의하지 않은 일부 옵션 변수의 기본값
  var defaults = {
    maxRow: 0,											// 행 추가 최대 개수 (0: 무제한)
    copyRowNoSize: 1									// 행 순번(No) 증가량
  };

  // 사용자가 정의할 수 있는 옵션 변수
  var options = {
    tableId: options.tableId,							// 행 추가/삭제 수행 테이블 id (*필수)

    plusBtnId: options.plusBtnId,						// 행 추가 버튼 id (*필수)
    minusBtnId: options.minusBtnId,						// 행 삭제 버튼 id (*필수)

    copyRowClass: options.copyRowClass,					// 복사할 행(tr)의 class (*필수)

    copyRowNoClass: options.copyRowNoClass,				// 순번(No) 열(td)의 class
    copyRowNoSize: options.copyRowNoSize,				// 순번(No) 증가량 :int

    maxRow: options.maxRow,								// 행 추가 최대 개수 :int
    maxNo: options.maxNo,								// 행 추가 최대 순번(No) :int

    rowspanClass: options.rowspanClass,					// 처리할 rowspan 속성이 있는 열(td)의 class

    plusRowCallback: options.plusRowCallback,			// 행 추가 콜백 함수명
    minusRowCallback: options.minusRowCallback			// 행 삭제 콜백 함수명
  };

  var settings = $.extend({}, defaults, options);


  // 행 추가 수행 횟수 계산 (순번 계산시 필요) - 문서 수정하는 경우 고려
  var plusCnt;

  if ($("#" + settings.tableId + " .copiedRow")[0] === undefined) {
    plusCnt = 1;
  }
  else {
    // 다중행일 경우 고려
    if (!$($("#" + settings.tableId + " ." + settings.copyRowClass + " td")[0]).attr("rowspan")) {
      plusCnt = $("#" + settings.tableId + " .copiedRow").length + 1;
    }
    else {
      var rowCnt = parseInt($($("#" + settings.tableId + " ." + settings.copyRowClass + " td")[0]).attr("rowspan"));
      plusCnt = ($("#" + settings.tableId + " .copiedRow").length + rowCnt) / rowCnt;
    }
  }


  // 행 추가 수행
  $("#" + settings.plusBtnId).on('click', function () {
    // 행 추가 최대수까지 or 무제한으로
    if ($("#" + settings.tableId + " ." + settings.copyRowClass).length + $("#" + settings.tableId + " .copiedRow").length < settings.maxRow || settings.maxRow == 0) {
      // 행 추가 최대 순번까지
      if (settings.maxNo !== undefined) {
        if (parseInt($("#" + settings.tableId + " ." + settings.copyRowNoClass + ":last").text()) < settings.maxNo) {
          plusRow();
          plusCnt++;
        }
      }
      else {
        plusRow();
        plusCnt++;
      }
    }
  });

  // 행 삭제 수행
  $("#" + settings.minusBtnId).on('click', minusRow);



  function plusRow() {
    var $tr = $("#" + settings.tableId + " ." + settings.copyRowClass).clone(true); // 추가할 행 복사 (이벤트도)

    // ① rowspan 처리 (optional)
    if ($("#" + settings.tableId + " ." + settings.rowspanClass)[0] !== undefined) {
      $.each($("#" + settings.tableId + " ." + settings.rowspanClass), function (k, v) {
        $(v).attr("rowspan", parseInt($(v).attr("rowspan")) + $tr.length);
      });

      $.each($tr.find("td[rowspan]"), function (k, v) {
        if ($(v).hasClass(settings.rowspanClass)) {
          $(v).remove();		// rowspan을 가진 행(td) 삭제
        }
      });
    }

    // ② 순번(No) 처리 - 순번 클래스가 한 행에 두 개 이상 있을 경우 고려 (optional)
    //    ex) 1  ...     2  ...             ex) 1  ...     1  ...
    //        3  ...     4  ...     or          2  ...     2  ...
    if ($("#" + settings.tableId + " ." + settings.copyRowNoClass)[0] !== undefined) {
      var copyRowNoCnt = $tr.find("." + settings.copyRowNoClass).length; // 한 행에 존재하는 순번 클래스의 수

      for (var i = 0; i < copyRowNoCnt; i++) {
        if (!$tr.find("." + settings.copyRowNoClass).attr('rowspan')) {
          var newNo = parseInt($($tr.find("." + settings.copyRowNoClass)[i]).text()) + settings.copyRowNoSize * plusCnt * $tr.length;
        }
        else {
          var newNo = parseInt($($tr.find("." + settings.copyRowNoClass)[i]).text()) + settings.copyRowNoSize * plusCnt;
        }

        $($tr.find("." + settings.copyRowNoClass)[i]).text(newNo);
      }
    }

    // ③ 복사행 class 재설정 및 컴포넌트 초기화
    var i = 1;		// 다중행 복사일 때 컴포넌트 name/id 처리시 필요. copiedRow의 수
    $.each($tr, function (k, v) {
      $(v).removeClass(settings.copyRowClass);
      $(v).addClass('copiedRow');

      initComponent($(v), i++);
    });

    // ④ 처리 완료된 복사행을 테이블에 추가 (마지막 행으로)
    if ($("#" + settings.tableId + " .copiedRow")[0] === undefined) {
      $("#" + settings.tableId + " ." + settings.copyRowClass + ":last").after($tr);
    }
    else {
      $("#" + settings.tableId + " .copiedRow:last").after($tr);
    }

    // ⑤ 행 추가 콜백 함수 실행
    if (typeof settings.plusRowCallback == 'function') {
      settings.plusRowCallback(this);
    }
  }



  function initComponent($tr, i) {
    var editorFormCnt = 1;		// 각 tr에 존재하는 컴포넌트 name/id 처리시 필요
    var radioName = "";			// radio 컴포넌트 name/id 처리시 필요
    var checkName = "";			// radio 컴포넌트 name/id 처리시 필요

    $.each($tr.find("td input"), function (k, v) {
      var componentType = $(v).attr("data-dsl");
      var componentId = $(v).attr("id");

      if (!(componentType.search("check") > -1) && !(componentType.search("radio") > -1)) {
        var newId =  settings.tableId+"_"+($("#" + settings.tableId).find(".copiedRow").length + i) + "_" + editorFormCnt;

        $(v).attr({name: newId, id: newId});
        $(v).val("");

        // currency 초기화
        if (componentType.search("currency") > -1) {
          var parseKey;
          componentType.replace(/{{([^}}]*)}}/g, function (m, key) {
            parseKey = key;
          });
          var precision = parseKey.split('_');

          $(v).inputmask({
            'alias': 'decimal',
            'groupSeparator': ',',
            'autoGroup': true,
            'digits': parseInt(precision[1] ? precision[1] : '0'),	// 소수점 처리 (ex. {{currency_3}}일 때)
            'allowMinus': true
          });
        }

        // calendar 초기화
        else if (componentType.search("calendar") > -1) {
          $(v).datepicker("destroy").removeClass('hasDatepicker');
          $(v).datepicker({
            dateFormat: "yy-mm-dd(D)",
            changeMonth: true,
            changeYear: true,
            yearSuffix: "",
          });
        }
      }

      // radio 초기화 - 기본 형식 고려: {{radio_A_B ...}} → editorForm_0_A, editorForm_0_B, ...
      else if (componentType.search("radio") > -1) {
        if ($(v).attr('name') == radioName) {
          editorFormCnt--;
        }
        else {
          radioName = $(v).attr('name');
        }

        var newName = settings.tableId+"_"+($("#" + settings.tableId).find(".copiedRow").length + i) + "_" + editorFormCnt;
        var newId = settings.tableId+"_"+($("#" + settings.tableId).find(".copiedRow").length + i) + "_" + editorFormCnt + "_" + componentId.split("_")[2];

        $(v).attr({name: newName, id: newId, checked: false});
      }

      // check 초기화 - 기본 형식 고려: {{check_A_B ...}} → editorForm_1_A, editorForm_1_B, ...
      else if (componentType.search("check") > -1) {
        var curCheckName = $(v).attr('name').split("_")[0] + "_" + $(v).attr('name').split("_")[1];

        if (curCheckName == checkName) {
          editorFormCnt--;
        }
        else {
          checkName = curCheckName;
        }

        var newId = settings.tableId+"_"+($("#" + settings.tableId).find(".copiedRow").length + i) + "_" + editorFormCnt + "_" + componentId.split("_")[2];

        $(v).attr({name: newId, id: newId, checked: false});
      }

      editorFormCnt++;
    });

    // select 초기화
    $.each($tr.find("td select"), function (k, v) {
      var componentName = $(v).attr("name");		// 기본 형식에서 id 속성이 존재하지 않으므로 name 값을 가져옴
      var newName = settings.tableId+"_"+($("#" + settings.tableId).find(".copiedRow").length + i) + "_" + editorFormCnt;

      $(v).attr({name: newName, id: newName});

      editorFormCnt++;
    });

    // textarea 초기화
    $.each($tr.find("td textarea"), function (k, v) {
      var componentId = $(v).attr("id");
      var newId = settings.tableId+"_"+($("#" + settings.tableId).find(".copiedRow").length + i) + "_" + editorFormCnt;

      $(v).attr({name: newId, id: newId});
      $(v).val("");

      editorFormCnt++;
    });

    // TODO : cOrg 초기화
    // TODO : cSum, rSum 초기화

    return $tr;
  }



  function minusRow() {
    // 추가된 행(copiedRow)이 존재하면
    if ($("#" + settings.tableId + " .copiedRow")[0] !== undefined) {
      // ① rowspan 처리 후 (optional)
      if ($("#" + settings.tableId + " ." + settings.rowspanClass)[0] !== undefined) {
        $.each($("#" + settings.tableId + " ." + settings.rowspanClass), function (k, v) {
          $(v).attr("rowspan", parseInt($(v).attr("rowspan")) - $("#" + settings.tableId + " ." + settings.copyRowClass).length);
        });
      }

      // ① 마지막 행(copiedRow) 삭제
      for (var i = 0; i < $('.' + settings.copyRowClass).length; i++) {
        $("#" + settings.tableId + " .copiedRow:last").remove();
      }

      plusCnt--;
    }

    // ② 행 삭제 콜백 함수 실행
    if (typeof settings.minusRowCallback == 'function') {
      settings.minusRowCallback(this);
    }
  }
};


var Integration = Backbone.View.extend({
		initialize : function(options){
			this.options = options || {};
			this.docModel = this.options.docModel;
			this.variables = this.options.variables;
			this.infoData = this.options.infoData;
		},
		render : function() {
			var self = this;
			$('.viewModeHiddenPart').show();
			$(".amount input").on("change",function(){self.calAmount();});
			$(".price input").on("change",function(){self.calAmount();});
			
			PlusMinusRow({
			        tableId : "dynamic_table",
			        plusBtnId : "plus",
			        minusBtnId : "minus",
			        copyRowClass : "copyRow",
			        minusRowCallback : function() {self.calAmount();},
			        plusRowCallback : function() {self.calAmount();}
			 });
		},
	    calAmount : function () {
	    	var self = this;
	    	var cur = 0; //금액
		    var total_amount = 0; 
		    var total_price = 0; 
			var total_cur = 0; 

			//수량, 단가, 금액 -> 합계
	    	$("#dynamic_table tr").each(function(i, e){
	    		 if ($(e).find('.amount')[0]) {
	    			var amount = parseFloat($(e).find('.amount input').val().replace(/\,/g,""));
	    			var price = parseFloat($(e).find('.price input').val().replace(/\,/g,""));
	    	
	    			if (isNaN(amount)) amount = 0;
	    			if (isNaN(price)) price = 0;
	    			
	    			cur = parseFloat((amount * price).toFixed(2));
	    			$(e).find(".cur").text(self._convertCurrencyFormat(cur));
	    			
	    			total_amount = parseFloat((total_amount + amount).toFixed(2));
					total_price = parseFloat((total_price + price).toFixed(2));
					total_cur = parseFloat((total_cur + cur).toFixed(2));
	    		}  
	    	});
	    	$(".total_amount").text(self._convertCurrencyFormat(total_amount));
	    	$(".total_price").text(self._convertCurrencyFormat(total_price));
	    	$(".total_cur").text(self._convertCurrencyFormat(total_cur));
	    },
		
	    _convertCurrencyFormat : function(value) { 	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");},
				
		renderViewMode : function(){$('.viewModeHiddenPart').hide();},
		onEditDocument : function(){this.render();},
		beforeSave :function() {$('.viewModeHiddenPart').hide();},
		afterSave :function() {$('.viewModeHiddenPart').hide();},
		validate :function() {return true;},getDocVariables : function(){}
	});
	return Integration;
</script>	
</body>
</html>