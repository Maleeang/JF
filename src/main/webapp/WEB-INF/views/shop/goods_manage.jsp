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
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label>상품명</label> <input class="form-control"
								value="${goodsBean.goods_name}" disabled="disabled" />
						</div>
						<div class="form-group">
							<label>상품가격</label> <input class="form-control"
								value="${goodsBean.goods_price}" disabled="disabled" />
						</div>
						<div class="form-group">
							<label>카테고리</label> <input class="form-control"
								value="${goodsBean.goods_category}" disabled="disabled" />
						</div>
						<div class="form-group">
							<label>상품 소개</label>
							<textarea class="form-control" rows="10" style="resize: none"
								disabled="disabled">${goodsBean.goods_des}</textarea>
						</div>
						<div class="form-group">
							<label>상품 이미지</label> <img
								src="${root}upload/${goodsBean.goods_picture}" width="100%" />
						</div>
						<div class="form-group">
							<div class="text-right">
								<a href="${root}shop/modify_goods?goods_idx=${goodsBean.goods_idx}" class="btn btn-primary" style="color: #ffffff;">상품수정</a>
								<a href="${root}shop/delete_goods?goods_idx=${goodsBean.goods_idx}" class="btn btn-danger" style="color: #ffffff;">상품삭제</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>


