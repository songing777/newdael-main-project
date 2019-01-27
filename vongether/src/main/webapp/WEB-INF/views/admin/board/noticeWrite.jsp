<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="/resources/admin/js/board/noticeWrite.js"></script>
<div class="panel box-shadow-none content-header">
	<div class="panel-body">
		<div class="col-md-12">
			<h3 class="animated fadeInLeft">공지사항 관리</h3>
			<p class="animated fadeInDown">
				공지사항 작성
			</p>
		</div>
	</div>
</div>

<div class="col-md-12">
	<div class="panel">
		<div class="panel-body">
			<form action="/admin/board/noticewrite.do" method="post">
				<div class="row">
					<div class="form-group">
						<h4 class="col-sm-1 control-label text-left"><b>제목 : </b></h4>
						<div class="col-sm-11"><input type="text" id="title" name="bTitle" class="form-control"></div>
					</div>
				</div>
				<div><textarea id="summernote" name="bContent"></textarea></div>
				<div class="pull-right">
					<button type="submit" class="btn btn-primary">작성</button>
				</div>
			</form>
		</div>
	</div>
</div>
