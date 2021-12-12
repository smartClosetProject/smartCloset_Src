package com.spring.admin.nboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.nboard.service.NboardService;
import com.spring.admin.nboard.vo.NboardVO;
import com.spring.common.vo.PageDTO;

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
		
		return "nboard/test";
	}
	
	/****************************************************
	 * 글 목록 구현
	 ****************************************************/
	@GetMapping("nboardList") // GetMapping이므로 반드시 매핑 일치와 get방식 두 가지 모두 일치해야 한다.
	public String nboardList(@ModelAttribute("data") NboardVO nvo, Model model) {
		log.info("nboardList 호출 성공");
		// 전체 레코드 조회
		List<NboardVO> nboardList = nboardService.nboardList(nvo);
		model.addAttribute("nboardList",nboardList);
		
		List<NboardVO> nboardImportantList = nboardService.nboardImportantList(nvo);
		model.addAttribute("nboardImportantList",nboardImportantList);
		
		// 전체 레코드 수 구현
		int total = nboardService.nboardListCnt(nvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		// 출력되는 글 번호 제어
		int count = total - (nvo.getPageNum() - 1) * nvo.getAmount();
		model.addAttribute("count", count);
		
		return "nboard/nboardList";
	}
	
	/****************************************************
	 * 글 상세 페이지 구현
	 ****************************************************/
	@GetMapping("/nboardDetail")
	public String nboardDetial(@ModelAttribute("data") NboardVO nvo, Model model) {
		log.info("nboardDetial 호출 성공");
		
		NboardVO detail = nboardService.nboardDetail(nvo);
		model.addAttribute("detail", detail);
		
		return "nboard/nboardDetail";
	}
	
	/****************************************************
	 * 글쓰기 폼 출력하기 
	 ****************************************************/
	@RequestMapping(value = "/writeForm")
	public String writeForm() {
		log.info("writeForm 호출 성공");
		
		return "nboard/writeForm";
	}
	
	/****************************************************
	 * 글쓰기 처리 /nboard/nboardInsert
	 ****************************************************/
	@PostMapping("nboardInsert")
	public String nboardInsert(NboardVO nvo) {
		log.info("nboardInsert 호출 성공");
		
		int result=0;
		String url = "";
				
		result = nboardService.nboardInsert(nvo);
		if(result == 1) {
			url = "/nboard/nboardList";
		} else {
			url = "/nboard/writeForm";
		}
		
		return "redirect:"+url;
			
	}
	
	/****************************************************
	 * 글수정 폼 출력하기
	 ****************************************************/
	@RequestMapping("updateForm")
	public String updateForm(@ModelAttribute("data") NboardVO nvo, Model model) {
		log.info("updateForm 호출 성공");
		
		NboardVO updateData = nboardService.updateForm(nvo);
		model.addAttribute("updateData", updateData);
		
		return "nboard/updateForm";
	}
	
	/****************************************************
	 * 글수정 처리
	 ****************************************************/
	@PostMapping
	public String nboardUpdate(@ModelAttribute NboardVO nvo, RedirectAttributes ras) {
		log.info("nboardUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = nboardService.nboardUpdate(nvo);
		ras.addFlashAttribute("data", nvo);
		
		if (result == 1) {
			url = "/nboard/nboardDetail";
		} else if (result == 0) {
			url = "/nboard/updateForm";
		}
		
		return "redirect:"+url;
	}
	
	/****************************************************
	 * 글삭제 처리
	 ****************************************************/
	@RequestMapping("nboardDelete")
	public String boardDelete(@ModelAttribute NboardVO nvo, RedirectAttributes ras) throws Exception{
		int result = 0;
		String url = "";
		
		result = nboardService.nboardDelete(nvo);
		ras.addFlashAttribute("nboardVO", nvo);
		
		if(result==1) {
			url="/nboard/nboardList";
		} else {
			url = "/nboard/nboardDetail";
		}
		return "redirect:"+url;
	}
	
	
}
