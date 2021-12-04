package com.spring.client.order.service;

import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;

public interface OrderService {
	OrderVO orderForm(OrderVO ovo);
	int orderAll(OrderVO ovo);
	int orderAllDetail(OrderDetailVO odvo);
}
