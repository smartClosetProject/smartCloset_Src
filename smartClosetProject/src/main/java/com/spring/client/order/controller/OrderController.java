package com.spring.client.order.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.spring.client.order.service.OrderService;
import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/order/*")
@Log4j
public class OrderController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	@PostMapping("orderForm")
	public String OrderForm(@RequestParam("chkBox") List<Integer> cartNum, @RequestParam("totalPayment") int totalPayment, OrderVO ovo, Model model) {
		log.info("OrderForm 호출 성공");
		
		String m_id = (String) session.getAttribute("m_id");
		m_id = "smartmember";
		ovo.setM_id(m_id);
		
		OrderVO vo = orderService.orderForm(ovo);
		vo.setOrder_totalPayment(totalPayment);
		model.addAttribute("order", vo);
		session.setAttribute("cart", cartNum);
		
		return "order/orderForm";
	}
	
	@PostMapping("orderComplete")
	public String OrderComplete(@ModelAttribute OrderVO ovo, Model model) {
		log.info("OrderComplete 호출 성공");
		
		System.out.println(ovo);
		
		return "order/orderComplete";
	}
	
	// 필요없는거 받아옴. 하지만 주문 완료 페이지에서 반드시 필요. 배열 받아오는 거.
//	@PostMapping(value = "orderForm")
//	public String OrderForm(@RequestParam("chkBox") List<Integer> cartNum, @RequestParam("totalPayment") int totalPayment) {
//		log.info("OrderForm 호출 성공");
//		
//		for (Integer i : cartNum) {
//			System.out.println(i);
//		}
//		System.out.println(totalPayment);
	
//		Calendar cal = Calendar.getInstance();
//		int year = cal.get(Calendar.YEAR);
//		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
//		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
//		String subNum = "";
//		 
//		for(int i = 1; i <= 6; i ++) {
//			subNum += (int)(Math.random() * 10);
//		}
//		int order_num = Integer.parseInt(ymd + subNum);
//		ovo.setOrder_num(order_num);
//		ovo.setOrder_totalPayment(totalPayment);
	
//		return "order/orderForm";
//	}
	
//	@GetMapping("orderAll")
//	public String orderAll(@ModelAttribute OrderVO ovo, OrderDetailVO odvo, Model model) {
//		String m_id = (String) session.getAttribute("m_id");
//		m_id = "smartmember";
//		odvo.setM_id(m_id);
//		
//		System.out.println(session.getAttribute("cart"));
//		session.removeAttribute("cart");
//		System.out.println(session.getAttribute("cart"));
//		
//		return "";
//	}
}
