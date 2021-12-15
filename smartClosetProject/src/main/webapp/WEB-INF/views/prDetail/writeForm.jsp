<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<title>Insert title here</title>
		
		
		<link rel="shortcut icon" href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
		<style type="text/css">
			.highlight1
			{	width:120px;
				background-color:#A4AFBC; 
				color : white;
			}
			.write{width: 80%;}
			#insertBtn{margin-top: 20px;}
			#prductList{margin-top: 20px;}
			.pr_issale{margin-right: 40px;}
			input[name=pr_issale]{margin-left: 40px;}
			#pr_issale{text-align: center;}
		</style>
		<script type="text/javascript">
		$(function(){
			let outer=['자켓','코트','패딩','야상','집업'];
			let top = ['반팔','긴팔','셔츠','니트','맨투맨','후드티'];
			let pants=['반바지','청바지','면바지','슬랙스'];
			let bag = ['가방','신발'];
			let acc = ['벨트'	,'스카프'];
			
			$("#pr_categoryl").change(function(){
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
			$("#insertBtn").click(function() {
				if(!chkData("#pr_price","판매가를"))return false;
				if(!chkData("#pr_name","상품명을"))return false;
				if(!chkData("#file","대표 이미지를"))return false;
				if(!chkData("#file1","내용이미지를"))return false;
				
				$("#insertForm").attr({
					"method":"post",
					"enctype":"multipart/form-data",
					"action":"/prDetail/prDetailInsert"
				})
				$("#insertForm").submit();
			})	
			$("#prductList").click(function(){
				location.href="/prDetail/prDetailList" ;
			})
		})
		
		</script>
	</head>
	<body>
		<div >
		<h2 style="color : #1A5276;"><strong>상품 입력 페이지</strong></h2>
			<form id="insertForm">
				<div class="form-group" id="text">
					<table class="table-bordered write">
						<tr>
							<td class="  highlight1 col-md-5">판매가</td>
							<td><input type="text" name="pr_price" id="pr_price" class="form-control"></td>
							<td class="  highlight1 col-md-5">판매 여부</td>
							<td id="pr_issale">
								<input type="radio" name="pr_issale" value="Y" checked="checked" /> <label class="pr_issale">Y</label>
								<input type="radio" name="pr_issale" value="N"/> <label  class="pr_issale">N</label>
							</td>
						</tr>
						<tr>
							<td class="  highlight1 col-md-5">상품명</td>
							<td ><input type="text" name="pr_name" id="pr_name" class="form-control"></td>
							<td class="  highlight1 col-md-5">계절</td>
							<td >
								<select id="pr_season" name="pr_season" class="form-control">
									<option value="봄">봄</option>
									<option value="여름">여름</option>
									<option value="가을">가을</option>
									<option value="겨울">겨울</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="  highlight1 col-md-5">카테고리<br>(대분류)</td>
							<td >
								<select id="pr_categoryl" name="pr_categoryl" class="form-control">
									<option value="상의">상의</option>
									<option value="하의">하의</option>
									<option value="아우터">아우터</option>
									<option value="가방신발">가방&신발</option>
									<option value="액세서리">액세서리</option>
								</select>
							</td>
							<td class=" highlight1 col-md-5">카테고리<br>(소분류)</td>
							<td >
								<select id="pr_categorys" name="pr_categorys" class="form-control">
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
							<td class="  highlight1 col-md-5">대표 이미지</td>
							<td colspan="3"><input  type="file" name="file" id="file" class="form-control"/></td>
						</tr>
						<tr>
							<td class=" highlight1 col-md-5">내용 이미지</td>
							<td colspan="3"><input  type="file" name="file1" id="file1" class="form-control"/></td>
						</tr>
					</table>
					<button type="button" class="btn btn-default" id="insertBtn">저장</button>
					<input type="button" class="btn btn-default" id="prductList" value="상품 리스트">
				</div>
			</form>
		</div>
	</body>
</html>