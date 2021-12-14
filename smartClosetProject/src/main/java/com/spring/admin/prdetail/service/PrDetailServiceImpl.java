package com.spring.admin.prdetail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.file.PrFileUploadUtil;
import com.spring.admin.prdetail.dao.PrDetailDAO;
import com.spring.admin.prdetail.vo.PrDetailVO;
import com.spring.admin.prdetail.vo.ProductVO;

import lombok.Setter;

@Service
public class PrDetailServiceImpl implements PrDetailService{
	@Setter(onMethod_ =@Autowired)
	private PrDetailDAO prDetailDAO;
	
	//글 목록 구현
	@Override
	public List<PrDetailVO> prDetailList(PrDetailVO prvo){
		List<PrDetailVO> list = null;
		list = prDetailDAO.prDetailList(prvo);
		return list;
	}
	//전체 레코드 수 구현
	@Override
	public int prDetailListCnt(PrDetailVO prvo) {
		return prDetailDAO.prDetailListCnt(prvo);
	}
	//글 입력 구현
	@Override
	public int prDetailInsert(PrDetailVO prvo) throws Exception{
		int result=0;
		
		if(prvo.getFile().getSize()>0) {
			String fileName=PrFileUploadUtil.fileUpload(prvo.getFile(), "prDetail");
			prvo.setPr_mainimg(fileName);
			
			String thumb = PrFileUploadUtil.makeThumb(fileName, 400);
			prvo.setPr_thumb(thumb);
		}
		if(prvo.getFile1().getSize()>0) {
			String fileName1=PrFileUploadUtil.fileUpload(prvo.getFile1(), "prDetail");
			prvo.setPr_contentimg(fileName1);
		}
		result=prDetailDAO.prDetailInsert(prvo);
		return result;
	}
	
	
	//상세 페이지 구현
	@Override
	public List<ProductVO> productDetail(ProductVO pvo) {
		List<ProductVO> prList = null;
		prList = prDetailDAO.productDetail(pvo);
		return prList;
	}
	
	//상품 통계 페이지 구현
	@Override
	public List<ProductVO> prNumericalList(ProductVO pvo){
		List<ProductVO> list=null;
		list = prDetailDAO.prNumericalList(pvo);
		return list;
	}
	
	//전체 레코드 수 구현
	@Override
	public int prNumericalListCnt(ProductVO pvo) {
		return prDetailDAO.prDetailListCnt(pvo);
	}
	@Override
	public int productCnt(PrDetailVO prvo) {
		return prDetailDAO.productCnt(prvo);
	}
	//상품 입고 페이지 구현
	@Override
	public List<ProductVO> warehousingList(ProductVO pvo){
		List<ProductVO> list=null;
		list = prDetailDAO.warehousingList(pvo);
		return list;
	}
	@Override
	public int warehousing(ProductVO pvo) {
		int result = 0;
		result=prDetailDAO.warehousing(pvo);
		return result;		
	}
	@Override
	public int warehousingInsert(ProductVO pvo) throws Exception {
		int result1=0;
		pvo.setPro_color(pvo.getColorKo()+" / "+pvo.getColorEn());
		if(pvo.getFile().getSize()>0) {
			String fileName=PrFileUploadUtil.fileUpload(pvo.getFile(),"warehousing");
			pvo.setPro_colorImg(fileName);
			
			String thumb = PrFileUploadUtil.makeThumb(fileName, 150);
			pvo.setPro_colorthumb(thumb);
		}
		result1=prDetailDAO.warehousingInsert(pvo);
		return result1;
	}
	@Override
	public int updateStock(ProductVO pvo) {
		int result=0;
		result=prDetailDAO.updateStock(pvo);
		return result;
	}
	@Override
	public int updateAllStock(ProductVO pvo) {
		int result1=0;
		result1=prDetailDAO.updateAllStock(pvo);
		return result1;
	}
	@Override
	public int issale(PrDetailVO prvo) {
		int result=0;
		result=prDetailDAO.issale(prvo);
		return result;
	}
	@Override
	public int productDelete(ProductVO pvo) {
		int result=0;
		result=prDetailDAO.productDelete(pvo);
		return result;
	}
	@Override
	public int prdetailDelete(ProductVO pvo) {
		int result=0;
		result=prDetailDAO.prdetailDelete(pvo);
		return result;
	}
	@Override
	public ProductVO listUpdate(ProductVO pvo) {
		ProductVO detail=null;
		detail=prDetailDAO.listUpdate(pvo);
		return detail;
	}
	@Override
	public int updateForm(PrDetailVO prvo) throws Exception{
		if(!prvo.getFile().isEmpty()) {
			String fileName=PrFileUploadUtil.fileUpload(prvo.getFile(), "prDetail");
			prvo.setPr_mainimg(fileName);
			
			String thumb = PrFileUploadUtil.makeThumb(fileName, 400);
			prvo.setPr_thumb(thumb);
		}
		if(!prvo.getFile1().isEmpty()) {
			String fileName1=PrFileUploadUtil.fileUpload(prvo.getFile1(), "prDetail");
			prvo.setPr_contentimg(fileName1);
		}
		int result=prDetailDAO.updateForm(prvo);
		return result;
	}
	@Override
	public int updatePr(PrDetailVO prvo) {
		int result=prDetailDAO.updatePr(prvo);
		return result;
	}
	@Override
	public int prnumCheck(PrDetailVO prvo) {
		int result=0;
		result=prDetailDAO.prnumCheck(prvo);
		return result;
	}
	@Override
	public int updateProStock(ProductVO pvo) {
		int result=0;
		result=prDetailDAO.prnumCheck(pvo);
		return result;
	}
}
