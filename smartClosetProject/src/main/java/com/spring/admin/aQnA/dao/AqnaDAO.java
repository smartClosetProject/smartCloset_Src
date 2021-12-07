package com.spring.admin.aQnA.dao;

import java.util.List;

import com.spring.admin.aQnA.vo.AqnaVO;

public interface AqnaDAO {

	public List<AqnaVO> aQnaList(AqnaVO aqvo);
	public int aQnaListCnt(AqnaVO aqvo);
	public AqnaVO aQnaDetail(AqnaVO aqvo);

}
