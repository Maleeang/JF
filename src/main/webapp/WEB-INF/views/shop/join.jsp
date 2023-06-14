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
<style>
.shop-title {
    margin-top: 15px;
    text-align: center;
    font-size: 30px;
    letter-spacing: 2px;
    margin-top: 15px;
    margin-bottom: 40px;
    font-weight: bold;
    color: #6C6C6C;
}

.shop-form {
    margin-top: 25px;
    text-align: left;
}

.form-group input{
    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    margin-bottom: 20px;
    padding-left: 0px;
    color: #6C6C6C;
}

.shop-form input{

    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    margin-bottom: 20px;
    padding-left: 0px;
    color: #6C6C6C;
}

select{
    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    margin-bottom: 20px;
    padding-left: 0px;
    color: #6C6C6C;
}

.content{
    border: 2px solid #0DB8DE;
    border-radius: 0px;
    margin-bottom: 20px;
    padding-left: 0px;
    font-weight: bold;
    color: #6C6C6C;
    resize:none;
}
.shop-group {
    margin-bottom: 40px;
    outline: 0px;
}

.form-group input:focus {
    border-color: inherit;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-bottom: 2px solid #0DB8DE;
    outline: 0;
    color: #6C6C6C;
}

.shop-form input:focus {
    outline: none;
    box-shadow: 0 0 0;
}

label {
    margin-bottom: 0px;
}

.form-control-label {
    font-size: 15px;
    color: #6C6C6C;
    font-weight: bold;
    letter-spacing: 1px;
}

.btn-outline-primary {
    border-color: #0DB8DE;
    color: #6C6C6C;
    border-radius: 0px;
    font-weight: bold;
    letter-spacing: 1px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.btn-outline-primary:hover {
    background-color: #0DB8DE;
    right: 0px;
}

</style>
</head>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp"/>

	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 shop-box">
				<div class="col-lg-12 shop-title">
					Create Shop
				</div>
				<div class="col-sm-12 shop-form">
					<div class="col-sm-12 shop-form">
						<form:form action="${root}shop/join_pro" modelAttribute="joinShopBean" enctype="multipart/form-data">
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
									rows="10"/>
								<form:errors path='description' style='color:red' />
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="upload_file">상점 이미지</form:label>
								<form:input type='file' path='upload_file' class="form-control"
									accept="image/*" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-outline-primary">상점등록</button>
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


