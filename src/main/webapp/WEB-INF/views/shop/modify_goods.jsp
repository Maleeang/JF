<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
   	form span { color: coral;  }  
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link href="${root}css/shop.css" rel="stylesheet">
<link rel="stylesheet" href="${root}css/templatemo.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
</head>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp"/>

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 shop-box">
				<div class="col-lg-12 shop-title">
					Modify Goods
				</div>
				<div class="col-sm-12 shop-form">
					<div class="col-sm-12 shop-form">
						<form:form action="modifyGoods_pro?goods_idx=${goodsBean.goods_idx}" modelAttribute="modifyGoodsBean" enctype="multipart/form-data">
							<div class="form-group">
								<form:label class="form-control-label" path="goods_name">상품명</form:label> <form:input path="goods_name" class="form-control" value="${goodsBean.goods_name}"/>
								<form:errors path="goods_name"/>
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="goods_price">상품가격</form:label> <form:input path="goods_price" class="form-control" value="${goodsBean.goods_price}"/>
								<form:errors path="goods_price"/>
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="goods_category" style="margin-bottom:15px">카테고리</form:label><br>
        						<form:select path="goods_category">
						          <option>Jewelry&Accessories</option>
						          <option>Clothing</option>
						          <option>Art&Collection</option>
						          <option>Other</option>
						        </form:select>
							</div>	
							<div class="form-group">
								<form:label class="form-control-label" path="goods_des">상품 소개</form:label>
								<form:textarea path="goods_des" class="form-control content"
									rows="10" style="resize:none" placeholder = "${goodsBean.goods_des }"/>
								<form:errors path='goods_des' style='color:red' />
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="goods_file">상품 이미지</form:label>
								<form:input type='file' path='goods_file' class="form-control"
									accept="image/*" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-outline-primary">상품수정</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp"/>

</body>
</html>


