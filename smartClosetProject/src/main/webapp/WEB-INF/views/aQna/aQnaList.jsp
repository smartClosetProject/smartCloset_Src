<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>Insert title here</title>
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<style type="text/css">
			.required {
					color : red;
				}
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
			$(function() {
				// 검색 후 검색 대상과 검색 단어 출력
				let word = "<c:out value='${data.keyword}' />"
				let value = "";
				if (word != "") {
					$("#keyword").val("<c:out value = '${data.keyword}' />");
					$("#search").val("<c:out value = '${data.search}' />");
				
					if ($("#search").val() != 'q_content') {
						// :contains()는 특정 텍스트를 포함한 요소 반환
						if ($("#search").val() == 'q_title') {
							value = "#list tr td.goDetail";
						} else if ($("#search").val() == 'm_id') {
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
						$("#keyword").val("전체 데이터 조회");
					} else if ($("#search").val() != "all") {
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				// 검색 버튼 클릭 시 처리 이벤트
				$("#searchData").click(function() {
					if ($("#search").val() != "all") {
						if (!chkData("#keyword", "검색어를")) {
							return;
						}
					}
					goPage();
				});
				
				
				// 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트
				$(".goDetail").click(function() {
					let q_num = $(this).parents("tr").attr("data-num");
					$("#q_num").val(q_num);
					// console.log(b_num);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/aQna/aQnaDetail"
					});
					$("#detailForm").submit();
				});
				
				// 페이지 클릭 시 처리
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			
			// 검색을 위한 실질적인 처리 함수
			function goPage() {
				if ($("#search").val() == "all") {
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method" : "get",
					"action" : "/aQna/aQnaList"
				});
				$("#f_search").submit();
			}
		</script>
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
	</head>
	<body>
		<div>
			<form id="detailForm">
				<input type="hidden" id="q_num" name="q_num">
			</form>
			<h2 style="color : #1A5276;"><strong>QnA 게시판 관리</strong></h2><br>
			
			<%-- =================== 검색 시작 =================== --%>
			<div id="boardSearch" class="text-left"  style="margin-bottom : 20px">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="q_title">제목</option>
							<option value="q_content">내용</option>
							<option value="m_id">작성자</option>
						</select>
						<input type="text" id="keyword" name="keyword" value="전체 데이터 조회" class="form-control">
						<button type="button" id="searchData" class="btn btn-default">검색</button>
					</div>
				</form>
			</div>
			<%-- =================== 검색 종료 =================== --%>
			
			<%-- =================== 리스트 시작 =================== --%>
			<div id="aQnaList" class="table-height">
				<table summary="게시판 리스트" class="table table-hover">
					<thead>
						<tr>
							<th class="order text-center col-md-1">글번호</th>
							<th class="text-center col-md-4">글제목</th>
							<th class="text-center col-md-1">작성일</th>
							<th class="text-center col-md-2">작성자</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty aQnaList }">
								<c:forEach var="aQna" items="${aQnaList }" varStatus="status">
									<tr class="text-center" data-num="${aQna.q_num }">
										<td class="text-center">${count - status.index }</td>
										<td class="goDetail text-center">${aQna.q_title }
											<c:if test="${aQna.r_cnt>0}">
												<span class="reply_count ">[${aQna.r_cnt}]</span>
											</c:if>
										</td>
										<td class="text-center">${aQna.q_regdate }</td>
										<td class="name text-center">${aQna.m_id }</td>
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
			
			<%-- ================ 글쓰기 버튼 출력 시작 ================ --%>
		</div>
	</body>
</html>