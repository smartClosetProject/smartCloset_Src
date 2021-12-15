package com.spring.admin.nboard.vo;

import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NboardVO extends CommonVO {
	private int n_num;
	private int ad_num;
	private String n_file;
	private String n_title;
	private String n_content;
	private String n_author;
	private String n_writedate;
	private int n_important;
}
