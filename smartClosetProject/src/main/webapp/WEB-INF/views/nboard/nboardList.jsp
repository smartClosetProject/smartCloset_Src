<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>SmartCloset - 공지 게시판 리스트</title>
	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->

		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<style type="text/css">
			.col-sm-9{
				width: 100%;
			}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function () {
			//작성하기 버튼 클릭시 처리 이벤트
			$("#nboardInsertBtn").click(function () {
				location.href="/nboard/writeForm";
			})
			//제목 믈릭시 상세 페이지로 이동을 위한 처리 이벤트
			$(".goDetail").click(function () {
				let n_num = $(this).parents("tr").attr("data-num");
				$("#n_num").val(n_num);
				
				//상세 페이지로 이동하기 위해 form 추가
				$("#detailForm").attr({
					"method" : "get",
					"action" : "/nboard/nboardDetail"
				});
				$("#detailForm").submit();
			})
			
		}); //최상위 $ 종료
		
		</script>
		
		
	</head>
	<body>
	<div>
		<form id="detailForm">
			<input type="hidden" id="n_num" name="n_num">
		</form>
	<%-- =============== 글쓰기 버튼 출력 시작 =============== --%>
		<div class="contentBtn text-right">
			<input class="text-left" type="button" id="nboardInsertBtn" name="nboardInsertBtn" value="작성하기">
		</div>
	<%-- =============== 글쓰기 버튼 출력 종료 =============== --%>
	<%-- =================== 리스트 시작 =================== --%>
			<div id="boardList" class="table-height">
				<table summary="게시판 리스트" class="table table-striped">
					<thead>
						<tr>
							<th class="order text-center col-md-1">글번호</th>
							<th class="text-center col-md-4">글제목</th>
							<th class="order col-md-1">작성일</th>
							<th class="text-center col-md-2">작성자</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty nboardList }">
								<c:forEach var="nboard" items="${nboardList }" varStatus="status">
									<tr class="text-center" data-num="${nboard.n_num }"> 
										<td>${nboard.n_num }</td> 
										<td class="goDetail text-left">${nboard.n_title }</td>
										<td class="text-left">${nboard.n_writedate }</td>
										<td class="name">${nboard.n_author }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<%-- =================== 리스트 종료 =================== --%>
		</div>
	</body>
</html>