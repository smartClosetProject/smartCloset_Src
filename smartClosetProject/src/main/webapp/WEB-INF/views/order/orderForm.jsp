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
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
			#m_mileApply {
				text-align: right;
			}
			input[type=number]::-webkit-inner-spin-button, 
			input[type=number]::-webkit-outer-spin-button {  
   				opacity: 0;
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
				margin-left: 630px;
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
			#selectMessage {
				font-size: 14px;
			}
			input[type='radio'], input[type='checkbox'] {
				width: 15px;
				height: 15px;
			}
			#goPayment {
				width: 870px;
				border: none;
				height: 52px;
				color: white;
				background-color: black;
				font-size: 24px;
			}
			#goPayment:hover {
				font-weight: bold;
			}
			#proInfo tr td img{
				width: 90px;
				margin-left: 10px;
				margin-right: 30px;
			}
			#proInfo tr td {
				padding: 10px;
			}
			#toggleBtn {
				margin-left: 700px;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				// ?????? ????????? ?????? ???????????? ??????
				$("#isEqual").click(function() {
					let isEqual = $("#isEqual").prop("checked");
					if (isEqual) {
						$("#m_name").val("${order.m_name}");
						$("#m_addr").val("${order.m_addr}");
						$("#m_addr2").val("${order.m_addr2}");
						$("#m_addr3").val("${order.m_addr3}");
						$("#m_phone").val("${order.m_phone}");
						$("#m_email").val("${order.m_email}");
						$("#m_name").prop("readonly", true);
						$("#m_addr").prop("readonly", true);
						$("#m_addr2").prop("readonly", true);
						$("#m_addr3").prop("readonly", true);
						$("#m_phone").prop("readonly", true);
						$("#m_email").prop("readonly", true);
					} else {
						$("#m_name").val("");
						$("#m_addr").val("");
						$("#m_addr2").val("");
						$("#m_addr3").val("");
						$("#m_phone").val("");
						$("#m_email").val("");
						$("#m_name").prop("readonly", false);
						$("#m_addr").prop("readonly", false);
						$("#m_addr3").prop("readonly", false);
						$("#m_phone").prop("readonly", false);
						$("#m_email").prop("readonly", false);
					}
				});
				
				// ?????? ????????? ??????
				$("#message").change(function() {
					$("#message option:selected").each(function() {
						if ($(this).val() == "????????????") { 
							$("#selectMessage").val(""); 
							$("#selectMessage").attr("readonly", false);
							$("#selectMessage").focus();
						} else if ($(this).index() == 0) {
							$("#selectMessage").val("");
							$("#selectMessage").attr("readonly", true);
						} else {
							$("#selectMessage").val($(this).text());
							$("#selectMessage").attr("readonly", true);
						}
					});
				});
				
				// ????????? ????????? ?????? ????????? ??????
				$("#m_mileApply").focusout(function() {
					if ($("#m_mileApply").val() < 0) {
						alert("0????????? ???????????? ????????? ??? ????????????.");
						$("#m_mileApply").val("");
						return;
					} else {
						totalSum();
					}
				});
				
				$("#m_mileApply").keydown(function(key) {
					if ($("#m_mileApply").val() < 0) {
						alert("0????????? ???????????? ????????? ??? ????????????.");
						$("#m_mileApply").val("");
						return;
					} else {
						if (key.keyCode == 13) {
							totalSum();
						}
	                }
	            });

				// ?????? ?????? ?????? ?????? ??? ?????? ??????
				$("#allAgree").click(function() {
					if ($("#allAgree").prop("checked")) {
						$(".agreeChk").prop("checked", true);
					} else {
						$(".agreeChk").prop("checked", false);
					}
				});
				
				// ?????? ?????? ?????? ??? ?????? ?????? ?????? ??????
				$("#agree").click(function() {
					if (!$("#agree").prop("checked")) {
						$("#allAgree").prop("checked", false);
					}
				})
				
				// ???????????? ?????? - ????????? ??????
				$("#goPayment").click(function() {
					if (!chkData("#m_name", "????????????")) {
						return;
					} else if (!chkData("#m_addr2", "?????????")) {
						return;
					} else if (!chkData("#m_addr3", "????????? ?????????")) {
						return;
					} else if (!chkData("#m_phone", "???????????????")) {
						return;
					} else if (!chkData("#m_email", "????????????")) {
						return;
					} else if ($("input[type='radio']:checked").length == 0) {
						alert("?????? ????????? ????????? ?????????.");
						$("input[type='radio']").focus();
						return;
					} else if ($("input[class='agreeChk']:checked").length == 0) {
						alert("????????? ????????? ?????????.");
						$("input[class='agreeChk']").focus();
						return;
					} else {
						$("#orderFrm").attr({
							"method" : "post",
							"action" : "/order/orderComplete"
						});
						$("#orderFrm").submit();
					}
				});
				
				// ????????? ?????? ?????? api
				document.getElementById("m_addr").addEventListener("click", function(){
			        new daum.Postcode({
			            oncomplete: function(data) {
							document.getElementById("m_addr").value = data.zonecode;
			                document.getElementById("m_addr2").value = data.address;
			                document.querySelector("input[name='m_addr3']").focus();
			            }
			        }).open();
			    });
				
				// ?????? ?????? ??? ?????? ?????????
				let i = 0;
				$("#toggleBtn").click(function() {
					i = i + 1;
					$("#toggleBtn").fadeOut(0.000001);
					
					if (i % 2 == 1) {
						$("#toggleBtn").removeClass("glyphicon-menu-up");
						$("#toggleBtn").addClass("glyphicon-menu-down");
						$("#toggleBtn").fadeIn(1000);
						$("#proInfo").toggle();
					} else {
						$("#toggleBtn").removeClass("glyphicon-menu-down");
						$("#toggleBtn").addClass("glyphicon-menu-up");
						$("#toggleBtn").fadeIn(1000);
						$("#proInfo").toggle();
					}
					
				});
// 				$("#goPayment").click(function(){
// 					IMP.init('iamport');
// 				  	//????????? ???????????? ??????
// 				  	let addr=$("#m_addr2").val();
// 				  	addr+=" ";
// 				  	addr+=$("#m_addr3").val();
// 				  	let amount= ${order.order_totalPayment};
// 				  	let email= $("#m_email").val();
// 				  	let name=${order.m_mile}
// 				  	let tel=${order.m_phone}
// 				  	let postcode=$("#m_addr").val();
// 					IMP.request_pay({
// 							    pg : 'html5_inicis', 
// 							    pay_method : 'card',
// 							    merchant_uid : 'merchant_'+ new Date().getTime(),
// 							    name : '?????????:???????????????'/*?????????*/,
// 							    amount : amount/*?????? ??????*/, 
// 							    buyer_email : eamil/*????????? ?????????*/,
// 							    buyer_name : name,
// 							    buyer_tel : tel/*????????? ?????????*/,
// 							    buyer_addr : addr /*????????? ??????*/,
// 							    buyer_postcode : postcode/*????????? ????????????*/
// 							}, function (rsp) { // callback
// 							      if (rsp.success) { // ?????? ?????? ???: ?????? ?????? ?????? ???????????? ????????? ????????? ??????
// 							          // jQuery??? HTTP ??????
// 							          jQuery.ajax({
// 							              url: "/order/orderComplete", // ???: https://www.myservice.com/payments/complete
// 							              method: "POST",
// 							              data: {
// 							                  "complete":"success"
// 							              }
// 							          })
// 							        } else {
// 							          alert("????????? ?????????????????????. ?????? ??????: " +  rsp.error_msg);
// 							        }
// 							      });
			});
			
			function totalSum() {
				let m_mile = ${order.m_mile };
				let applyMile = parseInt($("#m_mileApply").val());
				if ($("#m_mileApply").val() == "") {
					return;
				}
				if (applyMile > m_mile) {
					applyMile = m_mile;
				}
				$("#applyMile2").html(applyMile.toLocaleString() + "???");
				$("#useMile").html("-" + applyMile.toLocaleString() + "???");
				
				let totalSum = (${order.order_totalPayment} - applyMile).toLocaleString();
				$(".totalSum").html(totalSum);
				
				$("input[name='m_mile']").val(${order.m_mile });
				$("input[name='m_mileApply']").val(applyMile);
				$("input[name='m_mileAdd']").val(Math.floor((${order.order_totalPayment} - applyMile) * 0.025 ));
				$("input[name='order_totalPayment']").val(${order.order_totalPayment} - applyMile);
			}
		</script>
	</head>
	<body>
		<form name="orderFrm" id="orderFrm" class="form-horizontal">
			<input type="hidden" name="m_mile">
			<input type="hidden" name="m_mileApply">
			<input type="hidden" name="m_mileAdd">
			<input type="hidden" name="order_totalPayment">
			
			<div class="header">
				<h3>??????/??????</h3>
			</div>
			<div class="title">
				<h3>?????????</h3><hr>
			</div>
			<div class="box">
				<input type="checkbox" id="isEqual" value="equal">
				<label>&nbsp;?????? ????????? ??????</label>
			</div>
			<div class="info form-group">
				<div class="form-group">
					<label for="m_name" class="col-sm-2 control-label">?????? ??????<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="text" name="m_name" id="m_name" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="m_addr" class="col-sm-2 control-label">????????????<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="text" name="m_addr" id="m_addr" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="m_addr2" class="col-sm-2 control-label">??????<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="text" name="m_addr2" id="m_addr2" class="form-control" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="m_addr3" class="col-sm-2 control-label">?????? ??????<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="text" name="m_addr3" id="m_addr3" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="m_phone" class="col-sm-2 control-label">????????????<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="text" name="m_phone" id="m_phone" class="form-control" placeholder="010-0000-0000">
					</div>
				</div>
				<div class="form-group">
					<label for="m_phone" class="col-sm-2 control-label">?????????<span class="star"> *</span></label>
					<div class="col-sm-8">
 						<input type="email" name="m_email" id="m_email" class="form-control" placeholder="SmartCloset@example.com">
					</div>
				</div>
				<div class="text-center col-sm-10">
					<select id="message" class="form-control msg">
						<option value="">-- ????????? ?????? (????????????)</option>
						<option value="?????? ?????? ?????? ??????????????????.">?????? ?????? ?????? ??????????????????.</option>
						<option value="?????? ??? ??? ?????? ???????????????.">?????? ??? ??? ?????? ???????????????.</option>
						<option value="?????? ?????? ??????????????????.">?????? ?????? ??????????????????.</option>
						<option value="????????????">?????? ??????</option>
					</select>
					<input type="text" name="shipMessage" id="selectMessage" class="form-control msg" readonly="readonly">
				</div><br>
			</div>
			
			<div class="title">
				<hr><h3>????????????<span id="toggleBtn" class="glyphicon glyphicon-menu-up"></span></h3><hr>
			</div>
			<div>
				<table id="proInfo">
					<c:forEach var="info" items="${productsInfo }">
						<tr>
							<td><img src="/uploadStorage/warehousing/thumb/${info.pro_colorthumb }"></td>
							<td>
								<div>${info.pr_name }</div>
								<div>[??????: ${info.pro_size } / ${info.pro_color }]</div>
								<div>??????: ${info.cart_goodsCount }</div>
								<div><fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
										value="${info.pr_price * info.cart_goodsCount}" groupingUsed="true" />???</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="title">
				<hr><h3>??????/????????????</h3><hr>
			</div>
			<div class="mile">
				<span class="text-left">????????? (????????????: 
				<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
					value="${order.m_mile }" groupingUsed="true" />???)</span>
			</div>
			<div>
				<input type="number" id="m_mileApply" class="form-control" min="0">
			</div>
			<div class="mileApply">
				<span class="applyMile1">????????????</span>
				<span class="applyMile2" id="applyMile2">???</span>
			</div>
			<div class="title">
				<hr><h3>????????????</h3><hr>
			</div>
			<div>
				<label class="n">????????????</label>
				<label class="v">
				<c:set var="payment" value="${order.order_totalPayment }" />
				<c:if test="${payment < 52500 }">
					<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
					value="${order.order_totalPayment - 2500}" groupingUsed="true" />
				</c:if>
				<c:if test="${payment >= 52500 }">
					<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
					value="${order.order_totalPayment}" groupingUsed="true" />
				</c:if>
				???</label>
			</div>
			<div>
				<label class="n">??????/????????????</label>
				<label class="v" id="useMile">
				???</label>
			</div>
			<div>
				<label class="n">?????????</label>
				<label class="v">
				<c:if test="${payment < 52500 }">
					+2,500
				</c:if>
				<c:if test="${payment >= 52500 }">
					+0
				</c:if>
				???</label>
			</div>
			<div class="mileApply">
				<span class="applyMile1">????????????</span>
				<span class="applyMile2"><span class="totalSum"></span>???</span>
			</div>
			<div class="title">
				<hr><h3>????????????</h3><hr>
			</div>
			<div>
				<table class="table table-bordered">
					<tr>
						<th><label>???????????? ??????</label></th>
					</tr>
					<tr>
						<td class="text-center">
							<span><input type="radio" name="payMethod" value="????????? ????????????"><label>&nbsp;????????? ????????????</label></span>
							<span><input type="radio" name="payMethod" value="?????? ??????"><label>&nbsp;?????? ??????</label></span>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<hr>
				<input type="checkbox" class="agreeChk" id="allAgree">
				<label id="allAgreelabel">?????? ?????? ??????</label><br>
				<input type="checkbox" class="agreeChk" id="agree">
				<label>[??????] ???????????? ?????? ??????</label><hr>
			</div>
			<div>
				<button type="button" id="goPayment"><span class="totalSum">
				<fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
					value="${order.order_totalPayment}" groupingUsed="true" /></span>??? ????????????</button>
			</div>
		</form>
	</body>
</html>