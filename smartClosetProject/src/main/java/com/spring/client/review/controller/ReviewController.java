package com.spring.client.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.spring.client.review.service.ReviewService;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/review/*")
@Log4j
@AllArgsConstructor
public class ReviewController {
	
	@Setter(onMethod_= @Autowired)
	private ReviewService reviewService;
	
	/**********
	 * 리뷰게시판 구현
	 * **********/
	@GetMapping("reviewList")
	public String reviewList(@ModelAttribute("data")ReviewVO rvo, Model model) {
		log.info("reviewList 호출 성공");
		//전체 레코드 조회
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		model.addAttribute("reviewList",reviewList);
		
		// 전체 레코드 수 구현
		int total = reviewService.reviewListCnt(rvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		// 출력되는 글번호 제어
		int count = total - (rvo.getPageNum() - 1 ) * rvo.getAmount();
		
		return "review/reviewList";
	}
	
}
