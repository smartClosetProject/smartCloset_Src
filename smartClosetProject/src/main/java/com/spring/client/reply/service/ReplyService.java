package com.spring.client.reply.service;

import java.util.List;

import com.spring.client.reply.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(Integer q_num); 
	public int replyInsert(ReplyVO rvo);
	public int pwdConfirm(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(Integer r_num);

}
