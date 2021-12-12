package com.spring.admin.nboard.service;

import java.util.List;

import com.spring.admin.nboard.vo.NboardVO;

public interface NboardService {
	public List<NboardVO> nboardList(NboardVO nvo);
	public NboardVO nboardDetail(NboardVO nvo);
	public int nboardInsert(NboardVO nvo);
	public NboardVO updateForm(NboardVO nvo);
	public int nboardUpdate(NboardVO nvo);
	public int nboardDelete(NboardVO nvo);
	public int nboardListCnt(NboardVO nvo);
	public List<NboardVO> nboardImportantList(NboardVO nvo);

}
