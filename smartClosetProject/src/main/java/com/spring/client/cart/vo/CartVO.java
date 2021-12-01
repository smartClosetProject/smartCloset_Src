package com.spring.client.cart.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {
	private int cart_num;
	private int cart_goodsCount;
	private String cart_regdate;
	private int m_num;
	private String pro_num;
}
