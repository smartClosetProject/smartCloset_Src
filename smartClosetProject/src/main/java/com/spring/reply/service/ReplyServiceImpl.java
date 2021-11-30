package com.spring.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.reply.dao.ReplyDao;
import com.spring.reply.vo.ReplyVO;

import lombok.Setter;

public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao;
	
	

	@Override
	public List<ReplyVO> replyList(Integer r_num) {
		List<ReplyVO> list = null;
		list = replyDao.replyList(r_num);
		return list;
	}
	
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result =0;
		result = replyDao.replyInsert(rvo);
		return result;
	}
}

