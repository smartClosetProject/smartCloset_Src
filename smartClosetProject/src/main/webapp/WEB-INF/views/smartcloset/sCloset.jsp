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
		<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
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
				overflow-y: auto;
				overflow-x: hidden;
				background-image: url("/resources/image/codiBack.png");
				background-size: 440px;
				background-repeat: no-repeat;
				background-position: center 0.5cm;
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
				margin-left: 310px;
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
			.popup { /* 팝업이 열렸을 때, 팝업창 주변 전체를 어둡게 합니다 */ 
				display: none; 
				position: fixed; 
				width: 100%; 
				height: 100%; 
				top: 0; 
				left: 0; 
				background: rgba(0,0,0,0.5); 
			} 
			.popup-inner { /* 열렸을 때 팝업창 크기와 색상을 지정합니다. */ 
				position: absolute; 
				width: 50%; 
				height: 50%; 
				top: 50%; 
				left: 50%; 
				transform: translate(-50%, -50%); 
				padding: 10px; 
				background: #fff; 
			} 
			.popup-close{ /* 팝업창 내 닫기 버튼의 위치를 지정합니다. */ 
				position: absolute; 
				display: block; 
				top: 15px; 
				right: 15px;
				font-size: 20px;
			}
			.codiCloset {
				position: relative;
				height: 175px;
			}
			#regPopup {
				height: 30px;
				text-align: center;
				font-size: 20px;
				background-color: #ADB5BD;
			}
			#regSection1 {
				margin-top: 20px;
				margin-bottom: 10px;
				width: 50%;
				height: 350px;
				float: left;
			}
			#regSection2 {
				margin-top: 20px;
				margin-bottom: 10px;
				width: 50%;
				height: 350px;
				float: left;
				border: 1px solid;
			}
			#regImage {
				margin-left: 70px;
				
			}
			#regImage img {
				position: relative;
				width: auto;
				max-width: 400px;
				max-height: 350px;
			}
			#regMsg {
				margin-left: 20px;
				font-size: 12px;
				color: gray;
			}
			
			.inputsFile {
				margin-top: 20px;
				margin-bottom: 20px;
			}
			.inputs {
				margin-bottom: 15px;
			}
			#regBtns {
				text-align: center;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				$(".cloth").data("bor", "none");
				
				// 옷 이미지 클릭 시 선택, 선택 취소 효과.
				$(".cloth").on("click", function() {
					let num = $(this).data("num");
					let imgNum = -1;
					
					let top = Math.random() * 100;
					let left = Math.random() * 50;
					
					if ($(this).data("bor") == "none") {
						$(this).css("outline", "3px solid #3BAEDA");
						$(this).data("bor", "exist");
						$(this).clone().appendTo("#codiSpace").attr("class","codiCloset").data("imgNum", imgNum = imgNum + 1).css("outline", "none").css("top", top).css("left", left); // 썸네일 이용한 구현 실패. 이미지 복제로 우선 구현.
						$(".codiCloset").draggable();
					} else {
						$(this).css("outline", "none"); 
						$(this).data("bor", "none");
						$("#codiSpace img[data-num='" + num + "']").remove();
					}
				});
				
				// 팝업창 열기
			    $('[data-popup-open]').on('click', function(e)  {
					var targeted_popup_class = $(this).attr('data-popup-open');
					$('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
					e.preventDefault();
			    });

			    // 팝업창 닫기
			    $('[data-popup-close]').on('click', function(e)  {
			    	regExit();
			    });
			    
				 // 팝업창 - 취소하기 처리
			    $("#cancelBtn").on("click", function(e) {
			    	regExit();
				});
			    
				 // 첨부파일 이미지 미리보기
			    $("#file").change(function() {
			    	viewImage(this, '#imageArea');
				});
				 
			    // 팝업창 - 등록하기 처리
			    $("#regBtn").click(function() {
			    	if ($(".tags").val() == "") {
			    		alert("최소 하나의 태그는 등록하셔야 합니다.");
			    		return;
			    	} else if ($("#file").val() == "") {
						alert("상품 이미지를 첨부해 주세요.");
						return;
					} else if (!chkFile($("#file"))) {
						return;
					} else {
						console.log(1);
						$("#sC_frm").attr({
							"method" : "post",
							"enctype" : "multipart/form-data",
							"action" : "/sCloset/regCloset"
						});
						$("#sC_frm").submit();
						
						regExit();
					}
				});
			});
			
			function regExit() {
				var targeted_popup_class = $('[data-popup-close]').attr('data-popup-close');
				$('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
				
				$("#file").val("");
				$(".tags").val("");
				$("#imageArea").removeAttr("src");
			}
			
			function viewImage(input, area) {
			    if (input.files && input.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (e) {
			            $(area).attr("src", e.target.result);
			        }
			        reader.readAsDataURL(input.files[0]);
			    }
			}
		</script>
	</head>
	<body>
		<form id="sC_frm">
			<input type="hidden" name="sc_isBuy" value="NO">
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
					<c:if test="${not empty closetList }">
						<c:set var="i" value="-1" />
						<c:forEach var="closet" items="${closetList }">
							<div class="section1 text-center">
								<div class="section2">
									<img class="cloth" data-num="${i = i + 1 }" src="/uploadStorage/sCloset/${closet.sc_image }" /> 
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
					<div id="codiSpace"></div>  
				</div>
				<div class="btns">
					<input type="button" data-popup-open="regCloset" id="regCloset" class="btn footerBtn" value="옷 등록하기">
				
					<div class="popup" data-popup="regCloset">
						<div class="popup-inner">
							<div class="popup-contents">
								<span data-popup-close="regCloset" class="glyphicon glyphicon-remove popup-close"></span>
								<div id="regPopup">
									<span>등록하기</span>
								</div>
								
								<div id="regSection1">
									<div id="regImage">
										<img id="imageArea">
									</div>
								</div>
								
								<div id="regSection2">
									<div class="form-group">
										<label for="file" class="col-sm-3 control-label inputsFile">이미지 첨부</label> 
										<div class="col-sm-9">
											<input type="file" class="form-control inputsFile" name="file" id="file">
										</div>
									</div>
									<div id="regMsg">태그는 기억하기 쉬운 단어로 구성해 보세요^^</div>
									<div class="form-group inputs">
										<label for="sc_tag1" class="col-sm-2 control-label inputs">태그1 : </label>
										<div class="col-sm-10">
											<input type="text" class="form-control inputs tags" name="sc_tag1" id="sc_tag1" placeholder="ex) 아우터">
										</div>
									</div>
									<div class="form-group inputs">
										<label for="sc_tag2" class="col-sm-2 control-label inputs">태그2 : </label>
										<div class="col-sm-10">
											<input type="text" class="form-control inputs tags" name="sc_tag2" id="sc_tag2" placeholder="ex) 패딩">
										</div>
									</div>
									<div class="form-group inputs">
										<label for="sc_tag3" class="col-sm-2 control-label inputs">태그3 : </label>
										<div class="col-sm-10">
											<input type="text" class="form-control inputs tags" name="sc_tag3" id="sc_tag3" placeholder="ex) 겨울">
										</div>
									</div>
									<div class="form-group inputs">
										<label for="sc_tag4" class="col-sm-2 control-label inputs">태그4 : </label>
										<div class="col-sm-10">
											<input type="text" class="form-control inputs tags" name="sc_tag4" id="sc_tag4" placeholder="ex) 검정색">
										</div>
									</div>
									<div class="form-group inputs">
										<label for="sc_tag5" class="col-sm-2 control-label inputs">태그5 : </label>
										<div class="col-sm-10">
											<input type="text" class="form-control inputs tags" name="sc_tag5" id="sc_tag5" placeholder="ex) 2021년">
										</div>
									</div>								
								</div>
								<div id="regBtns">
									<input type="button" class="btn" id="regBtn" value="등록하기">
									<input type="button" class="btn" id="cancelBtn" value="취소">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>