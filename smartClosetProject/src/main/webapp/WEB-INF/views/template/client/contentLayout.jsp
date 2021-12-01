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
		<style>
			/* 상단바 투명화 */
			.navbar-default {
				background:transparent;
			}
		
			/* 사이드바 */
			.sidenav {
				background-color: #F6F6F6;
				position: fixed;
				width: 220px;
				height: 100%;
				margin-left: -30px;
				margin-top: 50px;
			}
		    
			.sidenav .large li a {
				color : black;
		    	font-weight: bold;
		    	font-size : 15px;
		    }
		    
		    .samll li a {
				font-size : 8px;
				width: 100px;
		    }
		    
		    /* 본문 */
			.page {
				margin-top:50px;
				margin-left: 220px;
				margin-bottom: 50px;
		    }
		    
		    /* footer */
			footer {
				background-color: #555;
				color: white;
				padding: 15px;
				position: relative;
		    }
  		</style>
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<div class="container">
			<nav class="navbar navbar-default navbar-fixed-top">
				<tiles:insertAttribute name="clientHeader" />
			</nav>
			
			<div class="container-fluid">
				<tiles:insertAttribute name="clientAside" />
				
				<div class="col-sm-9 page">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
		</div>
		<div>
			<tiles:insertAttribute name="clientFooter" />
		</div>
	</body>
</html>