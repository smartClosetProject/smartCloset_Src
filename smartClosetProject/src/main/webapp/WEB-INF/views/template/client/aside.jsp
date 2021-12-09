<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="col-sm-3 sidenav">
	<ul class="nav navbar-nav small">
		<li class="mainLi"><a href="/member/loginForm">로그인</a></li>
		<!-- <li class="mainLi"><a href="/member/logout">로그아웃</a></li> -->
		<li class="mainLi"><a href="/member/joinmember">회원가입</a></li>
		<li class="mainLi"><a href="/member/mypage">마이페이지</a></li>
		<li class="mainLi"><a href="/review/reviewList">리뷰게시판</a></li>
		<li class="mainLi"><a href="/qna/qnaList">QnA게시판</a></li>
		<li class="mainLi"><a href="#">공지게시판</a></li>
	</ul>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<ul class="nav nav-stacked large">
		<li class=""><a href="#section1">아우터</a></li>
		<!-- class="active" -->
		<li><a href="#section2">상의</a></li>
		<li><a href="#section3">하의</a></li>
		<li><a href="#section3">가방&신발</a></li>
		<li><a href="#section3">악세사리</a></li>
		<li>
			<br><br><br><br><br><br> 
			<span class="glyphicon glyphicon-search"></span>&nbsp; 
			<input type="text" name="pro_search" id="pro_search" size="10" placeholder="검색어 입력">
			<input type="button" name="searchBtn" id="searchBtn" value="검색">
		</li>
	</ul>
</nav>