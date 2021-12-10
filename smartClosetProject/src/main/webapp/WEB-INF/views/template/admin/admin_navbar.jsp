<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

        <div class="sidebar">
        <img alt="설정" src="/resources/image/setting_icon.png" class="mini_icon"/>
        <div>
	        <h3> 관리자 이름 </h3>
	        <h4> 관리자 id </h4> <br/>
        </div>
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">메인 페이지 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">공지 관리</a></li>
            <li><a href="#">주문 관리</a></li>
            <li><a href="#">상품 관리 </a>
				<ul class="sub_menu">
					<li><a href="/prDetail/prDetailList" >상품 리스트</a></li>
					<li><a href="/prDetail/pr_numerical" >통계리스트</a></li>
					<li><a href="/prDetail/warehousingList" >입고 확인</a></li>
				</ul>
			</li>
            <li><a href="#">회원 관리</a></li>
            <li><a href="#">게시물 관리</a></li>
            <li><a href="#">포인트 관리</a></li>
          </ul>
		</div>
