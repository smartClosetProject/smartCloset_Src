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
	</head>
	<body>
		<c:choose>
			<c:when test="${not empty cartList }">
				<c:forEach var="cart" items="${cartList }" varStatus="status">
					<div>상품명: ${cart.pr_name }</div>
					<div>개수: ${cart.cart_goodsCount }</div>
					<div>사이즈: ${cart.pro_size }</div>
					<div>색상: ${cart.pro_color }</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<div>
			<img src="https://thumbs.gfycat.com/KindheartedWateryAfricanpiedkingfisher-size_restricted.gif">
		</div>
		<div>
			<img src="https://blog.kakaocdn.net/dn/mG2KK/btrgTDPvv8k/tkuWxvlKEDhCp5kbhecFpk/img.gif">
		</div>
	</body>
</html>