package com.spring.client.order.dao;

import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;

public interface OrderDAO {
	public OrderVO orderForm(OrderVO ovo);
	public int orderAll(OrderVO ovo);
	public int orderAllDetail(OrderDetailVO odvo);
}
