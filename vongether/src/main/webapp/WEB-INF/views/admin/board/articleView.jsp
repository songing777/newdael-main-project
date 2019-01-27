<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script src="/resources/admin/js/board/articleView.js"></script>

<!-- start: Content -->
<div class="article-v1">
	<div class="panel box-shadow-none content-header">
		<div class="panel-body">
			<div class="col-md-12">
				<h3 class="animated fadeInLeft">게시글 관리</h3>
				<p class="animated fadeInDown">
					게시글 상세
				</p>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="panel">
			<div class="pull-right article-v1-time">
				<em> ${article.bRegdate }</em>
			</div>
			<div class="panel-body">
				<div class="col-md-12 text-center article-v1-title"><h2>${article.bTitle }</h2></div>
				<div class="col-md-12  article-v1-body">
					<input type="hidden" id="bNo" value="${article.bNo }">
					<span class="pull-right">
						${article.mId }
					</span>
					<p>${article.bContent }</p>
				</div>
				<div class="col-md-offset-10 col-md-2  colpull-right">
					<button id="articleDelBtn" class="btn btn-danger">삭제</button>
				</div>
				<div><hr></div>
				<div class="col-md-12 article-v1-footer">
					<div class="col-md-12 article-v1-comment">
 						<h3><b>Comment:</b></h3>
						<div class="media">
							<div class="media-left">
								<a href="#">
									<img src="/resources/admin/img/avatar2.png" class="media-object card-v10-avatar"/>
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">작성자</h4>
								<p>댓글내용이지롱</p>
								<p>2019-01-14</p>
								<span><button class="btn btn-info">수정</button><button class="btn btn-danger">삭제</button></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end: content -->	
	
