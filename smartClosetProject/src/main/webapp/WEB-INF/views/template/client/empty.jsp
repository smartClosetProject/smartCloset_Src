<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>SmartCloset</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<style type="text/css">
			nav {
				width: 900px;
				text-align: center;
				position: fixed;
				background-color: #F0F0F0;
				z-index: 1;
			}
			#all {
				background-color: #E2E2E2;
			}
			.container {
				width: 900px;
				background-color: white;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				$("#back").click(function() {
					history.back();
				});
			});
		</script>
	</head>
	<body>
		<div id="all">
			<div class="container" style="padding: 0px">
				<nav>
					<a href="#" id="back" style="color: black"><span class="glyphicon glyphicon-remove"></span></a>
					<span id="Main">SmartCloset</span>
					<a href="/cart/cartList" style="color: black"><span class="glyphicon glyphicon-shopping-cart"></span></a>
				</nav>
			</div>
			<div class="container">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
	</body>
</html>