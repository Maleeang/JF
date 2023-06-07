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
</head>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp"/>

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form:form action="${root}shop/join_pro" modelAttribute="joinShopBean" enctype="multipart/form-data">
							<div class="form-group">
								<form:label path="shop_name">상점 이름</form:label> <form:input path="shop_name" class="form-control" />
								<form:errors path="shop_name"/>
							</div>
							<div class="form-group">
								<form:label path="category">카테고리</form:label>
        						<form:select path="category" class="custom-select my-select">
						          <option>Jewelry&Accessories</option>
						          <option>Clothing</option>
						          <option>Art&Collection</option>
						          <option>Other</option>
						        </form:select>
							</div>	
							<div class="form-group">
								<form:label path="description">상점 소개</form:label>
								<form:textarea path="description" class="form-control"
									rows="10" style="resize:none" />
								<form:errors path='description' style='color:red' />
							</div>
							<div class="form-group">
								<form:label path="upload_file">상점 이미지</form:label>
								<form:input type='file' path='upload_file' class="form-control"
									accept="image/*" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-primary">상점등록</button>
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


