<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title></title>
	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->

		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<style type="text/css">
			.col-sm-9{
				width: 100%;
			}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function () {
			$("#returnProduct").click(function () {
				var childWin = window.open("/aOrder/returnProDetailForm", "childWin", "width = 500, height = 500, top = 100, left = 200, location = no");
				
				childWin.document.od_num = $("#od_num");
			});
			$("#returnProductBtn").click(function () {
				
			});
			$("#goToProDetailBtn").click(function () {
				location.href="/aOrder/aOrderDetail";
			});

		})
		
		</script>
</head>
<body>
<form id="returnPro" name="returnPro" method="get" action="/aOrder/returnProDetailForm" target="subWin">
	<input type="hidden" id="od_num" name="od_num" />
	<input type="hidden" id="pr_num" name="pr_num" />
	
</form>
<div>

	<table class="table table-bordered">
	<c:choose>
		<c:when test="${not empty checkProduct}">
			<c:forEach var="returnPro" items="${returnProduct}" varStatus="status">
				<tr>
					<td rowspan="2">상품 정보</td>
					<td rowspan="2" colspan="2" style="width : 300px;">
						<p class="text-right"><input type="button" id="returnProduct" name="returnProduct" value="옵션 변경"/></p>
						<span style="font-weight : bold; font-size : 120%;">${returnPro.pr_name}</span><br>사이즈 : ${returnPro.pro_size}, 색상 : ${returnPro.pro_color}, 갯수 : ${returnPro.od_goodsCount}
										
					</td>
					<td colspan="2">상품 가격</td>
				</tr>
				<tr>
					<td colspan="2">${returnPro.od_totalPayment*returnPro.od_goodsCount} 원</td>
				</tr>
			</c:forEach>
		</c:when>
	</c:choose>
	</table>
</div>
<div>
 <input type="button" id="returnProductBtn" name="returnProductBtn" value="반품하기"/>
 <input type="button" id="goToProDetailBtn" name="goToProDetailBtn" value="취소"/>
</div>
</body>
</html>