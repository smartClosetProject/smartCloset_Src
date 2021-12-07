package com.spring.client.smartcloset.dao;

import java.util.List;

import com.spring.client.order.vo.OrderVO;

public interface SmartClosetDAO {
	void buyInsertSCloset(OrderVO ovo);
	List<String> smartCloset(String m_id);
}
