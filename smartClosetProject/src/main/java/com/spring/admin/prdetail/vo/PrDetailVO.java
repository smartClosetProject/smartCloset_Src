package com.spring.admin.prdetail.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PrDetailVO extends CommonVO{
	private String pr_num;
	private String pr_name;
	private int pr_price;
	private String pr_mainimg;
	private String pr_thumb;
	private String pr_contentimg;
	private int pr_mile;
	private String pr_categoryl;
	private String pr_categorys;
	private String pr_season;
	private String pr_issale;
	private String pr_regdate;
	
	private String category;
	
	private MultipartFile file;
	private MultipartFile file1;
	private MultipartFile file2;
	private String colorKo;
	private String colorEn;
}
