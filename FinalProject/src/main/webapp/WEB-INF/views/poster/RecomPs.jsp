<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Future Imperfect by HTML5 UP</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
		
		<link rel="stylesheet" href="./resources/css/recom_style.css">
		<link rel="stylesheet" href="./resources/css/recom2_styles.css"/>
		<link rel="stylesheet" href="./resources/js/recom_scripts.js">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		 <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
		<style>
			/* Make the image fully responsive */
			.carousel-inner img {
				height: 500px;
				width: 500px;
			}
			</style>
	</head>
	<jsp:include page="../common/menubar.jsp"/>
	
	<script src="./resources/js/recom_main.min.js"></script>
	
	<footer>
		<!-- Portfolio-->
		<section class="content-section" id="portfolio">
			<div class="container px-3 px-lg-4">
					<div class="content-section-heading text-center">
						<header class="bg-dark py-3">
							<h1 class="mb-3" style="color:bisque; font-weight: bolder; font-size:40px !important;">Kind Of Poster</h1>
							<p class="lead fw-normal text-white-50 mb-0" style="color:bisque; font-size:20px;">Enjoy your life with us!</p>
						</header>
					</div>
					<br><br><br>
					<div class="row gx-3" style="flex-direction:row; flex-wrap:wrap;">
							<div class="col-lg-6" style="height: 200px; width: 250px;">
									<a class="portfolio-item" href="list.ps?list=액션"  style="height: 200px; width: 250px;">
											<img class="img-fluid" src="./resources/images/images.jpg" style="height: 200px  width: 100%;"/>
									</a>
							</div>
							<div class="col-lg-6" style="height: 200px; width: 250px;">
									<a class="portfolio-item" href="list.ps?list=멜로/로맨스" style="height: 200px; width: 250px;">
											<img class="img-fluid" src="./resources/images/romance-club-stories-i-play-icon.png"style="height: 200px; width: 100%;"/>
									</a>
							</div>
							<div class="col-lg-6" style="height: 200px; width: 250px;">
									<a class="portfolio-item" href="list.ps?list=코미디" style="height: 200px; width: 250px;">
											<img class="img-fluid" src="./resources/images/Hera-Pheri.jpeg" style="height: 200px; width: 100%;"/>
									</a>
							</div>
							<div class="col-lg-6" style="height: 200px; width: 250px;">
									<a class="portfolio-item" href="list.ps?list=애니메이션" style="height: 200px; width: 250px;">
											<img class="img-fluid" src="./resources/images/1050898-view-conference-2019-celebrating-best-animation-vfx-and-visual-storytelling.jpg" style="height: 200px; width: 100%;" />
									</a>
							</div>
					</div>
				</div>
	</section>
	<section class="news section illustration-section-01">
		<div class="container">
			<div class="news-inner section-inner">
				<div class="section-header center-content">
					<div class="container-xs">
						<h2 class="mt-0 mb-16" style="font-weight: 700; font-family:Inter, sans-serif;">
							Recommend for you!
						</h2>
						<br>
						<p class="mb-0" style="font-weight: 500; font-family:Inter, sans-serif;">
							We recommend based on your preferences.Find all the movies you want and enjoy the benefits!
						</p>
						<br>
					</div>
				</div>
				<div class="tiles-wrap">
					<article class="tiles-item reveal-from-bottom">
						<div class="tiles-item-inner has-shadow">
							<figure class="news-item-image m-0">
								<img
									src="images/news-image-01.jpg"
									alt="News 01"
									width="344"
									height="194"
								/>
							</figure>
							<div class="news-item-content">
								<div class="news-item-body">
									<h3
										class="news-item-title h4 mt-0 mb-8"
									>
										<a href="#"
											>How to build
											anything</a
										>
									</h3>
									<p class="mb-16 text-sm">
										Lorem ipsum dolor sit amet,
										consectetur adipiscing elit,
										sed do eiusmod tempor
										incididunt ut et dolore
										magna aliqua. Ut enim ad
										minim veniam, quis nostrud
										exercitation ullamco laboris
										nisi ut aliquip ex.
									</p>
								</div>
								<div
									class="news-item-more text-xs mb-8"
								>
									<a href="#">Read more</a>
								</div>
							</div>
						</div>
					</article>
					<article
						class="tiles-item reveal-from-bottom"
						data-reveal-delay="200"
					>
						<div class="tiles-item-inner has-shadow">
							<figure class="news-item-image m-0">
								<img
									src="https://nujhrcqkiwag1408085.cdn.ntruss.com/static/upload/movie_poster_images/280x400/movie_76722_1651460799.jpeg"
									alt="News 02"
									width="344"
									height="194"
								/>
							</figure>
							<div class="news-item-content">
								<div class="news-item-body">
									<h3
										class="news-item-title h4 mt-0 mb-8"
									>
										<a href="#"
											>How to build
											anything</a
										>
									</h3>
									<p class="mb-16 text-sm">
										Lorem ipsum dolor sit amet,
										consectetur adipiscing elit,
										sed do eiusmod tempor
										incididunt ut et dolore
										magna aliqua. Ut enim ad
										minim veniam, quis nostrud
										exercitation ullamco laboris
										nisi ut aliquip ex.
									</p>
								</div>
								<div
									class="news-item-more text-xs mb-8"
								>
									<a href="#">Read more</a>
								</div>
							</div>
						</div>
					</article>
					<article
						class="tiles-item reveal-from-bottom"
						data-reveal-delay="400"
					>
						<div class="tiles-item-inner has-shadow">
							<figure class="news-item-image m-0">
								<img
									src="images/news-image-03.jpg"
									alt="News 03"
									width="344"
									height="194"
								/>
							</figure>
							<div class="news-item-content">
								<div class="news-item-body">
									<h3
										class="news-item-title h4 mt-0 mb-8"
									>
										<a href="#"
											>How to build
											anything</a
										>
									</h3>
									<p class="mb-16 text-sm">
										Lorem ipsum dolor sit amet,
										consectetur adipiscing elit,
										sed do eiusmod tempor
										incididunt ut et dolore
										magna aliqua. Ut enim ad
										minim veniam, quis nostrud
										exercitation ullamco laboris
										nisi ut aliquip ex.
									</p>
								</div>
								<div
									class="news-item-more text-xs mb-8"
								>
									<a href="#">Read more</a>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
	</section>

	</footer>

	</html>