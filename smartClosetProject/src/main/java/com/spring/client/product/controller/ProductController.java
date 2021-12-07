package com.spring.client.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.product.dao.ProductDAO;
import com.spring.client.product.vo.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@EnableAspectJAutoProxy
public class ProductController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductDAO productDAO;
	
	
	@RequestMapping(value="mainPage", method=RequestMethod.GET)
	public String mainPage(@ModelAttribute("data") ProductVO cpvo, Model model) {
		log.info("MainpageList 호출성공");
		
		List<ProductVO> listDate = productDAO.productListDate(cpvo);
		model.addAttribute("listDate",listDate);
		
		List<ProductVO> listSales = productDAO.productListSales(cpvo);
		model.addAttribute("listSales",listSales);
		
		return "product/mainPage";
		
	}

}
