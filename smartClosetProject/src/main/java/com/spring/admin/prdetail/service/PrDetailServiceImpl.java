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
			String fileName=PrFileUploadUtil.fileUpload(prvo.getFile1(), "prDetail");
			prvo.setPr_contentimg(fileName);
		}
		result=prDetailDAO.prDetailInsert(prvo);
		return result;
	}
	
	//상세 페이지 구현
	@Override
	public List<ProductVO> productDetail (ProductVO pvo) {
		List<ProductVO> prList = null;
		prList = prDetailDAO.productDetail(pvo);
		return prList;
	}
}
