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
				$("#orderSearch").click(function(){
					$("#date").val($("#orderdate1").val()+"~"$("#orderdate2").val())
					$("")
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
				    				<div id ="date">
								    	<input type="date" id="orderdate1" name="orderdate1"value="2020-01-01"> ~ 
								    	<input type="date" id="orderdate2" name="orderdate2"value="2021-01-01">
								    	<input type="button" id="orderSearch" name="orderSearch" value="검색">
					    			</div>
				    			</td>
				    		</tr>
				    	</thead>
				    </table>
					    기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.
						주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.
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
				    							<input type="button" class="btn btn-default btn-sm" value="취소">
				    							<input type="button" class="btn btn-default btn-sm" value="교환">
				    							<input type="button" class="btn btn-default btn-sm" value="반품">
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