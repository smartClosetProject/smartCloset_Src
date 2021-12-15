package com.spring.client.qna.vo;

import org.springframework.web.multipart.MultipartFile;

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
public class QnaVO extends CommonVO{
	
		
	
    private int q_num        =0;
    private String q_title   ="";
    private String q_content ="";
    private String q_regdate; 
    private String m_id = ""; 
    private String q_file ="";
    private String q_category ="";
    private MultipartFile file;
    private String m_name = "";
	
}
