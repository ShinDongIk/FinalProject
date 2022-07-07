<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Future Imperfect by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body class="is-preload">
		<c:if test="${not empty alertMsg}">
			<script>
				alert("${alertMsg}");
			</script>
			<c:remove var="alertMsg"/>
		</c:if>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="${pageContext.request.contextPath}">ENJOY OTT</a></h1>
						<nav class="links">
							<ul>
								<li><a href="#">로그인/로그아웃</a></li>
								<li><a id="nickName" onClick="memModalOpen();">xxx님 !</a><a id="nickNeText">환영합니다!</a></li>
								<li><a href="#">등급: 골드</a></li>
								<li><a href="#">마이페이지</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
						<!--  
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>
						-->
						<!-- Links -->
							<section>
								<ul class="links">
									<li><a href="${pageContext.request.contextPath}">홈으로</li>
									<li><a href="">파티원 모여라!</a></li>
									<li><a href="">테마별 작품 정보</a></li>
									<li><a href="watch.ra">OTT별 가격정보</a></li>
									<li><a href="#">OTT별 인기순위</a></li>
									<li>
										<span class="opener">여기는 고객센터!</span>
										<br><br>
										<ul>
											<li class="list-Style-None"><a href="#">공지 합니다!</a></li>
											<li class="list-Style-None"><a href="#">자주 묻는 질문들이에요!</a></li>
											<li class="list-Style-None"><a href="#">문의 하고 싶어요!!</a></li>
										</ul>
									</li>
								</ul>
							</section>

					</section>

			</div>
			
			<jsp:include page="memberModal.jsp"/>
			
		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/js/main.js"></script>

	</body>
</html>