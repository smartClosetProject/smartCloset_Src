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
			.float{width:420px; margin:8px; float: left;}
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
			.tr{width:430px; text-align: center;}
			.th{background-color: #c9c9c9; border-bottom: none;}
			.td, .th {width:430px; text-align: center;}
			.new_div {with:420px;}
			#content{text-align: center; }
			#main{min-height:600px;}
			select{width: 98%; height:30px; margin-bottom: 8px; font-size: 15px; margin-left: 15px;}
			option{font-size: 12px;}
			.longline{width:440px; height:1px; background-color: #BDBDBD; margin-top: 20px; margin-bottom: 20px;}
			.line{width:400px; height:1px; background-color: #BDBDBD; margin-top: 8px; margin-bottom: 8px;}
			.content{margin-top: 50px; border: 1px solid #BDBDBD;}
			.Shipping{margin-top: 15px; margin-bottom: 15px;}
			a{color:black;}
			#pr_mile{margin-bottom: 10px; font-size: 13px; color:#5e5e5e; border-style: none;}
			button{width:220px; margin-right: 5px; background-color: #c9c9c9; height: 50px; boarder:0px; outline: 0px;}
			#listPr{list-style: none; margin:0;padding:0; }
			.sp_name{width:200px;}
			.pr_cnt{width:40px; text-align: center; margin-right: 0px;}
			.pro_size, .pro_color{font-size: 10px;color:#a0a0a0; }
			.pd_price{font-weight: bold;width:100px;}
			.updatebtn{font-size: 8px; width: 30px; margin-left: 0px; padding-left: 0px;}
			input[type=checkbox]{width:0px; height:0px;}
			.tablecl tr td {width:420; margin-left: 8px;}
		</style>
		<script type="text/javascript">
 			$(function(){
 				
 				let pr_mile="${detail.pr_mile}"*100+"%";
 				let pr_price="${detail.pr_price}"*"${detail.pr_mile}";
 				$("#pr_mile").text(pr_price+"  ( "+pr_mile+" )");

				let pr_num="${detail.pr_num}";
				let pr_name="${detail.pr_name}";
				let pd_price="${detail.pr_price}";
				let total=0;
				let item="";
				$("#color").change(function(){
					if ($(".pr_name").attr("data-pr_name") == pr_name) {
						console.log($('input[type="number"]').val());
						$('input[type="number"]').val(parseInt($('input[type="number"]').val()) + 1);
						
					} else {
					
						let pro_size=$("#size").val()
						let pro_color=$("#color").val()
						if(pro_size=="----선택하세요"){
							 $(".select").attr("selected",true)
							alert("사이즈를 선택해주세요.");
							return false;
						}else if(pro_color=="----선택하세요"){
							alert("색상을 선택해주세요.")
							return false;
						}
						
						$(".select").attr("selected",false);
	
		               let new_li=$("<li>")
		               new_li.addClass("list")
		               new_li.attr("data-num",pr_num);
		               let new_div=$("<div>");
		               new_div.addClass("new_div");
		               let line=$("<div>");
		               line.addClass("line");
		               
		               let table = $("<table>");
		               table.addClass("tablecl")
		               let tr1=$("<tr>");
		               tr1.addClass("tr");
		               let td_chk=$("<td>");
	// 	               td_chk.append("rowspan","2");
		               let chk=$("<input>");
		               chk.attr({"type":"checkbox","checked":"checked"});
		               let sp_name=$("<td>");
		               sp_name.attr({"value":"pr_name","colspan":"2", "data-pr_name":pr_name});
		               sp_name.html(pr_name);
		               sp_name.addClass("pr_name");
		               let td_number=$("<td>");
		               td_number.attr("rowspan","2");
		               let in_number = $("<input>");
		               in_number.attr({"type":"number","value":"1"});
		               in_number.attr("min","1");
		               in_number.addClass("pr_cnt");
		               in_number.attr("style","border:0 solid black");
		               
		               let up_button=$("<td>");
		               up_button.attr("rowspan","2");
		               let up_btn=$("<input>");
		               up_btn.attr({"type":"button","value":"변경"});
		               up_btn.addClass("updatebtn");
		
		               let td_price=$("<td>")
		               td_price.attr("rowspan","2");
		               td_price.html(pd_price);
		               td_price.addClass("pd_price");
	
		               let del_button=$("<td>");
		               del_button.attr("rowspan","2");
		               let del_btn=$("<input>");
		               del_btn.attr({"type":"button","value":"X"});
		               del_btn.addClass("deletebtn");
		               
		               let td=$("<td>");
		               let tr2=$("<tr>");
		               let td_size=$("<td>");
		               td_size.html(pro_size);
		               td_size.addClass("pro_size");
		               
		               let td_color=$("<td>");
		               td_color.html(pro_color);
		               td_color.addClass("pro_color");
		               
		               
		               td_chk.append(chk);
		               td_number.append(in_number)
		               up_button.append(up_btn);
		               del_button.append(del_btn);
		               
		               tr1.append(td_chk).append(sp_name).append(td_number).append(up_button).append(td_price).append(del_button);
		               tr2.append(td).append(td_size).append(td_color);
		               table.append(tr1).append(tr2);
		               new_div.append(table).append(line);
		               new_li.append(line).append(new_div);
		               $("#listPr").append(new_li);
		               update_total();
						}   
		               $(".select").attr("selected",true)
	            })
	            
	            
	            
				$(document).on("click",".updatebtn",function(){
            		update_total();
            		
	            })
	            
	           $(document).on("keydown",".pr_cnt",function() {
	            	  if (event.keyCode == 13) {
	            	    event.preventDefault();
	            	  };
	            });
				
				$(document).on("click",".deletebtn", function(){
					$(this).parents("li").remove();
					 $(".select").attr("selected",true)
					update_total();
				});
				
				$("#cartInput").click(function() {
					$("#productDetail").attr({
						"method":"post",
						"enctype":"multipart/form-data",
						"action":"/prDetail/prDetailInsert"
					})
					$("#productDetail").submit();
				})
				$("#cartInput").click(function() {
					let confirm_order = confirm("장바구니에 담으시겠습니까??");
					if (confirm_order) {
						if ($("input[type='checkbox']:checked").length <= 0) {
							alert("하나 이상의 상품을 선택해 주세요.");
							return;
						}
						cartSelect();
					}
				});
			})
			function update_total(){
					$("#listPr").each(function(){
						total=0;
						let number=$(this).find(".pr_cnt").val();
						let amount = (number*pd_price)
						total +=amount;
						$(this).find(".pd_price").text(amount);
						console.log(total);
						if(isNaN(total)){
							total=0;
						}
					})
					$("#totalPrice").text(total);
				}
			function cartSelect() {
				let pr_num = 0;
				let pr_cnt = 0;
				let pr_size = 0;
				let pr_color = 0;
				
				$("input[type='checkbox']:checked").each(function() {
					selectPrice = parseInt($(this).attr("data-prPrice"));
					selectCount = parseInt($(this).attr("data-goodsCount"));
					if (!isNaN(selectPrice) && !isNaN(selectCount)) {
						selectTotalPrice += selectPrice * selectCount;
					}
				});
				
				if (selectTotalPrice > 0 && selectTotalPrice < 50000 ) {
					selectShipCharge = 2500;
				}
				
				selectTotalPayment = selectTotalPrice + selectShipCharge;
				$("#totalPayment").val(selectTotalPayment);
				
				$("#cartFrm").attr({
					"method" : "post",
					"action" : "/order/orderForm"
				});
				$("#cartFrm").submit();
		</script>
	</head>
	<body>
		<div id="subPage">
			<div id="main">
				<div class="float">
					<img src="/uploadStorage/prDetail/${detail.pr_mainimg}">
				</div>
				<form id="productDetail">
					<div class="float">
						<div id="pr_name">${detail.pr_name}</div>
						<div id="pr_price">${detail.pr_price} 원</div>
						<div class="longline"> </div>
						<div id="pr_mile"></div>
						<div id="pro_size">
							<select id="size">
								<option class="select">----선택하세요</option>
								<c:forEach var="size" items="${listSize}" varStatus="status">
									<c:if test="${not empty size}">
										<option data-proNum="${size}" value="${size}">${size}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div id="pro_color">
							<select id=color >
								<option class="select" >----선택하세요</option>
								<c:forEach var="color" items="${listColor}" varStatus="status">
									<c:if test="${not empty color}">
										<option data-proNum="${color}" value="${color}">${color}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div id="order">
						<div>
							<ul id="listPr">
						
							</ul>
						</div>
						<div id="allPrice">
							총 합계 금액 : 
						<span id="totalPrice">0</span>원
						</div>
						<div id="button">	
							<button type="button" id="cartInput">장바구니 담기</button>
								<button type="button" id="naver">네이버페이</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div id="content">
				<div class="menu">
					<table class="table-bordered tableMenu">
						<tr>
							<th class="th"> <a id="Detail" >디테일</a></th>
							<td class="td"><a href="#Shipping"> 배송문의</a></td>	
						</tr>					
					</table>
				</div>
				<div id="imgdiv">
					<img id="img" src="/uploadStorage/prDetail/${detail.pr_contentimg}">
				</div>
				<div class="menu">
					<table class="table-bordered tableMenu">
						<tr>
							<td class="td"><a href="#Detail">디테일</a></td>
							<th class="th"><a id="Shipping" >배송문의</a></th>
						</tr>					
					</table>
				</div>
				<div class="content">
					<div class="Shipping">
						<table>
							<tr>
								<th>배송안내</th>
							</tr>
						</table>
						
						5만원 이상 구매 시 무료배송, 7만원 미만의 경우 2,500원의 배송비가 추가됩니다.<br>
						(제주도 : 5만원 이상 구매 시 배송비 2,500원 할인되며, 7만원 미만의 경우 6,000원입니다)<br>
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
			</div>
			<table>
				<tr>
					<td rowspan="2"><input type="checkbox" checked="checked"></td>
					<td colspan="2">물품 이름</td>
					<td rowspan="2"><input type="number"></td>
					<td rowspan="2"><input type="button"></td>
					<td rowspan="2">가격</td>
					<td rowspan="2"><input type="button"></td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td>색상</td>
				</tr>
			</table>
	</body>
</html>