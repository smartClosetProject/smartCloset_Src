<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
		</style>
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<div class="container-fluid">
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
									<input type="checkbox">
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
							<c:when test="${ empty cartList }">
								<c:forEach var="cart" items="${cartList }" varStatus="status">
									<tr>
										<td class="text-center">
											<input type="checkbox">
										</td>
										<td class="text-center">${cart.pr_thumb }</td>
										<td class="text-center">
											<div>${cart.pr_name }</div>
											<div>[옵션: ${cart.pro_size } / ${cart.pro_color }]</div>
										</td>
										<td class="text-center">${cart.pr_price }</td>
										<td class="text-center">
											<div>
												<input type="number" value="${cart.cart_goodsCount }">
											</div>
											<div>
												<input type="button" value="변경">
											</div>
										</td>
										<td class="text-center">
											<input type="button" value="삭제">
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
										상품 구매 금액 <span></span>원 + 
										배송비 
										<c:if test="${totalprice >= 50000 }">
											<span>2500</span>
										</c:if>
										<c:if test="${totalprice < 50000 }">
											<span>0</span>
										</c:if>원
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<input type="button" value="삭제하기">
					<input type="button" value="장바구니 비우기">
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
							<td class="text-center">원</td>
							<td class="text-center">원</td>
							<td class="text-center">원</td>
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