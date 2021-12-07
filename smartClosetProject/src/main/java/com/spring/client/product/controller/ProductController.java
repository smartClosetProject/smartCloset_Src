package com.spring.client.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	@GetMapping("productList") 
	public String nboardTest() {
		log.info("productList 호출 성공");
		// 전체 레코드 조회
		
		return "product/productList";
	}
}
