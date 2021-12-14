<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="/sCloset/sClosetHome">SmartCloset</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="/product/mainPage">홈</a></li><!-- class="active" -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="/product/cate/아우터">아우터 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/product/cate/아우터/자켓">자켓</a></li>
				<li><a href="/product/cate/아우터/코트">코트</a></li>
				<li><a href="/product/cate/아우터/패딩">패딩</a></li>
				<li><a href="/product/cate/아우터/야상">야상</a></li>
				<li><a href="/product/cate/아우터/집업">집업</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="/product/cate/상의">상의 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/product/cate/상의/반팔">반팔</a></li>
				<li><a href="/product/cate/상의/긴팔">긴팔</a></li>
				<li><a href="/product/cate/상의/셔츠">셔츠</a></li>
				<li><a href="/product/cate/상의/니트">니트</a></li>
				<li><a href="/product/cate/상의/맨투맨">맨투맨</a></li>
				<li><a href="/product/cate/상의/후드티">후드티</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="/product/cate/하의">하의 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/product/cate/하의/반바지">반바지</a></li>
				<li><a href="/product/cate/하의/긴바지">긴바지</a></li>
				<li><a href="/product/cate/하의/청바지">청바지</a></li>
				<li><a href="/product/cate/하의/면바지">면바지</a></li>
				<li><a href="/product/cate/하의/슬랙스">슬랙스</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="/product/cate/가방신발">가방/신발 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/product/cate/가방신발/가방">가방</a></li>
				<li><a href="/product/cate/가방신발/신발">신발</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="/product/cate/액세서리">액세서리 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/product/cate/액세서리/벨트">벨트</a></li>
				<li><a href="/product/cate/액세서리/스카프">스카프</a></li>
			</ul></li>
			
	</ul>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="/cart/cartList"><span
				class="glyphicon glyphicon glyphicon-shopping-cart"></span> </a></li>
		<li><a href="/member/mypage"><span class="glyphicon glyphicon-user"></span>
		</a></li>
		<c:if test="${empty login.m_id }">
			<li><a href="/member/loginForm"><span class="glyphicon glyphicon-log-in"></span>
		</a></li>
		</c:if>
		<c:if test="${not empty login.m_id }">
			<li><a href="/member/logout"><span class="glyphicon glyphicon-log-out"></span>
		</a></li>
		</c:if>
	</ul>
</div>