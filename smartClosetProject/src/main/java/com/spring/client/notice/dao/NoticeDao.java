package com.spring.client.notice.dao;

import java.util.List;

import com.spring.client.notice.vo.NoticeVO;




public interface NoticeDao {
	
	public List<NoticeVO> noticeList(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public int noticeListCnt(NoticeVO nvo);
}
