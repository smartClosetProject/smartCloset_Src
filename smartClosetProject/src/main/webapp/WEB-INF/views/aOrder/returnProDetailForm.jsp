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
	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<style type="text/css">
			h3{
				color : #1A5276;
				font-weight: bold;
				
			}
			select{
				height: 27px;
				width : 100px;
			}
		
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function () {
			let color = $("#pro_color option:selected").val();
			let size = $("#pro_size option:selected").val();
			let count = $("#od_goodscount").val();
			
			
			var od_num = opener.$("#od_num").val();
			$("#test").val(od_num);
			console.log(od_num); //5
			console.log($("#test").val(od_num))
			
			$("#returnCheckBtn").click(function () {
				var form ={
						od_num : $("#od_num").val(),
						pro_color : $("#pro_color option:selected").val(),
						pro_size : $("#pro_size option:selected").val(),
						od_goodscount : $("#od_goodscount").val(),
						pr_num : $("#pr_num").val()
				}
				$.ajax({
					url : "/aOrder/aOrderOptionChange",
					type : "post",
					data : JSON.stringify(form),
					contentType: "application/json; charset=utf-8;",
					dataType: "text",
					success : function (data) {
						alert("적용이 완료 되었습니다.");
					},
					error : function () {
						alert("재고가 없는 상품입니다. 다시 선택해 주세요.");
					}

				})
			});
				
			$("#returnOrderBtn").click(function () {
				opener.parent.location.reload();
				window.close();
			});
		
		})
		</script>
	</head>
	<body>
		<div class="container">
			<div>
				<form id="returnProInfo" name="returnProInfo" class="form-inline">
					<input type="hidden" id="od_num" name="od_num" value="${detail.od_num}"/>
					<input type="hidden" id="pr_num" name="pr_num" value="${detail.pr_num}"/>
						<h3>${detail.pr_name}</h3>
						<hr>
						<h4><strong>변경 전 옵션</strong> </h4><h5> 색상 : ${detail.pro_color}, 사이즈 : ${detail.pro_size}, 수량 : ${detail.od_goodscount} </h5>
						<div class="form-group">
						<br>
						<h4><strong>변경할 옵션</strong> </h4>
						<select id="pro_color" name="pro_color" >
							<c:choose>
								<c:when test="${not empty color}">
									<c:forEach var="proColor" items="${color}" varStatus="status">
										<option value="${proColor}">${proColor}</option>
									</c:forEach>
								</c:when>
							</c:choose>
						</select>
						<select id="pro_size" name="pro_size">
							<c:choose>
							<c:when test="${not empty size}">
								<c:forEach var="proSize" items="${size}" varStatus="status">
									<option value="${proSize}">${proSize}</option>
								</c:forEach>
							</c:when>
						</c:choose>
						</select>
						<input type="text"  style="width : 100px;" id="od_goodscount" name="od_goodscount" placeholder="수량"> 개</input>		
					</div>
				</form>
			</div>
			<br>
			<div class="text-left">
				<input type="button" class="btn btn-default" id="returnCheckBtn" value="옵션 변경"/>
				<input type="button" class="btn btn-default" id="returnOrderBtn" value="옵션 적용"/>
			</div>
		</div>
	</body>
</html>