package com.spring.client.qna.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.common.vo.PageDTO;

import com.spring.client.qna.service.QnaService;
import com.spring.client.qna.vo.QnaVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
@AllArgsConstructor // 생성자 주입
public class QnaController {
	private QnaService qnaService;
	/**글목록구현
	 * @throws Exception */

	@GetMapping("qnaList") // GetMapping이므로 반드시 매핑 일치와 get방식 두 가지 모두 일치해야 한다.
	public String qnaList(@ModelAttribute("data") QnaVO qvo, Model model){
		log.info("qnaList 호출 성공");
		// 전체 레코드 조회
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList",qnaList);
		// 전체 레코드 수 구현
		int total = qnaService.qnaListCnt(qvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(qvo, total));
		// 출력되는 글번호 제어
		int count = total - (qvo.getPageNum() - 1) * qvo.getAmount();
	    model.addAttribute("count", count);
				
		return "qna/qnaList";
	}
	/*글쓰기폼처리*/
	@RequestMapping("/writeQNA") // 메서드 방식을 입력하지 않으면 어떤 방식이 와도 상관없다.
	public String writeForm() {
		log.info("writeQNA 호출 성공");
		
		return "qna/writeQNA";
	}
	
	/****************************************************
	 * 글쓰기 처리
	 ****************************************************/
	@RequestMapping(value = "/qnaInsert", method=RequestMethod.POST)
	//@PostMapping("qnaInsert")
	public String qnaInsert(@ModelAttribute QnaVO qvo, Model model) throws Exception {
		log.info("qnaInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = qnaService.qnaInsert(qvo);
		if (result == 1) { // 입력 성공 시 게시판 리스트로 이동
			url = "/qna/qnaList";
		} else {		   // 입력 실패 시 입력화면으로 이동
			url = "/qna/qnaList"; 
		}
		return "redirect:" + url; // 
								   		   
	}
	/****************************************************
	 * 글 상세보기 구현
	 ****************************************************/
	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(@ModelAttribute("data") QnaVO qvo, Model model) { // 클라이언트에게 받은 그대로를 "data"에 담음
		log.info("qnaDetail 호출 성공");
		
		QnaVO detail = qnaService.qnaDetail(qvo);
		model.addAttribute("detail", detail); // 로직처리가 완료되고 반환받은 값을 model에 담음
		
		return "qna/qnaDetail";
	}

	/****************************************************
	 * 글수정 폼 출력하기
	 ****************************************************/
	@RequestMapping("/updateQna")
	public String updateQna(@ModelAttribute("data") QnaVO qvo, Model model) {
		log.info("updateQna 호출 성공");
		
		QnaVO updateData = qnaService.updateQna(qvo);
		model.addAttribute("updateData", updateData);
		
		return "qna/updateQna";
	}
	/****************************************************
	 * 글수정 처리
	 * 참고: RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에
	 * 한 번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다.
	 * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
	 ****************************************************/
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(@ModelAttribute QnaVO qvo, RedirectAttributes ras) throws Exception{
		log.info("qnaUpdate 호출 성공");
		
		int result = 0;
		String url ="";
		
		result = qnaService.qnaUpdate(qvo);
		ras.addFlashAttribute("data", qvo);
		
		if (result == 1) {
			// url = "/qna/qnaDetail?b_num=" + qvo.getB_num();
			url = "/qna/qnaDetail"; // 위와 코드와 같음. qnaDetail에서 사용하는 데이터가 b_num뿐이므로 같은 방법이 된다.
		} else if (result == 0) {
			// url = "/qna/updateQna?b_num=" + qvo.getB_num();
			url = "/qna/updateQna";
		}
		
		return "redirect:" + url;
	}
	
	/****************************************************
	 * 글삭제 처리
	 ****************************************************/
	@RequestMapping("/qnaDelete")
	/*@ResponseBody*/
	public String qnaDelete(@ModelAttribute("data") QnaVO qvo,RedirectAttributes ras) throws Exception{
		log.info("qnaDelete 호출 성공");
		

		int result = qnaService.qnaDelete(qvo);
		//ras.addFlashAttribute("qnaVO", qvo);
		
		
		
		/*	if(result ==1) {
			return "success";
		} else {
			return "false";
		}*/
		return "redirect:/qna/qnaList";
	}
}
