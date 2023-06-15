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
	<div class="container">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4" style="margin-top:80px;">
				<h4 style="border-bottom:solid 1px #ccc;  padding-bottom:12px;">결제정보</h4>
				<div style="margin-top:30px">
					<form action="${root}cart/pay_pro" method="post">
						<input type="text" name="name" placeholder="받으시는분"
							required="required" onclick="findAddr()"><br/> 
						<input id="member_post"
							type="text" placeholder="코드" required="required" readonly onclick="findAddr()"><br />
						<div class="input-group" style="padding-bottom:0px;">
							<input id="member_addr" name="adress" type="text"
							placeholder="도로명,지번주소" required="required" readonly style="width:70% !important;">
							<button type="button" onclick="findAddr()" class="btn btn-dark" style="width:30% !important; height:40px;">주소찾기</button>
						</div>
 						<input type="text" name="detail_adress" placeholder="상세주소"><br />
						<input type="number" name="phone" placeholder="연락처"
							required="required"><br />
						<div class="text-right" style="border-top:solid 1px #ccc; padding-top:15px; margin-top:18px;">
							<h5>결제금액&nbsp;&raquo;&nbsp;${totalprice}원</h5>
							<button class="button btn btn-dark" id="submitButton" type="submit" style="width:100%; border-radius:5px; margin-top:10px;">결제하기</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-4"></div>
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