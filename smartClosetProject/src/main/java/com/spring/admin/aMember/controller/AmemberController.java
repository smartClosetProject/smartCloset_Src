package com.spring.admin.aMember.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.admin.aMember.service.AmemberService;
import com.spring.admin.aMember.vo.AmemberVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/aMember/*")
@Log4j
@AllArgsConstructor // 생성자 주입
public class AmemberController {

	AmemberService aMemberService;
	
	/****************************************************
	 * 회원 리스트 구현
	 ****************************************************/
	@RequestMapping("aMemberList")
	public String aMemberList(@ModelAttribute("data") AmemberVO amvo, Model model) {
		log.info("aMemberList 호출 성공");
		
		List<AmemberVO> aMemberList = aMemberService.aMemberList(amvo);
		model.addAttribute("aMemberList",aMemberList);
		
		int total = aMemberService.aMemberListCnt(amvo);
		
		model.addAttribute("pageMaker", new PageDTO(amvo, total));
		
		int count = total - (amvo.getPageNum() - 1) * amvo.getAmount();
		model.addAttribute("count", count);
		
		return "aMember/aMemberList";
	}
	
	
}
