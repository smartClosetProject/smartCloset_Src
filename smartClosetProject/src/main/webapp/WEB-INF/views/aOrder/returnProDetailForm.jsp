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
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function () {
			var od_num = opener.$("#od_num").val();
			$("#test").val(od_num);
			console.log(od_num); //5
			console.log($("#test").val(od_num))
			
			$("#returnBtn").click(function () {
				$("#returnProInfo").attr({
					"method" : "get",
					"action" : "/aOrder/aOrderOptionChange"
				});
				$("#returnProInfo").submit();
				alert("적용 완료");
				//window.open("about:blank","_self").close();
			})
		})
		</script>
	</head>
	<body>
		<div>
			<form id="returnProInfo" name="returnProInfo">
				<input type="hidden" id="od_num" name="od_num" value="${detail.od_num}"/>
					<h3>상품명 : ${detail.pr_name}</h3>
					<select name="pro_color">
						<c:choose>
							<c:when test="${not empty color}">
								<c:forEach var="proColor" items="${color}" varStatus="status">
									<option value="${proColor}">${proColor}</option>
								</c:forEach>
							</c:when>
						</c:choose>
					</select>
					<select name="pro_size">
						<c:choose>
						<c:when test="${not empty size}">
							<c:forEach var="proSize" items="${size}" varStatus="status">
								<option value="${proSize}">${proSize}</option>
							</c:forEach>
						</c:when>
					</c:choose>
					</select>
					<input type="text" id="od_goodscount" name="od_goodscount" />		
			</form>
		</div>
		<div>
			<input type="button" id="returnBtn" value="옵션 변경"/>
		</div>
	</body>
</html>