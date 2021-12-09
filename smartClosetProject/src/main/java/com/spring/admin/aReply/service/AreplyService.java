package com.spring.admin.aReply.service;

import java.util.List;

import com.spring.admin.aReply.vo.AreplyVO;


public interface AreplyService {
	
	public List<AreplyVO> aReplyList(Integer q_num);
	public int aReplyInsert(AreplyVO rvo);
	public int aReplyUpdate(AreplyVO rvo);
	public int aReplyDelete(Integer r_num);

}
