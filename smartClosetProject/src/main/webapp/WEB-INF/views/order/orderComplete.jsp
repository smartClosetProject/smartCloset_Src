<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			.oDtitle {
				font-weight: 800;
			}
			.oDtable {
				margin: auto;
				width: 630px;
			}
			#checkImg {
				margin-left: 86px;
				width: 223px;
				height: 179px;
			}
			#oDfloat1 {
				float: left;
			}
			#oDfloat2 {
				margin-top: 36px;
				float: left;
			}
			#completeMsg {
				font: 24px bold;
			}
			.msg {
				font-size: 15px;
			}
			.orderTh {
				background-color: #F6F6F6;
			}
		</style>
	</head>
	<body>
		<div>
			<br><br><br><br>
			<h2 class="oDtitle">주문 완료</h2><hr>
		</div><br>
		
		<div>
			<table class="table table-bordered oDtable">
				<thead>
					<tr>
						<th class="orderTh text-center">사용 적립금</th>
						<th class="orderTh text-center">추가 적립금</th>
						<th class="orderTh text-center">최종 적립금</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center">-
							<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
								value="${orderDetail.m_mileApply }" groupingUsed="true" />원
						</td>
						
						<td class="text-center">+
							<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
								value="${orderDetail.m_mileAdd }" groupingUsed="true" />원
						</td>
						<td class="text-center">
							<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
								value="${orderDetail.m_mile - orderDetail.m_mileApply + orderDetail.m_mileAdd }" 
								groupingUsed="true" />원
						</td>
					</tr> 
				</tbody>
			</table><br><br>
		</div>
		<div id="oDfloat1">
			<img src="/resources/image/check.png" id="checkImg">
		</div>
		<div id="oDfloat2">
			<p>
				<span id="completeMsg">고객님의 주문이 완료되었습니다.</span><br>
				<span class="msg">주문 내역 및 배송에 관한 안내는 주문 내역을 통해 확인 가능합니다.</span>
			</p>
			<p>
				<span class="msg">주문번호 : ${orderDetail.order_num }</span><br>
				<span class="msg">주문일자 : ${orderDetail.order_regdate }</span>
			</p>
		</div>
		
		<div>
			<br><br><br><br><br><br><br><br><br><br><br>
			<span class="msg">&nbsp;결제 정보</span>
		</div> 
		<div>
			<table class="table table-bordered">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<th class="orderTh oDlabel">최종 결제</th>
					<td>
						<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
							value="${orderDetail.order_totalPayment }" groupingUsed="true" />원
					</td>
				</tr>
				<tr>
					<th class="orderTh oDlabel">결제 수단</th>
					<td>${orderDetail.payMethod }</td>
				</tr>
			</table>
		</div>
		
		<div>
			<br>
			<span class="msg">&nbsp;배송 정보</span>
		</div> 
		<div>
			<table class="table table-bordered">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<th class="orderTh oDlabel">받는 분</th>
					<td>${orderDetail.m_name }</td>
				</tr>
				<tr>
					<th class="orderTh oDlabel">주소</th>
					<td>${orderDetail.m_addr }</td>
				</tr>
				<tr>
					<th class="orderTh oDlabel">휴대전화</th>
					<td>${orderDetail.m_phone }</td>
				</tr>
				<tr>
					<th class="orderTh oDlabel">배송 메시지</th>
					<td>${orderDetail.shipMessage }</td>
				</tr>
			</table>
		</div>
	</body>
</html>