package com.spring.admin.aOder.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.aOder.service.AorderService;
import com.spring.admin.aOder.vo.AorderVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/aOrder/*")
@Log4j
@AllArgsConstructor // 생성자 주입
public class AorderController {
	AorderService aOrderservice;
	
	/***********************************************************************
	 * 주문 리스트 구현
	 ***********************************************************************/
	@RequestMapping("aOrderList")
	public String aOrderList(@ModelAttribute("data") AorderVO aovo, Model model) {
		List<AorderVO> aOrderList = aOrderservice.aOrderList(aovo);
		model.addAttribute("aOrderList",aOrderList);
		
		int total = aOrderservice.aOrderListCnt(aovo);
		model.addAttribute("pageMaker", new PageDTO(aovo, total));
		
		int count = total - (aovo.getPageNum() -1)*aovo.getAmount();
		model.addAttribute("count", count);
		
		return "aOrder/aOrderList";
	}
	
	/***********************************************************************
	 * 주문 상세 구현
	 ***********************************************************************/
	@RequestMapping("aOrderDetail")
	public String aOrderDetail(@ModelAttribute("data") AorderVO aovo, Model model) {
		List<AorderVO> aOrderProductDetail = aOrderservice.aOrderProductDetail(aovo);
		model.addAttribute("aOrderProductDetail",aOrderProductDetail);
		
		AorderVO aOrderDetail = aOrderservice.aOrderDetail(aovo);
		model.addAttribute("aOrderDetail",aOrderDetail);
		
		return "aOrder/aOrderDetail";
		
	}
	
	@GetMapping("aOrderchangeState")
	public String aOrderchangeState(@ModelAttribute AorderVO aovo, RedirectAttributes ras) {
		aOrderservice.aOrderChangeState(aovo);
		ras.addFlashAttribute("data",aovo);
		if(aovo.getOrder_state()=="결제 완료") {
			aOrderservice.aOrderChangeStock(aovo);
		}
		return "redirect:/aOrder/aOrderDetail";
	}
	
	@RequestMapping("aOrderAllDelete")
	public String aOrderAllDelete() throws Exception{
		aOrderservice.aOrderAllDelete();
		
		return "redirect:/aOrder/aOrderList";
	}

}
