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
<head>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	let r_num = ${detail.r_num};
	listAll(r_num);

/* 글입력을 위한 Ajax 연동처리 */
  $("#replyInsert").click(function() {
	 let insertUrl = "/replies/replyInsert";
	 /*JSON.stringify(): JAVASCRIPT 값이나 객체를 JSON 문자열로 반환*/
	 let value = JSON.stringify({
		 b_num : b_num,
		 r_name:$("#r_name").val(),
	 	 r_pwd: $("#r_pwd").val(),
	 	 r_content:$("#r_content").val()
	});
 $.ajax({
	 url : insertUrl,
	 type : "post",
	 headers : {
		  "Content-Type" : "application/json"
	 },
	 dataType:"text",
	 data : value,
	 error : function(){
		 alert('시스템 오류 입니다. 관리자에게 문의하세요');
	 },
	 beforeSend : function(){
		 if(!chkData("#r_name","작성자를")) return false;
		 else if (!chkData("#r_pwd","비밀번호를")) return false;
		 else if(!chkData("#r_content","내용을")) return false;
	 },
	 success : function(result){
		 if(result =="SUCCESS"){
			 alert("댓글 등록이 완료되었습니다.");
			 dataReset();
			 listAll(b_num);
		 }
	 		}
 		 })
      });
 }); //최상위$종료
/** 댓글 목록 보여주는 함수*/
 function listAll(b_num){
	 $("#comment_list").html("");
	 let url ="/replies/all/"+b_num;
}
function listAll(b_num){
	$("#comment_list").html("");
	let url = "/replies/all/"+b_num;
	
	$.getJSON(url, function(data) {
		console.log("list count:" + data.length);
		replyCnt = data.length;
		$(data).each(function() {
			let r_num = this.r_num;
			let r_name = this.r_name;
			let r_content = this.r_content;
			let r_date = this.r_date;
			r_content = r_content.replace(/(\r\n|\r|\n)/g,"<br />");
			addNewItem(r_num, r_name, r_content,r_date);
			
		});
	}).fail(function(){
		alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
	});
}
/**새로운 글을 화면에 추가하기(보여주기) 위한 함수*/
function addNewItem(r_num, r_name, r_content,r_date) {
	let new_li =$ ("<li>");
	new_li.attr("data-num", r_num);
	//new_li.addClass("comment_item"); //css 디자인 요소부여
	// 작성자 정보가 지정될<p>태그
	let writer_p =$("<p>");
	//writer_p.addClass("writer");

	//작성자 정보의 이름
	let name_span = $("<span>");
	//name_span.addClass("name");
	name_span.html(r_name +"님");

	//작성일시
	let date_span=$("<span>");
	date_span.html("/"+r_date+" ");

	//수정하기 버튼
	let up_input = $("<input>");
	up_input.attr({"type":"button","value":"수정하기"});
	up_input.addClass("update_form"); // 버튼을 식별하기 위한 식별자로써 사용할 class명

	//삭제하기 버튼
	let del_input = $("<input>");
	del_input.attr({"type":"button","value":"삭제하기"});
	del_input.addClass("delete_btn");

	//내용
	var content_p = $("<p>");
	content_p.html(r_content);
	
	//조립하기
	writer_p.append(name_span).append(date_span).append(up_input).append(del_input)
	new_li.append(writer_p).append(content_p);
	$("#comment_list").append(new_li);
}
	/*입력폼 초기화*/
	function dataReset() {
		$("#r_name").val("");
		$("#r_pwd").val("");
		$("#r_content").val("");
	}
	</script>
</head>
<body>
<div id="replyContainer">
	<div id="comment_write">
		<!-- 입력화면 구현 -->
<form class="form-inline">
  	<div class="form-group">
    		<label for="exampleInputName2">작성자</label>
    		<input type="text" class="form-control" id="r_name" name="r_name">
 	 </div>
 	 <div class="form-group">
  		  <label for="exampleInputEmail2">비밀번호</label>
  		  <input type="text" class="form-control" id="r_pwd" name="r_pwd">
  	</div>
 		 <button type="button"  id="replyInsert" class="btn btn-default">저장하기</button>
			<label>댓글내용</label>
			<textarea class="form-control" rows="3" id="r_content" name="r_content"></textarea>

</form>

</div>

	
	
	
	
	<ul id="comment_list">
		<!-- 동적 생성 요소 추가 -->
	</ul>
	</div>
</body>
</html>