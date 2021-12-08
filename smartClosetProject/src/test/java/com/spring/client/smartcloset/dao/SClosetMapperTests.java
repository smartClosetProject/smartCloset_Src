package com.spring.client.smartcloset.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//import com.spring.client.order.vo.OrderVO;
import com.spring.client.smartcloset.vo.SmartClosetVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SClosetMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private SmartClosetDAO sClosetDAO;
//	
//	@Test
//	public void testBuyInsertSCloset() {
//		log.info("testBuyInsertSCloset 호출 성공");
//		
//		OrderVO ovo = new OrderVO();
//		ovo.setM_id("smartmember");
//		ovo.setCart_num(33);
//		
//		sClosetDAO.buyInsertSCloset(ovo);
//	}
	
//	@Test
//	public void testRegCloset() {
//		log.info("testRegCloset 호출 성공");
//		
//		SmartClosetVO svo = new SmartClosetVO();
//		svo.setSc_tag1("바지");
//		svo.setSc_tag2("청바지");
//		svo.setSc_tag3("봄");
//		svo.setSc_tag4("가을");
//		svo.setSc_tag5("2021년");
//		svo.setSc_isBuy("NO");
//		svo.setSc_image("sc_jean");
//		svo.setSc_thumb("thumb_sc_jean");
//		svo.setM_id("smartmember");
//		
//		sClosetDAO.regCloset(svo);
//	}
	
	@Test
	public void testSmartCloset() {
		log.info("testSmartCloset 호출 성공");
		
		SmartClosetVO svo = new SmartClosetVO();
		svo.setM_id("smartmember");
		svo.setKeyword("여");
		
		List<SmartClosetVO> list = sClosetDAO.smartCloset(svo);
		for (SmartClosetVO i : list) {
			log.info(i);
		}
	}
}
