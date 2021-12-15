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
<style>
.qnasearch{
 position: absolute;
  top: 430px;
  left: 100;
  width: 500px;
  height: 50px;
 
}
.page1 {
	padding : 50px;
	text-align: center;
	
	}
.button2{
width:80px;
height:35px; 

font-size:15px;
background:white;
}



</style>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	
	let word="<c:out value='${data.keyword}' />";
	let value="";
	if(word!=""){
		$("#keyword").val("<c:out value='${data.keyword}'/>")
		$("#search").val("<c:out value='${data.search}' />")
	
		if($("#search").val()!='q_content'){
			if($("#search").val()=='q_title') {
				value="#list tr td.goDetail";
			} else if($("#search").val()=='m_id'){
				value="#list tr td.name";
			} else if($("#search").val()=='q_category'){
				value ="#list tr td.goCate";
			}
			console.log($(value+":contains('" +word+ "')").html());
		
			$(value + ":contains('" +word+ "')").each(function() {
				var regex = new RegExp(word,'gi');//g:모든 i:대소문자상관없이
				$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
			});
		}
	}
	//검색 대상이 변경될 때마다 처리 이벤트
	$("#search").change(function(){
		if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터 조회합니다.");
		} else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	//검색 버튼 클릭 시 처리 이벤트
	$("#searchData").click(function(){
		if($("#search").val()!="all"){
			if(!chkData("#keyword","검색어를")){
				return;
			}
		}
		goPage();
	});
	
	$("#insertFormBtn").click(function(){
		$("#detailForm").attr({
			"method":"get",
			"action": "/qna/writeQNA"
			});
			$("#detailForm").submit();
		
	});
	
	$(".goDetail").click(function(){
		let q_num = $(this).parents("tr").attr("data-num");
		$("#q_num").val(q_num);
		console.log("글번호 : "+ q_num);
	
		$("#detailForm").attr({
			"method":"get",
			"action": "/qna/qnaDetail"
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
			"action": "/qna/qnaList"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>
<div>
<form id="detailForm">
	<input type="hidden" id="q_num" name="q_num" />
</form>
<div id="QnaSearch" class="qnasearch">
	<%--==================검색기능시작=================== --%>
	<form id="f_search" name="f_search" class="form-inline">
			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
	<div class="form-group"  style="float:left;">
				<label>검색조건</label>
		<select id="search" name="search" class="form-control" >
				<option value="all">전체</option>
				<option value="q_title">제목</option>
		        <option value="q_content">내용</option>
				<option value="q_category">카테고리</option>
				<option value="m_id">작성자</option>
		</select>
				<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" style="width:150px;height:30px;" />
				<button type="button" id="searchData" class="button button2" style="width:80px;height:30px; font-size:13px;">검색</button>
		</div>
	</form>
</div>
<div id="QnaList" class="absolute" >
<table summary="게시판 리스트" class="table table-bordered" border="1">
	<thead>
		<tr>
			<th class="order text-center col-md 1">글번호</th>
			<th class="text-center col-md-4">글제목</th>
			<th class="order col-md-2">카테고리</th>
			<th class="order col-md-2">작성일</th>
			<th class="text-center col-md-2">작성자</th>
	   </tr>
	</thead>
		<tbody id="list" class="table-striped">
		<!-- 데이터출력 -->
		<c:choose>
		<c:when test="${not empty qnaList}">
			<c:forEach var="qna" items="${qnaList }" varStatus="status">
				<tr class="text-center" data-num="${qna.q_num} ">
					<td>${count - status.index}</td>
					<td class="goDetail text-left">${qna.q_title}</td>
					<td class="goCate text-center">${qna.q_category}</td>
					<td class="text-left" >${qna.q_regdate}</td>
					<td class="name" >${qna.m_name}</td>
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
<c:if test="${not empty login}">
<div class="text-center">
	<input type="button" value="글쓰기" id="insertFormBtn" class="button button2" style ="float:right;">
</div>
</c:if>
<%-- ==============페이징출력 시작======--%>
		<div class="page1">
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
		</div>
</body>
</html>