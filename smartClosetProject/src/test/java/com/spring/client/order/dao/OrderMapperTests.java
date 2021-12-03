package com.spring.client.order.dao;

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
public class OrderMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDao;
	
	@Test
	public void testOrderForm() {
		OrderVO ovo = new OrderVO();
		ovo.setM_id("smartmember");
		
		OrderVO vo = orderDao.orderForm(ovo);
		log.info("result : " + vo);
	}
	
//	@Test
//	public void testOrderAll() {
//		OrderVO ovo = new OrderVO();
//		ovo.setOrder_recipient("김철수");
//		ovo.setOrder_address("서울시 중랑구 상봉동");
//		ovo.setOrder_totalPayment(100000);
//		ovo.setOrder_state("결제대기");
//		ovo.setM_id("smartmember");
//		
//		int result = orderDao.orderAll(ovo);
//		log.info("result : " + result);
//	}
	
//	@Test
//	public void testOrderAllDetail() {
//		OrderDetailVO odvo = new OrderDetailVO();
//		odvo.setOrder_num(11);
//		odvo.setM_id("smartmember");
//		
//		int result = orderDao.orderAllDetail(odvo);
//		log.info("result : " + result);
//	}
}
