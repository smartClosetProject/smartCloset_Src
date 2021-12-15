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

<title>Insert title here</title>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
let replyNum, message = "작성시 입력한 비밀번호를 입력해 주세요." ,btnKind="";

$(function(){
	let q_num = ${detail.q_num};
	listAll(q_num);

/* 글입력을 위한 Ajax 연동처리 */
  $("#replyInsert").click(function(){
	 let insertUrl = "/replies/replyInsert";
	 /*JSON.stringify(): JAVASCRIPT 값이나 객체를 JSON 문자열로 반환*/
	 let value = JSON.stringify({
		 q_num : q_num,
		 r_name:$("#r_name").val(),
		 r_passwd: $("#r_passwd").val(),
	 	 r_content:$("#r_content").val()
	});
	 $.ajax({
		 url : insertUrl,
		 type : "POST",
		 headers : {"Content-Type" : "application/json"},
		 dataType:"text",
		 data : value,
		 error : function(){
			 alert('시스템 오류 입니다. 관리자에게 문의하세요');
		 },
		 beforeSend : function(){
			 if(!chkData("#r_name","작성자를")) return false;
			 else if (!chkData("#r_passwd","비밀번호를")) return false;
			 else if(!chkData("#r_content","내용을")) return false;
		 },
		 success : function(result){
			 if(result =="SUCCESS"){
				 alert("댓글 등록이 완료되었습니다.");
				 dataReset();
				 listAll(q_num);
			 }
		 }
	 	});
      });

	/**수정하기 버튼 클릭시 수정폼 출력*/

	$(document).on("click", ".update_form", function() {
			//$(".reset_btn").click();
			let currLi = $(this).parents("li");
			replyNum = currLi.attr("data-num");
			pwdReset(this);
			pwdView(currLi);
			btnKind = "upBtn";
		});
	/** 수정화면에서 수정취소 버튼(초기화 버튼) 클릭처리*/
	$(document).on("click",".reset_btn", function(){
		btnKind="";
	let conText = $(this).parents("li").find("textarea").html();
	conText = conText.replace(/(\r\n|\r\n)/g,"<br />");
	$(this).parents("li").find("input[type='button']").show();

	let conArea = $(this).parents("li").children().eq(1);
	conArea.html(conText);
	});
	/*수정화면에서 수정완료 버튼 클릭시 수정을 위한 ajax 연동처리*/
	$(document).on("click",".update_btn", function(){
		let r_num = $(this).parents("li").attr("data-num");
		let r_content = $("#content").val();
		
		if(!chkData("#content","댓글 내용을")) return;
		else {
			$.ajax({
				url:'/replies/'+r_num,
				type:'put',
				headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override":"PUT"
			},
			data:JSON.stringify({
				r_content:r_content}),
				dataType :'text',
				error : function() {
					alert('시스템 오류입니다. 관리자에게 문의하세요');
				},
				success:function(result){
					console.log("result:"+result);
					if(result == "SUCCESS"){
						alert('수정이 완료되었습니다.');
					listAll(q_num);
					}
				}
			});
		}
	})
	/*삭제하기 버튼 클릭처리*/
		$(document).on("click", ".delete_btn", function() {
			
			let currLi = $(this).parents("li");
			replyNum = currLi.attr("data-num");
			pwdReset(this);
			pwdView(currLi);
			btnKind = "delBtn";
		});
	
		/* 비밀번호 체크 화면에서 "취소" 버튼 클릭 처리 */
		/*function pwdReset(target){
			$("li .pwdArea").not(this).html("");
			$(target).parents("li").find(".pwdArea").html("");*/
		$(document).on("click", ".pwdResetBut", function() {
			pwdReset();
		});

		/* 비밀번호 입력 양식에 커서 주어졋을 경우 처리 이벤트*/
		$(document).on("focus", ".passwd", function() {
			$(this).val("");
			let span = $(this).parents("form").find("span");
			//span.removeClass("msg_error");
			//span.addClass("msg_default");
			span.html(message);
		});

		/*비밀번호 확인 버튼 클릭시 처리 이벤트*/
		$(document).on("click", ".pwdCheckBut", function() {
			let li = $(this).parents("li");
			let form = $(this).parents("form");
			let pwd = form.find(".passwd");
			let msg = form.find(".msg");
			let r_num = $(this).parents("li").attr("data-num");
			let result = 0;

			if (!formCheck(pwd, msg, "비밀번호를"))
				return;
			else {
				$.ajax({
					url : "/replies/pwdConfirm",
					type : "POST",
					data : "r_num=" + replyNum + "&r_passwd=" + pwd.val(),
					dataType : "text",
					error : function() {
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					success : function(resultData) {
						console.log("resultData :" + resultData);
						if (resultData == 0) { //일치하지 않는경우
							msg.addClass("msg_error");
							msg.text("입력한 비밀번호가 일치하지 않습니다.");
						} else if (resultData == 1) {//일치할경우
							pwdReset(form);
							/*console.log("비밀번호가일치합니다");*/
							console.log("btnKind: "+btnKind);
								if(btnKind=="upBtn"){
									updateForm(li);
								}
								else if(btnKind=="delBtn"){
									deleteBtn(r_num);
								}
									btnKind= "";
						}
					}
				});
			}
		});
	});
//최상위$종료
	/** 댓글 목록 보여주는 함수*/
	function listAll(r_num) {
		$("#comment_list").html("");
		let url = "/replies/all/" + r_num;

		$.getJSON(url, function(data) {
			console.log("list count:" + data.length);
			replyCnt = data.length;
			$(data).each(function() {
				let r_num = this.r_num;
				let r_name = this.r_name;
				let r_content = this.r_content;
				let r_date = this.r_date;
				r_content = r_content.replace(/(\r\n|\r|\n)/g, "<br />");
				addNewItem(r_num, r_name, r_content, r_date);

			});
		}).fail(function() {
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
		});
	}
	/**새로운 글을 화면에 추가하기(보여주기) 위한 함수*/
	function addNewItem(r_num, r_name, r_content, r_date) {
		let new_li = $("<li>");
		new_li.attr("data-num", r_num);
		//new_li.addClass("comment_item"); //css 디자인 요소부여
		// 작성자 정보가 지정될<p>태그
		let writer_p = $("<p>");
		//writer_p.addClass("writer");

		//작성자 정보의 이름
		let name_span = $("<span>");
		//name_span.addClass("name");
		name_span.html(r_name + "님");

		//작성일시
		let date_span = $("<span>");
		date_span.html("/" + r_date + " ");

		//수정하기 버튼
		
		let up_input = $("<input>");
		up_input.attr({
			"type" : "button",
			"value" : "수정하기"
		});
		up_input.addClass("update_form"); // 버튼을 식별하기 위한 식별자로써 사용할 class명

		//삭제하기 버튼
		let del_input = $("<input>");
		del_input.attr({
			"type" : "button",
			"value" : "삭제하기"
		});
		
		del_input.addClass("delete_btn");

		//내용
		var content_p = $("<p>");
		content_p.html(r_content);

		//조립하기
		writer_p.append(name_span).append(date_span).append(up_input).append(
				del_input)
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	}

	/*입력폼 초기화*/
	function dataReset() {
		$("#r_name").val("");
		$("#r_passwd").val("");
		$("#r_content").val("");
	}
	/** 수정 폼 화면 구현 함수 */
	function updateForm(currLi) {
		let conArea = currLi.children().eq(1);
		let conText = conArea.html();
		conText = conText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
		console.log("conText: " + conText);

		currLi.find("input[type='button']").hide();
		conArea.html("");

		let update_area = $("<span>");
		update_area.addClass("update_area");

		let textarea = $("<textarea>");
		textarea.attr({
			"name" : "content",
			"id" : "content"
		});
		textarea.html(conText);

		let update_btn = $("<input>");
		update_btn.attr({
			"type" : "button",
			"value" : "수정완료"
		});
		update_btn.addClass("update_btn");

		let reset_btn = $("<input>");
		reset_btn.attr({
			"type" : "button",
			"value" : "수정취소"
		});
		reset_btn.addClass("reset_btn");

		update_area.append(textarea).append(update_btn).append(reset_btn);
		conArea.html(update_area);
	}
	/** 비밀번호 체크를 화면 구현 */
	function pwdView(area) {
		let pwd_div = $("<div>");
		pwd_div.addClass("pwdArea");

		let pwd_form = $("<form>");
		pwd_form.attr("name", "f_pwd");

		let pwd_label = $("<label>");
		pwd_label.attr("for", "passwd");
		pwd_label.html("비밀번호 : ");

		let pwd_input = $("<input>");
		pwd_input.attr({
			"type" : "password",
			"name" : "passwd"
		});
		pwd_input.addClass("passwd");
		pwd_input.prop("autofocus", "autofocus");

		let pwd_check = $("<input>");
		pwd_check.attr({
			"type" : "button",
			"value" : "확인"
		});
		pwd_check.addClass("pwdCheckBut");

		let pwd_reset = $("<input>");
		pwd_reset.attr({
			"type" : "button",
			"value" : "취소"
		});
		pwd_reset.addClass("pwdResetBut");

		let pwd_span = $("<span>");
		pwd_span.addClass("msg");
		pwd_span.html(message);

		pwd_form.append(pwd_label).append(pwd_input).append(pwd_check).append(
				pwd_reset).append(pwd_span);
		pwd_div.append(pwd_form)
		area.append(pwd_div);
	}
	/* 비밀번호 체크 화면에서 "취소" 버튼 클릭 처리 */
	function pwdReset(target){
		$("li .pwdArea").not(this).html("");
		$(target).parents("li").find(".pwdArea").html("");
	}
	/* 글삭제를 위한 ajax 연동처리*/
	function deleteBtn(r_num){
		if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
			$.ajax({
				url : '/replies/' + replyNum,
				type : 'delete',
				headers : {
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: "+result);
					if (result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						listAll(r_num);
					}
				}
			});
		}
	}
</script>
</head>
<body>
	
<div id="replyContainer">
	<div id="comment_write">
		<!-- 입력화면 구현 -->
		
<form class="form-inline">
	<c:if test="${not empty login}">
			<div class="form-group">
		    		<label for="exampleInputName2">작성자</label>
		    		<input type="text" class="form-control" id="r_name" name="r_name" value="${login.m_id}">
		 	 </div>
		 	 <div class="form-group">
		  		  <label for="exampleInputEmail2">비밀번호</label>
		  		  <input type="text" class="form-control" id="r_passwd" name="r_passwd">
		  	</div>
		 		 <button type="button"  id="replyInsert" class="btn btn-default">저장하기</button>
					<label>댓글내용</label>
					<textarea class="form-control" rows="8" id="r_content" name="r_content"></textarea>
	</c:if>
	</form>
	</div>
	<ul id="comment_list">
		<!-- 동적 생성 요소 추가 -->
	</ul>
	</div>
</body>
</html>