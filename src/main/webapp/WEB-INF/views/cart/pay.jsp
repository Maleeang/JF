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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<!-- 상단 매뉴부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp" />
	
	<!-- 본문 -->
	<div class="d-flex justify-content-center" style="margin-top: 80px">
		<h2>결제정보</h2>
	</div>
	<div class="d-flex justify-content-center">

		<form action="${root}cart/pay_pro" method="post">
			<input type="text" name="name" placeholder="받으시는분"
				required="required"><br /> <input id="member_post"
				type="text" placeholder="코드" required="required" readonly><br />
			<input id="member_addr" name="adress" type="text"
				placeholder="도로명,지번주소" required="required" readonly>
			<button type="button" onclick="findAddr()">주소찾기</button>
			<br /> <input type="text" name="detail_adress" placeholder="상세주소"><br />
			<input type="number" name="phone" placeholder="연락처"
				required="required"><br />
			<div class="text-right">
				<b style="text-align: right;">총액 : ${totalprice}</b><br />
				<button class="button" id="submitButton" type="submit">결제</button>
			</div>
		</form>
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