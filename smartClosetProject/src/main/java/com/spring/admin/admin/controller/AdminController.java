package com.spring.admin.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.admin.admin.service.AdminService;
import com.spring.admin.admin.vo.AdminVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor // 생성자 주입
public class AdminController {
	public AdminService adminService;
	
	@GetMapping("adminLoginForm")
	public String loginTest() {
		log.info("loginTest 호출 성공");
		
		return "admin/adminLoginForm";
	}
	
	@RequestMapping("adminLogin")
	public String adminLogin(AdminVO avo, HttpSession session, Model model) {
		log.info(avo);
		AdminVO adminVO = adminService.adminLogin(avo);
		log.info(adminVO);
		if(adminVO != null) { // 로그인 성공
			session.setAttribute("adminVO", adminVO);
			return "redirect:/nboard/nboardTest";
		} else {
			model.addAttribute("msg", "아이디, 비밀번호를 확인하세요.");
			return "admin/loginForm";
		}
	}
	

	@GetMapping("adminTest")
	public String adminTest() {
		log.info("adminTest 호출 성공");
		
		return "admin/test";
	}
	
	/****************************************************
	 * 관리자 마이페이지 구현
	 ****************************************************/
	@GetMapping("adminInfo")
	public String adminInfo(@ModelAttribute("data") AdminVO avo, Model model) {
		log.info("adminInfo");
		
		AdminVO adminInfo = adminService.adminInfo(avo);
		model.addAttribute("adminInfo",adminInfo);
		
		return "admin/adminInfo";
	}

}
