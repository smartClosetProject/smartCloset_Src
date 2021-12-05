<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<title>리뷰 게시판</title>
		
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
			$(function(){
				// 검색 후 검색 대상과 검색 단어 출력
				let word = "<c:out value='${data.keyword}' />"
				let value = "";
				if (word != "") {
					$("#keyword").val("<c:out value = '${data.keyword}' />");
					$("#search").val("<c:out value = '${data.search}' />");
				
					if ($("#search").val() != 'b_content') {
						// :contains()는 특정 텍스트를 포함한 요소 반환
						if ($("#search").val() == 'b_title') {
							value = "#list tr td.goDetail";
						} else if ($("#search").val() == 'b_name') {
							value = "#list tr td.name";
						}
						console.log($(value + ":contains('" + word + "')").html());
						
						$(value + ":contains('" + word + "')").each(function() {
							var regex = new RegExp(word, 'gi'); // g: 모든 , i: 대소문자 관계없이
							$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
						});
					}
				}
				// 검색 대상이 변경될 때마다 처리 이벤트
				$("#search").change(function() {
					if ($("#search").val() == "all") {
						$("#keyword").val("검색어 입력");
					} else if ($("#search").val() != "all") {
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				// 검색 버튼 클릭 시 처리 이벤트
				$("#reviewSearchBtn").click(function() {
					if ($("#search").val() != "all") {
						if (!chkData("#keyword", "검색어를")) {
							return;
						}
					}
					goPage();
				});
				// 글쓰기 버튼 클릭 시 처리 이벤트
				$("#insertFormBtn").click(function() {
					location.href = "/board/writeForm"; /* jsp의 요청은 모두 매핑으로 준다. */
				});
				
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<form id="r_numForm">
				<input type="hidden" id="m_id" name="m_id">
			</form>
			
			<!-- -------------------검색 시작 ------------------------- -->
			<div id="revewSearch" class="text-right">
				<form id="r_search" name="r_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
				</form>
			</div>
			<!-- --------------------검색 종료 ---------------------------->
			<!-- -------------------- 리스트 시작 -------------------------->
			<div id="reviewList" class="table-height">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="order text-center col-md-1">번호</th>
						<th class="text-center col-md-2">상품</th>
						<th class="text-center col-md-4">제목</th>
						<th class="text-center col-md-2">작성자(아이디)</th>
					</tr>
				</thead>
				<tbody id="list" class="table-striped">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty reviewList}">
							<c:forEach var="review" items="${reviewList}" varStatus="status">
								<tr class="text-center" data-num="${review.r_num}"> <!-- ${review.r_num } 실제 글 번호 -->
									<td>${count - status.index }</td>

									<td class="text-left">${review.r_thumb}</td>
									<td class="text-left">${review.r_title}</td>
									<td class="text-left">${review.m_id}</td>
									
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
			<%-- =================== 검색 버튼 =================== --%>
			<div id="reviewSearch">
			<form>
					<span class="glyphicon glyphicon-search"></span>&nbsp; 
						<select id ="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="r_title">제목</option>
							<option value="r_content">내용</option>
							<option value="m_id">아이디</option>							
						</select>
					<input type="text" id="keyword" name="keyword" value="검색어 입력" class="form-control">
					<input type="button" name="reviewSearchBtn" class="btn btn-default" id="reviewSearchBtn" value="검색">
			</form>
			</div>
				<div class="contentBtn text-right">
				<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success">
			</div>
			<!-- ---------------------검색 종료 ------------------------------>
			
			<!------------------------ 페이징 출력 ---------------------------->
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
		</div>
	
	</body>
</html>