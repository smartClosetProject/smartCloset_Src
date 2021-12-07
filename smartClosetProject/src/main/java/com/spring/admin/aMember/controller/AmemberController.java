package com.spring.admin.aMember.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	/****************************************************
	 * 회원 상세페이지
	 ****************************************************/
	@GetMapping("aMemberDetail")
	public String aMemberDetail(@ModelAttribute("data") AmemberVO amvo, Model model) {
		log.info("aMemberDetail 호출 성공");

		log.info("amvo : "+amvo);
		AmemberVO aMemberDetail = aMemberService.aMemberDetail(amvo.getM_id());
		log.info("aMemberDetail : "+aMemberDetail);

		
		model.addAttribute("aMemberDetail",aMemberDetail);

		return "aMember/aMemberDetail";
	}
	
	/****************************************************
	 * 포인트 변경 폼
	 ****************************************************/
	@RequestMapping("updateMileForm")
	public String updateMileForm(@ModelAttribute("data") AmemberVO amvo, Model model) {
		log.info("updateMileForm 호출 성공");
		
		AmemberVO nowMile = aMemberService.aMemberDetail(amvo.getM_id());
		log.info("nowMiale: "+nowMile);
		model.addAttribute("nowMile",nowMile);
		
		return "aMember/updateMileForm";
	}
	
	/****************************************************
	 * 포인트 변경 기능
	 ****************************************************/
	@RequestMapping("updateMile")
	public String updateMile(@ModelAttribute AmemberVO amvo, RedirectAttributes ras) {
		log.info("updateMile 호출 성공");
		
		int result = aMemberService.updateMile(amvo);
		ras.addFlashAttribute("data", amvo);
		
		return "redirect:/aMember/aMemberDetail";
		
	}
	
	/****************************************************
	 * 탈퇴일 갱신 기능
	 ****************************************************/
	@RequestMapping("updateExitDate")
	public String updateExitDate(@ModelAttribute("data") AmemberVO amvo, RedirectAttributes ras) {
		aMemberService.updateExitDate(amvo);
		ras.addFlashAttribute("data",amvo);
		
		return "redirect:/aMember/aMemberDetail";
	}
	
	/****************************************************
	 * 탈퇴일 초기화 기능
	 ****************************************************/
	@RequestMapping("resetExitDate")
	public String resetExitDate(@ModelAttribute("data") AmemberVO amvo, RedirectAttributes ras) {
		aMemberService.resetExitDate(amvo);
		ras.addFlashAttribute("data",amvo);
		
		return "redirect:/aMember/aMemberDetail";
	}
	
	/****************************************************
	 * 회원 일괄 삭제
	 ****************************************************/
	@RequestMapping("aMemberAllDelete")
	public String aMemberAllDelete() throws Exception{
		aMemberService.aMemberAllDelete();
		
		return "redirect:/aMember/aMemberList";
	}
	
	
}
