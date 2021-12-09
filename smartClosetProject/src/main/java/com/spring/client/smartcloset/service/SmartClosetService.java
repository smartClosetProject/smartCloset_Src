package com.spring.client.smartcloset.service;

import java.util.List;

import com.spring.client.order.vo.OrderVO;
import com.spring.client.smartcloset.vo.SmartClosetVO;

public interface SmartClosetService {
	void buyInsertSCloset(OrderVO ovo);
	List<SmartClosetVO> smartCloset(SmartClosetVO svo);
	void regCloset(SmartClosetVO svo) throws Exception;
	void deleteCloset(int sc_num);
	List<SmartClosetVO> searchTag(int sc_num);
	void updateTag(SmartClosetVO svo);
}
