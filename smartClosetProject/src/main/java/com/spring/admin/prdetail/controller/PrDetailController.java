package com.spring.admin.prdetail.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	@RequestMapping(value="prDetailList", method = RequestMethod.GET)
	public String prDetailList(@ModelAttribute("data") PrDetailVO prvo, Model model) {
		
		 log.info("prDetailList 출력 성공");
		 prDetailService.issale(prvo);
		 List<PrDetailVO> prDetailList = prDetailService.prDetailList(prvo);
		 model.addAttribute("prDetailList",prDetailList);
		 
		 int total = prDetailService.prDetailListCnt(prvo);
		 model.addAttribute("pageMaker", new PageDTO(prvo, total));
		 
		 int count = total-(prvo.getPageNum()-1)*prvo.getAmount();
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
		String pr_num="";
		for(int i=1;i<=2;i++) {
			pr_num+=(char)((Math.random()*26)+65);
		}
		pr_num+="_";
		for(int i=1;i<=4;i++) {
			pr_num+=(char)((Math.random()*26)+65);
		}
		log.info(pr_num);
		prvo.setPr_num(pr_num);
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
		 
		 int total = prDetailService.productCnt(pvo);
		 
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
		 
		 int total = prDetailService.productCnt(pvo);
		 
		 model.addAttribute("pageMaker", new PageDTO(pvo, total));
		 
		 int count = total-(pvo.getPageNum()-1*pvo.getAmount());
		 model.addAttribute("count", count);
		
		 return "prDetail/warehousingList";
	}
	@RequestMapping(value="/insertWarehousing")
	public String insertWarehousing(ProductVO pvo, Model model) {
		log.info("insertWarehousing 호출 성공");
		ProductVO updateData=prDetailService.listUpdate(pvo);
		model.addAttribute("updateData", updateData);
		return "prDetail/insertWarehousing";
	}
	@RequestMapping(value="/warehousingInsert", method=RequestMethod.POST)
	public String warehousingInsert(ProductVO pvo, Model model)throws Exception{
		log.info("warehousingInsert 호출 성공");
		
		int result=0, result1 =0;
		String url="";
		result=prDetailService.warehousing(pvo);
		result1=prDetailService.warehousingInsert(pvo);
		prDetailService.updateProStock(pvo);
		prDetailService.stockInsert(pvo);
		if(result==1&&result1==1) {
			url="/prDetail/warehousingList";
		}else {
			url="/prDetail/insertWarehousing";
		}
		return "redirect:"+url;
	}
	@RequestMapping(value="updateStock", method=RequestMethod.POST)
	public String updateStock(ProductVO pvo,  RedirectAttributes ras){
		log.info("updateStock 호출 성공");
		prDetailService.updateStock(pvo);
		prDetailService.updateAllStock(pvo);
		return "redirect:/prDetail/pr_numerical";
	}
	
	@RequestMapping(value="delete",method =RequestMethod.POST)
	public String delete(ProductVO pvo, RedirectAttributes ras) {
		log.info("delete 호출 성공");
		prDetailService.productDelete(pvo);
		prDetailService.prdetailDelete(pvo);
		return "redirect:/prDetail/prDetailList";
	}
	@RequestMapping(value="/listUpdate")
	public String listUpdate(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("listUpdate 호출 성공");
		
		ProductVO updateData=prDetailService.listUpdate(pvo);
		model.addAttribute("updateData", updateData);
		return "prDetail/listUpdate";
	}
	@PostMapping
	public String updateForm(@ModelAttribute PrDetailVO prvo, RedirectAttributes ras) throws Exception{
		log.info("updateForm 호출 성공");
		int result=0;
		String url="";
		result=prDetailService.updateForm(prvo);
		prDetailService.updatePr(prvo);
		
		if(result==1) {
			url="/prDetail/prDetailList";
		}else {
			url="/prDetail/listUpdate";
		}
		return "redirect:"+ url;
	}
	@ResponseBody
	@RequestMapping(value="prnumCheck", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String prnumCheck(PrDetailVO prvo) {
		log.info("prnumCheck 호출 성공");
		String value="";
		
		int result=prDetailService.prnumCheck(prvo);
		log.info(result);
		if(result==1) {
			value="성공";
		}else {
			value="실패";
		}
		return value;
	}
}
