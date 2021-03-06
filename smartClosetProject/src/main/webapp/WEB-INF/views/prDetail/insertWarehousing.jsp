<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
     	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>입고 등록 폼</title>
		
			<link rel="shortcut icon" href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
	
		<style type="text/css">
			input[type=text]{width:100%}
			input[type=select]{width:100%}
			.insert{width:900px;}
		</style>
		<script type="text/javascript">
			$(function() {
				$("#insertBtn").click(function() {
					if(!chkData("#cl_name","거래처번호를"))return false;
					if(!chkData("#pro_num","상품 상세 번호를 "))return false;
					if(!chkData("#file","색상 이미지를"))return false;
					if(!chkData("#colorKo","색상의 한국어를"))return false;
					if(!chkData("#colorEn","색상의 영어를"))return false;
					if(!chkData("#cl_price","원가를"))return false;
					if(!chkData("#cl_amount","입고량을"))return false;
					$("#cl_name").val($("#cl_name").val().toUpperCase());
					$("#pro_num").val($("#pro_num").val().toUpperCase());
					
					$("#insertForm").attr({
						"method":"post",
						"enctype":"multipart/form-data",
						"action":"/prDetail/warehousingInsert"
					})
					$("#insertForm").submit();
				})
				$("#warehousingList").click(function(){
					location.href="/prDetail/warehousingList"
				})
			})
		</script>
	</head>
<body>
	<div class="container">
		<h2>입고 등록 페이지</h2>
		<form id="insertForm">
			<div class="form-group">
				<table class="table-bordered insert">
					<tr>
						<th class="col-md-1">거래처 번호</th>
						<td class="col-md-2" colspan="3"><input type="text" name="cl_name" id="cl_name" style="text-transform: uppercase;"></td>
					</tr>
					<tr>
						<th class="col-md-1">상품 번호</th>
						<td class="col-md-2" colspan="3" ><input type="text" id="pr_num" name="pr_num" value="${updateData.pr_num}" readonly="readonly"></td>
					</tr>
					<tr>
						<th class="col-md-1">상품 상세 번호</th>
						<td class="col-md-2" colspan="3"><input type="text" name="pro_num" id="pro_num" style="text-transform: uppercase;" value="${updateData.pr_num}"></td>
					</tr>
					<tr>
						<th class="col-md-1">색상 이미지</th>
						<td class="col-md-2" colspan="3"><input type="file" name="file" id="file"></td>
					</tr>
					<tr>
						<th class="col-md-1">사이즈</th>
						<td class="col-md-2"  colspan="3">
							<select id="pro_size" name="pro_size">
								<option value="S" selected="selected">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
								<option value="XL">XL</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="col-md-1">색상(한국어)</th>
						<td class="col-md-2"><input type="text" name="colorKo" id="colorKo"></td>
						<th class="col-md-1">색상(영어)</th>
						<td class="col-md-2"><input type="text" name="colorEn" id="colorEn"></td>
					</tr>
					<tr>
						<th class="col-md-1">원가</th>
						<td class="col-md-2" colspan="3"><input type="text" name="cl_price" id="cl_price"></td>
					</tr>
					<tr>
						<th class="col-md-1">입고량</th>
						<td class="col-md-2" colspan="3"><input type="text" name="cl_amount" id="cl_amount"></td>
					</tr>
				</table>
				<button type="button" class="btn btn-success" id="insertBtn">저장</button>
				<input type="button" class="btn btn-success" id="warehousingList" value="입고 리스트">
			</div>
		</form>
	</div>
</body>
</html>