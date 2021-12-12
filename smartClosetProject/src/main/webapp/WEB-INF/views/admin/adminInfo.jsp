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
		
		<!-- 모바일 웹 페이지 설정 끝 -->
		<style type="text/css">
		.highlight1{
			width:100px;background-color:#A4AFBC; color : white;
		}
		</style>
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function () {
				$("#changeInfoBtn").click(function () {
					goUrl = "/admin/adminUpdateForm";
					$("#f_adData").attr("action", goUrl);
					$("#f_adData").submit();
				})
				
				$("#toGoMainBtn").click(function () {
					location.href = "/nboard/nboardTest";
				})
				
				$("#adminLogoutBtn").click(function () {
					if(confirm("로그아웃 하시겠습니까?")){
						location.href = "/admin/adminLogout"
					}
				})
			}); //최상위 $ 종료
		
		
		</script>
		
	</head>
	<body>
		<div>
			<form name="f_adData" id="f_adData" method="post">
				<input type="hidden" name="ad_id" value="${adminInfo.ad_id}">
			</form>
			<h2 style="color : #1A5276;"><strong>관리자 정보</strong></h2>
			<br>
			<table class="table table-bordered" style="width : 50%">
				<tr >
					<td class="highlight1">관리자 번호</td>
					<td colspan="3">${adminInfo.ad_num}</td>
				</tr>
				<tr>
					<td class="highlight1">관리자 ID</td>
					<td >${adminInfo.ad_id}</td>
					<td class="highlight1">가입일</td>
					<td >${adminInfo.ad_regdate}</td>
				</tr>
				<tr>
					<td class="highlight1">관리자 이름</td>
					<td>${adminInfo.ad_name}</td>
					<td class="highlight1">전화번호</td>
					<td>${adminInfo.ad_phone}</td>
				</tr>
				<tr>
					<td class="highlight1">이메일</td>
					<td colspan="3">${adminInfo.ad_email}</td>
				</tr>
				<tr>
					<td class="highlight1">주소</td>
					<td colspan="3">${adminInfo.ad_addr}</td>
				</tr>
			</table>
		</div>
		<div class="text-left">
			<input type="button" class="btn btn-default text-right btn-sm" id="changeInfoBtn" name="changeInfoBtn" value="관리자정보 변경"/>
			<input type="button" class="btn btn-default text-right btn-sm" id="toGoMainBtn" name="toGoMainBtn" value="메인으로"/>
			<input type="button" class="btn btn-default text-right btn-sm" id="adminLogoutBtn" name="adminLogoutBtn" value="로그아웃"/>
		</div>
	
	</body>
</html>