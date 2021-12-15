package com.spring.client.order.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int od_num = 0;			// 주문 상세 번호
	private int od_goodsCount = 0;	// 상품 개수
	private long order_num = 0;		// 주문 번호
	private String pro_num = "";	// 상품 번호
	
	private String m_id;
	private int cart_num;			// 카트 번호
}
