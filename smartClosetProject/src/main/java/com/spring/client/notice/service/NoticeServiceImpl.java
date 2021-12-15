package com.spring.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.notice.dao.NoticeDao;
import com.spring.client.notice.vo.NoticeVO;


import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Setter(onMethod_=@Autowired)
	private NoticeDao noticeDao;
	
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> list = null;
		list = noticeDao.noticeList(nvo);
		return list;
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		if(detail!=null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n","<br />"));
		}
		return detail;
	}

	@Override
	public int noticeListCnt(NoticeVO nvo) {
		return noticeDao.noticeListCnt(nvo);
	}

}
