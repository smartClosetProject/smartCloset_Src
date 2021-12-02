package com.spring.client.member.service;

import com.spring.client.member.vo.MemberVO;

public interface MemberService {
	public MemberVO memberMypage(MemberVO mvo);
	public MemberVO updateForm(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);

}
