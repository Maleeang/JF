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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 상단 매뉴부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp" />

	<!-- 본문 -->
	<div class="container">
		<h4 style="margin-top: 60px;">${question}의 검색결과</h4>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach var="result" items="${resultGoods}">
				<div class="col-lg-3" style="margin-top: 25px;">
					<div class="card shadow-sm">
						<img src="${root}upload/${result.getGoods_picture()}" style="width: 100%; height: 250px">
						<div class="card-body">
							<h4 class="card-text">${result.getGoods_name()}</h4>
							<p class="card-text">${result.getGoods_price()}원</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${root}cart/add_cart?goods_idx=${result.getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">장바구니</a>
									<a href="${root}shop/goods_detail?goods_idx=${result.getGoods_idx()}" type="button" class="btn btn-sm btn-outline-secondary">상세보기</a>
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
</body>
</html>