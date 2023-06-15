<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로컬주소(절대주소)를 root라는 변수로 저장 -->
<c:set var="root" value="${pageContext.request.contextPath}/" />

<!-- 상단 메뉴 부분 -->
<nav class="navbar navbar-expand-md navbar-light bg-light"
	style="border-bottom: solid 1px">
	<a class="navbar-brand"
		style="font-size: 40px !important; margin-left: 50px; margin-right: 40px"
		href="${root}">JF</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse justify-content-start" id="navMenu">
		<ul class="navbar-nav">
			<li class="nav-item"><a
				href="${root}search/category?category=Jewelry&Accessories"
				class="nav-link">Jewelry&Accessories</a></li>
			<li class="nav-item"><a
				href="${root}search/category?category=Clothing" class="nav-link">Clothing</a></li>
			<li class="nav-item"><a
				href="${root}search/category?category=Art&Collection"
				class="nav-link">Art&Collection</a></li>
			<li class="nav-item"><a
				href="${root}search/category?category=Other" class="nav-link">Other</a></li>
		</ul>
		<form class="justify-content-center" action="${root}search?question=${question}" method="GET">
			<div class="search-bar input-group justify-content-center"
				style="margin-left: 70px">
				<input type="text" class="form-control" placeholder="Search item"
					name="question" style="width: 270px;" />
				<div class="input-group-append"></div>
				<button class="btn btn-white" type="submit"
					style="border-color: #ccc; background-color: white">
					<img src="${root}image/search2.svg" style="width: 20px;" />
				</button>
			</div>
		</form>
		<ul class="navbar-nav ml-auto justify-content-end">
			<c:choose>
				<c:when test="${loginUserBean.userLogin == true }">
					<div class="dropdown">
						<a data-toggle="dropdown"><img
							src="${root}image/user.png"
							style="width: 30px; height: 30px; margin-right: 30px" />
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${root}user/modify">내 정보수정</a> <a
								class="dropdown-item" href="${root}user/logout">로그아웃</a>
						</div>
					</div>
					<a href="${root}cart/cartlist"><img
						src="${root}image/cart.png"
						style="width: 30px; height: 30px; margin-right: 30px" /></a>
					<a href="${root}shop/join"><img
						src="${root}image/shop.png"
						style="width: 30px; height: 30px; margin-right: 50px" /></a>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="${root}user/login"
						class="nav-link">로그인</a></li>
					<li class="nav-item" style="margin-right: 50px"><a
						href="${root}user/join" class="nav-link">회원가입</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>
