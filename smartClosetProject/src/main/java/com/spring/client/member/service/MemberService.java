package com.spring.client.member.service;

import java.util.List;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.member.vo.MyorderVO;
import com.spring.client.member.vo.PostVO;

public interface MemberService {
	public MemberVO memberMypage(MemberVO mvo);
	public MemberVO updateForm(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	
	public List<PostVO> postList(PostVO pvo); //게시물 관리 리스트 출력
	public int postListCnt(PostVO pvo);		  //게시물 관리 레코드 수 구현
	
	public List<MyorderVO> myorderList(MyorderVO mvo);//주문내역 조회
	public int myorderListCnt(MyorderVO mvo);		  //주문내역 리스트 레코드 수 구현
	
}
