package com.spring.client.review.service;

import java.util.List;

import com.spring.client.review.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewList(ReviewVO rvo);
	public int reviewListCnt(ReviewVO rvo);
	public int reviewInsert(ReviewVO rvo) throws Exception;
	public ReviewVO reviewDetail(ReviewVO rvo);
	public ReviewVO updateForm(ReviewVO rvo);
	public int reviewUpdate(ReviewVO rvo) throws Exception;
	public int reviewDelete(ReviewVO rvo) throws Exception;
}
