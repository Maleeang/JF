<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로컬주소(절대주소)를 root라는 변수로 저장 -->
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!-- 상단 메뉴 부분 -->
<nav
	class="navbar navbar-expand-md navbar-light bg-light">
	<a class="navbar-brand " style="font-size: 40px !important; margin-left:40px;" href="${root}">JF</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navMenu">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a href="${root}" class="nav-link">Jewelry&Accessories</a>
			</li>
			<li class="nav-item">
				<a href="${root}" class="nav-link">Clothing</a>
			</li>
			<li class="nav-item">
				<a href="${root}" class="nav-link">Art&Collection</a>
			</li>
			<li class="nav-item">
				<a href="${root}" class="nav-link">Other</a>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<c:choose>
				<c:when test="${loginUserBean.userLogin == true }">
					<div class="dropdown">
						<a data-toggle="dropdown"><img src="${root}image/user.png" style="width:30px;
						height:30px; margin-right:30px"/>
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${root}user/modify">내 정보수정</a> 
							<a class="dropdown-item" href="${root}user/logout">로그아웃</a>
						</div>
					</div>
					<a href="${root}cart/cartlist"><img src="${root}image/cart.png" style="width:30px;
						height:30px; margin-right:30px"/></a>
					<a href="${root}shop/join"><img src="${root}image/shop.png" style="width:30px;
						height:30px; margin-right:50px"/></a>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="${root}user/login"
						class="nav-link">로그인</a></li>
					<li class="nav-item" style="margin-right:50px"><a href="${root}user/join"
						class="nav-link">회원가입</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>