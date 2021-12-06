package com.spring.client.review.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.review.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ReviewDAO reviewDAO;
	
//	@Test
//	public void testReviewList() {
//		ReviewVO rvo = new ReviewVO();
//		
//		rvo.setPageNum(1);
//		rvo.setAmount(10);
//		
//		List<ReviewVO> list = reviewDAO.reviewList(rvo);
//		for(ReviewVO vo: list) {
//			log.info(vo);
//		}
//	}
//	@Test
//	public void testReviewInsert() {
//		ReviewVO rvo = new ReviewVO();
//		
//		rvo.setM_id("smartmember"); 
//		rvo.setR_title("새로입력");
//		rvo.setR_content("새로넣는다");
//		rvo.setR_file("새로운 파일");
//		rvo.setR_thumb("새로 넣엇네");
//		
//		
//		int result = reviewDAO.reviewInsert(rvo);
//		if (result == 1) {
//			log.info("입력 성공");
//		} else {
//			log.info("입력 실패");
//		}
//	}
	@Test
	public void testReviewDetail() {
		ReviewVO rvo = new ReviewVO();
		rvo.setR_num(84);
		
		ReviewVO vo = reviewDAO.reviewDetail(rvo);
		log.info(vo);
		
	}

}
