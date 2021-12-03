package com.spring.admin.nboard.dao;

import java.util.List;

import com.spring.admin.nboard.vo.NboardVO;

public interface NboardDAO {
	public List<NboardVO> nboardList(NboardVO bvo);
	public NboardVO nboardDetail(NboardVO nvo);
	public int nboardInsert(NboardVO nvo);
	public int nboardUpdate(NboardVO nvo);
	public int nboardDelete(NboardVO nvo);
	public int nboardListCnt(NboardVO nvo);
}
