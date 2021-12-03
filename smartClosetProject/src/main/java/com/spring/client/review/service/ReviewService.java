package com.spring.client.review.service;

import java.util.List;

import com.spring.client.review.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewList(ReviewVO rvo);
	public int reviewListCnt(ReviewVO rvo);
}
