package com.spring.client.smartcloset.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		String m_id = (String) session.getAttribute("m_id");
		m_id = "smartmember";
		svo.setM_id(m_id);
		
		List<SmartClosetVO> closetList = sClosetService.smartCloset(svo);
		model.addAttribute("closetList", closetList);
		
		return "smartcloset/sCloset";
	}
	
	@PostMapping("regCloset")
	public String regCloset(@ModelAttribute SmartClosetVO svo) throws Exception {
		log.info("regCloset 호출 성공");
		
		String m_id = (String) session.getAttribute("m_id");
		m_id = "smartmember";
		svo.setM_id(m_id);
		
		sClosetService.regCloset(svo);
		
		return "redirect:/sCloset/sClosetHome";
	}
	
	@PostMapping("deleteCloset")
	@ResponseBody
	public String deleteCloset(@RequestParam(value = "chkBox[]") List<Integer> chkArr) {
		log.info("deleteCloset 호출 성공");
		
		int sc_num = 0;
		for (Integer i : chkArr) {
			sc_num = i;
			sClosetService.deleteCloset(sc_num);
		}
		return "success";
	}
}
