package com.spring.client.product.vo;

import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO extends CommonVO{
	public String pr_num;
	public String pr_name;
	public int pr_price;
	public String pr_mainimg;
	public String pr_thumb;
	public String pr_contentimg;
	public double pr_mile;
	public String pr_categoryl;
	public String pr_categorys;
	public String pr_category;
	public String pr_regdate;
	public int pr_sales;
	public String pro_size;
	public String pro_color;
	public String pro_num;
	public String pro_keyword;
	public String order;
}
