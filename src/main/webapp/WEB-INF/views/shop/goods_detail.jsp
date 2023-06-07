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
<title>JF</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
<style type="text/css">
form span {
	color: coral;
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

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-5" style="margin-right: 30px;">
				<div class="card shadow" style="height: 500px;">
					<img src="${root}upload/${goodsBean.goods_picture}" width="100%"
						height="100%" />
				</div>
			</div>
			<div class="col-sm-5" style="margin-left: 30px;">
				<div class="card shadow">
					<div class="card-body" style="height: 500px;">
						<h2>${goodsBean.goods_name}</h2>
						<p style="text-align: right; margin-top: 60px;">${goodsBean.goods_price}원</p>
						<p style="margin-top: 40px;">${goodsBean.goods_des}</p>
						<form:form action="${root}cart/add_cart" modelAttribute="CartBean">
							<div class="input-group mb-3" style="margin-top: 40px;">
								<span class="input-group-text" id="basic-addon1">구매수량 : </span>
								<form:input path="goods_quantity" class="form-control"
									name="goods_quantity" aria-describedby="basic-addon1" value="1" />
								<form:input type="hidden" path="goods_idx" name="goods_idx"
									value="${goodsBean.goods_idx}"></form:input>
							</div>
							<div class="form-group">
								<div class="text-right" style="margin-top: 60px;">
									<button type="submit" class="btn btn-primary"
										style="color: #ffffff;">장바구니</button>
									<a href="${root}cart/cartlist"
										class="btn btn-danger" style="color: #ffffff;">상품구매</a>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>


