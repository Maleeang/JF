<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Join Floor</title>
<!-- Bootstrap CDN -->
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/carousel-rtl/">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link href="${root}css/carousel.css" rel="stylesheet">
<link href="${root}css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- 상단 메뉴 부분 -->
<nav
  class="navbar navbar-expand-md navbar-light bg-light"
  style="border-bottom: solid 1px"
>
  <a
    class="navbar-brand"
    style="font-size: 40px !important; margin-left: 50px; margin-right: 40px"
    href="${root}"
    >JF</a
  >
  <button
    class="navbar-toggler"
    type="button"
    data-toggle="collapse"
    data-target="#navMenu"
  >
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navMenu">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a href="${root}search/category?category=Jewelry&Accessories" class="nav-link">Jewelry&Accessories</a>
      </li>
      <li class="nav-item"><a href="${root}search/category?category=Clothing" class="nav-link">Clothing</a></li>
      <li class="nav-item">
        <a href="${root}search/category?category=Art&Collection" class="nav-link">Art&Collection</a>
      </li>
      <li class="nav-item"><a href="${root}search/category?category=Other" class="nav-link">Other</a></li>
    </ul>
    
    <form action="${root}search?question=${question}" method="GET">
      <div class="search-bar input-group" style="margin-left: 70px">
        <input
          type="text"
          class="form-control"
          placeholder="Search item"
		  name="question"
          style="width: 270px;"
        />
        <div class="input-group-append"></div>
        <button class="btn btn-white" type="submit" style="border-color:#ccc; background-color:white">
          <img src="${root}image/search2.svg" style="width: 20px;"/>
        </button>
      </div>
    </form>
    
    <div class="d-flex justify-content-end" style="width:100%;">
    <ul class="navbar-nav ml-auto">
      <c:choose>
        <c:when test="${loginUserBean.userLogin == true }">
          <div class="dropdown">
            <a data-toggle="dropdown"
              ><img
                src="${root}image/user.png"
                style="width: 30px; height: 30px; margin-right: 30px"
              />
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="${root}user/modify">내 정보수정</a>
              <a class="dropdown-item" href="${root}user/logout">로그아웃</a>
            </div>
          </div>
          <a href="${root}cart/cartlist"
            ><img
              src="${root}image/cart.png"
              style="width: 30px; height: 30px; margin-right: 30px"
          /></a>
          <a href="${root}shop/join"
            ><img
              src="${root}image/shop.png"
              style="width: 30px; height: 30px; margin-right: 50px"
          /></a>
        </c:when>
        <c:otherwise>
          <li class="nav-item">
            <a href="${root}user/login" class="nav-link">로그인</a>
          </li>
          <li class="nav-item">
            <a href="${root}user/join" class="nav-link" style="margin-right: 50px">회원가입</a>
          </li>
        </c:otherwise>
      </c:choose>
    </ul>
    </div>
  </div>
</nav>

	<!-- 슬라이드 -->
	 <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="bd-placeholder-img" src="${root}image/JA.png" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></img>
      </div>
      <div class="carousel-item">
        <img class="bd-placeholder-img" src="${root}image/cloth.png" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></img>
      </div>
      <div class="carousel-item">
        <img class="bd-placeholder-img" src="${root}image/Art.png" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></img>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden"></span>
    </button>
  </div>
	
	<!-- 상품 -->
	<div class="container">
		<h4 style="margin-top: 60px;">Jewelry & Accessories</h4>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach var="i" begin="0" end="3">
				<div class="col-lg-3" style="margin-top: 25px;">
					<div class="card shadow-sm">
						<img src="${root}upload/${JaList[i].getGoods_picture()}" style="width: 100%; height: 250px">
						<div class="card-body">
							<h4 class="card-text">${JaList[i].getGoods_name()}</h4>
							<p class="card-text">${JaList[i].getGoods_price()}원</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${root}cart/add_cart?goods_idx=${JaList[i].getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">장바구니</a>
									<a href="${root}shop/goods_detail?goods_idx=${JaList[i].getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">상세보기</a>
								</div>
								<small class="text-muted"></small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="container">
		<h4 style="margin-top: 40px;">Clothing</h4>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach var="i" begin="0" end="3">
				<div class="col-lg-3" style="margin-top: 25px;">
					<div class="card shadow-sm">
						<img src="${root}upload/${ClothingList[i].getGoods_picture()}" style="width: 100%; height: 250px">
						<div class="card-body">
							<h4 class="card-text">${ClothingList[i].getGoods_name()}</h4>
							<p class="card-text">${ClothingList[i].getGoods_price()}원</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${root}cart/add_cart?goods_idx=${ClothingList[i].getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">장바구니</a>
									<a href="${root}shop/goods_detail?goods_idx=${ClothingList[i].getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">상세보기</a>
								</div>
								<small class="text-muted"></small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="container">
		<h4 style="margin-top: 40px;">Art & Collection</h4>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach var="i" begin="0" end="3">
				<div class="col-lg-3" style="margin-top: 25px;">
					<div class="card shadow-sm">
						<img src="${root}upload/${ArtList[i].getGoods_picture()}" style="width: 100%; height: 250px">
						<div class="card-body">
							<h4 class="card-text">${ArtList[i].getGoods_name()}</h4>
							<p class="card-text">${ArtList[i].getGoods_price()}원</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${root}cart/add_cart?goods_idx=${ArtList[i].getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">장바구니</a>
									<a href="${root}shop/goods_detail?goods_idx=${ArtList[i].getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">상세보기</a>
								</div>
								<small class="text-muted"></small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="container">
		<h4 style="margin-top: 40px;">Other</h4>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach var="i" begin="0" end="3">
				<div class="col-lg-3" style="margin-top: 25px;">
					<div class="card shadow-sm">
						<img src="${root}upload/${OtherList[i].getGoods_picture()}" style="width: 100%; height: 250px">
						<div class="card-body">
							<h4 class="card-text">${OtherList[i].getGoods_name()}</h4>
							<p class="card-text">${OtherList[i].getGoods_price()}원</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${root}cart/add_cart?goods_idx=${OtherList[i].getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">장바구니</a>
									<a href="${root}shop/goods_detail?goods_idx=${OtherList[i].getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">상세보기</a>
								</div>
								<small class="text-muted"></small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 하단 푸터부분 -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
	<script src="${root}js/bootstrap.bundle.min.js"></script>
</body>
</html>