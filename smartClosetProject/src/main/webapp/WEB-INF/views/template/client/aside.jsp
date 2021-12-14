<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="col-sm-3 sidenav">
	<ul class="nav navbar-nav small">
		<c:if test="${empty sessionScope.login.m_id }">
			<li class="mainLi"><a href="/member/loginForm">로그인</a></li>
		</c:if>
		<c:if test="${not empty sessionScope.login.m_id }">
			<li class="mainLi"><a href="/member/logout">로그아웃</a></li>
		</c:if>
		<c:if test="${empty sessionScope.login.m_id }">
			<li class="mainLi"><a href="/member/joinmember">회원가입</a></li>
		</c:if>
		<li class="mainLi"><a href="/member/mypage">마이페이지</a></li>
		<li class="mainLi"><a href="/review/reviewList">리뷰게시판</a></li>
		<li class="mainLi"><a href="/qna/qnaList">QnA게시판</a></li>
		<li class="mainLi"><a href="/notice/noticeList">공지게시판</a></li>
	</ul>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<ul class="nav nav-stacked large">
		<li class=""><a href="/product/cate/아우터">아우터</a></li>
		<!-- class="active" -->
		<li><a href="/product/cate/상의">상의</a></li>
		<li><a href="/product/cate/하의">하의</a></li>
		<li><a href="/product/cate/가방신발">가방&신발</a></li>
		<li><a href="/product/cate/악세사리">악세사리</a></li>
		<li>
			<br><br><br><br><br><br> 
			<form id="pro_search">
				<span class="glyphicon glyphicon-search"></span>&nbsp; 
				<input type="text" name="pro_keyword" id="pro_keyword" size="10" placeholder="검색어 입력">
				<input type="button" name="searchBtn" id="searchBtn" value="검색">
			</form>
		</li>
	</ul>
</nav>