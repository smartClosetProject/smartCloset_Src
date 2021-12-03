<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<title>상품 리스트</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<style type="text/css">
			.table-height{min-height:450px; padding-left: 270px; width:1700px;}
			.category select{width:150px; float: left; margin-right:30px;}
			.date input{width:380px; height:30px; margin-right: 30px; margin-top: 5px;}
			
		</style>
		<script type="text/javascript">
			$(function () {
				let outer=['자켓','코트','패딩','야상','집업'];
				let top = ['반팔','긴팔','셔츠','니트','맨투맨','후드'];
				let pants=['반바지','긴바지','청바지','면바지','슬랙스'];
				let bag = ['가방','신발'];
				let acc = ['벨트'	,'스카프'];
				
				$("#l_search").change(function(){
					$("#s_search").empty();
					if($(this).val()=="아우터"){
						for(i=0;i<outer.length;i++){
							option=$("<option>");
							option.attr("value",outer[i]);
							option.append(outer[i]);
							$("#s_search").append(option);
						}
					}else if($(this).val()=="상의"){
						for(i=0;i<top.length;i++){
							option=$("<option>");
							option.attr("value",top[i]);
							option.append(top[i]);
							$("#s_search").append(option);
						}
					}
				})
				$(".goDetail").click(function(){
					let pr_num=$(this).parents("tr").attr("data-num");
					$("#pr_num").val(pr_num);
					console.log("번호"+pr_num);
					
					$("#detailPr").attr({
						"method":"get",
						"action":"/prDetail/productDetail"
					})
					$("#detailPr").submit();
				})
				$("#insertFormBtn").click(function(){
					location.href="/prDetail/writeForm";
				})

			})
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<h2>상품 리스트</h2>
			<form id="detailPr">
				<input type="hidden" id="pr_num" name="pr_num" >
			</form>
			<div class="contentTit page-header">
				<div id="productSearch">
					<form id="pr_search" name="pr_seach" >
						<table>
							<tr>
								<th class="col-md-2">상품번호</th>
								<td class="col-md-3"><input type="text" id="pr_num" ><input type="hidden" value="pr_num"></td>
								<th class="col-md-2">카테고리</th>
								<td class="category col-md-6" >
									<div>
									<select id="l_search" name="l_search" class="form-control">
										<option value="전체">전체</option>
										<option value="아우터">아우터</option>
										<option value="상의">상의</option>
										<option value="하의">하의</option>
										<option value="가방/신발">가방,신발</option>
										<option value="액세서리">액세서리</option>
									</select>
									<select id="s_search" name="s_search" class="form-control">
										<option value="전체">전체</option>
									</select>
									</div>
								</td>
								<th rowspan="2"class="col-md-2">
									<button id="searchData" class="btn btn-info btn-default">검색</button>
								</th>
							</tr>
							<tr>
								<th class="col-md-2">상품명</th>
								<td class="col-md-3"><input type="text" id="pr_name"><input type="hidden" value="pr_name"></td>
								<th class="col-md-2">판매여부</th>
								<td class="col-md-6" class="issale">
									<input type="radio" name="pr_issale" value="all"><label>전체</label>
									<input type="radio" name="pr_issale" value="Y"><label>판매 중</label>
									<input type="radio" name="pr_issale" value="N"><label>판매 종료</label>
								</td>
							</tr>
							<tr>
								<th class="col-md-2">등록일</th>
								<td class="col-md-6" colspan="3">
									<div class="date">
										<input type="date" id="startDate"> 
										<input type="date" id="lastDate">
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="prDetailList" class="table-height">
			<table class="table">
				<thead>
					<tr>
						<th class="order text-center col-md-1">상품번호</th>
						<th class="text-center col-md-2">상품명</th>
						<th class="text-center col-md-2">카테고리</th>
						<th class="text-center col-md-1">사용</th>
						<th class="text-center col-md-1">판매가</th>
						<th class="order col-md-1">  </th>
					</tr>
				</thead>
				<tbody id="list" class="table-striped table-bordered">
					<c:choose>
						<c:when test="${not empty prDetailList}">
							<c:forEach var="prDetail" items="${prDetailList}" varStatus="status">
								<tr class="text-center" data-num="${prDetail.pr_num}">
									<td class="text-center">${prDetail.pr_num}</td>
									<td class="goDetail text-center">${prDetail.pr_name}</td>
									<td class="text-center">${prDetail.category}</td>
									<td>${prDetail.pr_issale}</td>
									<td>${prDetail.pr_price}</td>
									<td>
										<button id="move" name="move">이동</button>
										<button id="update" name="update">수정</button>
										<button id="delete" name="delete">삭제</button>
									</td>
								</tr>
							</c:forEach>	
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">
									등록된 물품이 없습니다.
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div>
				<input type="button" value="등록" id="insertFormBtn" class="btn btn-info btn-default" />
			</div>
		</div>
	</body>
</html>