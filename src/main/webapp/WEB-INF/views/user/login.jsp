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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
.login-title {
    margin-top: 15px;
    text-align: center;
    font-size: 30px;
    letter-spacing: 2px;
    margin-top: 15px;
    font-weight: bold;
    color: #6C6C6C;
}

.login-form {
    margin-top: 25px;
    text-align: left;
}

.login-form input[type=text] {

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

.login-form input[type=password] {

    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    padding-left: 0px;
    margin-bottom: 20px;
    color: #6C6C6C;
}

.form-group {
    margin-bottom: 40px;
    outline: 0px;
}

.form-control input:focus {
    border-color: inherit;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-bottom: 2px solid #0DB8DE;
    outline: 0;
    color: #6C6C6C;
}

.login-form input:focus {
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
    color: #0DB8DE;
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


	<div class="container" style="margin-top: 100px; height:585px">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4 login-box">
				<div class="col-lg-12 login-key">
				
				</div>
				<div class="col-lg-12 login-title">
					Login
				</div>
				<div class="col-lg-12 login-form">
					<div class="col-lg-12 login-form">
						<c:if test="${param.fail==true}">
						<div class="alert alert-danger">
							<h3>로그인 실패</h3>
							<p>아이디 비밀번호를 확인해주세요</p>
						</div>
						</c:if>
						<form:form action="${root }user/login_pro" modelAttribute="loginBean">
							<div class="form-group">
								<form:label class="form-control-label" path="user_id">Id</form:label> 
								<form:input path="user_id" class="form-control"/>
								<form:errors path="user_id" style="color:coral"/>
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="user_pw">Password</form:label>
								<form:input path="user_pw" class="form-control" type="password"/>
								<form:errors path="user_pw" style="color:coral"/>
							</div>

							<div class="form-group text-right">
								<a href="${root}user/emailcheck" style="margin-right:50px;">아이디/비밀번호찾기</a>
								<button type="submit" class="btn btn-outline-primary">로그인</button>

							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp"/>

</body>
</html>


