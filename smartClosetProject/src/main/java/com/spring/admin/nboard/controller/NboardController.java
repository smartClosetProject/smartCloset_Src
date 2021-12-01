package com.spring.admin.nboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.admin.nboard.service.NboardService;
import com.spring.admin.nboard.vo.NboardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/nboard/*")
@Log4j
@AllArgsConstructor // 생성자 주입
public class NboardController {
	public NboardService nboardService;

	@GetMapping("nboardTest") 
	public String nboardTest() {
		log.info("nboardTest 호출 성공");
		// 전체 레코드 조회
		
		return "nboard/test";
	}
	
	/****************************************************
	 * 글목록 구현하기(검색 추가 목록 조회)
	 ****************************************************/
	@GetMapping("nboardList") // GetMapping이므로 반드시 매핑 일치와 get방식 두 가지 모두 일치해야 한다.
	public String nboardList(@ModelAttribute("data") NboardVO bvo, Model model) {
//		log.info("nboardList 호출 성공");
//		// 전체 레코드 조회
//		List<NboardVO> nboardList = nboardService.nboardList(bvo);
//		model.addAttribute("nboardList",nboardList);
		
		return "nboard/nboardList";
	}
}
