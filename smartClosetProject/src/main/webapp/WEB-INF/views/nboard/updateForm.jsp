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
						if($("#n_important").is(":checked")){
							$("#n_important").val(1);
						} else {
							$("#n_important").val(0);
						}
						
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
					<h3 class="text-left">공지 수정</h3><br>
					<div class="form-group" style="font-weight : bold">
						<p>글 번호 | ${updateData.n_num}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						작성일  | ${updateData.n_writedate}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						작성자  | ${updateData.n_author}</p>
					</div>
					<div class="form-group">
						<label for="n_title">글 제목</label> 
						<input class="form-control" type="text" name="n_title" id="n_title" value="${updateData.n_title }">
					</div>
					<div class="form-group">
						<label for="n_important">중요 여부</label> 
						<c:choose>
							<c:when test="${updateData.n_important eq 1}">
								<input type="checkbox" id="n_important" name="n_important" checked="checked" value="${updateData.n_important}"/>
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="n_important" name="n_important" value="${updateData.n_important}"/>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<label for="n_content">글 내용</label> 
						<textarea class="form-control" name="n_content" id="n_content" 
								rows="12" style="resize : none">${updateData.n_content }</textarea>
					</div>
				</form>
			</div>
			<form>
				<div class="text-right">
					<button type="button" id="boardUpdateBtn" class="btn btn-default btn-sm">수정</button>
					<button type="button" id="boardCancelBtn" class="btn btn-default btn-sm">취소</button>
					<button type="button" id="boardListBtn" class="btn btn-default btn-sm">목록</button>
				</div>
			</form>
		</div>
	</body>
</html>