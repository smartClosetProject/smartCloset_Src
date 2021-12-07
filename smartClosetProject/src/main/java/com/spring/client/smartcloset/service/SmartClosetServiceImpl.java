package com.spring.client.smartcloset.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.order.vo.OrderVO;
import com.spring.client.smartcloset.dao.SmartClosetDAO;
import com.spring.client.smartcloset.vo.SmartClosetVO;

import lombok.Setter;

@Service
public class SmartClosetServiceImpl implements SmartClosetService {
	@Setter(onMethod_ = @Autowired)
	private SmartClosetDAO sClosetDao;

	@Override
	public void buyInsertSCloset(OrderVO ovo) {
		sClosetDao.buyInsertSCloset(ovo);
	}

	@Override
	public List<SmartClosetVO> smartCloset(String m_id) {
		List<SmartClosetVO> closetList = sClosetDao.smartCloset(m_id);
		return closetList;
	}
}
