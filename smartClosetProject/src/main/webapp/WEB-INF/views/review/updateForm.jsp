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
				$("#updateFormBtn").click(function(){
					if(!chkData("#r_title", "제목을")){
						return;
					} else if (!chkData("#r_content", "내용을")){
						return;
					} else {
						if($("#file").val() != ""){
							if(!chkFile($("#file"))){
								return;
							}
						}
						$("#f_updateForm").attr({
							"method" : "post",
							"enctype" : "multipart/form-data",
							"action" : "/review/reviewUpdate"
						});
						$("#f_updateForm").submit();
					}
					
						
				});
				$("#reviewListBtn").click(function(){
					location.href = "/review/reviewList";
				});
			});
				
		</script>	
		
		
	</head>
	<body>
		<div class="container">
			<div style="font-weight: bold;font-size: 36px; text-align:center;">REVIEW</div>
			
			<%-- 수정, 삭제 시 가져갈 글번호, 원본파일명, 썸네일파일명을 전달하는 폼 테이터 --%>
			<form id="f_updateForm" class="f_updateForm">
				<input type="hidden" name="r_num" value="${updateData.r_num}">
				<input type="hidden" name="m_id" value="${updateData.m_id}">
				<input type="hidden" name="r_file" value="${updateData.r_file }">
				<input type="hidden" name="r_thumb" value="${updateData.r_thumb }">
	
			
			<div id="boardPwdBut" class="row container">
				<div class="col-md-3 text-right">
					
				</div>
			</div>
			<%-- =============== 상세 정보 보여주기 시작 =============== --%>
			
			<div class="container">
				<table class="table table-bordered">
		 			<tr>
		 				<td>글제목</td>
		 				<td><input class="form-control" type="text" name="r_title" id="r_title" value="${updateData.r_title }"></td>
		 			</tr>
		 			<tr>
		 				<td>작성자</td>
		 				<td colspan="3">${updateData.m_id}</td>
		 			</tr>
		 			<tr class="table-height">
		 				<td>글내용</td>
		 				<td><textarea class="form-control" rows="15" name="r_content" id="r_content">${updateData.r_content}</textarea></td>	 				
		 			</tr>
		 			<tr>
						<td>파일첨부</td>
						<td colspan="3" class="text-left">
							<input type="file" name="file" id="file">
						</td>
						</tr>
		 			<c:if test="${not empty updateData.r_file }">
		 				<tr>
		 					<td class="col-md-4">이미지</td>
		 					<td colspan="3" class="col-md-8 text-left">
		 						<img src="/uploadStorage/review/${updateData.r_file }">
		 					</td>
		 				</tr>
		 				<tr>
		 					<td>
		 						<button type="button" class="btn btn-success text-right btn-sm" id="updateFormBtn">수정</button>
								<button type="button" class="btn btn-success text-right btn-sm" id="reviewListBtn">목록</button>
							</td>
						</tr>
		 			</c:if>
				</table>
			</div>
			</form>
		</div>
	</body>
</html>