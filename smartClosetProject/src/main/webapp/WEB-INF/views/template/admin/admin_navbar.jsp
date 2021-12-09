<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

        <div class="sidebar">
        <a href="/admin/adminInfo"><img alt="설정" src="/resources/image/setting_icon.png" class="mini_icon" /></a>
        <div>
	        <h3> 관리자 이름 </h3>
	        <h4> 관리자 id </h4> <br/>
        </div>
          <ul class="nav nav-sidebar">
            <li><a href="/nboard/nboardTest">메인 페이지</a></li>
            <li class="active">
            <a href="/nboard/nboardList">공지 관리</a>
            </li>
            <li><a href="/aOrder/aOrderList">주문 관리</a></li>
            <li><a href="#">상품 관리</a></li>
            <li><a href="/aMember/aMemberList">회원 관리</a></li>
            <li><a href="/aReview/aReviewList">리뷰 게시판 관리</a></li>
            <li><a href="/aQna/aQnaList">QnA 게시판 관리</a></li>
          </ul>
		</div>
