package com.spring.client.product.service;

import java.util.List;

import com.spring.client.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productListDate(ProductVO cpvo);
	public List<ProductVO> productListSales(ProductVO cpvo);
}
