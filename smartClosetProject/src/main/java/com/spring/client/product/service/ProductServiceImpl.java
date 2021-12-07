package com.spring.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.product.dao.ProductDAO;
import com.spring.client.product.vo.ProductVO;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {
	@Setter(onMethod_=@Autowired)
	private ProductDAO productDAO;
	
	@Override
	public List<ProductVO> productListDate(ProductVO cpvo){
		List<ProductVO> listDate = null;
		listDate = productDAO.productListDate(cpvo);
		return listDate;
	}
	@Override
	public List<ProductVO> productListSales(ProductVO cpvo){
		List<ProductVO> listSales = null;
		listSales = productDAO.productListSales(cpvo);
		return listSales;
	}
}