package com.spring.admin.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor // 생성자 주입
public class AdminController {
	
	@GetMapping("adminTest")
	public String adminTest() {
		log.info("adminTest 호출 성공");
		
		return "admin/test";
	}

}
