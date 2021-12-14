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
		
		<style type="text/css">
		.highlight1{
			width:150px;
			background-color:#A4AFBC; 
			color : white;
		}
		</style>
		<!-- 모바일 웹 페이지 설정 끝 -->
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function () {
				$("#changeInfoBtn").click(function () {
					if(!chkData("#ad_passwd", "비밀번호를")) return;
					else if(!chkData("#ad_name", "이름을")) return;
					else if(!chkData("#ad_email", "이메일을")) return;
					else if(!chkData("#ad_phone", "번화번호를")) return;
					else if(!chkData("#ad_addr", "주소를")) return;
					else {
						$("#f_adUpdateData").attr({
							"method" : "post",
							"action" : "/admin/adminUpdate"
						});
						$("#f_adUpdateData").submit();
					}
				})
				$("#resetBtn").click(function () {
					$("#f_adUpdateData").each(function () {
						this.reset();
					})
				})
				$("#goToAdminInfofBtn").click(function () {
					location.href = "/admin/adminInfo";
				})
			}); //최상위 $ 종료
		
		</script>
	</head>
	<body>
		<div>
			<form name="f_adUpdateData" id="f_adUpdateData" method="post">
				<input type="hidden" name="ad_id" value="${adminUpdateInfo.ad_id}">
				<h2 style="color : #1A5276;"><strong>관리자 정보</strong></h2>
				<br>
				<table class="table table-bordered">
					<tr>
						<td class="highlight1 col-md-4">관리자 번호</td>
						<td colspan="3">${adminUpdateInfo.ad_num}</td>
					</tr>
					<tr>
						<td class="highlight1 col-md-4">관리자 ID</td>
						<td>${adminUpdateInfo.ad_id}</td>
						<td class="highlight1 col-md-4">가입일</td>
						<td>${adminUpdateInfo.ad_regdate}</td>
					</tr>
					<tr>
						<td class="highlight1 col-md-4">변경할 비밀번호</td>
						<td colspan="3"><input class="form-control" type="text" name="ad_passwd" id="ad_passwd" value="${adminUpdateInfo.ad_passwd}"/></td>
					</tr>
					<tr>
						<td class="highlight1 col-md-4">관리자 이름</td>
						<td><input class="form-control" type="text" name="ad_name" id="ad_name" value="${adminUpdateInfo.ad_name}"/></td>
						<td class="highlight1 col-md-4">전화번호</td>
						<td><input class="form-control" type="text" name="ad_phone" id="ad_phone" value="${adminUpdateInfo.ad_phone}"/></td>
					</tr>
					<tr>
						<td class="highlight1 col-md-4">이메일</td>
						<td colspan="3"><input class="form-control" type="text" name="ad_email" id="ad_email" value="${adminUpdateInfo.ad_email}"/></td>
					</tr>
					<tr>
						<td class="highlight1 col-md-4">주소</td>
						<td colspan="3"><input class="form-control" type="text" name="ad_addr" id="ad_addr" value="${adminUpdateInfo.ad_addr}"/></td>
					</tr>
				</table>
				</form>
			</div>
			<div class="text-right">
				<input type="button" class="btn btn-default text-right btn-sm" id="changeInfoBtn" name="changeInfoBtn" value="변경"/>
				<input type="button" class="btn btn-default text-right btn-sm" id="resetBtn" name="resetBtn" value="초기화"/>
				<input type="button" class="btn btn-default text-right btn-sm" id="goToAdminInfofBtn" name="goToAdminInfofBtn" value="이전으로"/>
			</div>
			
		
	</body>
</html>