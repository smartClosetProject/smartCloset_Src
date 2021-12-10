package com.spring.admin.aOrder.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AorderDetailVO {
	private int od_num;
	private int od_goodsCount;
	private String pr_name;
	private int pr_price;
	private String pro_size;
	private String pro_color;
	private String pr_num;

}
