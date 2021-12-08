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
	public List<AreviewVO> aReviewList(AreviewVO arvo) {
		// TODO Auto-generated method stub
		return areviewDao.aReviewList(arvo);
	}

	@Override
	public int aReviewListCnt(AreviewVO arvo) {
		// TODO Auto-generated method stub
		return areviewDao.aReviewListCnt(arvo);
	}

	@Override
	public void aReviewDelete(AreviewVO arvo) {
		// TODO Auto-generated method stub
		areviewDao.aReviewDelete(arvo);
	}

}
