<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<!-- 모바일 웹 페이지 설정 끝 -->
	
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<style type="text/css">
		.button4 {
		   background-color: white;
		   color: black;
		   border: 2px solid #e7e7e7;
		}
		.button4:hover {background-color: #e7e7e7;}
		
		</style>
		<script type="text/javascript">
			$(function(){
				//회원 정보 수정 버튼 클릭시
				$("#updateBtn").click(function(){
					$("#memberList").attr({
						"method" : "get",
						"action" : "/member/updateForm"
					});
					$("#memberList").submit();
				});
				//주문내역조회 버튼 클릭시
				$("#serchBtn").click(function(){
					$("#memberList").attr({
						"method" : "get",
						"action" : "/member/myorderList"
					});
					$("#memberList").submit();
				});
				
				//장바구니 버튼 클릭시
				$("#cartBtn").click(function(){
					location.href = "/cart/cartList"
				});
				//게시물 조회 버튼 클릭시
				$("#boardSerchBtn").click(function(){
					$("#memberList").attr({
						"method" : "get",
						"action" : "/member/postmanagement"
					});
					$("#memberList").submit();
				});
				
				//스마트옷장 버튼 클릭시
				$("#smartClosetBtn").click(function(){
					location.href = "/sCloset/sClosetHome"
				});
			});
		</script>
		
	</head>
	<body>
	<form id="memberList">
		<input type="hidden" name="m_id" id="m_id" value="${login.m_id}">
		<div style="font-weight: bold;font-size: 36px; text-align:center;">MY PAGE</div>
		<div>
			<label>${login.m_name}회원님</label>
			<hr>
		</div>
		<div>
			<h3>나의 주문 처리 현황</h3>
			<hr>
			<ol class="list-group list-group-numbered">
				  <li class="list-group-item d-flex justify-content-between align-items-start">
					<a href = "/member/myorderList" class="count" >
						<strong id="order_state">입금전</strong>
						
						<span >
							<span id="myorderCount">${order_state.bd}</span>
						</span>
					</a>
				</li>
				<li>
					<a href = "/member/myorderList" class="count" >
						<strong id="order_state">결제 완료</strong>
						<span>
							<span id="myorderCount">${order_state.bd1}</span>
						</span>
					</a>
				</li>
				<li>
					<a href = "/member/myorderList" class="count" >
						<strong id="order_state">배송준비중</strong>
						<span>
							<span id="myorderCount">${order_state.bd2}</span>
						</span>
					</a>
				</li>
				<li>
					<a href = "/member/myorderList" class="count" >
						<strong id="order_state">배송중</strong>
						<span>
							<span id="myorderCount">${order_state.bd3}</span>
						</span>
					</a>
				</li>
				<li>
					<a href = "/member/myorderList" class="count" >
						<strong id="order_state">배송완료</strong>
						<span>
							<span id="myorderCount">${order_state}</span>
						</span>
					</a>
				</li>
					
			</ol>
		</div>	
			<div style="position: absolute; top: 424px; left:20px; width: 143px; height: 126px;">
				<input type="button"  class="button button4" id="updateBtn" name="updateBtn" value="회원정보 수정">
			</div>
			<div style="position: absolute; top: 424px; left:200px; width: 143px; height: 126px;">
				<input type="button" class="button button4" id="serchBtn" name="serchBtn" value="주문내역조회">
			</div>
			<div style="position: absolute; top: 424px; left:380px; width: 143px; height: 126px;">
				<input type="button" class="button button4" id="cartBtn" name="cartBtn" value="장바구니">
			</div>
			<div style="position: absolute; top: 424px; left:560px; width: 143px; height: 126px;">
				<input type="button" class="button button4" id="boardSerchBtn" name="boardSerchBtn" value="게시물관리">
			</div>
			<div style="position: absolute; top: 424px; left:740px; width: 143px; height: 126px;">
				<input type="button" class="button button4" id="smartClosetBtn" name="smartClosetBtn" value="스마트옷장">					
			</div>
				
				
						
			</form>	
	
	</body>
</html>