package com.spring.client.member.dao;

import java.util.List;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.member.vo.PostVO;


public interface MemberDAO {
	public MemberVO memberMypage(MemberVO mvo);
	public MemberVO updateForm(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public List<PostVO> postList(PostVO pvo);
	public int postListCnt(PostVO pvo);
}
