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
		
		<title></title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			nav span {
				font-size: 20px;
			}
			#Main {
				font-size: 35px;
				margin-left: 300px;
				margin-right: 300px;
			}
			form {
				margin-top: 64px;
			}
			.header {
				background-color: black;
				line-height: 200px;
			}
			.header h3 {
				color: white;
				text-align: center;
				vertical-align: middle;
				padding: 10px;
			}
			.info div input, label, mile {
				font-size: 17px;
			}
			.box {
				margin-left: 31px;
				margin-bottom: 10px;
			}
			.star {
				color: blue;
				font-size: 17px;
			}
			.msg {
				margin-left: 13px;
			}
			.mile {
				margin-bottom: 4px;
			}
			.mileApply {
				background-color: #CBDDF5;
				line-height: 56px;
			}
			.mileApply span {
				font-size: 20px;
			}
			.applyMile1 {
				margin-left: 30px;
			}
			.applyMile2 {
				margin-left: 700px;
			}
			.n {
				width: 150px;
				margin-left: 40px;
			}
			.v {
				width: 630px;
				text-align: right;
			}
			th {
				background-color: #E2E2E2;
			}
			th label {
				padding-left: 20px;
			}
			td span {
				margin-left: 100px;
				margin-right: 100px;
			}
			#allAgreelabel {
				font-size: 22px;
			}
			a:link, a:visited, a:active {
				text-decoration: none;
				color: white;
			}
			a:hover {
				text-decoration: none;
				font-weight: bold;
			}
		</style>
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<form class="form-horizontal">
			<div class="header">
				<h3>주문/결제</h3>
			</div>
			<div class="title">
				<h3>배송지</h3><hr>
			</div>
			<div class="box">
				<input type="checkbox" name="isEqual" id="isEqual" value="equal">
				<label>&nbsp;회원 정보와 동일</label>
			</div>
			<div class="info form-group">
				<div class="form-group">
					<label for="m_name" class="col-sm-2 control-label">받는 사람<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="text" name="m_name" id="m_name" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="m_addr" class="col-sm-2 control-label">주소<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="text" name="m_addr" id="m_addr" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="m_phone" class="col-sm-2 control-label">휴대전화<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="text" name="m_phone" id="m_phone" class="form-control" placeholder="010-0000-0000">
					</div>
				</div>
				<div class="form-group">
					<label for="m_phone" class="col-sm-2 control-label">이메일<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="email" name="m_phone" id="m_phone" class="form-control" placeholder="SmartCloset@example.com">
					</div>
				</div>
				<div class="text-center col-sm-10">
					<select class="form-control msg">
						<option value="">-- 메시지 선택 (선택사항)</option>
						<option value="배송 전에 미리 연락바랍니다.">배송 전에 미리 연락바랍니다.</option>
						<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
						<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
						<option value="">직접 입력</option>
					</select>
				</div><br>

			</div>
			<div class="title">
				<hr><h3>할인/부가결제</h3><hr>
			</div>
			<div class="mile">
				<span class="text-left">적립금 (사용가능: 
				<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
					value="${order.m_mile }" groupingUsed="true" />원)</span>
			</div>
			<div>
				<input type="number" name="m_mile" id="m_mile" class="form-control">
			</div>
			<div class="mileApply">
				<span class="applyMile1">적용금액</span>
				<span class="applyMile2">0원</span>
			</div>
			<div class="title">
				<hr><h3>결제정보</h3><hr>
			</div>
			<div>
				<label class="n">주문상품</label>
				<label class="v">
				<c:set var="payment" value="${order.order_totalPayment }" />
				<c:if test="${payment < 52500 }">
					${order.order_totalPayment - 2500} 
				</c:if>
				<c:if test="${payment >= 52500 }">
					${order.order_totalPayment }
				</c:if>
				원</label>
			</div>
			<div>
				<label class="n">할인/부가결제</label>
				<label class="v">-?원</label>
			</div>
			<div>
				<label class="n">배송비</label>
				<label class="v">
				<c:if test="${payment < 52500 }">
					+2500
				</c:if>
				<c:if test="${payment >= 52500 }">
					+0
				</c:if>
				원</label>
			</div>
			<div class="mileApply">
				<span class="applyMile1">결제금액</span>
				<span class="applyMile2">0원</span>
			</div>
			<div class="title">
				<hr><h3>결제수단</h3><hr>
			</div>
			<div>
				<table class="table table-bordered">
					<tr>
						<th><label>결제수단 선택</label></th>
					</tr>
					<tr>
						<td class="text-center">
							<span><input type="radio" name="payment" value="실시간 계좌이체"><label> 실시간 계좌이체</label></span>
							<span><input type="radio" name="payment" value="카드 결제"><label> 카드 결제</label></span>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<hr>
				<input type="checkbox" class="agreeChk" id="allAgree">
				<label id="allAgreelabel">모든 약관 동의</label><br>
				<input type="checkbox" class="agreeChk" id="agree">
				<label>[필수] 청약철회 방침 동의</label><hr>
			</div>
			<div class="header" id="goPayment">
				<h3><a href="/order/orderComplete"><fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
					value="${order.order_totalPayment }" groupingUsed="true" />원 결제하기</a></h3>
			</div>
		</form>
	</body>
</html>