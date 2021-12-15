package com.spring.admin.aQna.service;

import java.util.List;

import com.spring.admin.aQna.vo.AqnaVO;

public interface AqnaService {

	public List<AqnaVO> aQnaList(AqnaVO aqvo);
	public int aQnaListCnt(AqnaVO aqvo);
	public AqnaVO aQnaDetail(AqnaVO aqvo);
	public int aQnaDelete(AqnaVO aqvo);

}
