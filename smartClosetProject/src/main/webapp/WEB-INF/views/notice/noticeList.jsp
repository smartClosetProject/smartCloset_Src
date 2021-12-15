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
$(function() {
	$(".goDetail").click(function(){
			let n_num = $(this).parents("tr").attr("data-num");
			$("#n_num").val(n_num);
			console.log("글번호 : "+ n_num);
		
			$("#detailForm").attr({
				"method":"get",
				"action": "/notice/noticeDetail"
				});
				$("#detailForm").submit();
		});
	$(".paginate_button a").click(function(e){
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		goPage();
	});
});
function goPage(){
	if($("#search").val() == "all"){
		$("#keyword").val("");
	}
	$("#f_search").attr({
		"method":"get",
		"action": "/notice/noticeList"
	});
	$("#f_search").submit();
}
</script>
</head>
<body>
<form id="detailForm">
	<input type="hidden" id="n_num" name="n_num" />
</form>
<form id="f_search" name="f_search" class="form-inline">
			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
</form>
<div id="NoticeList" class="absolute">
<table summary="게시판 리스트" class="table table-bordered" border="1">
	<thead>
		<tr>
			<th class="order text-center col-md 1">공지글번호</th>
			<th class="text-center col-md-4">공지제목</th>
			<th class="order col-md-2">공지작성일</th>
			<th class="text-center col-md-2">작성자</th>
	   </tr>
	</thead>
		<tbody id="list" class="table-striped">
		<!-- 데이터출력 -->
		<c:choose>
		<c:when test="${not empty noticeList}">
			<c:forEach var="notice" items="${noticeList }" varStatus="status">
			<tr class="text-center" style="font-weight:bold;" data-num="${notice.n_num} ">
				<td>${count - status.index}</td>
				<td class="goDetail text-left" style="font-weight:bold;font-family:sans-serif">${notice.n_title}</td>
				<td class="text-left" style="font-weight:bold;">${notice.n_writedate}</td>
				<td class="name" style="font-weight:bold;">${notice.n_author}</td>
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
<%-- ==============페이징출력 시작======--%>
		<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
										 end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}" >
							<a href="${num}">${num }</a>
						</li>
					</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
										<a href="${pageMaker.endPage +1 }">Next</a>
								</li>
						</c:if>
					</ul>
				</div>				
				<%--==============페이징 출력 종료========== --%>		
	
</body>
</html>