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
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<!-- 모바일 웹 페이지 설정 끝 -->

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<style type="text/css">
			.required {
				color : red;
			}
			.table-height {
				min-height: 410px;
			}
			.contentBtn {
				min-height: 100px;
			}
			.container-fluid{
				padding-bottom: 50px !important;
			}
			.highlight1{
			width:100px;background-color:#A4AFBC; color : white;
		}
		</style>
		<script type="text/javascript">
			$(function(){
				// 검색 후 검색 대상과 검색 단어 출력
				let word = "<c:out value='${data.keyword}' />"
				let value = "";
				if (word != "") {
					$("#reviewKeyword").val("<c:out value = '${data.keyword}' />");
					$("#re_Search").val("<c:out value = '${data.search}' />");
				
					if ($("#re_Search").val() != 'r_title') {
						// :contains()는 특정 텍스트를 포함한 요소 반환
						if ($("#re_Search").val() == 'r_content') {
							value = "#list tr td.goDetail";
						} else if ($("#re_Search").val() == 'm_id') {
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
				$("#re_Search").change(function() {
					if ($("#re_Search").val() == "all") {
						$("#reviewKeyword").val("검색어 입력");
					} else if ($("#re_Search").val() != "all") {
						$("#reviewKeyword").val("");
						$("#reviewKeyword").focus();
					}
				});
				
				// 검색 버튼 클릭 시 처리 이벤트
				$("#reviewSearchBtn").click(function() {
					if ($("#re_Search").val() != "all") {
						if (!chkData("#reviewKeyword", "검색어를")) {
							return;
						}
					}
					goPage();
				});
				
				$(".deleteProc").click(function() {
					let r_num = $(this).parents("tr").attr("data-num");
					$("#r_num").val(r_num);
					console.log(r_num);
					if(confirm("리뷰를 삭제하시겠습니까?")){
						$("#r_numForm").attr({
							"method" : "get",
							"action" : "/aReview/aReviewDelete"
						});
						$("#r_numForm").submit();
					}
				});
				
				// 페이지 클릭 시 처리
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#r_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			// 검색을 위한 실질적인 처리 함수
			function goPage() {
				if ($("#re_Search").val() == "all") {
					$("#reviewKeyword").val("");
				}
				$("#r_search").attr({
					"method" : "get",
					"action" : "/aReview/aReviewList"
				});
				$("#r_search").submit();
			}
		</script>
	</head>
	<body>
		<div>
			<form id="r_numForm">
				<input type="hidden" id="r_num" value="r_num" name="r_num">
			</form>
			<h2 style="color : #1A5276;"><strong>리뷰 게시판 관리</strong></h2><br>
			<%-- =================== 검색 버튼 =================== --%>
			<div id="reviewSearch" class="text-left">
				<form id="r_search" name="r_search" class="form-inline" style="margin-bottom : 20px">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
						<span class="glyphicon glyphicon-search"></span>&nbsp;
					 <div class="form-group">
						<select id ="re_Search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="r_title">제목</option>
							<option value="r_content">내용</option>
							<option value="m_id">아이디</option>							
						</select>
							<input type="text" id="reviewKeyword" name="keyword" value="검색어 입력" class="form-control">
							<button type="button" class="btn btn-default" id="reviewSearchBtn" >검색</button>
					</div>
				</form> 
			</div>
			<!-- ---------------------검색 종료 ------------------------------>
			<!-- -------------------- 리스트 시작 -------------------------->
			<div id="reviewList" class="table-height">
			
				<c:choose>
					<c:when test="${not empty reviewList}">
						<c:forEach var="review" items="${reviewList}" varStatus="status">
							<table class="table table-bordered">
								<tbody id="list" class="table-striped">
										<tr class="text-center" data-num="${review.r_num}">
											<td class="highlight1 col-md-1">글 번호</td>
											<td class="text-left col-md-4">${count - status.index }</td>
											<td class="highlight1 col-md-1">작성자 id</td>
											<td class="text-left col-md-4">${review.m_id}</td>
											<td class="text-center col-md-1" rowspan="3"><input type="button" id="reviewDeleteBtn" name="reviewDeleteBtn" class="deleteProc btn btn-default" value="삭제"/></td>
										</tr>
										<tr class="text-center">
											<td class="highlight1 col-md-1">글 제목</td>
											<td class="text-left col-md-4">${review.r_title}</td>
											
											<td class="highlight1 col-md-1">작성일</td>
											<td class="text-left col-md-4">${review.r_regdate}</td>
											
										</tr>
										<tr class="text-center">
											<td class="highlight1 col-md-1">글 내용</td>
											<td class="text-left col-md-4" colspan="3">${review.r_content}</td>
										</tr>
										<c:if test="${not empty review.r_file }">
							 				<tr class="text-center">
							 					<td class="highlight1">이미지</td>
							 					<td colspan="3" class="text-left">
							 						<img style="max-width : 200px; max-height:200px;" src="/uploadStorage/Review/${review.r_file }">
							 					</td>
							 				</tr>
		 								</c:if>		
									</tbody>
								</table>
								
								<hr>
							</c:forEach>
						</c:when>
					<c:otherwise>
							<table class="table table-bordered">
								<tbody id="list" class="table-striped">
										<tr>
											<td colspan="4" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
										</tr>
									</tbody>
								</table>
							</c:otherwise>
					</c:choose>

			</div>			

			
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

