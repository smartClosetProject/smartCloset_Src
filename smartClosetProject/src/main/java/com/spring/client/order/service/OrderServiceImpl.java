package com.spring.client.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.order.dao.OrderDAO;
import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDao;

	@Override
	public OrderVO orderForm(OrderVO ovo) {
		OrderVO vo = orderDao.orderForm(ovo);
		return vo;
	}
	
	@Override
	public int orderAll(OrderVO ovo) {
		int result = orderDao.orderAll(ovo);
		return result;
	}

	@Override
	public int orderAllDetail(OrderDetailVO odvo) {
		int result = orderDao.orderAllDetail(odvo);
		return result;
	}
}
