<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				height: 500px;
				margin-left: -1px;
				margin-right: 15px;
				overflow-y: scroll;
				background-image: url("/resources/image/closetBack.jpg");
			}
			#sCfloat2 {
				float: left;
				width: 440px;
				height: 600px;
				border: 1px solid;
			}
			.section1 {
				float: left;
				width: 80px;
				height: 110px;
				border: 1px solid;
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
		</style>
		<script type="text/javascript">
			$(function() {
				// 일단 구현 실패
				$("img[data-border='none']").on("click", function() {
					$(this).css("border", "2px solid blue");
					$(this).data("border", "exist");
					let data = $(this).data("border");
					console.log(data);
				});
				
				$("img[data-border='exist']").on("click", function() {
					$(this).css("border", "none");
					$(this).data("border", "none");
					let data = $(this).data("border");
					console.log(data);
				});
				
			});
		</script>
	</head>
	<body>
		<form id="sC_frm">
			<div>
				<br><br><br><br>
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
					<div class="section1 text-center">
						<div class="section2">
							<img class="cloth" data-border="none" src="https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSVVD2Aj0wjDmRfkIsBGEElE0NFw48ZK-BfdvAfqX2do7CrSNECAwCKmKjVA49CSwsvT7YDzq3STcM&usqp=CAc" /> 
	    					<input type="checkbox" class="checkboxs" id="check1" />
						</div>
						<button class="tagBtn" type="button">안녕</button>
					</div>
					<div class="section1 text-center">
						<div class="section2">
							<img class="cloth" data-border="exist" src="https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQetKQSLwQIc37Bm0qTy_PwYuP4CD3O34_QL2AMugkG6DM0a8ukW0Zorw0vZSzIKaSE2uw2HfQZRAE&usqp=CAc" />
					    	<input type="checkbox"  class="checkboxs" id="check2" />
						</div>
						<button class="tagBtn" type="button">안녕</button>
					</div>
					<div class="section1 text-center">
						<div class="section2">
							<img class="cloth" src="data:image/webp;base64,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" />
							<input type="checkbox"  class="checkboxs" id="check2" />
						</div>
						<button class="tagBtn" type="button">안녕</button>
					</div>
					<div class="section1 text-center">
						<div class="section2">
							
						</div>
						<button class="tagBtn" type="button">안녕</button>
					</div>
					<div class="section1 text-center">
						<div class="section2">
							
						</div>
						<button class="tagBtn" type="button">안녕</button>
					</div>
					<div class="section1 text-center">
						<div class="section2">
							
						</div>
						<button class="tagBtn" type="button">안녕</button>
					</div>
				</div>
				<div id="sCfloat2">
					
				</div>
			</div>
		</form>
	</body>
</html>