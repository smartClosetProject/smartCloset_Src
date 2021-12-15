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
		
		<link rel="shortcut icon" href="../image/icon.png" />
     	<link rel="apple-touch-icon" href="../image/icon.png" />
     	<style type="text/css">
     		.main{width:900px; text-align: center; }
			.product{width:280px; float: left; margin: 5px; padding-bottom: 15px; text-align: center;}
			.title{font-size: 15px; font-weight: bold; text-align: left; padding-left: 18px;}
			.price{font-size: 13px; text-align: left; margin-right: 15px; padding-left: 18px;padding-top: 3px;}
			.line{ width: 240px; background: darkgray; color: darkgray; margin-left: 5px; margin-right: 5px;}
			.orimg{width:270px; margin-bottom: 15px; margin-top: 30px;}
			.line{width:267px; height:0.2px; background-color: #D8D8D8; margin-bottom: 15px; margin-top: 15px; }
			#longline{width:880px; height:2px; background-color: gray; }
			.longline{width:860px; height:1px; background-color: #BDBDBD;}
			#best{margin-top: 40px;}
			.more{margin-right: 20px; color:#515151;}
     	</style>
     	<script type="text/javascript">
     		$(function(){
     			$(".goDetail").click(function(){
					var pr_num = $(this).attr("data-num");
					$("#pr_num").val(pr_num);
					console.log(pr_num);
					
					$("#detailProduct").attr({
						"method":"get",
						"action":"/product/subPage"
					})
					$("#detailProduct").submit();
				})
     		})
     	</script>
	</head>
<body>
	<div class="contentContainer container">
			<form id="detailProduct">
				<input type="hidden" id="pr_num" name="pr_num" />
			</form>
			<div class="main">
				<div id="mainListDate" >
					<h2>${listData[0].order} </h2>
					<div class="longline"> </div>
					<c:forEach var="list" items="${listData}" varStatus="status">
						<div class="product goDetail" data-num="${list.pr_num}">
							<c:if test="${not empty list.pr_thumb}">
								<img class="orimg"src="/uploadStorage/prDetail/thumb/${list.pr_thumb}">
							</c:if>
							<div class="title">${list.pr_name}</div>
							<div class="line"> </div>
							<div class="price">${list.pr_price} 원</div>
						</div>					
					</c:forEach>
				</div>
			</div>
		</div>
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
</body>
</html>