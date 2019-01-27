<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="fh5co-page">
	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<h2>추운 겨울 우리의 이웃과 함께 따뜻하게 보내세요.</h2>
				</div>
			</div>
		</div>
	</div>
	<div id="fh5co-featured-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<a href="#" class="featured-grid" style="background-image: url(/resources/base/images/image_1.jpg);">
						<div class="desc">
							<h3>Make with love</h3>
							<span>Mural</span>
						</div>
					</a>
				</div>
				<div class="col-md-6">
					<a href="#" class="featured-grid featured-grid-2" style="background-image: url(/resources/base/images/image_2.jpg);">
						<div class="desc">
							<h3>Deliver your love</h3>
							<span>briquettes</span>
						</div>
					</a>
					<div class="row">
						<div class="col-md-6">
							<a href="#" class="featured-grid featured-grid-2" style="background-image: url(/resources/base/images/image_3.jpg);">
								<div class="desc">
									<h3>Warm Meal</h3>
									<span>a free lunch</span>
								</div>
							</a>
						</div>
						<div class="col-md-6">
							<a href="#" class="featured-grid featured-grid-2" style="background-image: url(/resources/base/images/image_4.jpg);">
								<div class="desc">
									<h3>Warm Winter</h3>
									<span>briquettes</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="fh5co-blog-section" class="fh5co-grey-bg-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>공지사항</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 text-center">
					<div class="blog-inner">
						<div class="desc">
							<h3><a href="/board/view.do?bNo=${notice[0].bNo}">${notice[0].bTitle}</a></h3>
							<p style=" height:95px ;text-overflow: ellipsis;overflow: hidden;">${notice[0].bContent}</p>
							<p><a href="/board/view.do?bNo=${notice[0].bNo}" class="btn btn-primary btn-outline with-arrow">Read More<i class="icon-arrow-right"></i></a></p>
						</div>
					</div>
				</div>
				<div class="col-md-4 text-center">
					<div class="blog-inner">
						<div class="desc">
							<h3><a href="/board/view.do?bNo=${notice[1].bNo}">${notice[1].bTitle}</a></h3>
							<p style=" height:95px ;text-overflow: ellipsis;overflow: hidden;">${notice[1].bContent}</p>
							<p><a href="/board/view.do?bNo=${notice[1].bNo}" class="btn btn-primary btn-outline with-arrow">Read More<i class="icon-arrow-right"></i></a></p>
						</div>
					</div>
				</div>
				<div class="col-md-4 text-center">
					<div class="blog-inner">
						<div class="desc">
							<h3><a href="/board/view.do?bNo=${notice[2].bNo}">${notice[2].bTitle}</a></h3>
							<p style=" height:95px ;text-overflow: ellipsis;overflow: hidden;">${notice[2].bContent}</p>
							<p><a href="/board/view.do?bNo=${notice[2].bNo}" class="btn btn-primary btn-outline with-arrow">Read More<i class="icon-arrow-right"></i></a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="fh5co-client-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>Vongether</h2>
					<p>Vongeter의 의미는 봉사를 뜻하는 Volunteer 와 함께 라는 뜻인 Togetehr 의 합성어 입니다. </p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 text-center">
					<div class="testimony">
						<span class="quote"><i class="icon-quote-right"></i></span>
						<blockquote>
							<p>나눔은 우리를 '진정한 부자'로 만들며 나누는 행위를 통해 자신이 누구이며 또 무엇인지를 발견하게 된다.</p>
							<span>테레사 수녀</span>
						</blockquote>
					</div>
				</div>
				<div class="col-md-6 text-center">
					<div class="testimony">
						<span class="quote"><i class="icon-quote-right"></i></span>
						<blockquote>
							<p>남을 행복하게 하는 것은 향수를 뿌리는 것과 같다. 뿌리는 자에게도 그 향이 묻어나기 때문이다.</p>
							<span>탈무드</span>
						</blockquote>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


