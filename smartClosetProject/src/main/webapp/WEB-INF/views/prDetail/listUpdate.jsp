<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
     	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>Insert title here</title>
		
		<link rel="shortcut icon" href="../image/icon.png" />
     	<link rel="apple-touch-icon" href="../image/icon.png" />
	<style type="text/css">
			input[type=text]{width:250px; height: 25px;}
			select{width:250px; height: 25px;}
			.insert{width:900px;}
			#img{width: 400px;}
			td, th{height: 30px;}
			input[type=file]{margin-top: 20px; margin-bottom: 20px;}
/* 			img{margin-top: 20px; margin-bottom: 20px;} */
		</style>
		<script type="text/javascript">
		$(function(){
			let outer=['자켓','코트','패딩','야상','집업'];
			let top = ['반팔','긴팔','셔츠','니트','맨투맨','후드티'];
			let pants=['반바지','청바지','면바지','슬랙스'];
			let bag = ['가방','신발'];
			let acc = ['벨트'	,'스카프'];
			
			$("#pr_categoryl").click(function(){
				$("#pr_categorys").empty();
				if($(this).val()=="아우터"){
					for(i=0;i<outer.length;i++){
						option=$("<option>");
						option.attr("value",outer[i]);
						option.append(outer[i]);
						$("#pr_categorys").append(option);
					}
				}else if($(this).val()=="상의"){
					for(i=0;i<top.length;i++){
						option=$("<option>");
						option.attr("value",top[i]);
						option.append(top[i]);
						$("#pr_categorys").append(option);
					}
				}else if($(this).val()=="하의"){
					for(i=0;i<pants.length;i++){
						option=$("<option>");
						option.attr("value",pants[i]);
						option.append(pants[i]);
						$("#pr_categorys").append(option);
					}
				}else if($(this).val()=="가방신발"){
					for(i=0;i<bag.length;i++){
						option=$("<option>");
						option.attr("value",bag[i]);
						option.append(bag[i]);
						$("#pr_categorys").append(option);
					}
				}else if($(this).val()=="액세서리"){
					for(i=0;i<acc.length;i++){
						option=$("<option>");
						option.attr("value",acc[i]);
						option.append(acc[i]);
						$("#pr_categorys").append(option);
					}
				}
			})	
			$("#updateBtn").click(function() {
				$("#updateForm").attr({
					"method":"post",
					"enctype":"multipart/form-data",
					"action":"/prDetail/updateForm"
				})
				$("#updateForm").submit();
			})	
			$("#prductList").click(function(){
				location.href="/prDetail/prDetailList" ;
			})
			$("#pr_season").val("${updateData.pr_season}").prop("selected",true);
			$("#pr_categoryl").val("${updateData.pr_categoryl}").prop("selected",true);
		})
		
		</script>
	</head>
	<body>
		<div class="container">
		<h2>상품 입력 페이지</h2>
			<form id="updateForm">
				<input type="hidden" name="pr_num" id="pr_num" value="${updateData.pr_num}">
				<input type="hidden" name="pr_mainimg" id="pr_mainimg" value="${updateData.pr_mainimg }">
				<input type="hidden" name="pr_contentimg" id="pr_contentimg" value="${updateData.pr_contentimg }">
				<input type="hidden" name="pr_thumb" id="pr_thumb" value="${updateData.pr_thumb}">
				<div class="form-group">
					<button type="button" class="btn btn-success" id="updateBtn">저장</button>
					<input type="button" class="btn btn-success" id="prductList" value="상품 리스트">
					<table class="table-bordered insert">
						<tr>
							<th class="col-md-2">상품 번호</th>
							<td colspan="3" class="col-md-1">
							 	${updateData.pr_num}
							</td>
						</tr>
						<tr>
							<th class="col-md-2">판매가</th>
							<td class="col-md-1"><input type="text" name="pr_price" id="pr_price" value="${updateData.pr_price}"></td>
							<th class="col-md-2">판매 여부</th>
							<td class="col-md-1" id="pr_issale">
								<input type="radio" name="pr_issale" value="Y" checked="checked"/> <label>Y</label>
								<input type="radio" name="pr_issale" value="N"/> <label>N</label>
							</td>
						</tr>
						<tr>
							<th class="col-md-2">상품명</th>
							<td class="col-md-1"><input type="text" name="pr_name" id="pr_name" value="${updateData.pr_name}"></td>
							<th class="col-md-2">계절</th>
							<td class="col-md-1">
								<select id="pr_season" name="pr_season">
									<option value="봄">봄</option>
									<option value="여름">여름</option>
									<option value="가을">가을</option>
									<option value="겨울">겨울</option>
								</select>
							</td>
						</tr>
						<tr>
							<th class="col-md-2">카테고리(대분류)</th>
							<td class="col-md-1">
								<select id="pr_categoryl" name="pr_categoryl" >
									<option value="상의">상의</option>
									<option value="하의">하의</option>
									<option value="아우터">아우터</option>
									<option value="가방신발">가방&신발</option>
									<option value="액세서리">액세서리</option>
								</select>
							</td>
							<th class="col-md-2">카테고리(소분류)</th>
							<td class="col-md-1">
								<select id="pr_categorys" name="pr_categorys">
									<option value="반팔">반팔</option>
									<option value="긴팔">긴팔</option>
									<option value="셔츠">셔츠</option>
									<option value="니트">니트</option>
									<option value="맨투맨">맨투맨</option>
									<option value="후드티">후드티</option>
								</select>
							</td>
						</tr>
						<tr>
							<th class="col-md-2">대표 이미지</th>
							<td colspan="3" class="col-md-1">
							<input  type="file" name=file id="file"/>
								<img src="/uploadStorage/prDetail/${updateData.pr_mainimg}">
							</td>
						</tr>
						<tr>
							<th class="col-md-2">내용 이미지</th>
							<td colspan="3" class="col-md-1"><input  type="file" name="file1" id="file1" />
								<img id="img" src="/uploadStorage/prDetail/${updateData.pr_contentimg}">
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</body>
</html>