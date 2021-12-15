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
		
		<script type="text/javascript">
			$(function(){
				$("#prductList").click(function(){
					location.href="/prDetail/prDetailList" ;
				})
				$("#prInsert").click(function(){
					location.href="/prDetail/writeForm" ;
				})
			})
		</script>
	</head>
	<body>
		<div>
		<h2 style="color : #1A5276;"><strong>상품 상세 페이지</strong></h2>
			<table class="table table-boardered">
				<tr>
					<th class="col-md-2 text-center">상품 상세 번호</th>
					<th class="col-md-1 text-center">색상 이미지</th>
					<th class="col-md-2 text-center">색상</th>
					<th class="col-md-2 text-center">사이즈</th>
					<th class="col-md-1 text-center">재고</th>
					<th class="col-md-1 text-center">판매량</th>
				</tr>
				<c:choose>
					<c:when test="${not empty productDetail}">
						<c:forEach var="product" items="${productDetail}" varStatus="status">
							<tr>
								<td class="col-md-2 text-center">${product.pro_num}</td>
								<td class="col-md-1 text-center">
									<img src="/uploadStorage/warehousing/thumb/${product.pro_colorthumb}">
								</td>
								<td class="col-md-2 text-center">${product.pro_color}</td>
								<td class="col-md-2 text-center">${product.pro_size}</td>
								<td class="col-md-1 text-center">${product.pro_stock}</td>
								<td class="col-md-1 text-center">${product.pro_sales}</td>
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
			</table>
			<div>
				<input type="button" id="prductList" class="btn btn-default" value="상품 리스트">
			</div>
		</div>
	</body>
</html>