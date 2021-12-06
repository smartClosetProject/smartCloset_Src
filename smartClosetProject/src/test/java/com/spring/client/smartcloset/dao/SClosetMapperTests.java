package com.spring.client.smartcloset.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.order.vo.OrderVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SClosetMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private SmartClosetDAO sClosetDAO;
	
	@Test
	public void testBuyInsertSCloset() {
		log.info("testBuyInsertSCloset 호출 성공");
		
		OrderVO ovo = new OrderVO();
		ovo.setM_id("smartmember");
		ovo.setCart_num(33);
		
		sClosetDAO.buyInsertSCloset(ovo);
	}
}
