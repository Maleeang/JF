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
<link rel="stylesheet" href="${root}css/templatemo.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
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
h3{
	color:#59ab6e;
}
</style>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp" />


	<div style="padding-top: 50px; padding-bottom:80px; background-color:#efefef">
		<div class="container">
			<h6>${goodsBean.goods_category}&nbsp;&raquo;&raquo;${goodsBean.goods_name}</h6>
			<div class="row" style="margin-top: 50px">
				<div class="col-sm-5" style="margin-right: 30px;">
					<div class="card shadow" style="height: 400px;">
						<img src="${root}upload/${goodsBean.goods_picture}" width="100%"
							height="100%" style="border-radius:15px"/>
					</div>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-5">
					<h2 style="">${goodsBean.goods_name}</h2>
					<h4 style="margin-top: 20px; border-bottom: solid 1px #ccc; padding-bottom: 15px">&#8361;${goodsBean.goods_price}</h4>
					<h6 style="margin-top: 20px; font: bold">
						<b>Description</b>
					</h6>
					<b style="margin-top: 30px; margin-left: 10px">${goodsBean.goods_des}</b>
					<form:form action="${root}cart/add_cart" modelAttribute="CartBean">
						<div class="input-group mb-3" style="margin-top: 40px;">
							<form:input type="hidden" path="goods_idx" name="goods_idx"
								value="${goodsBean.goods_idx}"></form:input>
						</div>
						<div class="form-group">
							<div class="row" style="margin-top: 60px;">
								<a href="${root}shop/modify_goods?goods_idx=${goodsBean.goods_idx}" class="btn btn-primary"
									style="color: #ffffff; width:50%">수정하기</a>
								<a href="${root}shop/delete_goods?goods_idx=${goodsBean.goods_idx}" class="btn btn-danger"
									style="color: #ffffff; width:50%;">삭제하기</a>
							</div>
						</div>
					</form:form>
				</div>
				<div class="col-sm-1"></div>
			</div>	
		</div>			
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-5" style="margin-top: 40px">
				<h3	style="border-bottom: solid 1px #ccc; padding-bottom: 15px;">Review</h3>
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
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-5" style="margin-top: 35px; margin-left:30px">
			</div>
			<div class="col-lg-1"></div>
		</div>

	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>


