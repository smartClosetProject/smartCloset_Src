package com.spring.admin.aMember.service;

import java.util.List;

import com.spring.admin.aMember.vo.AmemberVO;

public interface AmemberService {

	public List<AmemberVO> aMemberList(AmemberVO amvo);
	public int aMemberListCnt(AmemberVO amvo);
	public void aMemberAllDelete();
	public AmemberVO aMemberDetail(String m_id);
	public int updateExitDate(AmemberVO amvo);
	public int updateMile(AmemberVO amvo);
	public int resetExitDate(AmemberVO amvo);

}
