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
			.highlight1{
				width:150px;
				background-color:#F3F4F6; 
				color : black;
			}
		</style>
				
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function () {
			$(".returnProduct").click(function () {
				var od_num = $("#od_num").val($(this).data("num"));
				var order_num = $("#order_num").val();
				
				var pop = window.open("/aOrder/returnProDetailForm?od_num="+$("#od_num").val(), "childWin", "width = 500, height = 370, top = 100, left = 200, location = no , resizable=no");
				$("#test").val(od_num);


			});
			$("#returnProductBtn").click(function () {
				let order_state ="반품 중";
				console.log("pro_num : " + $("#pro_num").val())
				console.log("od_num : " + $("#od_num").val())
				console.log("order_num : " + $("#order_num").val())
				$("#order_state").val(order_state);
				$("#returnPro").attr({
					"method" : "get",
					"action" : "/aOrder/aOrderchangeRefundState"
				});
				$("#returnPro").submit();
				alert("반품이 완료되었습니다."); 
			});
			$("#goToProDetailBtn").click(function () {
				history.back();
			});

		})
		
		</script>
</head>
<body>

<h2 style="color : #1A5276;"><strong>주문 관리</strong></h2>
<br>
<div >
	<table class="table table-bordered">
	<c:choose>
		<c:when test="${not empty checkProduct}">
			<c:forEach var="returnPro" items="${returnProduct}" varStatus="status">
			<form id="returnPro" name="returnPro">
				<input type="hidden" id="order_num" name="order_num" value="${returnPro.order_num}"/>
				<input type="hidden" id="pro_num" name="pro_num" value="${returnPro.pro_num}"/>
				<input type="hidden" id="order_state" name="order_state"/>
				<input type="hidden" id="od_num" name="od_num" value="${returnPro.od_num}"/>
				<input type="hidden" id="pr_num" name="pr_num" value="${returnPro.pr_num}"/>
			</form>
				<tr data-num="${returnPro.od_num}">
					<td rowspan="2" class="highlight1">상품 정보</td>
					<td rowspan="2" colspan="2" style="width : 300px;" >
						<span style="font-weight : bold; font-size : 120%;">${returnPro.pr_name}</span><br>사이즈 : ${returnPro.pro_size}, 색상 : ${returnPro.pro_color}, 갯수 : ${returnPro.od_goodscount}
						<p class="text-right"><input type="button" id="returnProduct" name="returnProduct" class="returnProduct btn btn-default btn-sm" value="옵션 변경" data-num="${returnPro.od_num}"/></p>				
					</td>
					<td colspan="2" class="highlight1">상품 가격</td>
				</tr>
				<tr>
					<td colspan="2">${returnPro.pr_price*returnPro.od_goodscount} 원</td>
				</tr>
			</c:forEach>
		</c:when>
	</c:choose>
	</table>
</div>
<p>${msg}</p>
<div class="text-right">
 <input type="button" id="returnProductBtn" name="returnProductBtn" class="btn btn-default" value="반품" />
 <input type="button" id="goToProDetailBtn" name="goToProDetailBtn" class="btn btn-default" value="취소"/>
</div>
</body>
</html>