package com.spring.client.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;




@Controller
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;
	
	/**************
	 * 마이페이지 구현하기
	 * *************/
	@RequestMapping(value = "/mypage", method = { RequestMethod.GET, RequestMethod.POST})
	public String MemberMypage(@ModelAttribute("data") MemberVO mvo, Model model) {
		log.info("mypage 호출 성공");
		
		MemberVO mypage = memberService.memberMypage(mvo);
		model.addAttribute("mypage", mypage);
		
		String m_name = "손흥민";
		model.addAttribute("name", m_name);
		return "member/mypage";
	}
	/****************
	 * 회원 정보 수정 화면 구현
	 *********************/
	@RequestMapping("updateForm")
	public String updateForm(@ModelAttribute("data") MemberVO mvo, Model model) {
		log.info("updateForm 호출 성공");
		
		mvo.setM_id("smartmember");
		MemberVO updateData = memberService.updateForm(mvo);
		model.addAttribute("updateData", updateData);
		
	
		
		return "member/updateForm";
	}
	
	/******************************************
	 * 회원 정보 수정 처리
	 * **************************************/
	@PostMapping
	public String memberUpdate(@ModelAttribute MemberVO mvo, RedirectAttributes ras) {
		log.info("memberUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = memberService.memberUpdate(mvo);
		ras.addFlashAttribute("data", mvo);
		
		System.out.println(result);
		if(result == 1) {
			url="/member/mypage";
		} else if(result == 0) {
			url = "/member/updateForm";
		}
		return "redirect:" + url;
	}




}
