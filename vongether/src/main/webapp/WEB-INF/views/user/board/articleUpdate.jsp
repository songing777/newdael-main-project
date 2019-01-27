<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/board/pageBoardUpdate.js"></script>

<div class="container" style="padding-top: 30px; padding-bottom: 60px;">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
			<h2>게시판</h2>
			<p><span>게시글 수정</span></p>
		</div>
	</div>

	<div class="row">
		<div>
			<form id="updateForm" name="updateForm" method="post" action="">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-xs-12">
						<input type="hidden" id="bNo" name="bNo" value="${article.bNo}"/>
						<div class="row">
							<div class="col-lg-1 col-md-1 col-xs-1">
								<span><h3>제목</h3></span>
							</div>
							<div class="col-lg-11 col-md-11 col-xs-11">
								<input id="writeTitleBox" name="bTitle" class="writeTitleBox form-control" value="${article.bTitle}">
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-xs-12" >
						<textarea id="summernote" name="bContent" class="writeContentBox">${article.bContent}</textarea>
					</div>
				</div>
				<div class="row writeBtnBox pull-right">
					<button type="button" id="writeOKBtn" class="btn btn-primary">글수정</button>
					<button type="button" id="writeCancelBtn" class="btn btn-warning">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>