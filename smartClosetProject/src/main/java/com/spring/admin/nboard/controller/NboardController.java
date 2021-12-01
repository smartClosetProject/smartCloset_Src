package com.spring.admin.nboard.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/nboard/*")
@Log4j
@AllArgsConstructor // 생성자 주입
public class NboardController {

	@GetMapping("nboardTest") 
	public String nboardTest() {
		log.info("nboardTest 호출 성공");
		// 전체 레코드 조회
		
		return "nboard/test";
	}
}
