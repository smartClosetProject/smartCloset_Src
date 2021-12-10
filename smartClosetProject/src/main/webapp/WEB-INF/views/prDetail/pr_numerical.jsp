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
			.table-height{min-height:450px;  width:1600px;}
		</style>
	</head>
	<body>
		<div id="prNumericalList" class="table-height">
			<h2>상품 통계 페이지</h2>
			<form id="Numerical">
				<div class="contentTit page-header text-right">
					<select id="prNum" name="prNum">
						<option value="date">등록일</option>
						<option value="sales">판매량</option>
					</select>
					<button type="button" id="lineup" class="btn btn-info btn-default">정렬</button>
				</div>
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
								<tr class="text-center" data-num="${prNumerical.pro_num}">
									<td class="text-center">${prNumerical.pro_num}</td>
									<td class="text-center">${prNumerical.pr_name}</td>
									<td class="text-center">${prNumerical.pr_num}</td>
									<td class="text-center">${prNumerical.pro_size}</td>
									<td class="text-center">${prNumerical.pro_color}</td>
									<td class="text-center">${prNumerical.pro_stock}</td>
									<td class="text-center">${prNumerical.pro_sales}</td>
									<td>
										<button id="commit" name="commit">commit</button>
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
						<li class="paginate_button ${pageMaker.prvo.pageNum ==num ? 'active':'' }">
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