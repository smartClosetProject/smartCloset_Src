package com.spring.client.smartcloset.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.smartcloset.service.SmartClosetService;
import com.spring.client.smartcloset.vo.SmartClosetVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sCloset/*")
@Log4j
public class SmartClosetController {
	
	@Setter(onMethod_ = @Autowired)
	private SmartClosetService sClosetService;
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	@GetMapping("sClosetHome")
	public String sClosetHome(@ModelAttribute("data") SmartClosetVO svo, Model model) {
		log.info("sClosetHome 호출 성공");
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		svo.setM_id(login.getM_id());
		
		List<SmartClosetVO> closetList = sClosetService.smartCloset(svo);
		model.addAttribute("closetList", closetList);
		
		return "smartcloset/sCloset";
	}
	
	@PostMapping("regCloset")
	public String regCloset(@ModelAttribute SmartClosetVO svo) throws Exception {
		log.info("regCloset 호출 성공");
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		svo.setM_id(login.getM_id());
		
		sClosetService.regCloset(svo);
		
		return "redirect:/sCloset/sClosetHome";
	}
	
	@PostMapping("deleteCloset")
	@ResponseBody
	public String deleteCloset(@RequestParam(value = "chkBox[]") List<Integer> chkArr, SmartClosetVO svo, SmartClosetVO vo) throws Exception {
		log.info("deleteCloset 호출 성공");
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		svo.setM_id(login.getM_id());
		
		for (Integer i : chkArr) {
			svo.setSc_num(i);
			List<SmartClosetVO> list = sClosetService.searchTag(i);
			for (SmartClosetVO l : list) {
				svo.setSc_image(l.getSc_image());
				svo.setSc_thumb(l.getSc_thumb());
				svo.setSc_isBuy(l.getSc_isBuy());
			}
			sClosetService.deleteCloset(svo);
		}
		return "success";
	}
	
	@PostMapping(value = "searchTag", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<SmartClosetVO> searchTag(@RequestParam(value = "sc_num") int sc_num) {
		log.info("searchTag 호출 성공");
		
		List<SmartClosetVO> tagList = sClosetService.searchTag(sc_num);
		
		return tagList;
	}
	
	@PostMapping("updateTag")
	public String updateTag(@ModelAttribute SmartClosetVO svo) {
		log.info("updateTag 호출 성공");
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		svo.setM_id(login.getM_id());
		
		sClosetService.updateTag(svo);
		
		return "redirect:/sCloset/sClosetHome";
	}
	
}
