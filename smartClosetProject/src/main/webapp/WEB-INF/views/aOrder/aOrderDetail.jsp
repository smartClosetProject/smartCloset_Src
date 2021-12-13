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
	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		let state = "";	
		$(function () {
			$(".stateBtn").click(function () {
				if(confirm("상태를 변경하시겠습니까?")){
					let order_state = $(this).val();
					console.log($(".stateBtn").val());
					$("#order_state").val(order_state);
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/aOrder/aOrderchangeState"
					});
					$("#detailForm").submit();
				} 
			})
			
			$("#refundStateBtn").click(function () {
				if(confirm("환불을 하시겠습니까?")){
					let order_state = $(this).val();
					$("#order_state").val(order_state);
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/aOrder/aOrderchangeRefundState"
					});
					$("#detailForm").submit();
					alert("환불이 완료되었습니다.")
				} 
			})
			
			
			$("#allCheck").click(function () {
				var chk = $("#allCheck").prop("checked");
				if(chk){
					$(".checkProduct").prop("checked", true);
				} else{
					$(".checkProduct").prop("checked", false);
				}
			})
			$(".checkProduct").click(function () {
				$("allCheck").prop("checked", false);
			})
			
			$("#returnStateBtn").click(function () {
		
					var chkArr = new Array();
					
					$("input[class='checkProduct']:checked").each(function () {
						chkArr.push($(this).attr("data-odnum"));
					});
					$("#checkProduct").val(chkArr);
					
					console.log($("#checkProduct").val(chkArr));
					
					$("#detailForm1").attr({
						"method" : "get",
						"action" : "/aOrder/aOrderReturnForm"
					});
					$("#detailForm1").submit();
			});
			
			
		});// 최종 $ 종료
		
		</script>
	</head>
	<body>
		<div class="contentContainer" style="padding-bottom : 100px">
			<form id="detailForm1">
				<input type="hidden" id="checkProduct" name="checkProduct">
				<!--  <input type="hidden" id="od_num" name="od_num" value="${aOrder.od_num}"> -->
			</form>
			<form id="detailForm">
				<input type="hidden" id="order_num" name="order_num" value="${aOrderDetail.order_num}">
				<input type="hidden" id="order_state" name="order_state">
			</form>
			<h2 style="color : #1A5276;"><strong>주문 관리</strong></h2>
			<br>
			<div class="container">
				<table class="table table-bordered">
					<tr>
						<td>주문 번호</td>
						<td>${aOrderDetail.order_num}</td>
						<td>주문 날짜</td>
						<td>${aOrderDetail.order_regdate}</td>
					</tr>
					<tr>
						<td style="width : 150px;">주문자 ID</td>
						<td>${aOrderDetail.m_id}</td>
						<td>전화번호</td>
						<td colspan="2">${aOrderDetail.order_phone}</td>
					</tr>
					<tr>
						<td>수령자 이름</td>
						<td colspan="4"> ${aOrderDetail.order_recipient}</td>
					</tr>
					<tr>
						<td>수령지</td>
						<td colspan="4">${aOrderDetail.order_addr}</td>
					</tr>
					<tr>
						<td>배송 요청</td>
						<td colspan="4">${aOrderDetail.order_shipmessage}</td>
					</tr>
					<tr>
						<td>완료 날짜</td>
						<td colspan="4">${aOrderDetail.order_deliverydate}</td>
					</tr>
					<tr>
						<td>환불 사유</td>
						<td colspan="4">${aOrderDetail.order_cancelReason}</td>
					</tr>
					<c:choose>
						<c:when test="${not empty aOrderProductDetail }">
							<c:forEach var="aOrder" items="${aOrderProductDetail }" varStatus="status">
								<tr>
									<td rowspan="2">상품 정보</td>
									<td rowspan="2" colspan="2" style="width : 300px;">
										<p class="text-right"><input type="checkbox" class="checkProduct" name="checkProduct" data-odnum="${aOrder.od_num}"/></p>
										<span style="font-weight : bold; font-size : 120%;">${aOrder.pr_name}</span><br>사이즈 : ${aOrder.pro_size}, 색상 : ${aOrder.pro_color}, 갯수 : ${aOrder.od_goodscount}
										
									</td>
									<td colspan="2">상품 가격</td>
								</tr>
								<tr>
									<td colspan="2">${aOrder.pr_totalprice} 원</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
					<tr>
						<td colspan="2">주문 상태(현 상태 : ${aOrderDetail.order_state})</td>
						<td colspan="2">총 가격</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="입금 전" id="beforePayStateBtn" name="beforePayStateBtn" class="stateBtn btn btn-default"/>
							<input type="button" value="결제 완료" id="completePayStateBtn" name="completePayStateBtn" class="stateBtn btn btn-default"/>
							<input type="button" value="배송 준비 중" id="readyDeliStateBtn" name="readyDeliStateBtn" class="stateBtn btn btn-default"/>
							<input type="button" value="배송 중" id="ingDeliStateBtn" name="ingDeliStateBtn"  class="stateBtn btn btn-default"/>
							<input type="button" value="배송 완료" id="completeDeliStateBtn" name="completeDeliStateBtn" class="stateBtn btn btn-default"/>
						</td>
						<td colspan="2">${aOrderDetail.order_totalPayment} 원</td>
					</tr>
				</table>
			</div>
			<div class="allCheck text-right">
				<input type="checkbox" name="allCheck" id="allCheck"  /><label style="margin-right : 160px;" for="allCheck">전체 선택</label> 
			</div>
			<div class="text-right">
				<input type="button" value="선택 반품" id="returnStateBtn" name="returnStateBtn" class="btn btn-default" data-odnum="${aOrder.od_num}" />
				<input type="button" value="전체 환불" id="refundStateBtn" name="refundStateBtn" class="btn btn-default" value="환불" data-odnum="${aOrder.od_num}" />
				<input type="button" value="목록" id="goToOrderListBtn" name="goToOrderListBtn" class="btn btn-default"/>
			</div>
		</div>
	</body>
</html>