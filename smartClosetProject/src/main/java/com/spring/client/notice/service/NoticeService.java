package com.spring.client.notice.service;

import java.util.List;

import com.spring.client.notice.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> noticeList(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public int noticeListCnt(NoticeVO nvo);
}
