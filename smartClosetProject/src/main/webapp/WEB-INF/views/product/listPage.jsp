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
			.main{width:900px; text-align: center;  }
			.product{width:280px; float: left; margin: 5px; padding-bottom: 15px; text-align: center;}
			.title{font-size: 15px; font-weight: bold; text-align: left; padding-left: 18px;}
			.price{font-size: 13px; text-align: left; margin-right: 15px; padding-left: 18px;padding-top: 3px;}
			.line{ width: 240px; background: darkgray; color: darkgray; margin-left: 5px; margin-right: 5px;}
			.listimg{width:270px; margin-bottom: 15px; margin-top: 30px;}
			#mainListDate{width:890px; margin-bottom: 25px; margin-top: 10px; padding-bottom: 50px; text-align: center;}
			.line{width:267px; height:0.2px; background-color: #D8D8D8; margin-bottom: 15px; margin-top: 15px; }
			#longline{width:880px; height:2px; background-color: gray; }
			.longline{width:860px; height:1px; background-color: #BDBDBD; margin-top: 20px; margin-bottom: 20px;}
			#best{margin-top: 40px;}
			.cate{width:100px; color: black;}
			.cateColor{color: black;}
			#cate{text-align: center; margin-left: 200px; margin-top: 20px;}
			#categorys{color:black;}
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
				let outer=['자켓','코트','패딩','야상','집업'];
				let top = ['반팔','긴팔','셔츠','니트','맨투맨','후드티'];
				let pants=['반바지','청바지','면바지','슬랙스'];
				let bag = ['가방','신발'];
				let acc = ['벨트'	,'스카프'];
				let td="";
				
				if("${listData[0].pr_categoryl}"=="아우터"){
					console.log("아우터")
					for(let i=0; i<outer.length;i++){
						td+="<td class='cate'><a href='/product/cate/아우터/"+outer[i]+"' class='cate'>"+outer[i]+"</a></td>"
					}
					$("#categorys").append(td);
				}else if("${listData[0].pr_categoryl}"=="상의"){
					console.log("상의")
					for(let i=0; i<top.length;i++){
						td+="<td class='cate'><a href='/product/cate/상의/"+top[i]+"'class='cate'>"+top[i]+"</a></td>"
					}
					$("#categorys").append(td);
				}else if("${listData[0].pr_categoryl}"=="하의"){
					console.log("하의")
					for(let i=0; i<pants.length;i++){
						td+="<td class='cate'><a href='/product/cate/하의/"+pants[i]+"'class='cate'>"+pants[i]+"</a></td>"
					}
					$("#categorys").append(td);
				}else if("${listData[0].pr_categoryl}"=="가방신발"){
					console.log("가방")
					for(let i=0; i<bag.length;i++){
						td+="<td class='cate'><a href='/product/cate/가방신발/"+bag[i]+"'class='cate'>"+bag[i]+"</a></td>"
					}
					$("#categorys").append(td);
				}else if("${listData[0].pr_categoryl}"=="악세사리"){
					console.log("악세")
					for(let i=0; i<acc.length;i++){
						td+="<td class='cate'><a href='/product/cate/악세사리/"+acc[i]+"'class='cate''>"+acc[i]+"</a></td>"
					}
					$("#categorys").append(td);
				}
				
				
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
					<h2>${listData[0].pr_categoryl}</h2>
					<table id="cate">
						<tr id="categorys">
							
						</tr>	
					</table>
					<div class="longline"> </div>
					<c:forEach var="list" items="${listPage}" varStatus="status">
						<div class="product goDetail" data-num="${list.pr_num}">
							<c:if test="${not empty list.pr_thumb}">
								<img class="listimg" src="/uploadStorage/prDetail/thumb/${list.pr_thumb}">
							</c:if>
							<div class="title">${list.pr_name}</div>
							<div class="line"> </div>
							<div class="price">${list.pr_price} 원</div>
						</div>					
					</c:forEach>
				</div>
			</div>
		</div>
	</body>
</html>