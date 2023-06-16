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
<link rel="stylesheet" href="${root}css/templatemo.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
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
		<nav id="sidebar" style="min-height: 1000px;  padding-top:100px;">
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
		<div class="container py-5 ">
		    <div class="row text-center text-white mb-5">
		        <div class="col-lg-7 mx-auto">
		            <h2 class="display-4" style="color:#59ab6e; font-weight:500">Product List</h2>
		        </div>
		    </div>
		    <div class="row">
		        <div class="col-lg-8 mx-auto">
		            <ul class="list-group shadow">
		                <c:forEach var="goods" items="${goodsList}">
			                <a href="${root}shop/goods_detail?goods_idx=${goods.getGoods_idx()}" class="list-group-item">
			                    <div class="media align-items-lg-center flex-column flex-lg-row p-3">
			                        <div class="media-body order-2 order-lg-1">
			                            <h5 class="mt-0 font-weight-bold mb-2">${goods.getGoods_name()}</h5>
			                            <p class="font-italic text-muted mb-0 small">${goods.getGoods_des()}</p>
			                            <div class="d-flex align-items-center justify-content-between mt-1"  style="margin-top:20px !important;">
			                                <h6 class=" my-2">&#8361;${goods.getGoods_price()}</h6>
			                            </div>
			                        </div><img src="${root}upload/${goods.getGoods_picture()}" width="200" class="ml-lg-5 order-1 order-lg-2">
			                    </div> 
			                </a>
		                </c:forEach>
		            </ul> 
		        </div>
		    </div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>


