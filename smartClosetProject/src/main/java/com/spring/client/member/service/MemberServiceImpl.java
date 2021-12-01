package com.spring.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.dao.MemberDAO;
import com.spring.client.member.vo.MemberVO;

import lombok.Setter;
@Service
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberDAO memberDao;

	
	//마이페이지 구현
	@Override
	public MemberVO memberMypage(MemberVO mvo) {
		MemberVO member = null;
		member = memberDao.memberMypage(mvo);
		if(member != null) {
			member.setM_id(member.getM_id().toString());
		}
		return member;
	}


	@Override
	public MemberVO MemberUpdate(MemberVO mvo) {
		MemberVO update = memberDao.MemberUpdate(mvo);
		return update;
	}
	//회원정보 수정 페이지 구현
	

}
