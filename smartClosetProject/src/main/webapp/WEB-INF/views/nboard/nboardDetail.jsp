<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>SmartCloset - 공지 게시판 상세</title>
	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<!-- 모바일 웹 페이지 설정 끝 -->
		<style type="text/css">
			.col-sm-9{
				width: 100%;
			}
			
			.col-sm-9{
				width: 100%;
				padding-bottom: 15px;
			}
			
			.highlight1{
				width:150px;
				background-color:#A4AFBC; 
				color : white;
			}
		</style>
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			let buttonCheck=0;
			$(function() {
				
				//수정 버튼 클릭시 처리 이벤트
				$("#updateFormBtn").click(function () {
					goUrl = "/nboard/updateForm";
					$("#f_data").attr("action", goUrl);
					$("#f_data").submit();
				})
				
				//삭제 버튼 클릭시 처리 이벤트
				$("#boardDeleteBtn").click(function() {
					if(confirm("정말 삭제하시겠습니까?")){
						goUrl = "/nboard/nboardDelete";
						$("#f_data").attr("action", goUrl);
						$("#f_data").submit();
					}

				})
				
				//글쓰기 버튼 클릭시 처리 이벤트
				$("#insertFormBtn").click(function() {
					location.href = "/nboard/writeForm";
				});
				
				// 목록 버튼 클릭 시 처리 이벤트
				$("#boardListBtn").click(function() {
					location.href = "/nboard/nboardList";
				});
				
				
				
			}); //최상위 $ 종료
		</script>
	</head>
	<body>
		<div>
			<%-- ==== 수정, 삭제 시 가져갈 글 번호를 전달하는 form 데이터 ==== --%>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="n_num" value="${detail.n_num}">
			</form>
			<h2 style="color : #1A5276;"><strong>공지 관리</strong></h2><br>
		
			<%-- =============== 상세 페이지 보여주기 시작 =============== --%>
			<table class="table table-bordered">
				<tr>
					<td class="highlight1">글 번호</td>
					<td colspan="3">${detail.n_num}</td>
				</tr>
				<tr>
					<td class="highlight1">작성자</td>
					<td>${detail.n_author}</td>
					<td class="highlight1">작성일</td>
					<td>${detail.n_writedate}</td>
				</tr>
				<tr>
					<td class="highlight1">글 제목</td>
					<td>${detail.n_title}</td>
					<td class="highlight1">중요 여부</td>
					<c:choose>
					<c:when test="${detail.n_important eq '1'}"><td><img alt="" src="/resources/image/megaphone.png" style="width : 15px; height : 15px;"> </td></c:when>
					<c:otherwise><td></td></c:otherwise>
					</c:choose>
				</tr>
				<tr class="table-height" style="height : 400px">
					<td class="highlight1">글 내용</td>
					<td colspan="3">${detail.n_content}</td>
				</tr>
			</table>
			<%-- =============== 상세 페이지 보여주기 종료 =============== --%>
			<%-- =================== 버튼 출력 시작 =================== --%>
			<div class="text-right contentBtn" style="margin-bottom : 20px">
				<input type="button" class="btn btn-default btn-sm" id="insertFormBtn" value="작성"/>
				<input type="button" class="btn btn-default btn-sm" id="updateFormBtn" value="수정"/>
				<input type="button" class="btn btn-default btn-sm" id="boardDeleteBtn" value="삭제"/>
				<input type="button" class="btn btn-default btn-sm" id="boardListBtn" value="목록"/>
			</div>
			<%-- =================== 버튼 출력 종료 =================== --%>
		</div>
	</body>
</html>