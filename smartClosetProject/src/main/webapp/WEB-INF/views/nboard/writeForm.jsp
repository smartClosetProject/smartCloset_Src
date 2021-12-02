<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<script type="text/javascript">
			$(function () {
				//저장 버튼 클릭시
				$("#boardInsertBtn").click(function () {
					if(!chkData("#n_author","작성자를")) return;
					else if(!chkData("#n_title","제목을")) return;
					else if(!chkData("#n_content","내용을")) return;
					$("#f_writeForm").attr({
						"method" : "post",
						"action" : "/nboard/nboardInsert"
					});
					$("#f_writeForm").submit();
				});
				
				//취소 버튼 클릭시
				$("#boardCancelBtn").click(function () {
					$("#f_writeForm").each(function() {
		                this.reset();
					});
				});	
				//목록 버튼 클릭시
				$("#boardListBtn").click(function () {
					location.href = "/nboard/nboardList";
				});
				
			});//최상위 $ 끝
		</script>
		
	</head>
	<body>
		<div class="container">
			<form id="f_writeForm">
				<h3 class="text-center">글쓰기 입력 화면</h3>
				<div class="form-group">
					<label for="n_author">작성자</label> 
					<input type="text" class="form-control" name="n_author" id="n_author"
						placeholder="작성자 입력" maxlength="5">
				</div>
				<div class="form-group">
					<label for="n_title">글 제목</label> 
					<input type="text" class="form-control" name="n_title" id="n_title"
						placeholder="글제목 입력" maxlength="300">
				</div>
				<div class="form-group">
					<label for="n_important">중요 여부</label> 
					<input type="checkbox"  name="n_important" id="n_important" value="1">
				</div>
				<div class="form-group">
					<label for="n_content">글 내용</label> 
					<textarea class="form-control" rows="7" name="n_content" id="n_content"></textarea>
				</div>
				<div class="text-right">
					<button type="button" class="btn btn-success" id="boardInsertBtn">저장</button>
					<button type="button" class="btn btn-success" id="boardCancelBtn">취소</button>
					<button type="button" class="btn btn-success" id="boardListBtn">목록</button>
				</div>
			</form>
		</div>
	</body>
</html>