package com.spring.client.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.client.review.dao.ReviewDAO;
import com.spring.client.review.vo.ReviewVO;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewDAO  reviewDao;
	
	
	//게시판 리스트 구현
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		List<ReviewVO> list = reviewDao.reviewList(rvo);
		return list;
	}

	//전체 레코드 수 구현
	@Override
	public int reviewListCnt(ReviewVO rvo) {
		return reviewDao.reviewListCnt(rvo);
	}

}
