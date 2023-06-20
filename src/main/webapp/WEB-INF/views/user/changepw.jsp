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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link href="${root}css/sign.css" rel="stylesheet">
<link rel="stylesheet" href="${root}css/templatemo.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
</head>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp" />

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 sign-box">
				<div class="col-lg-12 sign-title">
					비밀번호 변경
				</div>
				<div class="col-lg-12 sign-form">
					<div class="col-lg-12 sign-form">
						<form:form action='${root }user/changepw_pro' method='post'
							modelAttribute="changePwUserBean">
							<div class="form-group">
								<form:label class="form-control-label" path="user_pw">비밀번호</form:label>
								<form:input type="password" path="user_pw" class='form-control'
									showPassword="true" />
								<form:errors path='user_pw' style='color:coral' />
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="user_pw2">비밀번호 확인</form:label>
								<form:input type="password" path="user_pw2" class='form-control'
									showPassword="true" />
								<form:errors path='user_pw2' style='color:coral' />
								<form:input type="hidden" path="user_id" class='form-control' value="${user_id}"
									showPassword="true" />
								<form:input type="hidden" path="user_email" class='form-control' value="${email}"
									showPassword="true" />
							</div>
							<div style="color: coral">${msg }</div>
							<div class="form-group">
								<div class="text-right">
									<form:button class='btn btn-outline-primary'>비밀번호 변경</form:button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>


