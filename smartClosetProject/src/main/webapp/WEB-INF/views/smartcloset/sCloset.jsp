<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			.sCtitle {
				font-weight: 800;
			}
			#sCfloat1 {
				float: left;
				width: 440px;
				height: 550px;
				margin-left: -1px;
				margin-right: 15px;
				overflow-y: scroll;
				background-image: url("/resources/image/shelf.jpg");
				background-size: 440px;
			}
			#sCfloat2 {
				float: left;
				width: 440px;
				height: 550px;
				outline: 1px solid #ADB5BD;
			}
			#sCfloat2::after {
				float: left;
				width: 440px;
				height: 530px;
				content: "";
				background-image: url("https://t1.daumcdn.net/cfile/tistory/227BC53557C385D122");
				background-size: 440px;
				background-repeat: no-repeat;
				background-position: center 0.5cm;
				opacity: 0.4; 
			}
			.section1 {
				float: left;
				width: 80px;
				height: 115px;
				margin-left: 20px;
				margin-top: 10px;
				margin-bottom: 30px;
			}
			.section2 {
				float: left;
				width: 80px;
				height: 90px;
				border: none;
				position: relative; 
			}
			.checkboxs { 
				position: absolute; 
				top: -3px; 
				left: 0px; 
			}
			.cloth {
				width: 80px; 
				height: 90px;
			}
			.tagBtn {
				height: 20px;
				padding: 1px;
			}
			.sCfloats {
				margin-bottom: 44px;
			}
			.sCfloat3 {
				width: 130px;
				font-weight: bold;
				float: left;
			}
			.sCfloat4 {
				width: 250px;
				height: 34px;
				margin-left: 130px;
				margin-right: 350px;
				float: left;
			}
			#sC_search {
				width: 150px;
				border: 0px solid black;
				border-bottom: 2px solid black;
			}
			#sC_search:focus {
				outline: none;
			}
			.btns {
				margin-left: 280px;
			}
			.footerBtn {
				margin-top: 5px;
				font-weight: 550;
			}
			#codiTitle {
				width: 440px;
				height: 22px;
				font-size: 17px;
				vertical-align: middle;
				font-weight: 550;
				text-align: center;
				background-color: #ADB5BD;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				$(".cloth").data("bor", "none");
				
				$(".cloth").on("click", function() {
					if ($(this).data("bor") == "none") {
						$(this).css("outline", "2px solid #3BAEDA");
						$(this).data("bor", "exist");
					} else {
						$(this).css("outline", "none"); 
						$(this).data("bor", "none");
					}
				});
			});
		</script>
	</head>
	<body>
		<form id="sC_frm">
			<div>
				<br>
				<h2 class="sCtitle">스마트 옷장</h2><hr>
			</div><br><br>
			
			<div class="sCfloats">
				<div class="sCfloat3">
					<select id="sC_select" class="form-control">
						<option value="all">전체 옷장</option>
						<option value="buy">구매한 옷장</option>
						<option value="reg">등록한 옷장</option>
					</select>
				</div> 
				<div class="sCfloat4"> 
					<span class="glyphicon glyphicon-search"></span>&nbsp;
					<input type="text" id="sC_search" name="sC_search" placeholder="&#9;&nbsp;태그 입력">
				</div>
			</div>
			
			<div>
				<div id="sCfloat1">
					<c:if test="${not empty thumbList }">
						<c:forEach var="thumb" items="${thumbList }">
							<div class="section1 text-center">
								<div class="section2">
									<img class="cloth" src="/uploadStorage/sCloset/thumb/${thumb }" /> 
			    					<input type="checkbox" class="checkboxs" id="check1" />
								</div>
								<input type="button" class="btn tagBtn" value="태그수정">
							</div>	
						</c:forEach>
					</c:if>
				</div>
				
				<div id="sCfloat2">
					<div id="codiTitle">
						<div>코디네이터</div>
					</div>
				</div>
				<div class="btns">
					<input type="button" id="codi" class="btn footerBtn" value="코디">
					<input type="button" id="reg" class="btn footerBtn" value="옷 등록하기">
				</div>
			</div>
		</form>
	</body>
</html>