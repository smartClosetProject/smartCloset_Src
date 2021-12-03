<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<title>Insert title here</title>
		
		
		<link rel="shortcut icon" href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#insertBtn").click(function() {
				$("#insertForm").attr({
					"mothod":"post",
					"enctype":"multipart/form-data",
					"action":"/prDetail/prDetailInsert"
				})
				$("#insertForm").submit();
			})	
		})
		
		</script>
	</head>
	<body>
		<div class="container">
			<form id="insertForm">
				<div class="form-group">
					<table>
						<tr>
							<th>상품 번호</th>
							<td><input type="text" name="pr_num" id="pr_num">
						</tr>
						<tr>
							<th>판매가</th>
							<td><input type="text" name="pr_price" id="pr_price">
						</tr>
						<tr>
							<th>판매 여부</th>
							<td>
								<input type="radio" name="pr_issale" value="Y"/>
								<input type="radio" name="pr_issale" value="N"/>
							</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" name="pr_name" id="pr_name">
						</tr>
						<tr>
							<th>계절</th>
							<td><input type="text" name="pr_season" id="pr_season">
						</tr>
						<tr>
							<th>카테고리</th>
							<td><input type="text" name="pr_categoryl" id="pr_categoryl">
						</tr>
						<tr>
							<th>카테고리</th>
							<td><input type="text" name="pr_categorys" id="pr_categorys">
						</tr>
						<tr>
							<td><input  type="file" name="file" id="file" /></td>
							<td><input  type="file" name="file1" id="file1" /></td>
						</tr>
					</table>
					<button type="button" class="btn btn-success" id="insertBtn">저장</button>
				</div>
			</form>
		</div>
	</body>
</html>