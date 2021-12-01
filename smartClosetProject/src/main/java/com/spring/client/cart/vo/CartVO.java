package com.spring.client.cart.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {
	private int cart_num = 0;
	private int cart_goodsCount = 0;
	private String cart_regdate;
	private int m_num = 0;
	private String pro_num = "";
}
