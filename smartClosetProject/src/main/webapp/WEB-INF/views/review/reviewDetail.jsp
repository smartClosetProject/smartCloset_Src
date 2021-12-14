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
			let buttonCheck = 0;
			$(function(){
				$("#updateFormBtn").click(function(){
					$("#f_data").attr({
						"method": "get",
						"action" : "/review/updateForm"
					});
					$("#f_data").submit();
				});
				// 목록 버튼 클릭 시 처리 이벤트
				$("#reviewListBtn").click(function() {
					location.href = "/review/reviewList";
				});
				
				//삭제 버튼 클릭시 처리 이벤트
				$("#reviewDeleteBtn").click(function(){
					$("#f_data").attr({
						"method": "post",
						"enctype" : "multipart/form-data",
						"action" : "/review/reviewDelete"
					});
					$("#f_data").submit();
				});
				
				
			});
		</script>
	</head>
	<body>
		<div>
			<div style="font-weight: bold;font-size: 36px; text-align:center;">REVIEW</div>
			
			<%-- 수정, 삭제 시 가져갈 글번호, 원본파일명, 썸네일파일명을 전달하는 폼 테이터 --%>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="r_num" value="${detail.r_num}">
				<input type="hidden" name="m_id" value="${detail.m_id}">
				<input type="hidden" name="m_id" value="${detail.m_name}">
				<input type="hidden" name="r_file" value="${detail.r_file }">
				<input type="hidden" name="r_thumb" value="${detail.r_thumb }">
			</form>
			
			<div id="boardPwdBut" class="row container">
				<div class="col-md-3 text-right">
					
				</div>
			</div>
			<%-- =============== 상세 정보 보여주기 시작 =============== --%>
			<div>
				<table class="table table-bordered">
		 			<tr>
		 				<td>글제목</td>
		 				<td>${detail.r_title }</td>
		 			</tr>
		 			<tr>
		 				<td>작성자</td>
		 				<td colspan="3">${detail.m_name}</td>
		 			</tr>
		 			<tr class="table-height">
		 				<td>글내용</td>
		 				<td colspan="15">${detail.r_content }</td>	 				
		 			</tr>
		 			
		 			<c:if test="${not empty detail.r_file }">
		 				<tr>
		 					<td class="col-md-4">이미지</td>
		 					<td colspan="3" class="col-md-8 text-left">
		 						<img src="/uploadStorage/review/${detail.r_file }">
		 					</td>
		 				</tr>
		 			</c:if>	
		 				<tr>
		 					<td><c:if test="${login.m_id == detail.m_id}">
			 						<button type="button" class="btn btn-success text-right btn-sm" id="updateFormBtn">수정</button>
									<button type="button" class="btn btn-success text-right btn-sm" id="reviewDeleteBtn">삭제</button>
								</c:if>
								<button type="button" class="btn btn-success text-right btn-sm" id="reviewListBtn">목록</button>
							</td>
						</tr>
				</table>
			</div>
			<%-- =============== 상세 정보 보여주기 종료 =============== --%>
		</div>
	
	</body>
</html>