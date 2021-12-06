package com.spring.admin.prdetail.dao;

import java.util.List;

import com.spring.admin.prdetail.vo.PrDetailVO;
import com.spring.admin.prdetail.vo.ProductVO;

public interface PrDetailDAO {
	public List<PrDetailVO> prDetailList(PrDetailVO prvo);
	public int prDetailInsert(PrDetailVO prvo);
	public int prDetailListCnt(PrDetailVO prvo);
	public List<ProductVO> productDetail(ProductVO prvo);
	
	public List<ProductVO> prNumericalList(ProductVO pvo);
	public int prNumericalListCnt(ProductVO pvo);
	
	public List<ProductVO> warehousingList(ProductVO pvo);
}
