package com.spring.admin.prdetail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.admin.prdetail.service.PrDetailService;
import com.spring.admin.prdetail.vo.PrDetailVO;
import com.spring.admin.prdetail.vo.ProductVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/prDetail/*")
public class PrDetailController {
	
	@Setter(onMethod_ = @Autowired)
	private PrDetailService prDetailService;
	
	@RequestMapping(value="prDetailList", method = RequestMethod.GET)
	public String prDetailList(@ModelAttribute("data") PrDetailVO prvo, Model model) {
		
		 log.info("prDetailList 출력 성공");
		  
		 List<PrDetailVO> prDetailList = prDetailService.prDetailList(prvo);
		 model.addAttribute("prDetailList",prDetailList);
		 
		 int total = prDetailService.prDetailListCnt(prvo);
		 
		 model.addAttribute("pageMaker", new PageDTO(prvo, total));
		 
		 int count = total-(prvo.getPageNum()-1*prvo.getAmount());
		 model.addAttribute("count", count);
		
		 return "prDetail/prDetailList";
	}
	@RequestMapping(value="/writeForm")
	public String writeForm() {
		log.info("writeForm 호출 성공");
		return "prDetail/writeForm";
	}
	@RequestMapping(value="/prDetailInsert",method=RequestMethod.POST)
	public String prDetailInsert(PrDetailVO prvo, Model model) throws Exception{
		log.info("insert 호출 성공");
		
		int result=0;
		String url="";
		result=prDetailService.prDetailInsert(prvo);
		if(result==1) {
			url="/prDetail/prDetailList";
		}else {
			url="/prDetail/writeForm";
		}
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/productDetail", method = RequestMethod.GET)
	public String productDetail(@ModelAttribute("data") ProductVO pvo, Model model) {
		
		 log.info("prDetailDt 출력 성공");
		  
		 List<ProductVO> productDetail = prDetailService.productDetail(pvo);
		 model.addAttribute("productDetail",productDetail);
		 
		
		return "prDetail/productDetail";
	}
	@RequestMapping(value="pr_numerical", method = RequestMethod.GET)
	public String prNumericalList(@ModelAttribute("data") ProductVO pvo, Model model) {
		
		 log.info("prNumericalList 출력 성공");
		  
		 List<ProductVO> prNumericalList = prDetailService.prNumericalList(pvo);
		 model.addAttribute("prNumericalList",prNumericalList);
		 
		 int total = prDetailService.prNumericalListCnt(pvo);
		 
		 model.addAttribute("pageMaker", new PageDTO(pvo, total));
		 
		 int count = total-(pvo.getPageNum()-1*pvo.getAmount());
		 model.addAttribute("count", count);
		
		 return "prDetail/pr_numerical";
	}
	
	@RequestMapping(value="warehousingList", method = RequestMethod.GET)
	public String warehousingList(@ModelAttribute("data") ProductVO pvo, Model model) {
		
		 log.info("warehousingList 출력 성공");
		  
		 List<ProductVO> warehousingList = prDetailService.warehousingList(pvo);
		 model.addAttribute("warehousingList",warehousingList);
		 
		 int total = prDetailService.prNumericalListCnt(pvo);
		 
		 model.addAttribute("pageMaker", new PageDTO(pvo, total));
		 
		 int count = total-(pvo.getPageNum()-1*pvo.getAmount());
		 model.addAttribute("count", count);
		
		 return "prDetail/warehousingList";
	}
	@RequestMapping(value="/insertWarehousing")
	public String insertWarehousing() {
		log.info("insertWarehousing 호출 성공");
		
		return "/prDetail/insertWarehousing";
	}
	
}
