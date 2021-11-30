<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="clientUri" value='${requestScope["javax.servlet.forward.request_uri"] }' />
<div class="container">
    <div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/">쇼핑몰 - 스마트 옷장</a>
	</div>
	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="/">Home</a></li>
			<li <c:if test="${fn:containsIgnoreCase(clientUri, '/nboard') }">class="active"</c:if>>
				<a href="/nboard/test">게시판</a>
			</li>
			<li><a href="#contact">Contact</a></li>
		</ul>
	</div><!--/.nav-collapse -->
</div>