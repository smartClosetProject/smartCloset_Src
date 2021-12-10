package com.spring.client.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.dao.MemberDAO;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.member.vo.MyorderVO;
import com.spring.client.member.vo.PostVO;

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
	@Override
	public int memberDelete(MemberVO mvo) {
		int result = 0;
		result = memberDao.memberDelete(mvo);
		return result;
	}
	
	//내가쓴 게시판 목록 구현
	@Override
	public List<PostVO> postList(PostVO pvo) {
		List<PostVO> list = memberDao.postList(pvo);
		return list;
	}
	//내가 쓴 게시판 목록 레코드 수 구현
	@Override
	public int postListCnt(PostVO pvo) {
		return memberDao.postListCnt(pvo);
	}
	
	//주문 내역 리스트 목록 구현
	@Override
	public List<MyorderVO> myorderList(MyorderVO mvo) {
		System.out.println(mvo.getStart_date() + " / " + mvo.getEnd_date());
		List<MyorderVO> list = memberDao.myorderList(mvo);
		return list;
	}
	//주문 내역 리스트 레코드 수 구현
	@Override
	public int myorderListCnt(MyorderVO mvo) {
		return memberDao.myorderListCnt(mvo);
	}

	/*------------------ 최태준 영역 ------------------*/
	
	@Override
	public int memberInsert(MemberVO memberVO) throws Exception {
		return memberDao.memberInsert(memberVO);
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		MemberVO mvo = memberDao.login(memberVO);
		return mvo;
	}

	
}
