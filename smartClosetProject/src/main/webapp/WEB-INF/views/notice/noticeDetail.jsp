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
	$("#noticeListBtn").click(function(){
		location.href="/notice/noticeList";
	});	
});
</script>
</head>
<body>
<div class="text-center"><h3>공지게시판 상세화면</h3></div>
	<div class="container">
			<table class="table table-bordered">
		 			<tr>
		 				<td>공지번호</td>
		 				<td colspan="3">${detail.n_num}</td>
		 			</tr>
		 			<tr>
		 				<td>공지제목</td>
		 				<td colspan="3">${detail.n_title}</td>
		 			</tr>
		 			<tr class="table-height">
		 				<td>공지내용</td>
		 				<td colspan="3">${detail.n_content}</td>
		 			</tr>
					<tr>
						<td>작성일</td>
						<td colspan="3">${detail.n_writedate}</td>
					</tr>
					<tr>
		 				<td>작성자</td>
		 				<td colspan="3">${detail.n_author}</td>
		 			</tr>
				</table>
		<input type="button" value="목록"  id="noticeListBtn" class="btn btn-success" style="float:right"/>			
		</div>
</body>
</html>