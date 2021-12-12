<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	.navbar-brand:hover {
		color : #163B6A;
	}
	
	.navbar-brand:visited{
	color : white;}

	.mini_icon{
		width : 40px;
		height: 40px;
		margin : 40px;
		color : white;
	}
</style>

<div class="container-fluid" style="margin-top : 0px !important; height : 120px;">
        <div class="navbar-header">
          <a class="navbar-brand" href="/nboard/nboardTest"><h2>SMART CLOSET</h2></a><p style="padding-top : 80px; color : white;"><strong>관리자 페이지</strong></p>
         </div>
        <p class="text-right">
       	 <a href="/admin/adminInfo"><img alt="설정" src="/resources/image/user_icon.png" class="mini_icon" /></a>
        </p>
        
</div>