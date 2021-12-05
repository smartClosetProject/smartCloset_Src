package com.spring.client.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.cart.dao.CartDAO;
import com.spring.client.order.dao.OrderDAO;
import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDao;
	@Setter(onMethod_ = @Autowired)
	private CartDAO cartDao;

	@Override
	public OrderVO orderForm(OrderVO ovo) {
		OrderVO vo = orderDao.orderForm(ovo);
		return vo;
	}

	@Override
	public int orderSeq() {
		int order_seq = orderDao.orderSeq();
		return order_seq;
	}

	@Override
	public void insertOrder(OrderVO ovo) {
		orderDao.insertOrder(ovo);
	}

	@Override
	public void insertOrderDetail(OrderDetailVO odvo) {
		orderDao.insertOrderDetail(odvo);
	}

	@Override
	public void deleteAllCart(String m_id) {
		cartDao.deleteAllCart(m_id);
	}

	@Override
	public void updateMile(OrderVO ovo) {
		orderDao.updateMile(ovo);
	}
	
}
