<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<script>
	alert('인증에 실패했습니다. 다시 시도해주세요')
	location.href = "${root}user/emailcheck"
</script>
