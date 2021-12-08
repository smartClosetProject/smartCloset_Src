package com.spring.admin.aReview.dao;

import java.util.List;

import com.spring.admin.aReview.vo.AreviewVO;

public interface AreviewDAO {

	public List<AreviewVO> aReviewList(AreviewVO arvo);
	public int aReviewListCnt(AreviewVO arvo);
	public void aReviewDelete(AreviewVO arvo);
}
