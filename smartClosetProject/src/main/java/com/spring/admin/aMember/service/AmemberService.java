package com.spring.admin.aMember.service;

import java.util.List;

import com.spring.admin.aMember.vo.AmemberVO;

public interface AmemberService {

	public List<AmemberVO> aMemberList(AmemberVO amvo);
	public int aMemberListCnt(AmemberVO amvo);

}
