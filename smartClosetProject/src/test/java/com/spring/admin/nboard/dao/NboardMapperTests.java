package com.spring.admin.nboard.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.admin.admin.dao.AdminDAO;
import com.spring.admin.admin.vo.AdminVO;
import com.spring.admin.nboard.vo.NboardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NboardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private NboardDAO nboardDAO;
	
	@Setter(onMethod_ = @Autowired)
	private AdminDAO adminDAO;
	
//	@Test
//	public void testBoardList() {
//		List<BoardVO> list = boardDAO.boardList();
//		for (BoardVO vo : list) {
//			log.info(vo);
//		}
//	}
//	
//	@Test
//	public void testBoardList() { // 검색 추가
//		NboardVO bvo = new NboardVO();
//		
//		bvo.setPageNum(2);
//		bvo.setAmount(10);
//		
//		// 검색 조건 부여
//		// bvo.setSearch("b_title");
//		// bvo.setKeyword("스프링");
//		
//		List<NboardVO> list = nboardDAO.nboardList(bvo);
//		for (NboardVO vo : list) {
//			log.info(vo);
//		}
//	}
	
//	@Test
//	public void testBoardInsert() {
//		BoardVO bvo = new BoardVO();
//		bvo.setB_name("홍길동");
//		bvo.setB_title("입력확인");
//		bvo.setB_content("오늘도 수고했어");
//		bvo.setB_pwd("1234");
//		
//		int result = boardDAO.boardInsert(bvo);
//		if (result == 1) {
//			log.info("입력 성공");
//		} else {
//			log.info("입력 실패");
//		}
//	}
	
//	@Test
//	public void testBoardDetail() {
//		BoardVO bvo = new BoardVO();
//		bvo.setB_num(7);
//		
//		BoardVO vo = boardDAO.boardDetail(bvo);
//		log.info(vo);
//	}
	
//	@Test
//	public void testPwdConfirm() {
//		BoardVO bvo = new BoardVO();
//		bvo.setB_num(5);
//		bvo.setB_pwd("1234"); // 옳은 비밀번호
//		
//		int result = boardDAO.pwdConfirm(bvo);
//		log.info("결과 : " + result);
//		
//		bvo.setB_pwd("123"); // 잘못된 비밀번호
//		int result2 = boardDAO.pwdConfirm(bvo);
//		log.info("결과 : " + result2);
//	}
	
//	@Test
//	public void testBoardUpdate() {
//		NboardVO nvo = new NboardVO();
//		nvo.setAd_num(1);
//		nvo.setN_author("관리자");
//		nvo.setN_content("1111");
//		nvo.setN_title("11");
//		nvo.setN_num(1);
//		nvo.setN_important(0);
//		
//		int result = nboardDAO.nboardUpdate(nvo);
////		int result = boardDAO.boardUpdate(bvo);
//		log.info("result : " + result);
//	}
	
//	@Test
//	public void testBoardDelete() {
//		BoardVO bvo = new BoardVO();
//		bvo.setB_num(7);
//		
//		boardDAO.boardDelete(bvo);
//	}
	
//	@Test
//	public void testBoardDelete() {
//		BoardVO bvo = new BoardVO();
//		bvo.setB_num(7);
//		
//		boardDAO.boardDelete(bvo);
//	}
	@Test
	public void testAdminlogin() { // 검색 추가
		AdminVO avo = new AdminVO();
		avo.setAd_id("admin1");
		avo.setAd_passwd("admin1234");
		
		adminDAO.adminLogin(avo);
	}
	
}
