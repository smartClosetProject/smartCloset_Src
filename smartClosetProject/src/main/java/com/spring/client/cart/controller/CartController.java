package com.spring.client.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@GetMapping("insertCart")
	@ResponseBody
	public String InsertCart(@ModelAttribute CartVO cvo) {
		log.info("InsertCart 호출 성공");
		
		int isExist = 0;
		isExist = cartService.isExist(cvo);
		if (isExist == 1) { // 이미 장바구니에 존재하는 상품
			return "existed"; 
		} else {			// 장바구니에 존재하지 않는 상품
			cartService.insertCart(cvo);
			return "success";
		}
	}
	
	@GetMapping("deleteEachCart")
	public String deleteEachCart(@ModelAttribute CartVO cvo) {
		log.info("deleteEachCart 호출 성공");
		
		cartService.deleteEachCart(cvo);
		return "redirect:/cart/cartList";
	}
	
	@GetMapping("deleteSelectCart")
	public String deleteSelectCart(@ModelAttribute List<CartVO> list) {
		log.info("deleteSelectCart 호출 성공");
		
		for (CartVO cvo : list) {
			cartService.deleteEachCart(cvo);
		}
		return "redirect:/cart/cartList";
	}
	
	@GetMapping("deleteAllCart")
	public String deleteAllCart(@ModelAttribute CartVO cvo) {
		log.info("deleteAllCart 호출 성공");
		
		cartService.deleteAllCart(cvo);
		return "redirect:/cart/cartList";
	}
	
	@GetMapping("modifyCount")
	public String modifyCount(@ModelAttribute CartVO cvo) {
		log.info("modifyCount 호출 성공");
		
		cartService.modifyCount(cvo);
		return "redirect:/cart/cartList";
	}
	
	@GetMapping("cartList")
	public String cartList(@ModelAttribute CartVO cvo, Model model) {
		log.info("cartList 호출 성공");
		
		String m_id = "";
		m_id = (String) session.getAttribute("m_id");
		m_id = "smartmember"; // 임시 생성
		cvo.setM_id(m_id);
		
		List<CartVO> cartList = cartService.cartList(cvo);
		model.addAttribute("cartList", cartList);
		
		if (!m_id.equals("")) {
			return "cart/cartList";
		} else {
			return "redirect:/member/login"; 
		}
	}
}
