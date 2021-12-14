package com.spring.client.notice.vo;

import com.spring.common.vo.CommonVO;


import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString

//@Data
@EqualsAndHashCode(callSuper=false)
public class NoticeVO extends CommonVO{

	   private int n_num = 0; // 공지글번호
	   private String n_title = "";// 공지제목
	   private String n_content = ""; // 공지내용
	   private String n_author = ""; // 공지작성자
	   private String n_writedate = ""; // 공지작성일
	   private int n_important =0; //공지중요여부
	   private int ad_num =0; // 관리자번호
	  
}
