package com.spring.client.product.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.product.vo.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductDAOTests {
	
	@Setter(onMethod_=@Autowired)
	private ProductDAO productDAO;
	
	@Test
	public void testBoardList() {
		ProductVO cpvo = new ProductVO();
		cpvo.setPr_num("ii_1010");
		List<String> pvo = productDAO.listSize(cpvo);
		for(String vo : pvo) {
			log.info(vo);
		}
	}
//	@Test
//	public void testsubPage() {
//		ProductVO detail = new ProductVO();
//		detail.setPr_num("ii_1010");
//		detail= productDAO.productDetail(detail);
//		
//		log.info(detail);
//	}
}	
