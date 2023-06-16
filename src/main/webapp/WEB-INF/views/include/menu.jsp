<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로컬주소(절대주소)를 root라는 변수로 저장 -->
<c:set var="root" value="${pageContext.request.contextPath}/" />

<!-- 상단 메뉴 부분 -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center" style="max-width: 1140px !important;">

            <a class="navbar-brand text-success logo h1 align-self-center" style="font-weight:500 !important" href="${root}">
                JF
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-start mx-lg-auto">
                        <li class="nav-item" style="padding-left:30px;">
                            <a class="nav-link" href="${root}">Home</a>
                        </li>
                        <li class="nav-item" style="padding-left:30px;">
                            <a class="nav-link" href="${root}search/shop">Shop</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex" style="box-shadow:none !important">
                <form class="justify-content-end" action="${root}search?question=${question}" method="GET">
					<div class="search-bar input-group d-flex" style="padding-right:50px;">
						<input type="text" class="form-control" placeholder="Search item"
							name="question" />
						<div class="input-group-append"></div>
						<button class="btn btn-white" type="submit"
							style="border-color: #ccc; background-color: white">
							<img src="${root}image/search2.svg" style="width: 20px;" />
						</button>
					</div>
				</form>
				<c:choose>
				<c:when test="${loginUserBean.userLogin == true }">
                    <a class="nav-icon position-relative text-decoration-none" href="${root}cart/cartlist">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                    </a>
                    <div class="dropdown">
	                    <a class="nav-icon position-relative text-decoration-none"  data-toggle="dropdown" href="#">
	                        <i class="fa fa-fw fa-user text-dark mr-3" ></i>
	                    </a>                    
                    	<div class="dropdown-menu">
                    		<a class="dropdown-item" href="${root}shop/join">내 상점</a> 
							<a class="dropdown-item" href="${root}user/modify">내 정보수정</a> 
							<a class="dropdown-item" href="${root}user/logout">로그아웃</a>
						</div>
                    </div>				
				</c:when>
				<c:otherwise>
					<li class="nav-item" style=" list-style-type: none;"><a href="${root}user/login"
						class="nav-link">로그인</a></li>
					<li class="nav-item" style="margin-right: 50px; list-style-type: none;"><a
						href="${root}user/join" class="nav-link">회원가입</a></li>
				</c:otherwise>
				</c:choose>


                </div>
            </div>

        </div>
    </nav>
