package com.spring.client.member.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.spring.client.member.vo.MyorderVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MemberDAO memberDAO;
	
//	@Test
//	public void testMemberUpdate() {
//		MemberVO mvo = new MemberVO();
//		mvo.setM_id("smartmember");
//		mvo.setM_passwd("123456");
//		mvo.setM_email("as@naver.com");
//		mvo.setM_addr("서울시 성동구 왕십리");
//		mvo.setM_phone("010-5656-5657");
//		
//		int result = memberDAO.memberUpdate(mvo);
//		log.info("result = " + result);
//	}
	@Test
	public void testMyorderList() {
		MyorderVO mvo = new MyorderVO();
		mvo.setM_id("smartmember");
		
		List<MyorderVO> list = memberDAO.myorderList(mvo);
		for(MyorderVO vo:list) {
			log.info(vo);
		}
	}

}
