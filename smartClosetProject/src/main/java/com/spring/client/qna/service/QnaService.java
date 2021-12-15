package com.spring.client.qna.service;

import java.util.List;

import com.spring.client.qna.vo.QnaVO;


public interface QnaService {
	public List<QnaVO> qnaList(QnaVO qvo); //게시판리스트
	public int qnaInsert(QnaVO qvo) throws Exception; //게시판정보입력
	public QnaVO qnaDetail(QnaVO qvo); //게시판상세
	public QnaVO updateQna(QnaVO qvo); //게시판정보수정
	public int qnaUpdate(QnaVO qvo) throws Exception; //게시판수정입력
	public int qnaDelete(QnaVO qvo) throws Exception; //게시판 삭제
	public int qnaListCnt(QnaVO qvo); //게시판숫자

}
