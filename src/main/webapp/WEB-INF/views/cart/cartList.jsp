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
<link rel="stylesheet" href="${root}css/templatemo.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
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
		<h3 style="margin-bottom: 18px"><img src="${root}image/cart.png" style="width:20px; height:30px; margin-right:10px; padding-bottom:5px;">Cart Item</h3>
		<div class="row">
			<div class="col-sm-7">
				<c:forEach var="item" items="${cartList}">
					<div class="row"
						style="margin-bottom: 30px; border-top: solid 1px #ccc; padding-top: 20px">
						<div class="col-md-4">
							<img src="${root}upload/${item.getGoods_picture()}"
								style="width: 50%">
						</div>
						<div class="col-md-3">
							<h5>
								<b>${item.getGoods_name()}</b>
							</h5>
							<p style="padding-top: 20px">수량 :
								${item.getGoods_quantity()}개
							<p>합계 : ${item.getTotal_price()}원</p>
						</div>
						<div class="col-md-2"></div>
						<div class="col-md-2 row align-items-center">
							<a href="${root}cart/delete_cart?cart_idx=${item.getCart_idx()}"
								class="btn btn-secondary" role="button"
								style="text-align: center; border-radius:24px;">삭제하기 &raquo;</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3" style="margin-right: 30px;">
				<h4 style="margin-bottom: 30px">Payment</h4>
				<div class="form-check"
					style="border-top: solid 1px #ccc; margin-bottom: 8px; padding-top: 8px">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" id="flexRadioDefault1"> <label
						class="form-check-label" for="flexRadioDefault1"> 신용카드</label>
				</div>
				<div class="form-check"
					style="border-top: solid 1px #ccc; margin-bottom: 8px; padding-top: 8px">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" id="flexRadioDefault2" checked> <label
						class="form-check-label" for="flexRadioDefault2"> 휴대폰 결제</label>
				</div>
				<div class="form-check"
					style="border-top: solid 1px #ccc; margin-bottom: 8px; padding-top: 8px">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" id="flexRadioDefault2" checked> <label
						class="form-check-label" for="flexRadioDefault2"> 무통장입금</label>
				</div>
				<div class="form-check"
					style="border-top: solid 1px #ccc; margin-bottom: 8px; padding-top: 8px">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" id="flexRadioDefault2" checked> <label
						class="form-check-label" for="flexRadioDefault2"> 기타 결제</label>
				</div>
				<div class="text-right" style="margin-top: 40px">
					<h5>총액 : ${totalprice}원</h5>
				</div>
				<div class="text-center" style="margin-top: 70px">
					<a href="${root}cart/pay?totalprice=${totalprice}"
						class="btn btn-dark" role="button" style="border-radius:24px; min-width: 100px; width:100% !important;" >결제하기 &raquo;</a>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<!-- 하단 푸터부분 -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>