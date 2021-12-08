package com.spring.admin.aReview.service;

import java.util.List;

import com.spring.admin.aReview.vo.AreviewVO;

public interface AreviewService {

	public List<AreviewVO> aReviewList(AreviewVO arvo);
	public int aReviewListCnt(AreviewVO arvo);
	public void aReviewDelete(AreviewVO arvo);

}
