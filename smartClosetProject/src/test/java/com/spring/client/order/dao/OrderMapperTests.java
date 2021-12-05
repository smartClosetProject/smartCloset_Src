package com.spring.client.order.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDao;
	
//	@Test
//	public void testOrderForm() {
//		OrderVO ovo = new OrderVO();
//		ovo.setM_id("smartmember");
//		
//		OrderVO vo = orderDao.orderForm(ovo);
//		log.info("result : " + vo);
//	}
//	
	@Test
	public void testInsertOrder() {
		log.info("testInsertOrder 호출 성공");
		
		OrderVO ovo = new OrderVO();
		ovo.setOrder_num(1234567890);
		ovo.setOrder_totalPayment(370000);
		ovo.setOrder_state("결제완료");
		ovo.setM_id("smartmember");
		ovo.setM_name("김자바");
		ovo.setM_addr("서울시 중랑구 상봉동");
		ovo.setM_phone("010-1234-4321");
		ovo.setShipMessage("부재 시 문 앞에 놓아주세요.");
		
		orderDao.insertOrder(ovo);
	}
//	
//	@Test
//	public void testInsertOrderDetail() {
//		OrderDetailVO odvo = new OrderDetailVO();
//		odvo.setOrder_num(1234567890);
//		odvo.setCart_num(20);
//		
//		orderDao.insertOrderDetail(odvo);
//	}
	
//	@Test
//	public void testUpdateMile() {
//		log.info("testUpdateMile 호출 성공");
//		
//		OrderVO ovo = new OrderVO();
//		ovo.setM_id("smartmember");
//		ovo.setM_mile(10000);
//		ovo.setM_mileApply(3000);
//		ovo.setM_mileAdd(3000);
//		
//		orderDao.updateMile(ovo);
//	}
}
