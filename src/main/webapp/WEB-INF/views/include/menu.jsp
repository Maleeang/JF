<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로컬주소(절대주소)를 root라는 변수로 저장 -->
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!-- 상단 메뉴 부분 -->
<nav
	class="navbar navbar-expand-md bg-dark navbar-dark fixed-top shadow-lg">
	<a class="navbar-brand" href="${root}">JF</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navMenu">

		<ul class="navbar-nav ml-auto">
			<c:choose>
				<c:when test="${loginUserBean.userLogin == true }">
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown" id="dropdownBtn">${loginUserBean.user_name}님
						</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${root}user/modify">정보수정</a> 
							<a class="dropdown-item" href="${root}shop/join">내 상점</a> 
							<a class="dropdown-item" href="${root}cart/cartlist">장바구니</a> 
							<a class="dropdown-item" href="${root}user/logout">로그아웃</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="${root}user/login"
						class="nav-link">로그인</a></li>
					<li class="nav-item"><a href="${root}user/join"
						class="nav-link">회원가입</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>