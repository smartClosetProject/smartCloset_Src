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
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<style type="text/css">
			.float{width:420px; margin:8px; float: left;height: 500px;}
			img{width:410px; padding-bottom: 40px;}
			#order{float: right; text-align: right; margin-bottom: 40px;}
			#pr_name{font-size: 20px; text-align: left;margin-bottom: 6px;}
			#pr_price{font-size: 20px;text-align: left; font-weight: bold; margin-bottom: 8px;}
			#size, #color{font-size: 8px; text-align: left;}
			#allPrice{font-size: 20px; font-weight: bold;}
			#imgdiv{text-align: center; margin-top: 100px;}
			#img{width:750px; padding-left: 100px;}
			.menu{margin-top: 30px; text-align: center; padding: 10px;}
			.tableMenu{width:880px; height: 40px;}
			th{background-color: #c9c9c9; border-bottom: none;}
			td, th{width:220px; text-align: center;}
			#content{text-align: center; }
			#main{min-height:600px;}
			select{width: 95%; height:30px; margin-bottom: 8px;}
			option{font-size: 12px;}
			.longline{width:860px; height:1px; background-color: #BDBDBD; margin-top: 20px; margin-bottom: 20px;}
			.content{margin-top: 50px; border: 1px solid #BDBDBD;}
			.Shipping{margin-top: 15px; margin-bottom: 15px;}
			a{color:black;}
			#pr_mile{margin-bottom: 10px; font-size: 13px; color:#5e5e5e;}
			button{width:100px; margin-right: 5px; background-color: #a0a0a0;}
		</style>
		<script type="text/javascript">
 			$(function(){
 				
 				let pr_mile="${detail.pr_mile}"*100+"%";
 				let pr_price="${detail.pr_price}"*"${detail.pr_mile}";
 				$("#pr_mile").text(pr_price+"  ( "+pr_mile+" )");

				let pr_num=${detail.pr_num};
				
				$("#color").change(function(){
					let insertUrl = "/product/insertList";
					let value=JSON.stringify({
						pr_num:pr_num,
						pro_size="#pro_size".val();
						pro_color="#pro_color".val();
					})
					
					$.ajax({
						url:insertUrl,
						type:"Post",
						headers:{
							"content-Type":"application/json"
						},
						dataType:"text",
						data:value,
						error:function(){
							alert('시스템 오류입니다. 관리자에게 문의하세요.')
						},
						success:function(result){
							if(result=="success"){
								listAll(pr_num);
							}
						}
					})
				})
				function listItem(pr_num){
						$("#listPr").html("");
						let url="/product/cartList"+pr_num;
						$.getJSON(url, function(data){
							console.log("list count:"data.length);
							prlistCnt = data.length;
							$(data).each(function(){
								let pro_num=this.pro_num;
								let pr_num=this.pr_num;
								let pr_name=this.pr_name;
								let pro_size=this.pro_size;
								let pro_color = this.pro_color;
								let pr_price=this.pro_price;
								addNewList(pro_num, )
							})
						})
					}
				}
			
			})
		</script>
	</head>
	<body>
		<div id="subPage">
			<div id="main">
				<form id="productDetail">
					<div class="float">
						<img src="/uploadStorage/prDetail/${detail.pr_mainimg}">
					</div>
					<div class="float">
						<div id="pr_name">${detail.pr_name}</div>
						<div id="pr_price">${detail.pr_price} 원</div>
						<div class="longline"> </div>
						<div id="pr_mile"></div>
						<div id="pro_size">
							<select id="size" >
								<option>----선택하세요</option>
								<c:forEach var="size" items="${listSize}" varStatus="status">
									<c:if test="${not empty size}">
										<option data-proNum="${size}" value="${size}">${size}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div id="pro_color">
							<select id=color >
								<option>----선택하세요</option>
								<c:forEach var="color" items="${listColor}" varStatus="status">
									<c:if test="${not empty color}">
										<option data-proNum="${color}" value="${color}">${color}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div>
							<span id="pr_mile" name="pr_mile"></span>
						</div>
						<div>
							<ul id="listPr">
								
							</ul>
						</div>
					</div>
					<div id="order">
						<div id="allPrice">총 합계 금액</div>
					</div>
					<div>
						<button>장바구니 담기</button>
						<button>구매</button>
						<button>네이버페이</button>
					</div>
				</form>
			</div>
			<div id="content">
				<div class="menu">
					<table class="table-bordered tableMenu">
						<tr>
							<th> <a id="Detail" >디테일</a></th>
							<td><a href="#Shipping"> 배송문의</a></td>
							<td><a href="#QnA">문의</a></td>
							<td><a href="#Review">리뷰</a></td>
						</tr>					
					</table>
				</div>
				<div id="imgdiv">
					<img id="img" src="/uploadStorage/prDetail/${detail.pr_contentimg}">
				</div>
				<div class="menu">
					<table class="table-bordered tableMenu">
						<tr>
							<td><a href="#Detail">디테일</a></td>
							<th><a id="Shipping" >배송문의</a></th>
							<td><a href="#QnA">문의</a></td>
							<td><a href="#Review">리뷰</a></td>
						</tr>					
					</table>
				</div>
				<div class="content">
					<div class="Shipping">
						배송안내<br>
						7만원 이상 구매 시 무료배송, 7만원 미만의 경우 2,500원의 배송비가 추가됩니다.<br>
						(제주도 : 7만원 이상 구매 시 배송비 2,500원 할인되며, 7만원 미만의 경우 6,000원입니다)<br>
						CJ 택배로 발송되며, CJ택배로 발송시 배송기간은 2-3일(주말, 공휴일 제외) 소요될 수 있습니다.<br>
						<br>
						<br>
						<br>


						택배발송<br>
						- 평일 PM 19:00 까지 결제 완료된 주문건에 한하여 거래처에 입고요청되어 입고 완료시 정상 발송됩니다.<br>
						- 택배발송 업무시간은 평일 PM 18:00 마감됩니다.<br>
						- 주문 후 평균적으로 2~3일정도 상품 입고기간이 소요됩니다.<br>
						- 택배 발송 시 알림톡을 통해 운송장번호가 발송됩니다. (알림톡 미발송시 문자발송)<br>
					</div>
				</div>
				<div class="menu">
					<table class="table-bordered tableMenu">
						<tr>
							<td><a href="#Detail">디테일</a></td>
							<td><a href="#Shipping"> 배송문의</a></td>
							<th><a id="QnA">문의</a></th>
							<td><a href="#Review">리뷰</a></td>
						</tr>					
					</table>
				</div>
				<div class="menu">
					<table class="table-bordered tableMenu">
						<tr>
							<td><a href="#Detail">디테일</a></td>
							<td><a href="#Shipping"> 배송문의</a></td>
							<td><a href="#QnA">문의</a></td>
							<th><a id="Review">리뷰</a></th>
						</tr>					
					</table>
				</div>
			</div>
		</div>
	</body>
</html>