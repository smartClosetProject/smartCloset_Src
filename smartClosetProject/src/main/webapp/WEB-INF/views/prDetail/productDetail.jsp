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
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<style type="text/css">
			td{height:150px;}
			.height-btn{height:100px;}
		</style>
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
		<div class="container">
		<h2>상품 상세 페이지</h2>
			<table class="table table-boardered">
				<tr>
					<th class="col-md-2">상품 상세 번호</th>
					<th class="col-md-1">색상 이미지</th>
					<th class="col-md-2">색상</th>
					<th class="col-md-2">사이즈</th>
					<th class="col-md-1">재고</th>
					<th class="col-md-1">판매량</th>
				</tr>
				<c:choose>
					<c:when test="${not empty productDetail}">
						<c:forEach var="product" items="${productDetail}" varStatus="status">
							<tr>
								<td class="col-md-2">${product.pro_num}</td>
								<td class="col-md-1">${product.pro_colorImg}</td>
								<td class="col-md-2">${product.pro_color}</td>
								<td class="col-md-2">${product.pro_size}</td>
								<td class="col-md-1">${product.pro_stock}</td>
								<td class="col-md-1">
									<c:if test="${not empty board.b_thumb}">
										<img src="/uploadStorage/prDetail/thumb/${product.pr_thumb}">
									</c:if>
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
			</table>
			<div class="height-btn">
				<input type="button" id="prductList" class="btn btn-info btn-default" value="상품 리스트">
			</div>
		</div>
	</body>
</html>