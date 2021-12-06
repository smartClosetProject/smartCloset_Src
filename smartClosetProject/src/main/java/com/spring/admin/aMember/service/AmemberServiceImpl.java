package com.spring.admin.aMember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.aMember.dao.AmemberDAO;
import com.spring.admin.aMember.vo.AmemberVO;

import lombok.Setter;

@Service
public class AmemberServiceImpl implements AmemberService {
	@Setter(onMethod_ = @Autowired)
	public AmemberDAO aMemberDao;
	
	@Override
	public List<AmemberVO> aMemberList(AmemberVO amvo) {
		List<AmemberVO> list = aMemberDao.aMemberList(amvo);
		return list;
	}

	@Override
	public int aMemberListCnt(AmemberVO amvo) {
		return aMemberDao.aMemberListCnt(amvo);
	}

}
