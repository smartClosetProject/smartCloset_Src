<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>title here</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
	</head>
	<body>
		${orderDetail.order_num }<br>
		${orderDetail.order_regdate }<br>
		${orderDetail.m_mile }<br>
		${orderDetail.m_mileApply }<br>
		${orderDetail.m_mileAdd }<br>
		${orderDetail.m_name }<br>
		${orderDetail.m_addr }<br>
		${orderDetail.m_phone }<br>
		${orderDetail.m_email }<br>
		${orderDetail.shipMessage }<br>
		${orderDetail.payMethod }<br>
		1
	</body>
</html>