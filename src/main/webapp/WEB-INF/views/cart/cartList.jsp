<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />

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
	<div class="container" style="margin-top: 90px">
		<c:forEach var="item" items="${cartList}">
			<div class="row" style="margin-top: 30px">
				<div class="col-md-5">
					<img src="${root}upload/${item.getGoods_picture()}"
						style="width: 50%">
				</div>
				<div class="col-md-5">
					<p>
					<h5>
						<b>[${item.getGoods_name()}</b>
					</h5>
					<p style="padding-top: 20px">${item.getGoods_quantity()}개
					<p>${item.getTotal_price()}원</p>
				</div>
				<div class="col-md-2" style="padding-top: 70px">
					<a href="${root}cart/delete_cart?cart_idx=${item.getCart_idx()}"
						class="btn btn-secondary" role="button">삭제하기 &raquo;</a>
				</div>
			</div>
		</c:forEach>
		<div class="text-right" style="margin-top: 50px">
			<b>총액 : ${totalprice}</b>
		</div>
		<div class="text-right" style="margin-top: 30px">
			<a href="${root}cart/pay?totalprice=${totalprice}"
				class="btn btn-primary" role="button">결제하기 &raquo;</a>
		</div>
	</div>
	<!-- 하단 푸터부분 -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>