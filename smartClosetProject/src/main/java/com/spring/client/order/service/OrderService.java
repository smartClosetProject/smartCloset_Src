package com.spring.client.order.service;

import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;

public interface OrderService {
	OrderVO orderForm(OrderVO ovo);
	int orderSeq();
	void insertOrder(OrderVO ovo);
	void insertOrderDetail(OrderDetailVO odvo);
	void deleteSelectCart(int cart_num);
	void updateMile(OrderVO ovo);
}
