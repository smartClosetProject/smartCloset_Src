package com.spring.client.product.dao;

import java.util.List;

import com.spring.client.product.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> productListDate(ProductVO cpvo);
	public List<ProductVO> productListSales(ProductVO cpvo);
	public ProductVO productDetail(ProductVO cpvo);
	public List<String> listSize(ProductVO cpvo);
	public List<String> listColor(ProductVO cpvo);
}
