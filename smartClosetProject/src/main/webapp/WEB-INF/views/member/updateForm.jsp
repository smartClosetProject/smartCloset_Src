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
		<!-- 모바일 웹 페이지 설정 끝 -->
	
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<style type="text/css">
		.button4 {
		   background-color: white;
		   color: black;
		   border: 2px solid #e7e7e7;
		}
		.button4:hover {background-color: #e7e7e7;}
		</style>
		<script type="text/javascript">
			$(function(){
				$("#memberUpdateBtn").click(function(){
					if(!chkData("#m_passwd","비밀번호를")) {
						return;
					} else if (!chkData("#m_passwd2","비빌번호 확인을")) {
						return;
					} else if (!chkData("#m_phone2","핸드폰 번호를")) {
						return;
					} else if (!chkData("#m_phone3","핸드폰 번호를")) {
						return;
					} else if (!chkData("#m_email","이메일을")) {
						return ;
					} else{
						$("#m_phone").val( $("#m_phone1").val()+"-"+$("#m_phone2").val()+"-"+$("#m_phone3").val() )
						//console.log( $("#m_phone").val() );
						$("#f_updateForm").attr({
							"method" : "post",
							"action" : "/member/memberUpdate"
						});
						$("#f_updateForm").submit();
					}
				});
				$('.pw').focusout(function(){
					var pwd1 = $("#m_passwd").val();
					var pwd2 = $("#m_passwd2").val();
					
					if(pwd1!=""&&pwd2==""){
						null;
					} else if(pwd1 != "" || pwd2!=""){
						if(pwd1 == pwd2){
							$("#alert-success").css('display', 'inline-block');
							$("#alert-danger").css('display', 'none');
						} else {
							alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인 해주세요.");
						    $("#alert-success").css('display', 'none');
			                $("#alert-danger").css('display', 'inline-block');
			               	$(".pw").val("");
			     
						}
					}
				});
					
				
				$("#memberExitBtn").click(function(){
					if(confirm("정말 탈퇴 하시겠습니까?(탈퇴후 5년간 같은 아이디로 가입이 불가능합니다.)")){
						goUrl = "/member/memberDelete";
						$("#f_updateForm").attr("action", goUrl);
						$("#f_updateForm").submit();
					}
					
				});
			});
			function execPostCode() {
	             new daum.Postcode({
	                 oncomplete: function(data) {
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	     
	                    // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                    var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                    var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	     
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraRoadAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraRoadAddr !== ''){
	                        extraRoadAddr = ' (' + extraRoadAddr + ')';
	                    }
	                    // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                    if(fullRoadAddr !== ''){
	                        fullRoadAddr += extraRoadAddr;
	                    }
	     
	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    console.log(data.zonecode);
	                    console.log(fullRoadAddr);
	                    
	                    
	                    $("[name=m_addr]").val(data.zonecode);
	                    $("[name=m_addr2]").val(fullRoadAddr);
	                    
	                    /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	                    document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	                    document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	                }
	             }).open();
	         }
		</script>
	</head>
	<body>
		
		<form id="f_updateForm">
			<input type="hidden" name="m_id" id="m_id" value="${updateData.m_id}">
			<input type="hidden" name="m_num" id="m_num" value="${updateData.m_num}">
			<input type="hidden" name="m_regdate" id="m_regdate" value="${updateData.m_regdate}">
			<input type="hidden" name="m_mile" id="m_mile" value="${updateData.m_mile}">
			<input type="hidden" name="m_acc" id="m_acc" value="${updateData.m_acc}">
			<input type="hidden" name="m_phone" id="m_phone" />
			<div class="titleArea">
				<h2>회원 정보 수정</h2>
			</div>
			<div class="ec-base-table typeWrite">
			
			<table class="table table-bordered">
				<tr>
					<th>아이디
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td id="m_id">${updateData.m_id}</td>
				</tr>
				<tr>
					<th>비밀번호
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td><input type="password" id="m_passwd" class="pw" name="m_passwd" maxlength="12">(최대 12글자까지 가능합니다.)</td>
				</tr>
				<tr>
					<th>비밀번호확인
						<img src="/resources/image/star.jpg" alt="필수" >
					</th>
					<td><input type="password" id="m_passwd2" class="pw" name="m_passwd2"  maxlength="12">
						<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
    					<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
					</td>
				</tr>
				<tr>
					<th>이름
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td id="m_name">${updateData.m_name}</td>
				</tr>
				
					<tr>
						<th rowspan="2">주소
							<img src="/resources/image/star.jpg" class="" alt="필수">
						</th>
						<td>
							<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="m_addr" id="m_addr" type="text" readonly="readonly" >
		   		 			<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
		   		 		</td>
					</tr>
					<tr>
						<td>
							<input class="form-control" style="top: 5px; width:40%; display: inline;" placeholder="도로명 주소" name="m_addr2" id="m_addr2" type="text" readonly="readonly" />
							<input class="form-control" placeholder="상세주소"  style="width: 40%; display: inline;" name="m_addr3" id="m_addr3" type="text"  />
						</td>
					</tr>
			
				
				<tr>
					<th>휴대전화
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td>
						<div id ="m_phone">
							<select id ="m_phone1" name="m_phone1">
								<option value="010">010</option>
								<option value="010">011</option>
								<option value="010">016</option>
								<option value="010">017</option>
								<option value="010">018</option>
								<option value="010">019</option>
							</select>
							-
							<input type="text" id ="m_phone2" maxlength="4" name="m_phone2">
							-
							<input type="text" id ="m_phone3" maxlength="4" name="m_phone3">
						</div>
					</td>
				</tr>
				<tr>
					<th>이메일
						<img src="/resources/image/star.jpg" alt="필수">
					</th>
					<td><input type="text" id="m_email" name="m_email" value="${updateData.m_email}"></td>
				</tr>
			</table>
		</div>
		</form>
		<form>
			<div class="ec-base-button justify">
				<button type="button" id="memberExitBtn"  class="button button4" >회원탈퇴</button>
				<button type="button" id="memberUpdateBtn" class="button button4">회원정보수정</button>
			</div>
		</form>
	</body>
</html>