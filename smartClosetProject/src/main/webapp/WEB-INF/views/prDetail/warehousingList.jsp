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
		
		<link rel="shortcut icon" href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
		<style type="text/css">
			.table-height{min-height:450px;  width:1600px;}
			.category select{width:150px; float: left; margin-right:30px;}
			.date input{width:370px; height:25px; margin-right: 30px; margin-top: 5px;}
			.issale{margin-right: 75px;}
			#searchData{height:80px;}
		</style>
		<script type="text/javascript">
			$(function(){
				$("#insertWarBtn").click(function(){
					location.href="/prDetail/insertWarehousing";
				})
			})
		</script>
	</head>
	<body>
		<div id="prDetailList" class="table-height">
			<table class="table">
				<thead>
					<tr>
						<th class="order text-center col-md-1">거래처 번호</th>
						<th class="text-center col-md-2">상품상세번호</th>
						<th class="text-center col-md-2">개별 금액</th>
						<th class="text-center col-md-1">수량</th>
						<th class="text-center col-md-1">총 금액</th>
						<th class="text-center col-md-1">입고일자</th>
					</tr>
				</thead>
				<tbody id="list" class="table-striped table-bordered">
					<c:choose>
						<c:when test="${not empty warehousingList}">
							<c:forEach var="warehousing" items="${warehousingList}" varStatus="status">
								<tr class="text-center">
									<td class="text-center">${warehousing.cl_name}</td>
									<td class="text-center">${warehousing.pro_num}</td>
									<td class="text-center">${warehousing.cl_price}</td>
									<td class="text-center">${warehousing.cl_amount}</td>
									<td class="text-center">${warehousing.cl_allPrice}</td>
									<td class="text-center">${warehousing.cl_regdate}</td>
								</tr>
							</c:forEach>	
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">
									등록된 물품이 없습니다.
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum ==num ? 'active':'' }">
							<a href = "${num}">${num}</a>
						</li>					
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href ="${pageMaker.endPage+1}">next</a>
						</li>
					</c:if>
				</ul>
			</div>
			<div>
				<input type="button" value="등록" id="insertWarBtn" class="btn btn-info btn-default" />
			</div>
		</div>
	</body>
</html>