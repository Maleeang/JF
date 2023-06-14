<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<script>
	alert('메세지를 보냈습니다!')
	location.href = "${root}shop/myShop?user_idx=${user_idx}"
</script>
