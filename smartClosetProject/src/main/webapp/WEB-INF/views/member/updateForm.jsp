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
	
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#memberUpdateBtn").click(function(){
					if(!chkData("#m_passwd","비밀번호를")) {
						return;
					} else if (!chkData("#m_passwd_confirm","비빌번호 확인을")) {
						return;
					} else if (!chkData("#m_phone2","핸드폰 번호를")) {
						return;
					} else if (!chkData("#m_phone3","핸드폰 번호를")) {
						return;
					} else if (!chkData("#m_email","이메일을")) {
						return ;
					} else{
						$("#m_phone").val( $("#m_phone1").val()+"-"+$("#m_phone2").val()+"-"+$("#m_phone3").val() )
						//console.log( $("#m_phone").val() );
						$("#f_updateForm").attr({
							"method" : "post",
							"action" : "/member/memberUpdate"
						});
						$("#f_updateForm").submit();
					}
				});
				
				$("#memberExitBtn").click(function(){
					
				});
			});
		</script>
	</head>
	<body>
		
		<form id="f_updateForm">
			<input type="hidden" name="m_id" id="m_id" value="${updateData.m_id}">
			<input type="hidden" name="m_num" id="m_num" value="${updateData.m_num}">
			<input type="hidden" name="m_regdate" id="m_regdate" value="${updateData.m_regdate}">
			<input type="hidden" name="m_mile" id="m_mile" value="${updateData.m_mile}">
			<input type="hidden" name="m_acc" id="m_acc" value="${updateData.m_acc}">
			<input type="hidden" name="m_phone" id="m_phone" />
			<div class="titleArea">
				<h2>회원 정보 수정</h2>
			</div>
			<div class="ec-base-table typeWrite">
			
			<table class="table table-bordered">
				<tr>
					<th>아이디
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td id="m_id">${updateData.m_id}</td>
				</tr>
				<tr>
					<th>비밀번호
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td><input type="password" id="m_passwd" name="m_passwd" maxlength="8">(영문자 8자)</td>
				</tr>
				<tr>
					<th>비밀번호확인
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td><input type="password" id="m_passwd_confirm" name="m_passwd_confirm"></td>
				<tr>
					<th>이름
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td id="m_name">${updateData.m_name}</td>
				</tr>
				<tr>
					<th>주소
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td><input type="text" id="m_addr" name="m_addr" value="${updateData.m_addr}"></td>
				</tr>
				<tr>
					<th>휴대전화
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td>
						<div id ="m_phone">
							<select id ="m_phone1" name="m_phone1">
								<option value="010">010</option>
								<option value="010">011</option>
								<option value="010">016</option>
								<option value="010">017</option>
								<option value="010">018</option>
								<option value="010">019</option>
							</select>
							-
							<input type="text" id ="m_phone2" maxlength="4" name="m_phone2">
							-
							<input type="text" id ="m_phone3" maxlength="4" name="m_phone3">
						</div>
					</td>
				</tr>
				<tr>
					<th>이메일
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td><input type="text" id="m_email" name="m_email" value="${updateData.m_email}"></td>
				</tr>
			</table>
		</div>
		</form>
		<form>
			<div class="ec-base-button justify">
				<button type="button" id="memberExitBtn"  class="btn btn-success opacity" >회원탈퇴</button>
				<button type="button" id="memberUpdateBtn" class="btn btn-success">회원정보수정</button>
			</div>
		</form>
	</body>
</html>