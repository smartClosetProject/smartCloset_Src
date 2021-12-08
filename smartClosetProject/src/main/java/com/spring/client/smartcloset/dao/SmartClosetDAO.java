package com.spring.client.smartcloset.dao;

import java.util.List;

import com.spring.client.order.vo.OrderVO;
import com.spring.client.smartcloset.vo.SmartClosetVO;

public interface SmartClosetDAO {
	void buyInsertSCloset(OrderVO ovo);
	List<SmartClosetVO> smartCloset(SmartClosetVO svo);
	void regCloset(SmartClosetVO svo);
}
