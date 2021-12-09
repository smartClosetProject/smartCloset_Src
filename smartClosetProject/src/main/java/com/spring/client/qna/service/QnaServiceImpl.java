package com.spring.client.qna.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.qna.dao.QnaDao;
import com.spring.client.qna.vo.QnaVO;
import com.spring.common.file.FileUploadUtil;
import com.spring.client.reply.dao.ReplyDao;
import lombok.Setter;

@Service
public class QnaServiceImpl implements QnaService {

	@Setter(onMethod_=@Autowired)
	private QnaDao qnaDao;

	@Setter(onMethod_=@Autowired)
	private ReplyDao replyDao;
	
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> list = null;
		list = qnaDao.qnaList(qvo);
		return list;
	}
	public int qnaInsert(QnaVO qvo) throws Exception {
		int result =0;
		if(qvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "qna");
			qvo.setQ_file(fileName);
			
		}
		result = qnaDao.qnaInsert(qvo);
		return result;
		
	}
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = null;
		detail = qnaDao.qnaDetail(qvo);
		if(detail!=null) {
			detail.setQ_content(detail.getQ_content().toString().replaceAll("\n","<br />"));
		}
		return detail;
	}

	@Override
	public QnaVO updateQna(QnaVO qvo) {
		QnaVO update = null;
		update = qnaDao.qnaDetail(qvo);
		return update;
	}

	@Override
	public int qnaUpdate(QnaVO qvo) throws Exception {
		int result =0;
		
		if(!qvo.getFile().isEmpty()) {
			if(!qvo.getQ_file().isEmpty()) {
			FileUploadUtil.fileDelete(qvo.getQ_file());
			
		}
	
		}	
		result = qnaDao.qnaUpdate(qvo);
		return result;
	}

	@Override
	public int qnaDelete(QnaVO qvo) throws Exception {
		int result = 0;
		
		if(!qvo.getQ_file().isEmpty()) {
			FileUploadUtil.fileDelete(qvo.getQ_file());
		}
		result = qnaDao.qnaDelete(qvo);
		return result;
	}

	@Override
	public int qnaListCnt(QnaVO qvo) {
		return qnaDao.qnaListCnt(qvo);
		}





	

}