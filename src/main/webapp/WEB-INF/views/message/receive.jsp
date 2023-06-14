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
	
	a{
	color:black;
	}
	
	li {
	margin-bottom:15px;
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


	<div class="container-fluid">
		<div class="row flex-nowrap">
			<!-- 사이드바 -->
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li class="row" style="border-bottom:1px solid #ccc; margin-bottom:30px; padding-bottom:20px;"><img src="${root}image/shop.png" style="width:30px; height:30px; margin-left:10px; margin-right:10px; padding-bottom:1px"><h4>${ShopBean.shop_name}</h4></li>
					<li style="margin-bottom:40px;"><img src="${root}upload/${ShopBean.shop_picture}"
						width="100%" /></li>
					<li style="margin-bottom:50px;"><p>${ShopBean.description}<p></li>
					<c:if test="${ShopBean.user_idx==loginUser}">
						<li ><a href="${root}shop/modify_myshop">◉ 상점 정보수정</a></li>
						<li><a href="${root}shop/addGoods">◉ 상품 등록</a></li>
					    <li><a href="${root}message/receive">◉ 받은 메세지</a></li>
					    <li><a href="${root}message/sendlist">◉ 보낸 메세지</a></li>
					</c:if>
					<li><a></a></li>
				</ul>
				<br>
			</div>
			<!-- 상품 목록 -->
			<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<div class="container" style= "margin-top: 70px; margin-left:40px; ">
					<h4 style="border-bottom:1px solid #ccc; margin-bottom:30px; padding-bottom:30px;">Receive Message</h4>
					<c:forEach var="msg" items="${msgList}">
						<div class="row" style="margin-bottom:30px; border-bottom:1px solid #ccc; padding-bottom: 20px">
							<div class="col-md-3">
								<p style="padding-top: 20px">${msg.getMsg_title()}</p>
							</div>
							<div class="col-md-5">
								<c:choose>
									<c:when test="${fn:length(msg.getMsg_content()) > 40}">									
										<p style="padding-top: 20px">${fn:substring(msg.getMsg_content(), 0, 38)}...</p>				
									</c:when>
									<c:otherwise>									
										<p style="padding-top: 20px">${msg.getMsg_content()}									
									</c:otherwise>
								</c:choose>							
							</div>
							<div class="col-md-2">
								<p>${msg.getUser_name()}</p>
								<p style="font-size:11px;">${msg.getMessage_date()}
							</div>
							<div class="col-md-2">
								<a href="${root}shop/modify_goods?goods_idx=${goods.getGoods_idx()}"
									class="btn btn-primary" role="button" style="margin-top: 8px">답장하기 &raquo;</a>
								<a href="${root}shop/delete_goods?goods_idx=${goods.getGoods_idx()}"
									class="btn btn-danger" role="button" style="margin-top: 8px">삭제하기 &raquo;</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</main>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>


