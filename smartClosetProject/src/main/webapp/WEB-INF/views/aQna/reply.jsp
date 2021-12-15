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
		<style type="text/css">
			span{
				color : #1A5276;
				font-size: 15px;
				font-weight: bold;
			}
			.content{
				margin-bottom: 50px;
			}
			
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			let replyNum,btnKind="";
			$(function(){
				let q_num=${detail.q_num};
				listAll(q_num);
				
				/*새로운 글을 화면에 추가하기(보여주기)위한 함수 */
				function addNewItem(r_num, r_name, r_content,r_regdate){
					//새로운 글이 추가될 li태그 객체
					let new_li = $("<li>");
					new_li.attr("data-num",r_num);
					//new_li.addClass()"comment_item");
					
					//작성자 정보가 지정될 <p>태그
					let writer_p = $("<p>");
					
					//작성자 정보의 이름
					let name_span =$("<span>");
					name_span.html(r_name+" 님");
					
					//작성일시
					let date_span = $("<span>");
					date_span.html(" / "+ r_regdate+" ");
					
					
					//삭제하기 버튼
					let del_input=$("<input>");
					del_input.attr({"type":"button","value":"삭제하기"});
					del_input.addClass("delete_btn btn btn-default btn-sm");
					
					//내용
					var content_p = $("<p>");
					content_p.html(r_content);
					content_p.addClass("content")
					
					//조립하기
					writer_p.append(name_span).append(date_span).append(del_input)
					new_li.append(writer_p).append(content_p);
					$("#comment_list").append(new_li);
				}
				
				/*댓글 보여주는 함수 */
				function listAll(q_num){
					$("#comment_list").html("");
					let url = "/aReply/all/"+q_num;
					
					$.getJSON(url,function(data){
						replyCnt = data.length;
						$(data).each(function(){
							var r_num = this.r_num;
							var r_name =this.r_name;
							var r_content = this.r_content;
							var r_regdate = this.r_regdate;
							r_content= r_content.replace(/(\r\n|\r|\n)/g, "<br />");
							
							addNewItem(r_num, r_name,r_content, r_regdate);
						});
					}).fail(function(){
						alert("덧글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해주세요.");
					})
				}
				
				//글 입력을 위한 Ajax 연동 처리
				$("#replyInsert").click(function(){
					let insertUrl = "/aReply/aReplyInsert";
					/* Json.stringify(): JavaScript 값이나 객체를 JSON 문자열로 반환 */
					let value = JSON.stringify({
						q_num:q_num,
						r_name:$("#r_name").val(),
						r_content:$("#r_content").val()
					})
					
					///글 저장을 위한 Post방식의 Ajax 연동 처리
					$.ajax({
						url:insertUrl,
						type:"post",
						headers:{// 일반적으로 서버에 전달하는 데이터의 형태는 html/text 인데, 우린 json을 전달하므로 headers에 명시해주어야함
							"content-Type":"application/json"
						},
						dataType:"text",
						data:value,
						error : function(){
							alert('시스템 오류입니다. 관리자에게 문의하세요.')
						},
						beforeSend: function(){
							if(!chkData("#r_name","작성자를")) return false;
							else if(!chkData("#r_content","댓글 내용을")) return false;
						},
						success : function(result){
							if(result=="SUCCESS"){
								alert("댓글 등록이 완료되었습니다.");
								dataReset();
								listAll(q_num);
							}
						}
					});
				});
				
				
			
				$(document).on("click",".delete_btn",function(){
					$(".reset_btn").click();
					let currLi = $(this).parents("li");
					let r_num =  $(this).parents("li").attr("data-num");
					replyNum = currLi.attr("data-num");
					btnKind="delBtn";
					deleteBtn(q_num);
				})
				
				function dataReset(){
					$("#r_name").val("");
					$("#r_content").val("");
					
				}
				
				
				/** 글 삭제를 위한 Ajax 연동 처리 */
				function deleteBtn(q_num) {
					if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
						$.ajax({
							url : '/aReply/' + replyNum,
							type : 'delete',
							headers : {
								"X-HTTP-Method-Override" : "DELETE"
							},
							dataType : 'text',
							success : function (result) {
								if(result=='SUCCESS'){
									alert("삭제되었습니다.");
									dataReset();
									listAll(q_num);
								}
								
							}
							
						});
					}
				}
			
			}); // 최상위 $ 종료
			
			
			
				
		</script>
	</head>
	<body>
		<div id="replyContainer">
			<div id="comment_write">
				<form id="comment_form" class="form-inline">
				<div id="comment" class="form-group" style="margin-bottom : 20px;">
					<label for="r_name" class="tac" style="width : 70px;">작성자</label>
					<input type="text" class="form-control" name="r_name" id="r_name"/>
				</div>
				<br>
				<div class="form-inline">
					<label for="r_content" style="width : 70px;">덧글 내용</label>
					<textarea style="resize: none; width : 200px;" class="form-control" id="r_content" name="r_content"></textarea>
					<input type="button"  id="replyInsert" name="replyInsert" class="btn btn-default btn-sm" value="저장하기">
				</div>
				</form>
			</div>
			<hr>
			<ul id="comment_list" style="margin-bottom : 20px;">
				<!-- 동적 생성 요소 추가 -->
			</ul>			
		</div>
	</body>
</html>