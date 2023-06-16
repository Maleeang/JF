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
<title>Join Floor</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="${root}css/templatemo.css"/>
<link href="${root}css/sign.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
input{
	margin-bottom:10px;
	width:100%;
	height:40px;
}
</style>
</head>
<body>
	<!-- 상단 매뉴부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp" />

	<!-- 본문 -->
	<div class="container" style="margin-top: 100px; height:585px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 sign-box">
				<div class="col-lg-12 sign-title">
					결제정보
				</div>
				<div class="col-lg-12 sign-form">
					<div class="col-lg-12 sign-form">
						<form:form action="${root}cart/pay_pro" modelAttribute="PayBean">
							<div class="form-group">
								<form:label class="form-control-label" path="name">이름</form:label> <form:input path="name" class="form-control" />
								<form:errors path="name"/>
							</div>
							<div class="form-group">
								<label class="form-control-label">주소코드</label>
								<div class="input-group">
									<input id="member_post" 
										class="form-control" required="required" readonly onclick="findAddr()"/>
									<div class="input-group-append">
										<button onclick="findAddr()" type="button" class="btn btn-outline-primary">주소찾기</button>
									</div>
								</div>
							</div>	
							<div class="form-group">
								<form:label class="form-control-label" path="address" >주소</form:label> 
								<form:input id="member_addr" path="address" class="form-control" required="required" onclick="findAddr()"/>								
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="detail_address">상세주소</form:label> 
								<form:input type="text" path="detail_address" class="form-control" />
							</div>
							<div class="form-group">
								<form:label class="form-control-label" path="phone">연락처</form:label> 
								<form:input type="text" path="phone" class="form-control" />
							</div>							
							<span>${msg}</span>
							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-outline-primary">결제완료</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<!-- 하단 푸터부분 -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<!-- 카카오 주소찾기 API -->
	<script>
		function findAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							console.log(data);

							var roadAddr = data.roadAddress;
							var jibunAddr = data.jibunAddress;

							document.getElementById('member_post').value = data.zonecode;
							if (roadAddr !== '') {
								document.getElementById("member_addr").value = roadAddr;
							} else if (jibunAddr !== '') {
								document.getElementById("member_addr").value = jibunAddr;
							}
						}
					}).open();
		}
	</script>
</body>
</html>