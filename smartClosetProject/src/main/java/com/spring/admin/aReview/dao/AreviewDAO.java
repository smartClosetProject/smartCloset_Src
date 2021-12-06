package com.spring.admin.aReview.dao;

import java.util.List;

import com.spring.admin.aReview.vo.AreviewVO;

public interface AreviewDAO {

	public List<AreviewVO> reviewList(AreviewVO arvo);
	public int reviewListCnt(AreviewVO arvo);
	public void reviewDelete(AreviewVO arvo);
}
