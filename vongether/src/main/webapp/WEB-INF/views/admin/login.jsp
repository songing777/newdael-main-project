<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">

	<form class="form-signin" action="/admin/login.do" method="post">
		<div class="panel periodic-login">
			<div class="panel-body text-center">
				<p class="element-name">Vongether-Admin</p>

				<i class="icons icon-arrow-down"></i>
				<div class="form-group form-animate-text" style="margin-top: 40px !important;">
					<input type="text" class="form-text" name="mId" required> <span class="bar"></span> <label>아이디</label>
				</div>
				<div class="form-group form-animate-text" style="margin-top: 40px !important;">
					<input type="password" class="form-text" name="mPwd" required> <span class="bar"></span> <label>비밀번호</label>
				</div>
				 <input type="submit" class="btn col-md-12" value="로그인" />
			</div>
		
		</div>
	</form>

</div>