package com.spring.admin.aMember.dao;

import java.util.List;

import com.spring.admin.aMember.vo.AmemberVO;

public interface AmemberDAO {

	List<AmemberVO> aMemberList(AmemberVO amvo);
	public int aMemberListCnt(AmemberVO amvo);

}
