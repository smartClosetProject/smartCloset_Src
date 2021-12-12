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
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		
		<!-- 모바일 웹 페이지 설정 끝 -->
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function () {
				$("#updateMileBtn").click(function () {
					goUrl="/aMember/updateMileForm";
					$("#f_data").attr("action", goUrl);
					$("#f_data").submit();
				});
				
				$("#updateExitDateBtn").click(function () {
					if(confirm("오늘 날짜로 탈퇴일을 변경하시겠습니까?")){
						goUrl="/aMember/updateExitDate";
						$("#f_data").attr("action", goUrl);
						$("#f_data").submit();
					}
				});
				
				$("#cancleExitDateBtn").click(function () {
					if(confirm("탈퇴일을 삭제하시겠습니까?")){
						goUrl="/aMember/resetExitDate";
						$("#f_data").attr("action", goUrl);
						$("#f_data").submit();
					}
				});
				
				$("#aMemberListBtn").click(function () {
					location.href="/aMember/aMemberList";
				});
			}); // 최상위 $ 종료
		</script>
	</head>
	<body>
		<div>
			<%-- ==== 수정, 삭제 시 가져갈 회원 ID를 전달하는 form 데이터 ==== --%>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="m_id" id="m_id" value="${aMemberDetail.m_id}">
			</form>
			<h2 style="color : #1A5276;"><strong>회원 관리</strong></h2><br>
			
			<%-- =============== 상세 페이지 보여주기 시작 =============== --%>
			<table class="table table-bordered">
				<tr>
					<td>회원 아이디</td>
					<td>${aMemberDetail.m_id}</td>
					<td>회원 이름</td>
					<td>${aMemberDetail.m_name}</td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${aMemberDetail.m_regdate}</td>
					<td>탈퇴일</td>
					<td>${aMemberDetail.m_exitdate}</td>
				</tr>
				<tr>
					<td>포인트</td>
					<td>${aMemberDetail.m_mile}</td>
					<td>누적 구매액</td>
					<td>${aMemberDetail.m_acc}</td>
				</tr>
			</table>
			<%-- =============== 상세 페이지 보여주기 종료 =============== --%>
			<%-- =================== 버튼 출력 시작 =================== --%>
			<div class="text-right contentBtn" style="margin-bottom : 20px">
				<input type="button" class="btn btn-default btn-sm" id="updateMileBtn" value="포인트 변경"/>
				<input type="button" class="btn btn-default btn-sm" id="updateExitDateBtn" value="탈퇴"/>
				<input type="button" class="btn btn-default btn-sm" id="cancleExitDateBtn" value="탈퇴 취소"/>
				<input type="button" class="btn btn-default btn-sm" id="aMemberListBtn" value="목록"/>
			</div>
			<%-- =================== 버튼 출력 종료 =================== --%>
		
		</div>
	</body>
</html>