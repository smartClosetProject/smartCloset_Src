package com.spring.admin.aQnA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.aQnA.dao.AqnaDAO;
import com.spring.admin.aQnA.vo.AqnaVO;
import com.spring.admin.aReply.dao.AreplyDAO;

import lombok.Setter;

@Service
public class AqnaServiceImpl implements AqnaService {
	@Setter(onMethod_ = @Autowired)
	private AqnaDAO aqnaDao;
	
	@Setter(onMethod_ = @Autowired)
	private AreplyDAO areplyDao;
	
	@Override
	public List<AqnaVO> aQnaList(AqnaVO aqvo) {
		return aqnaDao.aQnaList(aqvo);
	}

	@Override
	public int aQnaListCnt(AqnaVO aqvo) {
		return aqnaDao.aQnaListCnt(aqvo);
	}

	@Override
	public AqnaVO aQnaDetail(AqnaVO aqvo) {
		return aqnaDao.aQnaDetail(aqvo);
	}

}
