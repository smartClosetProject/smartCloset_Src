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
			data-toggle="dropdown" href="#">아우터 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">패딩</a></li>
				<li><a href="#">자켓</a></li>
				<li><a href="#">코드</a></li>
				<li><a href="#">점퍼/짚업</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">상의 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">긴팔</a></li>
				<li><a href="#">니트</a></li>
				<li><a href="#">가디건</a></li>
				<li><a href="#">조끼</a></li>
				<li><a href="#">반팔</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">하의 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">슬랙스</a></li>
				<li><a href="#">데님</a></li>
				<li><a href="#">면바지</a></li>
				<li><a href="#">반바지</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">가방/신발 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">가방</a></li>
				<li><a href="#">신발</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">악세사리 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">벨트</a></li>
				<li><a href="#">스카프</a></li>
			</ul></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="/cart/cartList"><span
				class="glyphicon glyphicon glyphicon-shopping-cart"></span> </a></li>
		<li><a href="#"><span class="glyphicon glyphicon-user"></span>
		</a></li>
		<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
		</a></li>
		<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>
		</a></li>
	</ul>
</div>