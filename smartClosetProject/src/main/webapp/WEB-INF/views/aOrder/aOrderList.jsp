<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title></title>
	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->

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
			
			// 검색 후 검색 대상과 검색 단어 출력
			let word = "<c:out value='${data.keyword}'/>"
			let value = "";
			if(word != ""){
				$("#keyword").val("<c:out value = '${data.keyword}' />");
				$("#search").val("<c:out value = '${data.search}' />");
				
				if ($("#search").val() =='m_id'){
					value = "#list tr td.goDetail";
				} else if ($("#search").val() =='order_deliverydate'){
					value = "#list tr td.deliverydate";
				} else if ($("#search").val() =='order_num'){
					value = "#list tr td.num";
				}
				console.log($(value + ":contains('" + word + "')").html());
				
				$(value + ":contains('" + word + "')").each(function() {
					var regex = new RegExp(word, 'gi'); // g: 모든 , i: 대소문자 관계없이
						$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
				});
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
			
			$(".goDetail").click(function () {
				let order_num = $(this).parents("tr").attr("data-num");
				$("#order_num").val(order_num);
				console.log("click ok");
				//상세 페이지로 이동하기 위해 form 추가
				$("#detailForm").attr({
					"method" : "get",
					"action" : "/aOrder/aOrderDetail"
				});
				$("#detailForm").submit();
			})
			
			// 페이지 클릭 시 처리
			$(".paginate_button a").click(function(e) {
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
			
		}); //최상위 $ 종료
		
		// 검색을 위한 실질적인 처리 함수
		function goPage() {
			if ($("#search").val() == "all") {
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method" : "get",
				"action" : "/aOrder/aOrderList"
			});
			$("#f_search").submit();
		}
		</script>
	</head>
	<body>
	<div>
		<form id="detailForm">
			<input type="hidden" id="order_num" name="order_num" />
		</form>
	
		<div id="aOrderSearch" class="text-left" style="margin-bottom : 20px">
			<form id="f_search" name="f_search" class="form-inline">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
				<div class="form-group">
					<label>검색조건</label>
					<select id="search" name="search" class="form-control">
						<option value="all">전체</option>
						<option value="order_num">주문 번호</option>
						<option value="m_id">회원 아이디</option>
						<option value="order_state">주문 상태</option>
					</select>
					<input type="text" id="keyword" name="keyword" value="전체 데이터 조회" class="form-control">
					<button type="button" id="searchData" class="btn btn-default">검색</button>
				</div>
			</form>
		</div>
		<%-- ==================== 리스트 시작 ==================== --%>
		<div id="aOrderList">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class=" text-center ">주문 번호</th>
						<th class="text-center ">회원 아이디</th>
						<th class="text-center ">가격</th>
						<th class="text-center ">주문 상태</th>
						<th class="text-center ">배송 완료일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty aOrderList}">
							<c:forEach var="aOrder" items="${aOrderList}" varStatus="status">
								<tr class="text-center" data-num ="${aOrder.order_num}">
									<td class="text-center num">${aOrder.order_num}</td>
									<td class="goDetail text-center">${aOrder.m_id}</td>
									<td class="text-center">${aOrder.order_totalPayment}</td>
									<td class="text-center">${aOrder.order_state}</td>
									<td class="text-center deleverydate">${aOrder.order_deliverydate}</td>
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
		<%-- =============== 주문 일괄삭제 버튼 출력 시작 =============== --%>
		<div class="text-right contentBtn ">
			<input type="button" id="exitOrderDeleteBtn" name="exitOrderDeleteBtn" value="완료 주문 삭제" class="btn btn-default">
			<p class="text-right" style="color : gray;">*완료 주문 삭제 버튼은 배송완료일로부터 7일이 지난 주문을 일괄적으로 삭제합니다.</p>
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