package com.spring.client.order.dao;

import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;

public interface OrderDAO {
	OrderVO orderForm(OrderVO ovo);
	int orderAll(OrderVO ovo);
	int orderAllDetail(OrderDetailVO odvo);
}
