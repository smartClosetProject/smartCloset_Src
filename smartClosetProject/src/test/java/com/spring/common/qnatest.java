package com.spring.common;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.qna.dao.QnaDao;
import com.spring.qna.vo.QnaVO;
import com.spring.reply.dao.ReplyDao;
import com.spring.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class qnatest {
	@Setter(onMethod_ = @Autowired)
	private QnaDao qnaDao;
	
	/*@Test
	public void testReplyList() {
		List<ReplyVO> list = replyDao.replyList(1);
		for(ReplyVO vo : list) {
			log.info(vo);		
		}
	}
	@Test
	public void testReplyInsert() {
		ReplyVO rvo = new ReplyVO();
		rvo.setQ_num(1); // 게시판의 글번호
		rvo.setM_num("21000");
		rvo.setQ_title("최태준");
		rvo.setQ_content("태준");
		rvo.setQ_passwd("1234");
		rvo.setAD_num("123");
		int result = replyDao.replyInsert(rvo);
		log.info("입력결과 : " + result);
		}*/
	public void testQnaInsert() {
		QnaVO qna = new QnaVO();
		qna.setQ_num(1);
		qna.setM_num(2100);
		qna.setQ_title("확인");
		qna.setQ_content("qna");
		qna.setQ_passwd("1234");
		int count = qnaDao.QnaInsert(qna);
		log.info("INSERT COUNT : " + count);
	}


}