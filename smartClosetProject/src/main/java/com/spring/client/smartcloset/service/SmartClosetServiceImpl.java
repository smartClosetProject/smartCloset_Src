package com.spring.client.smartcloset.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.order.vo.OrderVO;
import com.spring.client.smartcloset.dao.SmartClosetDAO;

import lombok.Setter;

@Service
public class SmartClosetServiceImpl implements SmartClosetService {
	@Setter(onMethod_ = @Autowired)
	private SmartClosetDAO sClosetDao;

	@Override
	public void buyInsertSCloset(OrderVO ovo) {
		sClosetDao.buyInsertSCloset(ovo);
	}
}