package com.spring.client.smartcloset.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.client.smartcloset.service.SmartClosetService;

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
	public String sClosetHome(Model model) {
		log.info("sClosetHome 호출 성공");
		
		String m_id = (String) session.getAttribute("m_id");
		m_id = "smartmember";
		
		List<String> thumbList = sClosetService.smartCloset(m_id);
		model.addAttribute("thumbList", thumbList);
		
		return "smartcloset/sCloset";
	}
	
	@GetMapping("regClosetForm")
	public String regClosetForm() {
		log.info("regClosetForm 호출 성공");
		
		return "smartcloset/regClosetForm";
	}
}
