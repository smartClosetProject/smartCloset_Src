package com.spring.reply.service;

import java.util.List;

import com.spring.reply.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(Integer q_num); 
	public int replyInsert(ReplyVO rvo);
}
