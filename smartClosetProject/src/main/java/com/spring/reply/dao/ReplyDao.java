package com.spring.reply.dao;

import java.util.List;

import com.spring.reply.vo.ReplyVO;

public interface ReplyDao {
	public List<ReplyVO> replyList(Integer b_num); 
	public int replyInsert(ReplyVO rvo);
}
