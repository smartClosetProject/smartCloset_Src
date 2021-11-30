package com.spring.qna.dao;

import java.util.List;


import com.spring.qna.vo.QnaVO;

public interface QnaDao {
	public List<QnaVO> qnaList(QnaVO qvo);
	public int QnaInsert(QnaVO qvo);
	
}
