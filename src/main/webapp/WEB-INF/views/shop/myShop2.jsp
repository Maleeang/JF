<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>JF</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet" href="${root}css/sidebar.css">
<style type="text/css">
form span {
	color: coral;
}

.bd-sidebar {
	position: sticky;
	top: 4rem;
	z-index: 1000;
	height: calc(100vh - 4rem);
	background: #ffffff;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 220px;
}

.bd-sidebar .nav {
	display: block;
	margin-top: 100px;
}

/* .bd-sidebar .nav>li>a {
		display: block;
		padding: .25rem 1.5rem;
		font-size: 90%;
		margin-top: 25px
	} */
a {
	color: black;
}

#footer {
	margin-top: 0px !important;
}

.navbar {
	margin-bottom: 0px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp" />


	
	<div class="d-flex">
		<!-- 사이드바 -->
		<nav id="sidebar" style="min-height: 1000px;">
			<div class="p-4 pt-5">
				<a href="#" class="img logo rounded-circle mb-5"
					style="background-image: url(${root}upload/${ShopBean.shop_picture});"></a>
				<div class="footer text-center" style="margin-bottom: 100px;">
					<p>${ShopBean.shop_name}</p>
					<br>
					<p>${ShopBean.description}</p>
				</div>
				<c:if test="${ShopBean.user_idx==loginUser}">
					<ul class="list-unstyled components mb-5">
						<li><a href="${root}shop/modify_myshop">상점 정보수정</a></li>
						<li><a href="${root}shop/addGoods">상품등록</a></li>
						<li><a href="${root}message/receive">메세지함</a></li>
					</ul>
				</c:if>
			</div>
		</nav>
		<!-- 상품 목록 -->
		<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
			<div class="container" style="margin-top: 70px; margin-left: 40px;">
				<h4
					style="border-bottom: 1px solid #ccc; margin-bottom: 30px; padding-bottom: 30px;">${ShopBean.shop_name}'s
					Items</h4>
				<c:forEach var="goods" items="${goodsList}">
					<div class="row"
						style="margin-bottom: 30px; border-bottom: 1px solid #ccc; padding-bottom: 20px">
						<div class="col-md-3">
							<img src="${root}upload/${goods.getGoods_picture()}"
								style="width: 50%">
						</div>
						<div class="col-md-7">
							<p>
							<h5>
								<b>[${goods.getGoods_category()}] ${goods.getGoods_name()}</b>
							</h5>
							<c:choose>
								<c:when test="${fn:length(goods.getGoods_des()) > 40}">
									<p style="padding-top: 20px">${fn:substring(goods.getGoods_des(), 0, 38)}...</p>
								</c:when>
								<c:otherwise>
									<p style="padding-top: 20px">${goods.getGoods_des()}
								</c:otherwise>
							</c:choose>
							<p>${goods.getGoods_price()}원</p>
						</div>
						<div class="col-md-2">
							<a
								href="${root}shop/goods_detail?goods_idx=${goods.getGoods_idx()}"
								class="btn btn-secondary" role="button">상세정보 &raquo;</a> <a
								href="${root}shop/modify_goods?goods_idx=${goods.getGoods_idx()}"
								class="btn btn-primary" role="button" style="margin-top: 8px">수정하기
								&raquo;</a> <a
								href="${root}shop/delete_goods?goods_idx=${goods.getGoods_idx()}"
								class="btn btn-danger" role="button" style="margin-top: 8px">삭제하기
								&raquo;</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</main>
	</div>



	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>


