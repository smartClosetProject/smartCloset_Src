package com.spring.client.order.dao;

import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;

public interface OrderDAO {
	OrderVO orderForm(OrderVO ovo);
	int orderSeq();
	void insertOrder(OrderVO ovo);
	void insertOrderDetail(OrderDetailVO odvo);
	void updateMile(OrderVO ovo);
}
