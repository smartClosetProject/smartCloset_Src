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
		
		<link rel="shortcut icon" href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
		<style type="text/css">
			.contentBtn {
				min-height: 100px;
			}
			.container-fluid{
				padding-bottom: 50px !important;
			}
			.table{margin-top: 20px;}
			.pro{width: 75px;}
		</style>
		<script type="text/javascript">
			$(function(){
				$(".save").click(function(){
					
					let pro_num=$(this).parents("tr").attr("data-num");
					let pro_stock=$(this).parents("tr").find(".pro_stock").val();
					let pro_sales=$(this).parents("tr").find(".pro_sales").val();
					let pr_num=$(this).parents("tr").attr("data-pr_num");
					
					$("#pro_num").val(pro_num);
					$("#pro_stock").val(pro_stock);
					$("#pro_sales").val(pro_sales);
					$(".pr_num").val(pr_num);
					
					$("#updateNum").attr({
						"method":"post",
						"action":"/prDetail/updateStock"
					})
					$("#updateNum").submit();
				})
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#updateNum").find("input[name='pageNum']").val($(this).attr("href"));
					$("#updateNum").attr({
						"method":"get",
						"action":"/prDetail/pr_numerical"
					});
					$("#updateNum").submit();
				})
				$("#lineup").click(function(){
					let order=$("#odSelect").val();
					$("#orderOp").val(order);
					$("#orderby").attr({
						"method":"get",
						"action":"/prDetail/pr_numerical"
					});
					$("#orderby").submit();
				})
			})
			
		</script>
	</head>
	<body>
		<div id="prNumericalList">
			<h2 style="color : #1A5276;"><strong>상품 통계 페이지</strong></h2>
			<form id="orderby" class="form-inline">
				<input type="hidden" name="pr_num" class="pr_num">
				<input type="hidden" name="orderOp" id="orderOp">
				<span class="glyphicon glyphicon-search"></span>&nbsp;
				<div class="form-group">
					<select id="odSelect" name="order" class="form-control">
						<option value="date">등록일</option>
						<option value="sales">판매량</option>
					</select>
					<button type="button" id="lineup" class="btn btn-default">정렬</button>
				</div>
			</form>
			<form id="updateNum">
				<input type="hidden" name="pro_num" id="pro_num">
				<input type="hidden" name="pr_num" class="pr_num">
				<input type="hidden" name="pro_stock" id="pro_stock">
				<input type="hidden" name="pro_sales" id="pro_sales">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
			</form>
				<table class="table">
					<thead>
						<tr>
							<th class="order text-center col-md-1">상품상세번호</th>
							<th class="text-center col-md-2">상품명</th>
							<th class="text-center col-md-2">상품번호</th>
							<th class="text-center col-md-1">사이즈</th>
							<th class="text-center col-md-1">색상</th>
							<th class="text-center col-md-1">재고</th>
							<th class="text-center col-md-1">판매량</th>
							<th class="order col-md-1">  </th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped table-bordered">
						<c:choose>
							<c:when test="${not empty prNumericalList}">
								<c:forEach var="prNumerical" items="${prNumericalList}" varStatus="status">
									<tr class="text-center" data-num="${prNumerical.pro_num}" data-pr_num="${prNumerical.pr_num}">
										<td class="text-center">${prNumerical.pro_num}</td>
										<td class="text-center">${prNumerical.pr_name}</td>
										<td class="text-center" >${prNumerical.pr_num}</td>
										<td class="text-center">${prNumerical.pro_size}</td>
										<td class="text-center">${prNumerical.pro_color}</td>
										<td class="text-center"><input type="number" class="form-control pro"name="pro_stock" id="prnumberST" value="${prNumerical.pro_stock}"></td>
										<td class="text-center"><input type="number" class="form-control pro"name="pro_sales" id="prnumberSA" value="${prNumerical.pro_sales}"></td>
										<td>
											<button class="btn btn-default">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="14" fill="currentColor" class="bi bi-file-earmark-check-fill" viewBox="0 0 16 16">
											  		<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zm1.354 4.354-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708.708z"/>
												</svg>
											</button>
										</td>
									</tr>
								</c:forEach>	
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7">
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
		</div>
	</body>
</html>