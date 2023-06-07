<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
<style type="text/css">
form span {
	color: coral;
}

.bd-sidebar {
	position: sticky;
	top: 4rem;
	z-index: 1000;
	height: calc(100vh - 4rem);
	background: #eee;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 220px;
}

.bd-sidebar .nav {
	display: block;
	margin-top: 100px;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: .25rem 1.5rem;
	font-size: 90%;
	margin-top: 25px
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

	<!-- 사이드바 -->
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><img src="${root}upload/${ShopBean.shop_picture}"
						width="100%" /></li>
					<li><a href="${root}shop/modify_myshop">내 상점 정보수정</a></li>
					<li><a href="${root}shop/addGoods">상품 등록</a></li>
					<li><a></a></li>
					<li><a>Side 4</a></li>
					<li><a>Side 5</a></li>
					<li><a>Side 6</a></li>
					<li><a>Side 7</a></li>
					<li><a>Side 8</a></li>
				</ul>
				<br>
			</div>
			<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<div class="container" style= "margin-top: 70px">
					<c:forEach var="goods" items="${goodsList}">
						<div class="row">
							<div class="col-md-3">
								<img src="${root}upload/${goods.getGoods_picture()}" style="width: 50%">
							</div>
							<div class="col-md-7">
								<p>
								<h5>
									<b>[${goods.getGoods_category()}] ${goods.getGoods_name()}</b>
								</h5>
								<p style="padding-top: 20px">"${goods.getGoods_des()}"...							
								<p>${goods.getGoods_price()}원</p>
							</div>
							<div class="col-md-2">
								<a href="${root}shop/goods_detail?goods_idx=${goods.getGoods_idx()}"
									class="btn btn-secondary" role="button">상세정보 &raquo;</a>
								<a href="${root}shop/modify_goods?goods_idx=${goods.getGoods_idx()}"
									class="btn btn-primary" role="button" style="margin-top: 8px">수정하기 &raquo;</a>
								<a href="${root}shop/delete_goods?goods_idx=${goods.getGoods_idx()}"
									class="btn btn-danger" role="button" style="margin-top: 8px">삭제하기 &raquo;</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</main>
		</div>
	</div>

	<!-- 상품 목록 -->


	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>


