package com.spring.client.member.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
@RequestMapping("/member/*")

public class MemberController {
	
	@RequestMapping(value = "/mypage", method = { RequestMethod.GET, RequestMethod.POST})
	public String MemberMypage() {
		return "member/mypage";
	}




}
