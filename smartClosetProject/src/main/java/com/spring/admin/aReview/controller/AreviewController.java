package com.spring.admin.aReview.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.aReview.service.AreviewService;
import com.spring.admin.aReview.vo.AreviewVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/aReview/*")
@Log4j
@AllArgsConstructor
public class AreviewController {
	
	@Setter(onMethod_= @Autowired)
	private AreviewService areviewService;
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	/**********
	 * 리뷰게시판 구현
	 * **********/
	@GetMapping("aReviewList")
	public String reviewList(@ModelAttribute("data")AreviewVO arvo, Model model) {
		log.info("reviewList 호출 성공");
		//전체 레코드 조회
		List<AreviewVO> reviewList = areviewService.aReviewList(arvo);
		model.addAttribute("reviewList",reviewList);
		
		// 전체 레코드 수 구현
		int total = areviewService.aReviewListCnt(arvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(arvo, total));
		// 출력되는 글번호 제어
		int count = total - (arvo.getPageNum() - 1 ) * arvo.getAmount();
		model.addAttribute("count", count);
		return "aReview/aReviewList";
	}
	
	
	/**************************************************************
	 * 글 삭제 처리
	 * ************/
	@RequestMapping("aReviewDelete")
	public String reviewDelete(@ModelAttribute("data") AreviewVO arvo) throws Exception{
		areviewService.aReviewDelete(arvo);
		
		return "redirect:/aReview/aReviewList";
	}
}