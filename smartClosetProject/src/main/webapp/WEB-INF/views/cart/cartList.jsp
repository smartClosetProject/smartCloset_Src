<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>title here</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			input[type=number] {
				width: 50px;
			}
			input[type=number]::-webkit-inner-spin-button, 
			input[type=number]::-webkit-outer-spin-button {  
   				opacity: 1;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				let totalPrice = 0; // 주문 금액
				let shipCharge = 2500; // 배송비
				
				// 주문 금액 처리
				$(".cartInfo").each(function() {
					let price = parseInt($(this).find("input[type='checkbox']").attr("data-prPrice"));
					let count = parseInt($(this).find("input[type='checkbox']").attr("data-goodsCount"));
					totalPrice += price * count;
				});
				
				// 배송비 처리
				if (totalPrice >= 50000) {
					shipCharge = 0;
				}
				
				// 금액 뷰단 입력
				$(".totalPrice").html(totalPrice.toLocaleString() + "원");
				$(".shipCharge").html(shipCharge.toLocaleString() + "원");
				$(".totalPayment").html((totalPrice + shipCharge).toLocaleString() + "원");
				
				// 수량 변경 처리(실패함) - 값이 변경되어있는 값이 아니라 기존 값으로 들어옴
				$(".modifyCountBtn").click(function() {
					let m_id = "${cartList[0].m_id }";
					let pro_num = $(this).attr("data-proNum");
					let proCount = parseInt($(this).); // attr이 아니라 이게 input의 바뀐 value를 가져 와야 함
					console.log(proCount);
					
					//console.log($("input[type='number']").val());
					/*if ($("input[type='number']").val() <= 0) {
						alert("0 이하의 수량으로는 변경할 수 없습니다.");
						return;
					}*/
					$.ajax({
						url : "/cart/modifyCount",
						type : "post",
						data : "m_id=" + m_id + "&pro_num=" + pro_num + "&cart_goodsCount=" + proCount,
						dataType : "text",
						error : function() {
							alert("시스템 오류입니다. 관리자에 문의하세요.");
						},
						success : function(result) {
							if (result == "success") {
								location.href = "/cart/cartList";
							} else {
								alert("변경에 실패했습니다. 다시 실행해 주세요.");
							}
						}
					});
				});
				
				// 전체 체크박스 선택 시 모두 선택
				$("#allCheck").click(function() {
					let chk = $("#allCheck").prop("checked");
					if (chk) {
						$(".chkBox").prop("checked", true);
					} else {
						$(".chkBox").prop("checked", false);
					}
				})
				
				// 개별 체크박스 선택 시 전체 체크박스 해제
				$(".chkBox").click(function() {
					$("#allCheck").prop("checked", false);
				});
				
				// 선택된 상품 삭제 처리
				$("#deleteSelectBtn").click(function() {
					let confirm_del = confirm("선택한 상품을 삭제하시겠습니까?");
					
					if (confirm_del) {
						let chkArr = new Array();
						
						$("input[class='chkBox']:checked").each(function() {
							chkArr.push($(this).attr("data-cartNum"));
						});
						
						$.ajax({
							url : "/cart/deleteSelectCart",
							type: "post",
							data : {chkBox : chkArr},
							dataType : "text",
							error : function() {
								alert("시스템 오류입니다. 관리자에 문의하세요.");
							},
							success : function(result) {
								if (result == "success") {
									location.href = "/cart/cartList";
								} else {
									alert("삭제에 실패했습니다. 다시 실행해 주세요.");
								}
							}
						});
					}
				});
				
				// 개별 상품 삭제 처리
				$(".deleteEachBtn").click(function() {
					let confirm_del = confirm("해당 상품을 삭제하시겠습니까?");
					
					if (confirm_del) {
						let chkArr = new Array();
						
						chkArr.push($(this).attr("data-cartNum"));
						
						$.ajax({
							url : "/cart/deleteSelectCart",
							type: "post",
							data : {chkBox : chkArr},
							dataType : "text",
							error : function() {
								alert("시스템 오류입니다. 관리자에 문의하세요.");
							},
							success : function(result) {
								if (result == "success") {
									location.href = "/cart/cartList";
								} else {
									alert("삭제에 실패했습니다. 다시 실행해 주세요.");
								}
							}
						})
					}
				});
				
				// 장바구니 비우기 처리
				$("#deleteAllBtn").click(function() {
					let confirm_del = confirm("장바구니를 비우시겠습니까?");
					
					if (confirm_del) {
						$("#deleteAllFrm").attr({
							"method" : "post",
							"action" : "/cart/deleteAllCart"
						});
						$("#deleteAllFrm").submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<form id="deleteAllFrm">
				<input type="hidden" name="m_id" value="${cartList[0].m_id }">
			</form>
			<form>
				<div class="text-center">
					<br><br><br><br>
					<h3>장바구니</h3>
				</div><br>
				
				<div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>
									<input type="checkbox" name="allCheck" id="allCheck">
								</th>
								<th class="text-center">이미지</th>
								<th class="text-center">상품</th>
								<th class="text-center">가격</th>
								<th class="text-center">수량</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty cartList }">
								<c:forEach var="cart" items="${cartList }" varStatus="status">
									<tr class="cartInfo">
										<td class="text-center">
											<input type="checkbox" name="chkBox" class="chkBox" data-cartNum="${cart.cart_num }" 
												data-prPrice="${cart.pr_price }" data-goodsCount="${cart.cart_goodsCount }">
										</td>
										<td class="text-center">${cart.pr_thumb }</td>
										<td class="text-center">
											<div>${cart.pr_name }</div>
											<div>[옵션: ${cart.pro_size } / ${cart.pro_color }]</div>
										</td>
										<td class="text-center pr_price" data-price="${cart.pr_price }">
											<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
												value="${cart.pr_price }" groupingUsed="true" />원
										</td>
										<td class="text-center" >
											<div>
												<input type="number" min="1" id="" value="${cart.cart_goodsCount }">
											</div>
											<div>
												<input type="button" data-proNum="${cart.pro_num }" class="modifyCountBtn" value="변경">
											</div>
										</td>
										<td class="text-center">
											<input type="button" class="deleteEachBtn" data-cartNum=${cart.cart_num } value="삭제">
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
							<tr>
								<td class="text-right" colspan="6">
									<div>
										상품 구매 금액 <span class="totalPrice"></span> + 
										배송비 <span class="shipCharge"></span> = <span class="totalPayment"></span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<input type="button" id="deleteSelectBtn" value="선택삭제">
					<input type="button" id="deleteAllBtn" value="장바구니 비우기">
				</div>
				<br><br><br>
				
				<div>
					<table class="table table-bordered">
						<tr>
							<th class="text-center">총 상품금액</th>
							<th class="text-center">배송비</th>
							<th class="text-center">결제 예정 금액</th>
						</tr>
						<tr>
							<td class="text-center totalPrice"></td>
							<td class="text-center shipCharge"></td>
							<td class="text-center totalPayment"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
		
		<div class="text-center">
			<input type="button" value="전체 상품 주문">
			<input type="button" value="선택 상품 주문">
		</div>
		
		<!-- <div>
			<img src="https://thumbs.gfycat.com/KindheartedWateryAfricanpiedkingfisher-size_restricted.gif">
		</div>
		<div>
			<img src="https://blog.kakaocdn.net/dn/mG2KK/btrgTDPvv8k/tkuWxvlKEDhCp5kbhecFpk/img.gif">
		</div> -->
	</body>
</html>