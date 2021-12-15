package com.spring.admin.aReview.vo;


import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AreviewVO extends CommonVO {
	private int r_num = 0; //게시판번호
	private String r_title = ""; //게시판 제목
	private String r_content = ""; //게시판 내용
	private String r_regdate = ""; //등록일
	private String m_id = "" ; //회원 아이디
	
}