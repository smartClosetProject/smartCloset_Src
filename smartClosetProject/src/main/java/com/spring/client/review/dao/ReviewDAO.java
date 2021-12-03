package com.spring.client.review.dao;

import java.util.List;

import com.spring.client.review.vo.ReviewVO;

public interface ReviewDAO {
	public List<ReviewVO> reviewList(ReviewVO rvo);
	public int reviewListCnt(ReviewVO rvo);

}
