package com.spring.admin.aReview.service;

import java.util.List;

import com.spring.admin.aReview.vo.AreviewVO;

public interface AreviewService {

	public List<AreviewVO> reviewList(AreviewVO arvo);
	public int reviewListCnt(AreviewVO arvo);
	public void reviewDelete(AreviewVO arvo);

}
