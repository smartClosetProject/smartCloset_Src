package com.spring.client.product.dao;

import java.util.List;

import com.spring.client.product.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> productListDate(ProductVO cpvo);
	public List<ProductVO> productListSales(ProductVO cpvo);
	public ProductVO productDetail(ProductVO cpvo);
	public List<String> listSize(ProductVO cpvo);
	public List<String> listColor(ProductVO cpvo);
	public List<ProductVO> categoryPage(ProductVO pvo);
	public List<ProductVO> listPage(ProductVO pvo);
	public int updateStock(ProductVO pvo);
	public List<ProductVO> categorysPage(ProductVO pvo);
	public List<ProductVO> orderPage(ProductVO pvo);
}
