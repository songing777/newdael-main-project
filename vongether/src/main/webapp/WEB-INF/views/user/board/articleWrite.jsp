<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/board/pageBoardWrite.js"></script>

<form id="writeForm" action="" method="get">
	<input type="hidden" id="bTitle" name="bTitle" value=""> <input
		type="hidden" id="bContent" name="bContent" value=""> <input
		type="hidden" id="login" name="login" value="">
</form>

<div class="container" style="padding-top: 30px; padding-bottom: 60px;">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
			<h2>게시판</h2>
			<p>
				<span>자유롭게 글을 작성하세요!</span>
			</p>
		</div>
	</div>

	<div class="row">
		<div>
			<form id="writeForm" name="writeForm" method="post" action="">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-xs-12">
						<div class="row">
							<div class="col-lg-1 col-md-1 col-xs-1">
								<span><h3>제목</h3></span>
							</div>
							<div class="col-lg-11 col-md-11 col-xs-11">
								<input id="writeTitleBox" name="bTitle"
									class="writeTitleBox form-control" placeholder="제목을 입력하세요.">
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-xs-12">
						<textarea id="summernote" name="bContent" class="writeContentBox"></textarea>
					</div>
				</div>
				<div class="row writeBtnBox pull-right">
					<button type="button" id="writeOKBtn" class="btn btn-primary">글작성</button>
					<button type="button" id="writeCancelBtn" class="btn btn-warning">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
