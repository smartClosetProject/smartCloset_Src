package com.spring.qna.service;

import java.util.List;


import com.spring.qna.vo.QnaVO;

public interface QnaService {
	public List<QnaVO> qnaList(QnaVO qvo);
	public int QnaInsert(QnaVO qvo);
	public int qnaListCnt(QnaVO qvo);
	

}
