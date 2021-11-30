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

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
$("#pwdChk").css("visibility","hidden");

	$("#updateFormBtn").click(function(){
		$("#pwdChk").css("visibility","visible");
		$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
		buttonCheck = 1;
	});
	
	$("#boardDeleteBtn").click(function(){
		$("#pwdChk").css("visibility", "visible");
		$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
		buttonCheck = 2;
	});
		
	$("#pwdBtn").click(function(){
			boardPwdConfirm();
	});
		
	$("#boardListBtn").click(function(){
			location.href="/views/qnaList";
	});
	
	$("#insertFormBtn").click(function(){
			location.href="/views/writeQNA";
	});
});
		
	function boardPwdConfirm() {
		if(!formCheck($('#q_pwd'),$('#msg'),"비밀번호를"))  {
			return;	
	} else {
			$.ajax({
				url : "/views/pwdConfirm",//전송url
				type : "post", // 전송시 method 방식
				data : $("#q_pwd").serialize(),
				dataType : "text",
				error : function(){
					alert('시스템 오류입니다.관리자에게 문의하세요');
				},
				success : function(resultData){
					var goUrl="";
					if(resultData=="실패"){
						$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
						$("#q_pwd").select();
					}else if(resultData=="성공"){
						$("#msg").text("");
						if(buttonCheck==1){
							goUrl="/views/updateForm";
							$("#f_data").attr("action",goUrl);
							$("#f_data").submit();
						} else if(buttonCheck==2){
							if(confirm("정말 삭제하시겠습니까?")){
								goUrl  = "/board/boardDelete";
								$("#f_data").attr("action",goUrl);
								$("#f_data").submit();
							}
						}
					}
				}
			});
		}
	}
</script>
<title></title>
</head>
<body>
<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 상세보기<h3> -->
<%--수정 및 삭제 시 글번호, 원본파일명, 썸네일파일명을 전달하는 폼 --%>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="b_num" value="${detail.q_num }" />
			<input type="hidden" name="b_file" value="${detail.q_file }" />
		</form>
<div class="text-center"><h3>QNA게시판 상세화면</h3></div>
	<div class="container">
			<table class="table table-bordered">
		 			<tr>
		 				<td>회원번호</td>
		 				<td colspan="3">${detail.m_num}</td>
		 			</tr>
		 			<tr>
		 				<td>글번호</td>
		 				<td colspan="3">${detail.q_num}</td>
		 			</tr>
		 			<tr>
		 				<td>글제목</td>
		 				<td colspan="3">${detail.q_title}</td>
		 			</tr>
		 			<tr class="table-height">
		 				<td>글내용</td>
		 				<td colspan="3">${detail.q_content}</td>
		 			</tr>
					<tr>
						<td>작성일</td>
						<td colspan="3">${detail.q_regdate}</td>
					</tr>
				</table>
		</div>
	
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="q_num" value="${detail.q_num}" />
			</form>
			<%--비밀번호 확인 버튼 및 버튼 추가 시작 --%>
			<div id="boardPwdBut" class="row text-center">
				<div id="pwdChk" class="authArea col-md-8 text-left">
				<form name="f_pwd" id="f_pwd" class="form-inline">
				<input type="hidden" name="q_num" id="q_num" value="${detail.q_num}" />
				<label for="q_pwd" id="q_pwd">비밀번호 : </label>
				<input type="password" name="q_pwd" id="q_pwd" class="form-control" />
				<button type="button" id="pwdBtn" class="btn btn-default"> 확인</button>
				<span id="msg"></span>
				</form>
				</div>
				<div class="btnArea col-md-4 text-right">
					<input type="button" value="글수정" id="updateFormBtn" class="btn btn-success" />
					<input type="button" value="글삭제" id="boardDeleteBtn" class="btn btn-success" />
					<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success" />
					<input type="button" value="목록"   id="boardListBtn" class="btn btn-success" />			
				</div>
		
		</div>
	</body>
</html>