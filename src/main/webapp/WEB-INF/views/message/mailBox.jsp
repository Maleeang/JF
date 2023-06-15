<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>JF</title>
<!-- Bootstrap CDN -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="${root}css/sidebar.css">
<link rel="stylesheet" href="${root}css/templatemo.css">
<style type="text/css">
form span {
	color: coral;
}

.bd-sidebar {
	position: sticky;
	top: 4rem;
	z-index: 1000;
	height: calc(100vh - 4rem);
	background: #ffffff;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 220px;
}

.bd-sidebar .nav {
	display: block;
	margin-top: 100px;
}

/* .bd-sidebar .nav>li>a {
		display: block;
		padding: .25rem 1.5rem;
		font-size: 90%;
		margin-top: 25px
	} */
a {
	color: black;
}

main li {
	margin-bottom: 15px;
}

main {
	background: #edf1f5;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid transparent;
	border-radius: 0;
}

.mailbox-widget .custom-tab .nav-item .nav-link {
	border: 0;
	color: #fff;
	border-bottom: 3px solid transparent;
}

.mailbox-widget .custom-tab .nav-item .nav-link.active {
	background: 0 0;
	color: #fff;
	border-bottom: 3px solid #2cd07e;
}

.no-wrap td, .no-wrap th {
	white-space: nowrap;
}

.table td, .table th {
	padding: .9375rem .4rem;
	vertical-align: top;
	border-top: 1px solid rgba(120, 130, 140, .13);
}

.font-light {
	font-weight: 300;
}

span {
	display: inline-block;
	vertical-align: middle;
}
.navbar{
margin-bottom:0px;
}
#footer{
margin-top:0px !important;
}
#align{
background: #edf1f5;
}
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
	<c:import url="/WEB-INF/views/include/menu.jsp" />


		<div class="d-flex w-100">
			<!-- 사이드바 -->
				<nav id="sidebar" style="min-height:1000px; padding-top:100px;">
					<div class="p-4 pt-5">
						<a href="#" class="img logo rounded-circle mb-5"
							style="background-image: url(${root}upload/${ShopBean.shop_picture});"></a>
						<div class="footer text-center" style="margin-bottom:100px;">
							<p>${ShopBean.shop_name}</p><br>
							<p>${ShopBean.description}</p>
						</div>
						<c:if test="${ShopBean.user_idx==loginUser}">
							<ul class="list-unstyled components mb-5">
								<li><a href="${root}shop/modify_myshop">상점 정보수정</a></li>
								<li><a href="${root}shop/addGoods">상품등록</a></li>
								<li><a href="${root}message/receive">메세지함</a></li>
							</ul>
						</c:if>
					</div>
				</nav>
			<!-- 상품 목록 -->
			<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<div class="container">
					<div class="row" style="margin-top:70px;">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body bg-primary text-white mailbox-widget pb-0">
									<h2 class="text-white pb-3">Your Mailbox</h2>
									<ul class="nav nav-tabs custom-tab border-bottom-0 mt-4"
										id="myTab" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											id="inbox-tab" data-toggle="tab" aria-controls="inbox"
											href="#inbox" role="tab" aria-selected="true"> <span
												class="d-block d-md-none"><i class="ti-email"></i></span> 
										<span class="d-none d-md-block">INBOX</span>
										</a></li>
										<li class="nav-item"><a class="nav-link" id="sent-tab"
											data-toggle="tab" aria-controls="sent" href="#sent"
											role="tab" aria-selected="false"> <span
												class="d-block d-md-none"><i class="ti-export"></i></span> <span
												class="d-none d-md-block">SENT</span>
										</a></li>
									</ul>
								</div>
								<div class="tab-content" id="myTabContent">
									<div class="tab-pane fade active show" id="inbox"
										aria-labelledby="inbox-tab" role="tabpanel">
										<div>
											<div class="row p-4 no-gutters align-items-center">
												<div class="col-sm-12 col-md-6">
													<h3 style="font-weight:500">INBOX</h3>
												</div>
												<div class="col-sm-12 col-md-6">
													<ul class="list-inline dl mb-0 float-left float-md-right">
														<li class="list-inline-item text-info mr-3"><a
															href="#"> </a></li>
													</ul>
												</div>
											</div>
											<!-- Mail list-->
											<div class="table-responsive">
												<table
													class="table email-table no-wrap table-hover v-middle mb-0 font-14">
													<tbody>
														<!-- row -->
														<c:forEach var="msg" items="${msgList}">
															<tr>
																<td><span class="mb-0 text-muted"
																	style="margin-left: 15px !important;">${msg.getMsg_title()}</span></td>
																<!-- Message -->
																<td><span class="text-dark">${msg.getMsg_content()}</span>
																</td>
																<!-- Attachment -->
																<td><span class="text-dark">${msg.getUser_name()}</span></td>
																<!-- Time -->
																<td class="text-muted text-right">${msg.getMessage_date()}</td>
																<td class="pl-1"><a
																	class="btn btn-circle btn-danger text-white text-right"
																	style="padding: 3px !important; padding-right: 5px !important; padding-left: 5px !important; float: right;"
																	href="${root}message/delete?message_idx=${msg.getMsg_idx()}">
																		<i class="fa fa-trash"></i>
																</a></td>
															</tr>
														</c:forEach>

													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="tab-pane fade active show" id="sent"
										aria-labelledby="sent-tab" role="tabpanel">
										<div>
											<div class="row p-4 no-gutters align-items-center">
												<div class="col-sm-12 col-md-6">
													<h3 style="font-weight:500">SENT</h3>
												</div>
												<div class="col-sm-12 col-md-6">
													<ul class="list-inline dl mb-0 float-left float-md-right">
														<li class="list-inline-item text-info mr-3"><a
															href="#"> </a></li>
													</ul>
												</div>
											</div>
											<!-- Mail list-->
											<div class="table-responsive">
												<table
													class="table email-table no-wrap table-hover v-middle mb-0 font-14">
													<tbody>
														<!-- row -->
														<c:forEach var="msg" items="${sentList}">
															<tr>
																<td><span class="mb-0 text-muted"
																	style="margin-left: 15px !important;">${msg.getMsg_title()}</span></td>
																<!-- Message -->
																<td><span class="text-dark">${msg.getMsg_content()}</span>
																</td>
																<!-- Attachment -->
																<td><span class="text-dark">${msg.getUser_name()}</span></td>
																<!-- Time -->
																<td class="text-muted text-right">${msg.getMessage_date()}</td>
																<td class="pl-1"><a
																	class="btn btn-circle btn-danger text-white"
																	style="padding: 3px !important; padding-right: 5px !important; padding-left: 5px !important; float: right;"
																	href="${root}message/delete?message_idx=${msg.getMsg_idx()}">
																		<i class="fa fa-trash"></i>
																</a></td>
															</tr>
														</c:forEach>

													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<div class="col-3 py-md-3 pl-md-5 bd-content" id="align"></div>
		</div>



	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>


