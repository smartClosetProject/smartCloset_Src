package com.spring.qna.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.spring.common.vo.PageDTO;
import com.spring.qna.service.QnaService;
import com.spring.qna.vo.QnaVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
@AllArgsConstructor // 생성자 주입
public class QnaController {
	private QnaService qnaService;
	
	@GetMapping("qnaList") // GetMapping이므로 반드시 매핑 일치와 get방식 두 가지 모두 일치해야 한다.
	public String qnaList(@ModelAttribute("data") QnaVO qvo, Model model) {
		log.info("qnaList 호출 성공");
		// 전체 레코드 조회
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		// 전체 레코드 수 구현
		int total = qnaService.qnaListCnt(qvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(qvo, total));
		// 출력되는 글번호 제어
		int count = total - (qvo.getPageNum() - 1) * qvo.getAmount();
		model.addAttribute("count", count);
		
		return "qna/qnaList";
	}
}
