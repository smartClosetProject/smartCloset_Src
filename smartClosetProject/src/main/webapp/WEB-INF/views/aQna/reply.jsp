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
		<link rel="shortcut icon" href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
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
					name_span.html(r_name+"님");
					
					//작성일시
					let date_span = $("<span>");
					date_span.html(" / "+ r_regdate+" ");
					
					//수정하기 버튼
					let up_input=$("<input>");
					up_input.attr({"type":"button","value":"수정하기"});
					up_input.addClass("update_form");
					
					//삭제하기 버튼
					let del_input=$("<input>");
					del_input.attr({"type":"button","value":"삭제하기"});
					del_input.addClass("delete_btn");
					
					//내용
					var content_p = $("<p>");
					content_p.html(r_content);
					
					//조립하기
					writer_p.append(name_span).append(date_span).append(up_input).append(del_input)
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
				
				/** 수정 화면에서 수정완료 버튼 클릭시 수정을 위한 Ajax 연동 처리 */
				$(document).on("click", ".update_btn", function () {
					let r_num = $(this).parents("li").attr("data-num");
					let r_content = $("#content").val();
					
					if(!chkData("#content","댓글 내용을")) return;
					else{
						$.ajax({
							url : '/aReply/'+r_num,
							type : 'put',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "PUT"//put 방식과 맞는 것을 찾아 실행(controller 참고)
							},
							data : JSON.stringify({
								r_content:r_content
							}),
							dateType : 'text',
							error : function(){
								alert('시스템 오류입니다. 관리자에게 문의하세요.')
							},
							success : function (result) {
								console.log("result : "+result);
								if(result=="SUCCESS"){
									alert("수정이 완료되었습니다.");
									listAll(q_num);
								}
								
							}
							
						})
					}
					
				})
				
				/** "수정하기" 버튼 클릭시 수정폼 출력 */
				$(document).on("click",".update_form",function(){
					$(".reset_btn").click(); // 수정하기가 활성화 된 상태에서 다른 댓글의 버튼을 눌렀을 경우를 제어
					let currLi = $(this).parents("li");
					replyNum = currLi.attr("data-num");
					btnKind="upBtn";
				})
				;
				/*수정 화면에서 수정 취소버튼(초기화 버튼) 클릭 처리*/
 				$(document).on("click", ".reset_btn", function(){
 					btnKind="";
					
					var conText = $(this).parents("li").find("textarea").html();
 					conText = conText.replace(/(\r\n|\r|\n)/g, "<br />");		//\n\r 다시 <br/>로 바꾸기
 					$(this).parents("li").find("input[type='button']").show();	//숨긴 버튼 다시 보이기
 					
 					let conArea = $(this).parents("li").children().eq(1);
 					conArea.html(conText);
 				});
				
			
				$(document).on("click",".delete_btn",function(){
					$(".reset_btn").click();
					let currLi = $(this).parents("li");
					replyNum = currLi.attr("data-num");
					btnKind="delBtn";
				})
			
			}); // 최상위 $ 종료
			
			
			function dataReset(){
				$("#r_name").val("");
				$("#r_content").val("");
				
			}
			/** 수정 폼 화면 구현 함수 */
			function updateForm(currLi){
				let conArea = currLi.children().eq(1);  //두번째 <p>태그
				let conText = conArea.html();			//두번째 <p>태그의 내용
				conText = conText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
				// <br> <br/> <br /> 세가지가 들어오면 '\r\n'을 이용해 엔터처리를 함
				// 이를 통해 수정을 누르면 원래 있던 글의 줄 수 만큼의 textArea가 생기게 된다.
				console.log("conText: " + conText);
								
				currLi.find("input[type='button']").hide();	//수정하기, 삭제하기 버튼 숨기기
				conArea.html("");
							
				let update_area = $("<span>");
				update_area.addClass("update_area");
							
				let textarea = $("<textarea>");
				textarea.attr({"name" : "content", "id" : "content"});
				textarea.html(conText);		// 댓글 내용 출력, 접근할 수 있는 id가 필요해서 얘만 id 줌, 입력화면에 r_content있어서 겹치지 않게 content만 줌
							
				let update_btn = $("<input>");
				update_btn.attr({"type" : "button", "value" : "수정완료"});
				update_btn.addClass("update_btn");
							
				let reset_btn = $("<input>");
				reset_btn.attr({"type" : "button", "value" : "수정취소"});
				reset_btn.addClass("reset_btn");
							
				// 동적 요소는 반드시 조립을 해 주어야 함
				update_area.append(textarea).append(update_btn).append(reset_btn);
				conArea.html(update_area);
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
							console.log("result : "+result);
							if(result=='SUCCESS'){
								alert("삭제되었습니다.");
								listAll(q_num);
							}
							
						}
						
					});
				}
			}
				
		</script>
	</head>
	<body>
		<div id="replyContainer">
			<div id="comment_write">
				<form id="comment_form">
				<div id="comment">
					<label for="r_name" class="tac">작성자</label>
					<input type="text" name="r_name" id="r_name">
					<input type="button" id="replyInsert" name="replyInsert" value="저장하기">
				</div>
				<div>
					<label>덧글 내용</label>
					<textarea style="resize: none;" id="r_content" name="r_content"></textarea>
				</div>
				</form>
			</div>
			<ul id="comment_list">
				<!-- 동적 생성 요소 추가 -->
			</ul>
		</div>
	</body>
</html>