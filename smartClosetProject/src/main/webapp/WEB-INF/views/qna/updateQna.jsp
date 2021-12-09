<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>Insert title here</title>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#qnaUpdateBtn").click(function(){
		if (!chkData("#q_title", "글제목을")) return;
		else if (!chkData("#q_content", "글내용을")) return;
		else {
			$("#f_updateQna").attr({
				"method" : "post",
				"enctype": "multipart/form-data",
				"action" : "/qna/qnaUpdate"
			});
			$("#f_updateQna").submit();
		}
	});
	$("#qnaCancelBtn").click(function(){
		$("#f_updateQna").each(function(){
			this.reset();
	});
});
	$("#qnaListBtn").click(function(){
		location.href="/qna/qnaList";
	});
});
</script>
</head>
<body>
		<form id="f_updateQna" name="f_updateQna">
			<input type="hidden" id="q_num" name="q_num" value="${updateData.q_num}" />
			<input type="hidden" id="q_file" name="q_file" value="${updateData.q_file }" />
			
		<table class="table table-bordered">	
			<tbody>
					<tr>
						<td class="col-md-3">글번호</td>
						<td class="text-left col-md-3">${updateData.q_num }</td>
						<td class="col-md-3">작성일</td>
						<td class="text-left col-md-3">${updateData.q_regdate}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="3" class="text-left">${updateData.m_id}</td>
					</tr>
					<tr>
						<td>글제목</td>
						<td colspan="3" class="text-left">
							<input type="text" name="q_title" id="q_title"
							value="${updateData.q_title}" class="form-control" />
						</td>
					</tr>
					<tr class="table-tr-height">
						<td>내용</td>
						<td colspan="3" class="text-left">
							<textarea name="q_content" id="q_content" class="form-control" rows="8">${updateData.q_content}</textarea>
						</td>
					</tr>
					<tr>
						<td>파일첨부</td>
						<td colspan="3" class="text-left"><input type="file" name="file" id="file" ></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		<div class="contentBtn text-right">
			<input type="button" value="수정" id="qnaUpdateBtn" class="btn btn-success" />
			<input type="button" value="취소" id="qnaCancelBtn" class="btn btn-success" />
			<input type="button" value="목록" id="qnaListBtn" class="btn btn-success" />
		</div>
</body>
</html>