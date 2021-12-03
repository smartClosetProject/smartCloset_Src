package com.spring.admin.prdetail.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.admin.prdetail.vo.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PrDetailDAOTests {
	
	@Setter(onMethod_=@Autowired)
	private PrDetailDAO prDetailDAO;
	
	@Test
	public void testBoardList() {
		ProductVO pvo = new ProductVO();
		pvo.setPr_num("TS_0112");
		
		List<ProductVO> pro = prDetailDAO.productDetail(pvo);
		for(ProductVO vo : pro) {
			log.info(vo);
		}
	}

}	
