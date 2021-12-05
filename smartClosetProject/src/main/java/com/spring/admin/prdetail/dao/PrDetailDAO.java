package com.spring.admin.prdetail.dao;

import java.util.List;

import com.spring.admin.prdetail.vo.PrDetailVO;
import com.spring.admin.prdetail.vo.ProductVO;

public interface PrDetailDAO {
	public List<PrDetailVO> prDetailList(PrDetailVO prvo);
	public int prDetailInsert(PrDetailVO prvo);
	public int prDetailListCnt(PrDetailVO prvo);
	public List<ProductVO> productDetail(PrDetailVO prvo);
}
