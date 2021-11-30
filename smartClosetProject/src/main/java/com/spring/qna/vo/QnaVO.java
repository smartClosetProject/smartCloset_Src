package com.spring.qna.vo;

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
	
		
	private String q_file    ="";
    private int q_num        =0;
    private String q_title   ="";
    private String q_content ="";
    private String q_date; 
    private String q_passwd  ="";
    private int m_num =0; 
    private int ad_num =0;
	
	
}
