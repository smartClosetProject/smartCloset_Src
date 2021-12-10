<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->


<!--[if lt IE 9]>
	<script src="../js/html5shiv.js"></script>
	<![endif]-->

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
			$(function(){
				$("#loginBtn").click(function () {
					if (!chkData("#m_id", "아이디를")) {
						return;
					} else if (!chkData("#m_passwd", "비밀번호를")) {
						return;
					} else {
						$("#login").attr({
							"method" : "GET",
							"action" : "/member/login"
						});
						$("#login").submit();
					}
				});
				$("#joinBtn").click(function () {
					location.href="/member/joinmember"
				});
			});
		</script>
	</head>
	<body>
<h2>로그인화면</h2>
	<form id ="login">
				  <div class="form-group">
				    <label for="exampleInputEmail1">아이디</label>
				    <input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">비밀번호</label>
				    <input type="password" class="form-control" id="m_passwd" name="m_passwd" placeholder="비밀번호">
				    
				  </div>
				   <div class="right">
				    <input type="button" value="회원가입" id="joinBtn"/>
					<input type="button" value="로그인" id="loginBtn"/>
				   </div> 
		</form>
	</body>
</html>