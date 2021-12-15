package com.spring.admin.aReply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.aReply.dao.AreplyDAO;
import com.spring.admin.aReply.vo.AreplyVO;


import lombok.Setter;

@Service
public class AreplyServiceImpl implements AreplyService{
	
	@Setter(onMethod_ = @Autowired)
	private AreplyDAO replyDAO;
	
	@Override
	public List<AreplyVO> aReplyList(Integer q_num) {
		List<AreplyVO> list = null;
		list =  replyDAO.aReplyList(q_num);
		return list;
	}

	@Override
	public int aReplyInsert(AreplyVO rvo) {
		int result = 0;
		result = replyDAO.aReplyInsert(rvo);
		return result;
	}
	
	//글 수정 구현
	@Override
	public int aReplyUpdate(AreplyVO rvo) {
		int result = 0;
		result= replyDAO.aReplyUpdate(rvo);
		return result;
	}
	
	//글 삭제 구현
	@Override
	public int aReplyDelete(Integer r_num) {
		int result = 0;
		result=replyDAO.aReplyDelete(r_num);
	
		return result;
	}



}
