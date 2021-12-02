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

	//회원정보 수정 페이지 구현
	@Override
	public MemberVO updateForm(MemberVO mvo) {
		MemberVO update = memberDao.updateForm(mvo);
		return update;
	}

	//회원 정보 수정 처리
	@Override
	public int memberUpdate(MemberVO mvo) {
		int result = 0;
		result = memberDao.memberUpdate(mvo);
		return result;
	}

	

}
