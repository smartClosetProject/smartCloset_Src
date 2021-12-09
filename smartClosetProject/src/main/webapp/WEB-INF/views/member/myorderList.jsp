<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<title>주문내역조회</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
	
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
		<script type="text/javascript">
			$(function(){
				//달력 눌러서 기간 검색 버튼 클릭시 
				$("#orderSearch").click(function(){
						let startDate = $("#startDate").val();
						let endDate = $("#endDate").val();
						
				});
				//교환 버튼 클릭시
				$("#orderChange").click(function(){
					location.href = "/qna/writeQNA"
				});
				//반품 버튼 클릭시
				$("#orderReturn").click(function(){
					location.href = "/qna/writeQNA"
				});
				
			});
			
			
		</script>
	</head>
	<body>
		<div class="contentContainer myorderDiv">
			<form id="r_numForm">
				<input type="hidden" id="m_id" value="m_id" name="m_id">

			</form>
			
			<div style="font-weight: bold;font-size: 30px; text-align:center;">MY ORDER</div>
			
			<div id="SearchForm">
				<form>
				    <table border="1" class="table table-bordered">
				    	<thead>
				    		<tr>
				    			<td>
				    				<div id ="order_regdate">
								    	<input type="date" id="startDate" name="startDate"value="2020-01-01">~
								    	<input type="date" id="endDate" name="endDate"value="2021-01-01">
								    	<input type="button" id="orderSearch" name="orderSearch" value="검색">
					    			</div>
				    			</td>
				    		</tr>
				    	</thead>
				    </table>
					    기본적으로 최근 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.
				    <br />
				    <br />
				    <table border="1" class="table table-bordered">
				    	<thead>
				    		<tr>
				    			<th class="text-center col-md-2">구매일자</th>
				    			<th class="text-center col-md-2">상품</th>
				    			<th class="text-center col-md-2">상품이름</th>
				    			<th class="text-center col-md-1">수량</th>
				    			<th class="text-center col-md-2">상품 구매금액</th>
				    			<th class="text-center col-md-2">주문 처리상태</th>
				    			<th class="text-center col-md-2">취소/교환/반품</th>
				    		</tr>
				    	</thead>
				    	<tbody id="list" class="table-striped">
				    		<!-- 데이터 출력 -->
				    		<c:choose>
				    			<c:when test="${not empty myorderList}">
				    				<c:forEach var="myorder" items="${myorderList}" varStatus="status">
				    					<tr>
				    						<td class="text-center">${myorder.order_regdate}</td>
				    						<td class="text-center">${myorder.pr_thumb}</td>
				    						<td class="text-center">${myorder.pr_name}</td>
				    						<td class="text-center">${myorder.od_goodscount}</td>
				    						<td class="text-center">${myorder.order_totalPayment}</td>
				    						<td class="text-center">${myorder.order_state}</td>
				    						<td>
				    							<input type="button" class="btn btn-default btn-sm" id="orderChange" value="교환">
				    							<input type="button" class="btn btn-default btn-sm" id="orderReturn" value="반품">
				    						</td>
				    					</tr>
				    				</c:forEach>
				    			</c:when>
				    		</c:choose>
				    </table>
		   	 	</form>	
	   	 	</div>
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