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
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function () {
				$("#QnaDeleteBtn").click(function () {
					if (confirm("정말 삭제하시겠습니까?")) {
						goUrl = "/aQna/aQnaDelete";
						$("#f_data").attr("action", goUrl);
						$("#f_data").submit();
					}
				})
				
				$("#goToQnaListBtn").click(function () {
					location.href="/aQna/aQnaList";
				})
			})
		</script>
	
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>상세 페이지</h3></div>
			
			<%-- 수정, 삭제 시 가져갈 글번호, 원본파일명을 전달하는 폼 테이터 --%>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="q_num" value="${detail.q_num }">
				<input type="hidden" name="q_file" value="${detail.q_file }">
			</form>
			<div class="text-right contentBtn ">
				<input type="button" id="QnaDeleteBtn" name="QnaDeleteBtn" value="삭제"/>
				<input type="button" id="goToQnaListBtn" name="goToQnaListBtn" value="목록"/>
			</div>
			<%-- =============== 상세 정보 보여주기 시작 =============== --%>
			<div class="container">
				<table class="table table-bordered">
		 			<tr>
		 				<td>글번호</td>
		 				<td>${detail.q_num }</td>
		 				<td>작성일</td>
		 				<td>${detail.q_regdate }</td>
		 			</tr>
		 			<tr>
		 				<td>작성자</td>
		 				<td colspan="3">${detail.m_id }</td>
		 			</tr>
		 			<tr>
		 				<td>글제목</td>
		 				<td colspan="3">${detail.q_title }</td>
		 			</tr>
		 			<tr class="table-height">
		 				<td>글내용</td>
		 				<td colspan="3">${detail.q_content }</td>
		 			</tr>
		 			<c:if test="${not empty detail.q_file }">
		 				<tr>
		 					<td class="col-md-4">이미지</td>
		 					<td colspan="3" class="col-md-8 text-left">
		 						<img src="/uploadStorage/QnA/${detail.q_file }">
		 					</td>
		 				</tr>
		 			</c:if>
				</table>
			</div>
			<%-- =============== 상세 정보 보여주기 종료 =============== --%>
			<jsp:include page="reply.jsp"/>
			
		</div>
	</body>
</html>