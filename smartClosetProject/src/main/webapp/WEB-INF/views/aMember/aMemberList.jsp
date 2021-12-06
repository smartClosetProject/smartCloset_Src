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
	</head>
	<body>
	<div>
		<form id="aMemberListForm">
			<input type="hidden" id="m_id" name="m_id"/>
		</form>
	
		<%-- ================= 검색 시작 ================== --%>
		<div id="aMemberSearch" class="text-left" style="margin-bottom : 20px">
			<form id="f_amsearch" name="f_amsearch" class="form-inline">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
				<div class="form-group">
					<label>검색조건</label>
					<select id="search" name="search" class="form-control">
						<option value="all">전체</option>
						<option value="m_id">id</option>
						<option value="m_name">이름</option>
					</select>
					<input type="text" id="keyword" name="keyword" value="전체 데이터 조회" class="form-control">
					<button type="button" id="searchData" class="btn btn-default">검색</button>
				</div>
			</form>
		</div>
		<%-- =================== 검색 종료 ==================== --%>
	
		<%-- ==================== 리스트 시작 ==================== --%>
		<div id="aMemberList">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="order text-center col-md-1">회원 id</th>
						<th class="text-center col-md-4">회원 이름</th>
						<th class="order col-md-1">가입일</th>
						<th class="text-center col-md-2">탈퇴일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty aMemberList}">
							<c:forEach var="aMember" items="${aMemberList}" varStatus="status">
								<tr class="text-center" data-num ="${aMember.m_id}">
									<td class="goDetail text-left">${aMember.m_id }</td>
									<td >${aMember.m_name}</td>
									<td class="text-left">${aMember.m_regdate}</td>
									<td class="text-left">${aMember.m_exitdate}</td>
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
		<%-- ==================== 리스트 종료 ==================== --%>
		<%-- =============== 회원 일괄탈퇴 버튼 출력 시작 =============== --%>
			<div class="text-right contentBtn ">
				<input type="button" id="exitMemberDeleteBtn" name="exitMemberDeleteBtn" value="탈퇴 회원 삭제" class="btn btn-default">
				<p class="text-right" style="color : gray;">*탈퇴 회원 삭제 버튼은 탈퇴일로부터 5년이 지난 회원을 일괄적으로 영구삭제합니다.</p>
			</div>
			<%-- =============== 회원 일괄탈퇴 버튼 출력 종료 =============== --%>
	
		<%-- ================= 페이징 출력 시작 ================= --%>
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage - 1 }">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					<li class="paginate_button ${(pageMaker.cvo.pageNum == num) ? 'active':''}">
						<a href="${num }">${num }</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li class="paginate_button next">
						<a href="${pageMaker.endPage + 1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<%-- ================= 페이징 출력 종료 ================= --%>
	</div>
	</body>
</html>