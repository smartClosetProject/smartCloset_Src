<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		.highlight1{
			width:150px;background-color:#A4AFBC; color : white;
		}
		</style>

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function () {
				$("#updateMileBtn").click(function () {
					goUrl = "/aMember/updateMile";
					$("#f_mile").attr("action", goUrl);
					$("#f_mile").submit();
					alert("포인트 변경이 완료되었습니다.");
				})
				
			})
		</script>
	</head>
	<body>
	<div>
		<form id="f_mile" name="f_mile">
			<input type="hidden" id="m_id" name="m_id" value="${nowMile.m_id}">
			<h2 style="color : #1A5276;"><strong>회원 관리</strong></h2><br>
		
			<table class="table table-bordered" style="width:500px">
				<tbody>
					<tr>
						<td class="highlight1">현재 포인트</td>
						<td>${nowMile.m_mile} 점</td>
					</tr>
					<tr class="form-inline">
						<td class="highlight1">변경할 포인트</td>
						<td><input type="text" class="form-control" style="width : 200px" id="m_mile" name="m_mile" /> 점</td>
					</tr>
				</tbody>
			</table>
			</form>
			<input type="button" id="updateMileBtn" name="updateMileBtn" class="btn btn-default btn-sm" value="변경하기"/>
		
	</div>
	</body>
</html>