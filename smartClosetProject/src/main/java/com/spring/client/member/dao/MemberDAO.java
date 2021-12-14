package com.spring.client.member.dao;

import java.util.List;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.member.vo.MyorderVO;
import com.spring.client.member.vo.PostVO;


public interface MemberDAO {
	public MemberVO memberMypage(MemberVO mvo);//마이페이지
	public MyorderVO memberMypageCnt(MyorderVO ovo);
	public MemberVO updateForm(MemberVO mvo); //회원 정보 수정 폼
	public int memberUpdate(MemberVO mvo);	  //회원 정보 수정
	public int memberDelete(MemberVO mvo);	//회원정보 삭제
	
	public List<PostVO> postList(PostVO pvo); //게시물 관리 리스트 구현
	public int postListCnt(PostVO pvo);		  //게시물 관리 리스트 레코드수
	
	public List<MyorderVO> myorderList(MyorderVO mvo);//주문내역 조회
	public int myorderListCnt(MyorderVO mvo);		  //주문내역 리스트 레코드 수 구현
	
	/*------------------ 최태준 영역 ------------------*/
	
	public int memberInsert(MemberVO memberVO) throws Exception;
	public MemberVO login(MemberVO memberVO);
}
