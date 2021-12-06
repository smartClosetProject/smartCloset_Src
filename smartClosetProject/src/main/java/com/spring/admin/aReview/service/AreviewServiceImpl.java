package com.spring.admin.aReview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.aReview.dao.AreviewDAO;
import com.spring.admin.aReview.vo.AreviewVO;

import lombok.Setter;

@Service
public class AreviewServiceImpl implements AreviewService{
	@Setter(onMethod_ = @Autowired)
	AreviewDAO areviewDao;
	
	
	@Override
	public List<AreviewVO> reviewList(AreviewVO arvo) {
		// TODO Auto-generated method stub
		return areviewDao.reviewList(arvo);
	}

	@Override
	public int reviewListCnt(AreviewVO arvo) {
		// TODO Auto-generated method stub
		return areviewDao.reviewListCnt(arvo);
	}

	@Override
	public void reviewDelete(AreviewVO arvo) {
		// TODO Auto-generated method stub
		areviewDao.reviewDelete(arvo);
	}

}
