package com.spring.admin.prdetail.dao;

import java.util.List;

import com.spring.admin.prdetail.vo.PrDetailVO;
import com.spring.admin.prdetail.vo.ProductVO;

public interface PrDetailDAO {
	public List<PrDetailVO> prDetailList(PrDetailVO prvo);
	public int prDetailInsert(PrDetailVO prvo);
	public int prDetailListCnt(PrDetailVO prvo);
	public int issale(PrDetailVO prvo);
	public List<ProductVO> productDetail(ProductVO prvo);
	
	public List<ProductVO> prNumericalList(ProductVO pvo);
	public int prNumericalListCnt(ProductVO pvo);
	
	public List<ProductVO> warehousingList(ProductVO pvo);
	public int warehousingInsert(ProductVO pvo);
	public int warehousing(ProductVO pvo);
	public int updateStock(ProductVO pvo);
	public int productCnt(PrDetailVO prvo);
	public int updateAllStock(ProductVO pvo);
	public int productDelete(ProductVO pvo);
	public int prdetailDelete(ProductVO pvo);
	public ProductVO listUpdate(ProductVO pvo);
	public int updateForm(PrDetailVO prvo);
	public int updatePr(PrDetailVO prvo);
	public int prnumCheck(PrDetailVO prvo);
	public int updateProStock(ProductVO pvo);
}
