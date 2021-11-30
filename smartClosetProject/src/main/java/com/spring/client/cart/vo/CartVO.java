package com.spring.client.cart.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {
	private int sc_num;
	private String sc_tag1;
	private String sc_tag2;
	private String sc_tag3;
	private String sc_tag4;
	private String sc_tag5;
	private String sc_isBuy;
	private String sc_image;
	private String sc_thumb;
	private String sc_regdate;
	private String m_num;
}
