<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			#pro_size, #pro_color{font-size: 8px; text-align: left;}
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
 			input[type=checkbox]{width:0px; height:0px;} */
			.tablecl {width:420px; margin-left: 8px;}
			.list{width: 420px;}
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
// 				let item="";
				$("#pro_color").change(function(){
						
					
						let pro_size=$("#pro_size").val()
						let pro_color=$("#pro_color").val()
						
						if(pro_size=="----선택하세요"){
							 $(".select").attr("selected",true)
							alert("사이즈를 선택해주세요.");
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
		               let chk=$("<input>");
		               chk.attr({"type":"checkbox","checked":"checked"});
		               let sp_name=$("<td>");
		               sp_name.attr({"value":"pr_name","colspan":"2"});
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
		               td_size.attr("data-pro_size",pro_size);
		               
		               let td_color=$("<td>");
		               td_color.html(pro_color);
		               td_color.attr("data-pro_color",pro_color);
		               td_color.addClass("pro_color");
		               
		               check()
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
				 
		               $(".select").attr("selected",true)
		               
			        
			           	$(document).on("click",".updatebtn",function(){
		            		update_total();
		            		
			            })
			            $(document).on("click",".deletebtn", function(){
							$(this).parents("li").remove();
							 $(".select").attr("selected",true)
							update_total();
						});
			           	$(document).on("keydown",".pr_cnt",function() {
			            	  if (event.keyCode == 13) {
			            	    event.preventDefault();
			            	  };
			            });
			           	function check(){
			           		$(".list").each(function(){
			           			let size=$(this).find(".pro_size").attr("data-pro_size");
			           			let color=$(this).find(".pro_color").attr("data-pro_color");
			           			let number=$(this).find(".pr_cnt").val();    		
			           			
			           			console.log(size);
			           			console.log(color);
			           			console.log(number);
			           			if(size==pro_size){
			           				if(color==pro_color){
			           					$(this).remove();
			           				}
			           			}
			           			
								update_total();
			           		})
			           	}
			            function update_total(){
			            		total=0;
 							$(".list").each(function(){
								
								let number=$(this).find(".pr_cnt").val();
								let amount = (number*pd_price)
								total += amount;
								$(this).find(".pd_price").text(amount);
								if(isNaN(total)){
		   							total=0;
		   						}
 							})
							$("#totalPrice").text(total);
						}
	            })
	            
					
				
				$("#cartInput").click(function() {
					let confirm_order = confirm("장바구니에 담으시겠습니까??");
					if (confirm_order) {
						if ($("input[type='checkbox']:checked").length <= 0) {
							alert("하나 이상의 상품을 선택해 주세요.");
							return;
						}
						$(".chkBox").prop("checked",true);
						cartSelect;
					}
				});
				function cartSelect() {		
	 				console.log("카트")
					$("#productDetail").attr({
						"method" : "post",
						"action" : "/cart/cartInsert"
					});
					$("#productDetail").submit();
				}
				
			})
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
						<div id="pr_price"><fmt:formatNumber type="currency" currencySymbol="" maxFractionDigits="0" 
					value="${detail.pr_price}" groupingUsed="true" /> 원</div>
						<div class="longline"> </div>
						<div id="pr_mile"></div>
						<div id="pr_size">
							<select id="pro_size">
								<option class="select">----선택하세요</option>
								<c:forEach var="size" items="${listSize}" varStatus="status">
									<c:if test="${not empty size}">
										<option data-proNum="${size}" value="${size}">${size}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div id="pr_color">
							<select id="pro_color">
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
						<div>
							<div id="title">배송안내</div>
							<div class="longline"></div>
							<div class="board">배송안내</div>
							<div class="content">
								7만원 이상 구매 시 무료배송, 7만원 미만의 경우 2,500원의 배송비가 추가됩니다.<br />
								(제주도 : 7만원 이상 구매 시 배송비 2,500원 할인되며, 7만원 미만의 경우 6,000원입니다)<br />
								CJ 택배로 발송되며, CJ택배로 발송시 배송기간은 2-3일(주말, 공휴일 제외) 소요될 수 있습니다.<br />
							</div>
							<div class="board">택배발송</div>
							<div class="content">
								- 평일 PM 19:00 까지 결제 완료된 주문건에 한하여 거래처에 입고요청되어 입고 완료시 정상 발송됩니다.<br />
								- 택배발송 업무시간은 평일 PM 18:00 마감됩니다.<br />
								- 주문 후 평균적으로 2~3일정도 상품 입고기간이 소요됩니다.<br />
							</div>
						</div>
						<div>
							<div id="title">교환 및 반품안내</div>
							<div class="longline"></div>
							<div class="board">교환 및 반품주소</div>
							<div class="content">
								- 경기도 수원시 팔달구 인계동 1031-2 성지빌딩 701호 모던이프<br />
							</div>
							<div class="board">교환 및 반품안내</div>
							<div class="content">
								- 상품 수령 후 7일 이내 모던이프 Q&A 또는 고객센터(1522-4953) 로 접수<br />
								- 타택배(편의점, 우체국, 로젠 등) 이용 시 선불로 발송<br />
								- 모던이프와 계약된 CJ택배가 아닌 타택배(편의점, 우체국, 로젠 등)로 발송된 상품이 분실된 경우 책임을 지지 않습니다<br />
							</div>
							<div class="board">교환 및 반품이 불가능한 경우</div>
							<div class="content">
								- 반품 및 교환 접수 기간(수령일로부터 7일) 이 경과한 경우<br />
								- 고객의 부주의로 인한 제품의 변형이나 훼손, 오염, 파손으로 인해 재화의 가치가 떨어진 경우<br />
								- 제품착용 흔적이 있을 경우 (향수, 스킨, 바디로션, 탈취제 등 그외 향취)<br />
								- 인위적인 수선이나 세탁된 제품<br />
								- 받았던 상태가 아닌 포장 비닐 없이 발송되어 상품이 훼손된 경우<br />
								- 주문제작으로만 판매가 이루어지는 수제화 등의 상품의 경우<br />
								- 불량상품 또는 모던이프 실수로 오배송된 상품을 착용하거나 오염 및 훼손한 경우<br />
							</div>
							<div class="board">불량사유에 포함되지 않는 항목</div>
							<div class="content">
								- 배송시 발생한 상품의 구김<br />
								- 재봉실밥 일부 정리가 안된 경우<br />
								- 단추가 다소 허술하게 마감된 경우<br />
								- 원단 특유의 냄새<br />
								- 원단 자체의 잡실이나 스크래치 / 패턴위치차이 / 빈티지함을 위한 디테일 차이<br />
								- 사이즈 측정방법에 따라 표기된 사이즈 오차범위 (±1~2cm)<br />
								- 모니터 해상도의 미세한 차이로 인한 색상&이미지 차이<br />
								
								사소한 부분들은 불량사유가 될 수 없는 부분 안내드리겠습니다.<br />
							</div>
						</div>
					</div>
				</div>
			</div>
	</body>
</html>