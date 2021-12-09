package com.spring.admin.aQna.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.aQna.service.AqnaService;
import com.spring.admin.aQna.vo.AqnaVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/aQna/*")
@Log4j
@AllArgsConstructor // 생성자 주입
public class AqnaController {
	private AqnaService aQnaService;
	
	/****************************************************
	 * 글목록 구현하기(페이징 처리 목록 조회)
	 ****************************************************/
	@GetMapping("aQnaList")
	public String aQnAList(@ModelAttribute("data") AqnaVO aqvo, Model model) {
		log.info("aQnaList 호출 성공");
		
		List<AqnaVO> aQnaList = aQnaService.aQnaList(aqvo);
		model.addAttribute("aQnaList",aQnaList);
		
		int total = aQnaService.aQnaListCnt(aqvo);
		
		model.addAttribute("pageMaker", new PageDTO(aqvo, total));
		
		int count = total - (aqvo.getPageNum()-1) * aqvo.getAmount();
		model.addAttribute("count",count);
		
		return "aQna/aQnaList";
	}
	
	/****************************************************
	 * 글 상세 보기
	 ****************************************************/
	@RequestMapping("aQnaDetail")
	public String aQnaDetail(@ModelAttribute("data") AqnaVO aqvo, Model model) {
		log.info("aQnaDetail 호출 성공");
		
		AqnaVO detail = aQnaService.aQnaDetail(aqvo);
		model.addAttribute("detail",detail);
		
		return "aQna/aQnaDetail";
	}
	
	/****************************************************
	 * 글 삭제 처리
	 ****************************************************/
	@RequestMapping("aQnaDelete")
	public String aQnaDelete(@ModelAttribute AqnaVO aqvo, RedirectAttributes ras) {
		aQnaService.aQnaDelete(aqvo);
		ras.addFlashAttribute("AqnaVO", aqvo);
		
		return "redirect:/aQna/aQnaList";
	}

}
