<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head></head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>SmartCloset - 공지 게시판 리스트</title>
	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->

		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<style type="text/css">
			.imp_notice:hover{
				background-color: #C3CAD2;
			}
		</style>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		
	
	</head>
	<body>
	<div>
		<div style="margin-left : 90px; margin-top : 0px;">
		<canvas id="bar-chart" width="200" height="200"></canvas>
		</div>
		<script type="text/javascript">
				new Chart(document.getElementById("bar-chart"), {
					  type: 'bar',
					  data: {
					    labels: ['신규 회원','탈퇴 회원'],
					    datasets: [{ 
					        data: [15,20],
					        label: "회원수 변화",
					        backgroundColor: ["#4C7D9D","#2F6689"],
					        fill: true
					      }
					    ]
					  },
					  options: {
						  responsive: false,
					    title: {
					      display: true,
					      text: '신규, 탈퇴 회원'
					    }
					  }
					});
		</script>
		<div style="margin-top : 100px;">
		<canvas id="pie-chart" width="400" height="200"></canvas>
		</div>
		<script type="text/javascript">
				new Chart(document.getElementById("pie-chart"), {
					  type: 'pie',
					  data: {
					    labels: ['QNA 새글','리뷰 새글'],
					    datasets: [{ 
					        data: [15,20],
					        backgroundColor: ["#4C7D9D","#2F6689"],
					        fill: true
					      }
					    ]
					  },
					  options: {
						  responsive: false,
					    title: {
					      display: true,
					      text: '게시글 변화'
					    }
					  }
					});
		</script>
		</div>
	</body>
</html>