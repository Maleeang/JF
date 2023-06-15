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
<link rel="stylesheet" href="${root}css/templatemo.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
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
<style>

</style>
</head>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp"/>

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 shop-box">
				<div class="col-lg-12 shop-title">
					Modify Shop
				</div>
				<div class="col-sm-12 shop-form">
					<div class="col-sm-12 shop-form">
						<form:form action="${root}shop/modify_myshop_pro" modelAttribute="modifyShopBean" enctype="multipart/form-data">
							<div class="form-group">
								<form:label class="form-control-label" path="shop_name">상점 이름</form:label> <form:input path="shop_name" class="form-control" />
								<form:errors path="shop_name"/>
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="category" style="margin-bottom:15px;">카테고리</form:label><br>
        						<form:select path="category">
						          <option>Jewelry&Accessories</option>
						          <option>Clothing</option>
						          <option>Art&Collection</option>
						          <option>Other</option>
						        </form:select>
							</div>	
							<div class="form-group">
								<form:label class="form-control-label" path="description">상점 소개</form:label>
								<form:textarea path="description" class="form-control content"
									rows="10" />
								<form:errors path='description' style='color:red' />
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="upload_file">상점 이미지</form:label>
								<form:input type='file' path='upload_file' class="form-control"
									accept="image/*" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-outline-primary">수정하기</button>
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


