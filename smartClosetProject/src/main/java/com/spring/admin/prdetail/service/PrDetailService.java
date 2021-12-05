package com.spring.admin.prdetail.service;

import java.util.List;

import com.spring.admin.prdetail.vo.PrDetailVO;
import com.spring.admin.prdetail.vo.ProductVO;

public interface PrDetailService {
	public List<PrDetailVO> prDetailList(PrDetailVO prvo);
	public int prDetailListCnt(PrDetailVO prvo);
	public List<ProductVO> productDetail(ProductVO pvo);
	public int prDetailInsert(PrDetailVO prvo) throws Exception;
}
