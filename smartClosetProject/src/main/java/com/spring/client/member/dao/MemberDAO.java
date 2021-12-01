package com.spring.client.member.dao;

import com.spring.client.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO memberMypage(MemberVO mvo);
	public MemberVO MemberUpdate(MemberVO mvo);

}
