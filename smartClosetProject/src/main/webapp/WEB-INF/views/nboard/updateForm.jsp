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
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<style type="text/css">
		#b_content {
				resize: none; /* textarea 사이즈 변경이 안 되도록 하는 기능 */
			}
		</style>
		<script type="text/javascript">
			$(function () {
				$("#boardUpdateBtn").click(function() {
					if(!chkData("#n_title","제목을")) return;
					else if(!chkData("#n_content","내용을")) return;
					else {
						console.log($("#n_important").val());
						$("#f_updateForm").attr({
							"method" : "post",
							"action" : "/nboard/nboardUpdate"
						});
						$("#f_updateForm").submit();
					}
				})
				
				$("#boardCancelBtn").click(function() {
					$("#f_updateForm").each(function() {
						this.reset();
					});
				});
				
				$("#boardListBtn").click(function() {
					location.href = "/nboard/nboardList";
				});
			})
		
		</script>
	</head>
	<body>
				<div class="container">
			<div class="container">
				<form id="f_updateForm" class="f_updateForm">
					<input type="hidden" id="n_num" name="n_num" value="${updateData.n_num}"/>
					
					<table class="table table-bordered">
						<tr>
							<td>글 번호</td>
							<td>${updateData.n_num}</td>
							<td>작성일</td>
							<td>${updateData.n_writedate}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${updateData.n_author}</td>
							<td>중요여부</td>
							<td>
							<c:choose>
								<c:when test="${updateData.n_important eq 1}">
									<input type="checkbox" id="n_important" name="n_important" checked="checked" value="1"/>
								</c:when>
								<c:otherwise>
									<input type="checkbox" id="n_important" name="n_important" value="0"/>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						<tr>
							<td>글 제목</td>
							<td colspan="3">
								<input class="form-control" type="text" name="n_title" id="n_title" value="${updateData.n_title }">
							</td>
						</tr>
						<tr class="table-height">
							<td>글 내용</td>
							<td colspan="3">
								<textarea class="form-control" name="n_content" id="n_content" 
								rows="8">${updateData.n_content }</textarea>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<form>
				<div class="text-right">
					<button type="button" id="boardUpdateBtn" class="btn btn-primary btn-sm">수정</button>
					<button type="button" id="boardCancelBtn" class="btn btn-primary btn-sm">취소</button>
					<button type="button" id="boardListBtn" class="btn btn-primary btn-sm">목록</button>
				</div>
			</form>
		</div>
	</body>
</html>