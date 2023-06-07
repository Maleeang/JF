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
									<a href="${root}cart/cartlist" class="btn btn-danger"
										style="color: #ffffff;">상품구매</a>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-6" style="margin-top: 20px">
				<div class="card shadow">
					<div class="card-body">
						<h4 class="card-title">Review</h4>
						<table class="table table-hover" id="board_list">
							<thead>
								<tr>
									<th class="text-center w-25">별점</th>
									<th>내용</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="review" items="${reviewList}">
									<tr>
										<td class="text-center">${review.review_score}</td>
										<th>${review.review_content}</th>
										<td>${review.user_name}<br> <c:if
												test="${review.user_idx == loginUserBean.user_idx}">
												<a
													href="${root}shop/delete_review?review_idx=${review.review_idx}&goods_idx=${review.goods_idx}">삭제하기</a>
											</c:if></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
						<form:form action="${root}shop/write_review"
							modelAttribute="ReviewBean">
							<form:select path="review_score" class="custom-select my-select">
								<option>⭐⭐⭐⭐⭐</option>
								<option>⭐⭐⭐⭐</option>
								<option>⭐⭐⭐</option>
								<option>⭐⭐</option>
								<option>⭐</option>
							</form:select>
							<form:textarea rows="1" cols="40" path="review_content"></form:textarea>
							<form:input type="hidden" path="goods_idx" name="goods_idx"
								value="${goodsBean.goods_idx}"></form:input>
							<button type="submit" class="btn btn-primary">리뷰쓰기</button>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-lg-6" style="margin-top: 20px">
				<div class="card shadow">
					<div class="card-body">
						<h4 class="card-title">Meet your seller</h4>
						<div class="row">
							<div class="col-lg-4">
								<img src="${root}upload/${shopBean.shop_picture}" width="100%">
							</div>
							<div class="col-lg-8">
								<p>${shopBean.shop_name}</p>
								<a href="${root}shop/myShop?user_idx=${goodsBean.user_idx}">판매자 상점 방문하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>


