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
		<script type="text/javascript">
		//저장 버튼 클릭시 처리
		$(function(){
			$("#reviewInsertBtn").click(function(){
				if(!chkData("#r_title","글 제목을")) {
					return;
				} else if (!chkData("#r_content","글 내용을")){
					return;
				} else if (!chkData("#file","파일을")){
					return;
				}
				$("#r_writeForm").attr({
					"method" : "post",
					"enctype" : "multipart/form-data",
					"action"  : "/review/reviewInsert"
				});
				$("#r_writeForm").submit();
			});
			//목록으로 되돌아가기
			$("#reviewListBtn").click(function(){
				location.href = "/review/reviewList";
			});
		});
		
		
		</script>	
	
	</head>
	<body>
	<div class="container">
			<form id="r_writeForm">
			<input type="hidden" id="m_id" value="smartmember" name="m_id">
				<h3 class="text-center">글쓰기 입력 화면</h3>
				<div class="form-group">
					<label for="m_id">작성자</label> 
					${m_id}
				</div>
				<div class="form-group">
					<label for="r_title">글제목</label> 
					<input type="text" class="form-control" name="r_title" id="r_title"
						placeholder="글제목 입력" maxlength="300">
				</div>
				<div class="form-group">
					<label for="r_content">글내용</label> 
					<textarea class="form-control" rows="30" name="r_content" id="r_content">
키 :
몸무게 :
착용 사이즈 :
후기 :
					</textarea>
				</div>
				<div class="form-group">
					<label>파일첨부</label> 
					<input type="file" class="form-control" name="file" id="file">
				</div>
				<div class="text-right">
					<button type="button" class="btn btn-success" id="reviewInsertBtn">저장</button>
						<div class="text-left">
							<button type="button" class="btn btn-success" id="reviewListBtn">목록</button>
						</div>
				</div>
			</form>
		</div>
	
	</body>
</html>