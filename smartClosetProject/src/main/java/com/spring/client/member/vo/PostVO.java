package com.spring.client.member.vo;

import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Data
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
@NoArgsConstructor
public class PostVO extends CommonVO{
	private int r_num = 0; //리뷰게시판번호
	private String r_title = ""; //리뷰게시판 제목
	private String r_content = ""; //리뷰게시판 내용
	private String r_regdate = ""; //리뷰게시판 등록일
	private String m_id = "" ; //회원 아이디
	
	private int q_num = 0; //QnA 게시판 번호
	private String q_title = "";//QnA 게시판 제목
	private String q_content = ""; //QnA 게시판 내용
	private String q_regdate; //QnA 게시판 등록일
	
	private String category = "";

}
