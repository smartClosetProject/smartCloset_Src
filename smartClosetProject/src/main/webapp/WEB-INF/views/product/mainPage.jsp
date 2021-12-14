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
		
		<link rel="shortcut ipr_pricecon" href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
		<style type="text/css">
			.main{width:900px; text-align: center;  }
			.product{width:280px; float: left; margin: 5px; padding-bottom: 15px; text-align: center;}
			.title{font-size: 15px; font-weight: bold; text-align: left; padding-left: 18px;}
			.price{font-size: 13px; text-align: left; margin-right: 15px; padding-left: 18px;padding-top: 3px;}
			.line{ width: 240px; background: darkgray; color: darkgray; margin-left: 5px; margin-right: 5px;}
			.primg{width:270px; margin-bottom: 15px; margin-top: 30px;}
			#mainListSales{width:890px; margin-bottom: 40px;}
			#mainListDate{width:890px; margin-bottom: 25px; margin-top: 10px; padding-bottom: 50px;}
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
					<h2>NEW 6</h2>
					<div class="longline"> </div>
					<c:forEach var="date" items="${listDate}" varStatus="status">
						<div class="product goDetail" data-num="${date.pr_num}">
							<c:if test="${not empty date.pr_thumb}">
								<img src="/uploadStorage/prDetail/thumb/${date.pr_thumb}">
							</c:if>
							<div class="title">${date.pr_name}</div>
							<div class="line"> </div>
							<div class="price">${date.pr_price} 원</div>
						</div>					
					</c:forEach>
					<div >
						<a href="/product/order/pr_regdate" class="more">[more]</a>
					</div>
				</div>
				<div id="longline"> </div>
				<div id="mainListSales">
					<h2 id="best">BEST 6</h2>
					<div class="longline"> </div>
					<c:forEach var="ListSales" items="${listSales}" varStatus="status">
						<div class="product goDetail" data-num="${ListSales.pr_num}">
							<c:if test="${not empty ListSales.pr_thumb}">
								<img class="primg" src="/uploadStorage/prDetail/thumb/${ListSales.pr_thumb}">
							</c:if>
							<div class="title">${ListSales.pr_name}</div>
							<div class="line"> </div>
							<div class="price">${ListSales.pr_price} 원</div>
						</div>
					</c:forEach>
					<div >
						<a href="/product/order/pr_sales" class="more">[more]</a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>