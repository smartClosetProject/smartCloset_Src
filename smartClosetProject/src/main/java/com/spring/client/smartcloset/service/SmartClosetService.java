package com.spring.client.smartcloset.service;

import java.util.List;

import com.spring.client.order.vo.OrderVO;

public interface SmartClosetService {
	void buyInsertSCloset(OrderVO ovo);
	List<String> smartCloset(String m_id);
}
