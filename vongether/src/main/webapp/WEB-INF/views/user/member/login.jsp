<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/member/customHeader.css" rel="stylesheet" type="text/css" />

<div id="fh5co-page">
	<div class="container">
		<div class="row">
			<div class="custom-header col-lg-12">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">
					<h2>로그인</h2>
				</div>
				<div class="col-lg-3"></div>
			</div>
		</div>
		
		<div class="row">
			<div class="login-body col-lg-12">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">
					<form class="form-signin" action="login.do" method="post">
						<fieldset>
							<div class="row">
								<input type="text" class="form-control" name="mId" id="inputEmail" placeholder="아이디(이메일)" required="true">
								<input type="password" class="form-control" name="mPwd" id="inputPassword" placeholder="비밀번호" required="true">
							</div>
							<div class="row col-lg-offset-7 col-lg-6">
								<span><a href="/member/findId.do">아이디 찾기</a></span>
								<span>/</span>
								<span><a href="/member/findPwd.do">비밀번호 찾기</a></span>
							</div>
						
							<div class="row form-group">
								<button class="btn btn-large btn-warning form-control active" type="submit"><span>로그인</span></button>
							</div>
							<div class="row form-group">
								<a href="/member/join.do" class="btn btn-large btn-primary form-control active">회원가입</a>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="col-lg-3"></div>
			</div>
		</div>
		
	</div>
</div>

