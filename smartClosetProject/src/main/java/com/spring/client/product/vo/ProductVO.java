package com.spring.client.product.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	public String pr_num;
	public String pr_name;
	public int pr_price;
	public String pr_mainimg;
	public String pr_thumb;
	public String pr_contentimg;
	public int pr_mile;
	public String pr_categoryl;
	public String pr_categorys;
	public String pr_category;
	public String pr_regdate;
	public int pr_sales;
}
