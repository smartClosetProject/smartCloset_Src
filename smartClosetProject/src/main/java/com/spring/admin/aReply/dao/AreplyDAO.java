package com.spring.admin.aReply.dao;

import java.util.List;

import com.spring.admin.aReply.vo.AreplyVO;


public interface AreplyDAO {
	public List<AreplyVO> aReplyList(Integer q_num);
	public int aReplyInsert(AreplyVO rvo);
	public int aReplyUpdate(AreplyVO rvo);
	public int aReplyDelete(Integer r_num);
	public int aReplyCnt(int q_num);

}
