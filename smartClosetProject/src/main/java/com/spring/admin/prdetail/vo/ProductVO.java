package com.spring.admin.prdetail.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ProductVO extends PrDetailVO {
	private String pro_num;
	private String pro_colorImg;
	private String pro_size;
	private String pro_color;
	private int pro_stock;
	private int pro_sales;
	private String pro_colorthumb;
	
	private int cl_num;
	private int cl_price;
	private String cl_regdate;
	private String cl_name;
	private int cl_amount;
	private int cl_allPrice;
	
	private int ad_num;
	private String orderOp;
}
