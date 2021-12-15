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
	$("#updateQnaBtn").click(function(){
		//location.href="/qna/updateQna";
		$("#f_data").attr({
			"method" : "post",
			"enctype": "multipart/form-data",
			"action" : "/qna/updateQna"
		});
		$("#f_data").submit();
	});
	$("#qnaDeleteBtn").click(function(){
		//$.ajax({
		//	url: "/qna/qnaDelete",
		//	dataType: "text",
		//	type: "post",	
		//	success : function(resultData) {
		//		if(resultData == "success")
		//			$("#f_data").attr({
		//				"method":"get",
		//				"action": "/qna/qnaList"
		//			});
		//			$("#f_data").submit();
		//			}
		//		});
		$("#f_data").attr({
			"method" : "post",
			"enctype": "multipart/form-data",
			"action" : "/qna/qnaDelete"
		});
		$("#f_data").submit();
		
	});
	
	$("#qnaListBtn").click(function(){
		location.href="/qna/qnaList";
	});
});
</script>
<title></title>
</head>
<body>
<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 상세보기<h3> -->
<%--수정 및 삭제 시 글번호, 원본파일명, 썸네일파일명을 전달하는 폼 --%>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="q_num" value="${detail.q_num }" />
			<input type="hidden" name="q_file" value="${detail.q_file }" />
			<input type="hidden" name="q_category" value="${detail.q_category}">
		</form>
<div class="text-center"><h3>QNA게시판 상세화면</h3></div>
	<div class="container">
			<table class="table table-bordered">
		 			<tr>
		 				<td>회원이름</td>
		 				<td colspan="3" style="font-size:15px;font-family:sans-serif">${detail.m_name}</td>
		 			</tr>
		 			<tr>
		 				<td>글번호</td>
		 				<td colspan="3" style="font-size:15px;font-family:sans-serif">${detail.q_num}</td>
		 			</tr>
		 			<tr>
		 				<td>글제목</td>
		 				<td colspan="3" style="font-size:15px;font-family:sans-serif">${detail.q_title}</td>
		 			</tr>
		 			<tr class="table-height">
		 				<td>글내용</td>
		 				<td colspan="3" style="font-size:15px;font-family:sans-serif">${detail.q_content}</td>
		 			</tr>
					<tr>
						<td>카테고리</td>
						<td colspan="3" style="font-size:15px;font-family:sans-serif">${detail.q_category}</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td colspan="3" style="font-size:15px;font-family:sans-serif">${detail.q_regdate}</td>
					</tr>
					<c:if test = "${not empty detail.q_file}">
					<tr>
						<td class="col-md-4">이미지</td>
						<td colspan="3" class="col-md-8 text-left">
							<img src="/uploadStorage/qna/${detail.q_file}" />
						</td>
					</tr>
				</c:if>
				</table>
		</div>
					<div class="btnArea col-md-50 text-right">
					
					<c:if test="${login.m_id == detail.m_id}">
					<input type="button" value="글수정" id="updateQnaBtn" class="btn btn-success" />
					<input type="button" value="글삭제" id="qnaDeleteBtn" class="btn btn-success" />
					</c:if>
					<input type="button" value="목록"  id="qnaListBtn" class="btn btn-success" />			
				</div>
		<jsp:include page="reply.jsp" />
	</body>
</html>