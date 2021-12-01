package com.spring.admin.prdetail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.prdetail.vo.PrDetailVO;

import lombok.Setter;

@Service
public class PrDetailServiceImpl implements PrDetailService{
	@Setter(onMethod_ =@Autowired)
	private PrDetailService prDtailDAO;
	
	//글 목록 구현
	@Override
	public List<PrDetailVO> prDetailList(PrDetailVO prvo){
		List<PrDetailVO> list = null;
		list = prDtailDAO.prDetailList(prvo);
		return list;
	}
}
