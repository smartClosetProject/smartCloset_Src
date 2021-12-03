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
		<!-- 모바일 웹 페이지 설정 끝 -->
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
	</head>
	<body>
		<div>
			<form name="f_adData" id="f_adData" method="post">
				<input type="hidden" name="ad_num" value="${adminInfo.ad_num}">
			</form>
			<table class="table table-bordered">
				<tr>
					<td>관리자 번호</tr>
					<td colspan="3">${adminInfo.ad_num}</td>
				</tr>
				<tr>
					<td>관리자 ID</td>
					<td>${adminInfo.ad_id}</td>
					<td>가입일</td>
					<td>${adminInfo.ad_regdate}</td>
				</tr>
				<tr>
					<td>관리자 이름</td>
					<td>${adminInfo.ad_name}</td>
					<td>전화번호</td>
					<td>${adminInfo.ad_phone}</td>
				</tr>
				<tr>
					<td>이메일</tr>
					<td colspan="3">${adminInfo.ad_email}</td>
				</tr>
				<tr>
					<td>주소</tr>
					<td colspan="3">${adminInfo.ad_addr}</td>
				</tr>
			
			</table>
		
		</div>
	
	</body>
</html>