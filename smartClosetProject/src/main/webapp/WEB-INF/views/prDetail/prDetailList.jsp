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
		<style type="text/css">
			.table-height{min-height:450px;  width:1600px;}
			.category select{width:150px; float: left; margin-right:30px;}
			.date input{width:370px; height:25px; margin-right: 30px; margin-top: 5px;}
			.issale{margin-right: 75px;}
			.height-btn{min-height:100px;}
			#searchData{height:35px;}
			#search{width:150px; margin-right: 30px; height:30px; margin-left: 20px;}
			#keyword{width:400px; margin-right: 30px; height:30px;}
			productSearch{width:800px;}
		</style>
		<script type="text/javascript">
			$(function () {
				let now= new Date();
				$("#lastDate").val(now);
				
				let outer=['자켓','코트','패딩','야상','집업'];
				let top = ['반팔','긴팔','셔츠','니트','맨투맨','후드'];
				let pants=['반바지','긴바지','청바지','면바지','슬랙스'];
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
					}else if($(this).val()=="가방/신발"){
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
					}else if($(this).val()=="전체"){
						option=$("<option>");
						option.attr("value","전체");
						option.append("전체");
						$("#pr_categorys").append(option);
					}
				})
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#pr_search").find("input[name='pageNum']").val($(this).attr("href"));
					$("#pr_search").attr({
						"method":"get",
						"action":"/prDetail/prDetailList"
					});
					$("#pr_search").submit();
				})
				$(".goDetail").click(function(){
					let pr_num=$(this).parents("tr").attr("data-num");
					$(".pr_num").val(pr_num);
					
					$("#detailProduct").attr({
						"method":"get",
						"action":"/prDetail/productDetail"
					})
					$("#detailProduct").submit();
				})
				$("#insertFormBtn").click(function(){
					location.href="/prDetail/writeForm";
				})
				$(".update").click(function(){
					let pr_num=$(this).parents("tr").attr("data-num");
					$(".pr_num").val(pr_num);
					$("#detailProduct").attr({
						"method":"post",
						"action":"/prDetail/listUpdate"
					})
					$("#detailProduct").submit();
				})
				$(".delete").click(function(){
					let pr_num=$(this).parents("tr").attr("data-num");
					$(".pr_num").val(pr_num);
					alert("해당 상품 번호에 속한 모든 상품이 삭제됩니다.")
					$("#detailProduct").attr({
						"method":"post",
						"action":"/prDetail/delete"
					})
					$("#detailProduct").submit();
				})
				$("#keyword").click(function(){
					$("#keyword").val("");
				})
				$("#search").change(function(){
					if($("#search").val()=="all"){
						$("#keyword").val("전체 데이터를 조회합니다.");
					}else if($("#search").val()!="all"){			
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				$("#searchData").click(function(){
					console.log($("#search").val())
					if($("#search").val()!="all"){
						if(!chkData("#keyword","검색어를"))return false;
					}
					$("#keyword").val($("#keyword").val().toUpperCase());
					if($("#search").val()=="all"){
						$("#keyword").val("");
					}
					$("#pr_search").attr({
						"method":"get",
						"action":"/prDetail/prDetailList"
					});
					$("#pr_search").submit();
					
				})
			})
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<h2>상품 리스트</h2>
			<div class="contentTit page-header">
				<div id="productSearch" class="text-right">
					<form id="pr_search" name="pr_seach" >
						<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
						<div class="form-group" >
							<label>검색 조건</label>
							<select id="search" name="search" >
								<option value="all">전체</option>
								<option value="pr_num">상품 번호</option>
								<option value="pr_name">상품명</option>
								<option value="pr_categoryl">카테고리(대)</option>
								<option value="pr_categorys">카테고리(소)</option>
							</select>
							<input type="text" id="keyword" name="keyword" value="검색어를 입력하세요" style="text-transform: uppercase;">
							<button type="button" class="btn btn-info btn-default" id="searchData">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="prDetailList" class="table-height">
			<form id="detailProduct">
				<input type="hidden" class="pr_num" name="pr_num" />
			</form>
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
										<button class="update" name="update">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
											  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
											  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
											</svg>
										</button>
										<button class="delete" name="delete">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
											  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
											  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
											</svg>
										</button>
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
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum ==num ? 'active':'' }">
							<a href = "${num}">${num}</a>
						</li>					
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href ="${pageMaker.endPage+1}">next</a>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="height-btn">
				<input type="button" value="등록" id="insertFormBtn" class="btn btn-info btn-default" />
			</div>
		</div>
	</body>
</html>