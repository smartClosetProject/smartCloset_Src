package com.spring.client.review.vo;


import org.springframework.web.multipart.MultipartFile;

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
public class ReviewVO extends CommonVO {
	private int r_num = 0; //게시판번호
	private MultipartFile file; //첨부파일
	private String r_thumb = ""; //썸네일
	private String r_title = ""; //게시판 제목
	private String r_content = ""; //게시판 내용
	private String r_regdate = ""; //등록일
	private String m_id = "" ; //회원 아이디
	private String r_file = "";
	private String m_name = ""; //회원 이름
	
}
