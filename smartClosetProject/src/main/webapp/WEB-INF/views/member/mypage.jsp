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
		<script type="text/javascript">
			$(function(){
				//회원 정보 수정 버튼 클릭시
				$("#updateBtn").click(function(){
					location.href = "/member/updateForm";
				});
				//주문내역조회 버튼 클릭시
				
				
				//장바구니 버튼 클릭시
				$("#cartBtn").click(function(){
					location.href = "/cart/cart"
				});
				//게시물 조회 버튼 클릭시
				
				
				//스마트옷장 버튼 클릭시
				$("#smartClosetBtn").click(function(){
					location.href = "/closet/closerList"
				});
			});
		</script>
		
	</head>
	<body>
	<form>
		<div style="font-weight: bold;font-size: 36px; text-align:center;">MY PAGE</div>
		<div>
			<label>${name}회원님</label>
			<hr>
		</div>
		<div>
			<h3>나의 주문 처리 현황</h3>
			<hr>
			<ul>
				<li>
					<strong>배송준비중</strong>
					<span>
						<span id="money">0</span>
					</span>
				</li>
				<li>
					<strong>배송중</strong>
					<span>
						<span id="">0</span>
					</span>
				</li>
				<li>
					<strong>배송완료</strong>
					<span>
						<span id="">0</span>
					</span>
				</li>
					
			</ul>
		</div>	
			<div style="position: absolute; top: 424px; left:219px; width: 143px; height: 126px;">
				<input type="button" id="updateBtn" name="updateBtn" value="회원정보 수정">
			</div>
			<div style="position: absolute; top: 424px; left:384px; width: 143px; height: 126px;">
				<input type="button" id="serchBtn" name="serchBtn" value="주문내역조회">
			</div>
			<div style="position: absolute; top: 424px; left:549px; width: 143px; height: 126px;">
				<input type="button" id="cartBtn" name="cartBtn" value="장바구니">
			</div>
			<div style="position: absolute; top: 424px; left:714px; width: 143px; height: 126px;">
				<input type="button" id="boardSerchBtn" name="boardSerchBtn" value="게시물관리">
			</div>
			<div style="position: absolute; top: 424px; left:880px; width: 143px; height: 126px;">
				<input type="button" id="smartClosetBtn" name="smartClosetBtn" value="스마트옷장">					
			</div>
				
				
						
			</form>	
	
	</body>
</html>