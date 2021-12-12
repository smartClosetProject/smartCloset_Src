package com.spring.admin.aOrder.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.aOrder.service.AorderService;
import com.spring.admin.aOrder.vo.AorderVO;
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
		
		return "redirect:/aOrder/aOrderDetail";
		
		
	}
	@GetMapping("aOrderchangeRefundState")
	public String aOrderchangeRefundState(@ModelAttribute AorderVO aovo, RedirectAttributes ras) {
		aOrderservice.aOrderChangeState(aovo);
		ras.addFlashAttribute("data",aovo);
		
		return "redirect:/aOrder/aOrderList";
		
		
	}
	
	@RequestMapping("aOrderAllDelete")
	public String aOrderAllDelete() throws Exception{
		aOrderservice.aOrderAllDelete();
		
		return "redirect:/aOrder/aOrderList";
	}
	
	@RequestMapping("aOrderReturnForm")
	public String aOrderReturnForm(@RequestParam(value ="checkProduct") List<Integer> checkProduct, Model model) throws Exception {
		log.info("checkProduct : " + checkProduct);
		model.addAttribute("checkProduct",checkProduct);
		List<AorderVO> returnProduct = new ArrayList<AorderVO>();
		for(int i:checkProduct) {
			AorderVO a1 = new AorderVO();
			a1.setOd_num(i);
			returnProduct.add(aOrderservice.aOrderReturnDetail(a1));
			log.info(returnProduct);
			model.addAttribute("returnProduct",returnProduct);
		}

	
		return "aOrder/aOrderReturnForm";
	}
	
	@RequestMapping("returnProDetailForm")
	public String returnProDetailForm(@RequestParam(value ="od_num") int od_num, Model model) {
		log.info("returnProDetailForm  실행완료");
		log.info(od_num);
		AorderVO aovo = new AorderVO();
		aovo.setOd_num(od_num);
		AorderVO a1 = aOrderservice.aOrderReturnDetail(aovo);
		log.info(a1);
		model.addAttribute("detail", a1);
		
		List<String> color = new ArrayList<String>();
		color = aOrderservice.aGetProColor(a1);
		
		model.addAttribute("color",color);
		
		List<String> size = new ArrayList<String>();
		size = aOrderservice.aGetProSize(a1);
		
		model.addAttribute("size",size);
		
		return "aOrder/returnProDetailForm";
	}
	
	@RequestMapping("aOrderOptionChange")
	public String aOrderOptionChange(@ModelAttribute AorderVO aovo, RedirectAttributes ras) {
		aOrderservice.aOrderOptionChange(aovo);
		ras.addFlashAttribute("data",aovo);
		
		return "aOrder/aOrderReturnForm";
	}
	
	
	
	
//	@RequestMapping("returnOrder")
//	public int returnOrder(@RequestParam(value ="checkProduct[]") List<String> checkProduct, AorderVO aovo) throws Exception{
//		log.info("checkProduct : " + checkProduct);
//		int result = 0;
//		int od_num = 0;
//		for(String i : checkProduct) {
//			od_num = Integer.parseInt(i);
//			aovo.setOd_num(od_num);
//			result = aOrderservice.returnOrder(aovo);
//		}
//		
//		return result;
//		
//	}

}
