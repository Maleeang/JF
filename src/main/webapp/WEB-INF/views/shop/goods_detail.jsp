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
<style>
</style>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp" />


	<div class="container" style="margin-top: 50px">
		<h6>${goodsBean.goods_category}&nbsp;&raquo;&raquo;
			${goodsBean.goods_name}</h6>
		<div class="row" style="margin-top: 50px">
			<div class="col-sm-5" style="margin-right: 30px;">
				<div class="card shadow" style="height: 400px;">
					<img src="${root}upload/${goodsBean.goods_picture}" width="100%"
						height="100%" style="border-radius:15px"/>
				</div>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">
				<h3 style="border-bottom: solid 1px #ccc; padding-bottom: 15px">${goodsBean.goods_name}</h3>
				<h6 style="margin-top: 20px; font: bold">
					<b>상세설명</b>
				</h6>
				<p style="margin-top: 15px; margin-left: 10px">${goodsBean.goods_des}</p>
				<p style="text-align: right; margin-top: 60px;">가격 &raquo;
					${goodsBean.goods_price} 원</p>
				<form:form action="${root}cart/add_cart" modelAttribute="CartBean">
					<div class="input-group mb-3" style="margin-top: 40px;">
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"
								style="background-color: white !important; border: none; border-bottom: solid 1px; border-radius: 0px">수량
								&raquo; </span>
							<form:input path="goods_quantity" class="form-control"
								name="goods_quantity" aria-describedby="basic-addon1" value="1"
								id="result"
								style="background-color:white !important; border:none; border-bottom:solid 1px; border-radius:0px" />
							<input class="btn btn-outline-secondary" type="button"
								onClick='count("plus");' value="+"
								style="background-color: white !important; border: none; border-bottom: solid 1px; border-radius: 0px"></input>
							<input class="btn btn-outline-secondary" type="button"
								onClick='count("minus"); return false;' value="-"
								style="background-color: white !important; border: none; border-bottom: solid 1px; border-radius: 0px"></input>
						</div>
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
			<div class="col-sm-1"></div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-5" style="margin-top: 40px">
				<h4	style="border-bottom: solid 1px #ccc; padding-bottom: 15px;">Review</h4>
				<c:forEach var="review" items="${reviewList}">
					<div style="border-bottom: solid 1px #ccc">
						<p>${review.review_score}</p>
						<p>${review.review_content}</p>
						<p>
							작성자&nbsp;&raquo;&nbsp;${review.user_name}&nbsp;
							<c:if test="${review.user_idx == loginUserBean.user_idx}">
								<a
									href="${root}shop/delete_review?review_idx=${review.review_idx}&goods_idx=${review.goods_idx}">삭제하기</a>
							</c:if>
						</p>
					</div>
				</c:forEach>
				<form:form action="${root}shop/write_review"
					modelAttribute="ReviewBean">
					<div class="row" style="margin-top: 20px; margin-left: 0px">
						<form:select path="review_score" class="custom-select my-select"
							style="width:160px;">
							<option>⭐⭐⭐⭐⭐</option>
							<option>⭐⭐⭐⭐</option>
							<option>⭐⭐⭐</option>
							<option>⭐⭐</option>
							<option>⭐</option>
						</form:select>
						<form:input path="review_content" style="width:285px;"></form:input>
					</div>
					<form:input type="hidden" path="goods_idx" name="goods_idx"
						value="${goodsBean.goods_idx}"></form:input>
					<div class="text-right" style="margin-top:15px">
						<button type="submit" class="btn btn-dark" style="border-radius:24px; min-width: 150px;">리뷰쓰기</button>
					</div>

				</form:form>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-5" style="margin-top: 35px; margin-left:30px">
				<h4 style="border-bottom: solid 1px #ccc; padding-bottom: 15px;">Meet your seller</h4>
				<div class="row" style="margin-top: 20px;">
					<div class="col-lg-4">
						<img src="${root}upload/${shopBean.shop_picture}" width="100%" style="border-radius:15px">
					</div>
					<div class="col-lg-8">
						<h6>Shop Name</h6>
						<p style="margin-top:15px">${shopBean.shop_name}</p>
						<a type="button" class="btn btn-dark" href="${root}message/send?receiver_idx=${goodsBean.user_idx}" style="border-radius:24px; min-width: 100px; width:100% !important; margin-top:50px">메세지보내기</a>
						<a type="button" class="btn btn-dark" href="${root}shop/myShop?user_idx=${goodsBean.user_idx}" style="border-radius:24px; min-width: 100px; width:100% !important; margin-top:50px">판매자
							상점 방문하기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>

	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<script>
		//수량 증가, 감소 버튼
		function count(type) {
			const input = $('#result');

			let number = input.val();

			if (type === 'plus') {
				number = parseInt(number) + 1;
			} else if (type === 'minus') {
				if (number <= 1) {

				} else {
					number = parseInt(number) - 1;
				}

			}

			input.attr('value', number);
		}
	</script>
</body>
</html>


