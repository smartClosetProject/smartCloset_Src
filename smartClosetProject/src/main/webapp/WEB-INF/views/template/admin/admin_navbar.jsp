<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	.sidebar {
		top : 120px;
		width: 150px;
	}
</style>

        <div class="sidebar">

          <ul class="nav nav-sidebar">
            <li class="nav-item"><a class="nav-link" href="/nboard/nboardTest">메인 페이지</a></li>
            <li class="nav-item"><a class="nav-link" href="/nboard/nboardList">공지 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/aOrder/aOrderList">주문 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/prDetail/prDetailList">상품 관리</a>
            	<ul class="sub_menu">
					<li><a href="/prDetail/prDetailList" >상품 리스트</a></li>
					<li><a href="/prDetail/pr_numerical" >통계리스트</a></li>
					<li><a href="/prDetail/warehousingList" >입고 확인</a></li>
				</ul>
			</li>
			<li class="nav-item"><a class="nav-link" href="/aMember/aMemberList">회원 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/aReview/aReviewList">리뷰 게시판 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/aQna/aQnaList">QnA 게시판 관리</a></li>
          </ul>
		</div>
		<script>
			 $(function () {
		            $('.nav-item').click(function () {
		                $('.nav-item').removeClass('active');
		                $(this).addClass('active');
		     	 });
			 });


		</script>

