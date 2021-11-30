package com.spring.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.qna.dao.QnaDao;
import com.spring.qna.vo.QnaVO;

import lombok.Setter;

public class QnaServiceImpl implements QnaService {

	@Setter(onMethod_=@Autowired)
	private QnaDao qnaDao;

	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> list = null;
		list = qnaDao.qnaList(qvo);
		return list;
	}

	@Override
	public int QnaInsert(QnaVO qvo) {
		
		return 0;
	}

	@Override
	public int qnaListCnt(QnaVO qvo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
