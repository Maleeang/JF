<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<script>
	alert('상품이 등록되었습니다!')
	location.href = "${root}shop/myShop?user_idx=${loginUserBean.user_idx}"
</script>
