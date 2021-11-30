package com.spring.client.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.client.cart.service.CartService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart/*")
@Log4j
public class CartController {
	
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	
	/************************************
	 * 카트 리스트 구현하기
	 ************************************/
	@GetMapping("cartList")
	public String cartList() {
		
		return "cart/cart";
	}
}
