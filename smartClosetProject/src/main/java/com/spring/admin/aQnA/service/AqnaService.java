package com.spring.admin.aQnA.service;

import java.util.List;

import com.spring.admin.aQnA.vo.AqnaVO;

public interface AqnaService {

	public List<AqnaVO> aQnaList(AqnaVO aqvo);
	public int aQnaListCnt(AqnaVO aqvo);
	public AqnaVO aQnaDetail(AqnaVO aqvo);

}
