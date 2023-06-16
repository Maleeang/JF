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
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/carousel-rtl/">
<link rel="stylesheet" href="${root}css/templatemo.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link href="${root}css/carousel.css" rel="stylesheet">
<link href="${root}css/bootstrap.min.css" rel="stylesheet">
<style>
h2 {
	margin-top: 100px;
	margin-bottom: 40px;
	font-size: 40px;
	font-weight: 700;
}

a {
	text-decoration-line: none;
	color: black;
	font-weight: 700;
}
</style>
</head>
<body>
	<!-- 상단 메뉴 부분 -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center" style="max-width: 1140px !important;">

            <a class="navbar-brand text-success logo h1 align-self-center" style="font-weight:500 !important; color:#59ab6e !important" href="${root}">
                JF
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav" style="height:90px !important;">
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
                <div class="navbar align-self-center d-flex">
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
					<li class="nav-item" style="margin-right: 85px; list-style-type: none; padding-left:30px"><a
						href="${root}user/join" class="nav-link">회원가입</a></li>
				</c:otherwise>
				</c:choose>
                </div>
            </div>

        </div>
    </nav>
	
	<!-- 슬라이드 -->
	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel"
		style="height: 1000px !important">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="bd-placeholder-img" src="${root}image/As.jpg"
					width="100%" height="100%" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777" />
				</img>
			</div>
			<div class="carousel-item">
				<img class="bd-placeholder-img" src="${root}image/watch2.jpg"
					width="100%" height="100%" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777" />
				</img>
			</div>
			<div class="carousel-item">
				<img class="bd-placeholder-img" src="${root}image/Art.png"
					width="100%" height="100%" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777" />
				</img>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden"></span>
		</button>
	</div>

	<!-- 상품 -->
	<div class="container" style="width: 60%">
		<!-- New Arrivals -->
		<h2>New Arrivals</h2>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach var="i" begin="0" end="2">
				<div class="col-lg-4" style="margin-top: 25px;">
					<a
						href="${root}shop/goods_detail?goods_idx=${goodsList[i].getGoods_idx()}"><img
						src="${root}upload/${goodsList[i].getGoods_picture()}"
						style="width: 100%; height: 450px !important"></a>
					<div class="text-center" style="margin-top: 20px;">
						<a
							href="${root}shop/goods_detail?goods_idx=${goodsList[i].getGoods_idx()}"
							style="font-size: 30px;">${goodsList[i].getGoods_name()}</a>
						<p class="card-text"
							style="font-size: 20px; font-weight: 500; margin-top: 10px;">&#8361;${goodsList[i].getGoods_price()}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- gallery -->
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
		style="width: 100%; margin-top:150px;">
		<div class="col-lg-6" >
		<a href="${root}shop/goods_detail?goods_idx=${JaList[4].getGoods_idx()}"><img
			src="${root}upload/${JaList[4].getGoods_picture()}"
			style="width: 100%; height: 650px !important"></a>			
		</div>
		<div class="col-lg-3" >
		<a href="${root}shop/goods_detail?goods_idx=${ClothingList[4].getGoods_idx()}"><img
			src="${root}upload/${ClothingList[4].getGoods_picture()}"
			style="width: 100%; height: 650px !important"></a>			
		</div>
		<div class="col-lg-3" >
			<div class="row">
				<div class="col-lg-12 col-sm-6">
					<a href="${root}shop/goods_detail?goods_idx=${ArtList[4].getGoods_idx()}"><img
					src="${root}upload/${ArtList[4].getGoods_picture()}"
					style="width: 100%; height: 325px !important"></a>					
				</div>
				<div class="col-lg-12 col-sm-6">
					<a href="${root}shop/goods_detail?goods_idx=${OtherList[4].getGoods_idx()}"><img
					src="${root}upload/${OtherList[4].getGoods_picture()}"
					style="width: 100%; height: 325px !important"></a>					
				</div>	
			</div>
		</div>
	</div>

	<!-- Recommend -->
	<div class="container" style="width: 60%;">
		<div class="text-center">
			<h2>Recommend Items</h2>
		</div>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<div class="col-lg-4" style="margin-top: 25px;">
				<a
					href="${root}shop/goods_detail?goods_idx=${goodsList[3].getGoods_idx()}"><img
					src="${root}upload/${goodsList[3].getGoods_picture()}"
					style="width: 100%; height: 450px !important"></a>
				<div class="text-center" style="margin-top: 20px;">
					<a
						href="${root}shop/goods_detail?goods_idx=${goodsList[3].getGoods_idx()}"
						style="font-size: 30px;">${goodsList[3].getGoods_name()}</a>
					<p class="card-text"
						style="font-size: 20px; font-weight: 500; margin-top: 10px;">&#8361;${goodsList[3].getGoods_price()}</p>
				</div>
			</div>
			<div class="col-lg-4" style="margin-top: 25px;">
				<a
					href="${root}shop/goods_detail?goods_idx=${goodsList[4].getGoods_idx()}"><img
					src="${root}upload/${goodsList[4].getGoods_picture()}"
					style="width: 100%; height: 450px !important"></a>
				<div class="text-center" style="margin-top: 20px;">
					<a
						href="${root}shop/goods_detail?goods_idx=${goodsList[4].getGoods_idx()}"
						style="font-size: 30px;">${goodsList[4].getGoods_name()}</a>
					<p class="card-text"
						style="font-size: 20px; font-weight: 500; margin-top: 10px;">&#8361;${goodsList[4].getGoods_price()}</p>
				</div>
			</div>
			<div class="col-lg-4" style="margin-top: 25px;">
				<a
					href="${root}shop/goods_detail?goods_idx=${goodsList[5].getGoods_idx()}"><img
					src="${root}upload/${goodsList[5].getGoods_picture()}"
					style="width: 100%; height: 450px !important"></a>
				<div class="text-center" style="margin-top: 20px;">
					<a
						href="${root}shop/goods_detail?goods_idx=${goodsList[5].getGoods_idx()}"
						style="font-size: 30px;">${goodsList[5].getGoods_name()}</a>
					<p class="card-text"
						style="font-size: 20px; font-weight: 500; margin-top: 10px;">&#8361;${goodsList[5].getGoods_price()}</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 하단 푸터부분 -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<script src="${root}js/bootstrap.bundle.min.js"></script>
</body>
</html>