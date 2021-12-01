package com.spring.client.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.cart.service.CartService;
import com.spring.client.cart.vo.CartVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart/*")
@Log4j
public class CartController {
	
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	/************************************
	 * 카트 리스트 구현하기
	 ************************************/
	@GetMapping("cartList")
	public String cartList(@ModelAttribute CartVO cvo, Model model) {
		log.info("카트 리스트 호출 성공");
		int m_num = (int) session.getAttribute("m_num");
		m_num = 210000;
		cvo.setM_num(m_num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVO> list = cartService.cartList(cvo);
		
		if (m_num != 0) {
			return "cart/cartList";
		} else {
			return "redirect:/member/login"; 
		}
		
		
	}
}
