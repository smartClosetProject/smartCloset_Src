package com.spring.client.order.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.order.service.OrderService;
import com.spring.client.order.vo.OrderDetailVO;
import com.spring.client.order.vo.OrderVO;
import com.spring.client.smartcloset.service.SmartClosetService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/order/*")
@Log4j
public class OrderController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	@Setter(onMethod_ = @Autowired)
	private SmartClosetService sClosetService;
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	@PostMapping("orderForm")
	public String orderForm(@RequestParam("chkBox") List<Integer> cartNum, @RequestParam("totalPayment") int totalPayment, OrderVO ovo, ArrayList<OrderVO> productsInfo, Model model) {
		log.info("OrderForm 호출 성공");
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		ovo.setM_id(login.getM_id());
		
		for (Integer i : cartNum) {
			ovo.setCart_num(i);
			productsInfo.add(orderService.productsInfo(ovo));
		}
		OrderVO vo = orderService.orderForm(ovo);
		vo.setOrder_totalPayment(totalPayment);
		model.addAttribute("order", vo);
		model.addAttribute("productsInfo", productsInfo);
		session.setAttribute("cart", cartNum);
		
		return "order/orderForm";
	}
	
	@PostMapping("orderComplete")
	public String orderComplete(@ModelAttribute OrderVO ovo, OrderDetailVO odvo) {
		log.info("OrderComplete 호출 성공");
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		ovo.setM_id(login.getM_id());
		
		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR) + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1)
				+ new DecimalFormat("00").format(cal.get(Calendar.DATE));
		int order_seq = orderService.orderSeq();
		long order_num = Long.parseLong(date + "000" + order_seq);
		ovo.setOrder_num(order_num);
		ovo.setOrder_state("결제완료");
		
		orderService.insertOrder(ovo);
		
		@SuppressWarnings("unchecked")
		List<Integer> cartNums = (ArrayList<Integer>) session.getAttribute("cart");
		odvo.setOrder_num(order_num);
		
		for (Integer i : cartNums) {
			odvo.setCart_num(i);
			ovo.setCart_num(i);
			orderService.insertOrderDetail(odvo);
			sClosetService.buyInsertSCloset(ovo);
			orderService.deleteSelectCart(i);
		}
		orderService.updateMile(ovo);
		session.removeAttribute("cart");

		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
		String dateFormat = sdf.format(cal.getTime());
		ovo.setOrder_regdate(dateFormat);

		session.setAttribute("order", ovo);
		
		return "redirect:/order/orderComplete";
	}
	
	@GetMapping("orderComplete") 
	public String orderComplete(OrderVO ovo, Model model) {
		log.info("OrderComplete(get) 호출 성공");
		
		ovo = (OrderVO) session.getAttribute("order");
		model.addAttribute("orderDetail", ovo);
		
		return "order/orderComplete";
	}
}
