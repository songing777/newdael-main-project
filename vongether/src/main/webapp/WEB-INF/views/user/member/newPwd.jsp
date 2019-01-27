<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/member/customHeader.css" rel="stylesheet" type="text/css" />
    
<div id="fh5co-page">
    <div class="container">
        <div class="row">
            <div class="custom-header col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <h2>새 비밀번호 생성</h2>
                    <span>새로운 비밀번호로 재생성합니다</span>
                </div>
                <div class="col-lg-3"></div>
            </div>
        </div>
        
        <form class="form-signin" action="newPwd.do" method="post">
            <fieldset>
		        <div class="form-group">
			        <div class="row">
			            <div class="col-lg-2">
			                <label class="control-label">비밀번호</label>
			            </div>
			            <div class="col-lg-10">
			                <input type="password" class="form-control" id="pwd1" placeholder="비밀번호" required="true">
			            </div>
			        </div>
			        <input type="hidden" name = "mId" value="${mId}" required="true">
                        
			        <div class="row">
			            <div class="col-lg-2"></div>
			            <div class="col-lg-10">
			                <span>최소 6자리 이상 12자 이하 // 영어 소대문자숫자, 특수기호  2가지 조합</span>
			            </div>
			        </div>
			    </div>
			    
			    <div class="form-group">
			        <div class="row">
			            <div class="col-lg-2">
			                <label class="control-label">비밀번호 확인</label>
			            </div>
			            <div class="col-lg-10">
			                <input type="password" class="form-control" id="pwd2" name="mPwd" placeholder="비밀번호 확인" required="true">
			            </div>
			        </div>
			    </div>
		        
		        <div class="row">
		            <div class="form-group">
		                <div class="col-lg-4 col-lg-offset-9">
		                    <button class="btn btn-danger" type="reset">초기화</button>
		                    <button class="btn btn-primary" type="submit">수정하기</button>
		                    <button class="btn btn-info" onclick="back();">취소</button>
		                </div>
		            </div>
		        </div>
	        </fieldset>
        </form>
  
    </div>
</div>

<script>
  
  //뒤로가기
  function back() {
     history.back();
  }

</script>