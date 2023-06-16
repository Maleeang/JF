<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

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
<style>
.menu-category li{
	list-style-type: none;
  	margin-bottom:15px;
}
.menu-category li a {
  	text-decoration-line: none;
	color: black !important;
	font-weight: 500;

}
.menu-category li a:hover {
  	text-decoration-line: none;
	color: #0056b3 !important;
	font-weight: 500;

}
h3{
	color:#59ab6e;
}
</style>
</head>
<body>
	<!-- 상단 매뉴부분 -->
	<c:import url="/WEB-INF/views/include/menu.jsp" />

	<!-- 본문 -->
    <section class="section-main bg padding-y">
    <div class="container">
    
    <div class="row" style="margin-top:40px;">
        <aside class="col-md-4" >
            <nav class="card">
            	<h3 style="margin-left:30px; margin-top:30px; margin-bottom:30px;">Category</h3>
                <ul class="menu-category">
                    <li><a href="${root}search/category?category=Jewelry&Accessories">Jewelry&Accessories</a></li>
                    <li><a href="${root}search/category?category=Clothing">Clothing</a></li>
                    <li><a href="${root}search/category?category=Art&Collection">Art&Collection</a></li>
                    <li><a href="${root}search/category?category=Others">Others</a></li>
                    <li><a href="${root}search/allgoods">All Goods</a></li>
                </ul>
            </nav>
        </aside> 
        <div class="col-md-8">
            <article class="banner-wrap">
                <img src="${root}image/banner.jpg" class="w-100 rounded" style="max-height:400px">
            </article>
        </div> 
    </div> 
    </div> 
    </section>

    <section class="section-name padding-y-sm">
    <div class="container" style="margin-top:150px;">
    
    <header class="section-heading">
        <h3 class="section-title" style="margin-bottom:60px">${question}의 검색결과</h3>
    </header><!-- sect-heading -->
    
        
    <div class="row">
		<c:forEach var="result" items="${resultGoods}">
			<div class="col-lg-4" style="margin-top: 25px;">
				<a
					href="${root}shop/goods_detail?goods_idx=${result.getGoods_idx()}"><img
					src="${root}upload/${result.getGoods_picture()}"
					style="width: 100%; height: 450px !important"></a>
				<div class="text-center" style="margin-top: 20px;">
					<a
						href="${root}shop/goods_detail?goods_idx=${result.getGoods_idx()}"
						style="font-size: 30px; color:black !important;">${result.getGoods_name()}</a>
					<p class="card-text"
						style="font-size: 20px; font-weight: 500; margin-top: 10px;">&#8361;${result.getGoods_price()}</p>
				</div>
			</div>
		</c:forEach>
    </div> 
    
    </div>
    </section>


	
	<!-- 하단 푸터부분 -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>