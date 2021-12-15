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
<style>
.cate{
position: absoulte;
 left: 100;

}

</style>

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#qnaInsertBtn").click(function(){
		if (!chkData("#m_id", "아이디를")) return;
		else if (!chkData("#q_title", "글제목을")) return;
		else if (!chkData("#q_content", "글내용을")) return;
		else if (!chkData("#q_category","카테고리를")) return;
	    else {
			if($("#file").val() != "") {
				if(!chkFile($("#file"))) return;
			}
				$("#f_writeQNA").attr({
				"method" : "post",
				"enctype": "multipart/form-data",
				"action" : "/qna/qnaInsert"
				});
				$("#f_writeQNA").submit();
		}
	});

			$("#qnaCancelBtn").click(function(){
			$("#f_writeQNA").each(function(){
					this.reset();
					});
			});
			$("#qnaListBtn").click(function(){
				location.href="/qna/qnaList";	
	});
});
			</script>
<title>Insert title here</title>
</head>
<body>
<form class="form-horizontal" id="f_writeQNA">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name ="m_id" id="m_id" value="${login.m_id}" >
    </div>
  </div>
   <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">글제목</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name ="q_title" id="q_title" >
    </div>
  </div>
   <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">글내용</label>
    <div class="col-sm-10">
      <textarea name="q_content" id="q_content" class="form-control" rows="8"></textarea>
    </div>
  </div>
 	 <div class="form-group">
    <label class="col-sm-2 control-label">카테고리</label>
    	  <select id ="q_category" name="q_category" class="cate">
                        <option value="교환">교환</option>
                        <option value="환불">환불</option>
                        <option value="기타">기타</option>
            </select>            
  </div>
 
<div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">파일첨부</label>
    <div class="col-sm-10">
      <input type="file" class="form-control" name ="file" id="file" >
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" id="qnaInsertBtn" class="btn btn-default">저장</button>
      <button type="button" id="qnaCancelBtn" class="btn btn-default">취소</button>
      <button type="button" id="qnaListBtn"  class="btn btn-default">목록</button>
    </div>
  </div>
</form>

</body>
</html>