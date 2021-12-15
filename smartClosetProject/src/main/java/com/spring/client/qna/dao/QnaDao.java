package com.spring.client.qna.dao;

import java.util.List;

import com.spring.client.qna.vo.QnaVO;



public interface QnaDao {
	public List<QnaVO> qnaList(QnaVO qvo);
	public int qnaInsert(QnaVO qvo) throws Exception;
	public QnaVO qnaDetail(QnaVO qvo);
	public QnaVO updateQna(QnaVO qvo); 
	public int qnaUpdate(QnaVO qvo) throws Exception;
	public int qnaDelete(QnaVO qvo) throws Exception;
	public int qnaListCnt(QnaVO qvo);
	
}
