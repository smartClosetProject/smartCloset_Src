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
		/*
		 * log.info("prDetailList 출력 성공");
		 * 
		 * List<PrDetailVO> prDetailList = prDetailService.prDetailList(prvo);
		 * model.addAttribute("prDetailList",prDetailList);
		 */
		
		return "prDetail/prDetailList";
	}
}
