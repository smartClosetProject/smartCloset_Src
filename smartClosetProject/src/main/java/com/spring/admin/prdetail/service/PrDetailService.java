package com.spring.admin.prdetail.service;

import java.util.List;

import com.spring.admin.prdetail.vo.PrDetailVO;
import com.spring.admin.prdetail.vo.ProductVO;

public interface PrDetailService {
	public List<PrDetailVO> prDetailList(PrDetailVO prvo);
	public int prDetailInsert(PrDetailVO prvo) throws Exception;
	public int prDetailListCnt(PrDetailVO prvo);
	public List<ProductVO> productDetail(ProductVO pvo);
	
	public List<ProductVO> prNumericalList(ProductVO pvo);
	public int prNumericalListCnt(ProductVO pvo);
	
	public List<ProductVO> warehousingList(ProductVO pvo);
	public int warehousingInsert(ProductVO pvo) throws Exception;
	public int warehousing(ProductVO pvo);
}
