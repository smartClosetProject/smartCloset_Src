package com.spring.client.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.notice.service.NoticeService;
import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@Log4j
@AllArgsConstructor 
public class NoticeController {

	private NoticeService noticeService;
	/*공지리스트*/
	@GetMapping("/noticeList") // GetMapping이므로 반드시 매핑 일치와 get방식 두 가지 모두 일치해야 한다.
	public String noticeList(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("noticeList 호출 성공");
		// 전체 레코드 조회
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList",noticeList);
		// 전체 레코드 수 구현
				int total = noticeService.noticeListCnt(nvo);
				// 페이징 처리
				model.addAttribute("pageMaker", new PageDTO(nvo, total));
				// 출력되는 글번호 제어
				int count = total - (nvo.getPageNum() - 1) * nvo.getAmount();
			    model.addAttribute("count", count);
						
		return "notice/noticeList";
	}
	
	/*상세보기*/
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model) { // 클라이언트에게 받은 그대로를 "data"에 담음
		log.info("noticeDetail 호출 성공");
		
		NoticeVO detail = noticeService.noticeDetail(nvo);
		model.addAttribute("detail", detail); // 로직처리가 완료되고 반환받은 값을 model에 담음
		
		return "notice/noticeDetail";
	}
}
