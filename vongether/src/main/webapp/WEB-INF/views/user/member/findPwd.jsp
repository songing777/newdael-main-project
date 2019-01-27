<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/member/customHeader.css" rel="stylesheet" type="text/css" />

<div id="fh5co-page">
    <div class="container">
        <div class="row">
            <div class="custom-header col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <h2>비밀번호 찾기</h2>
                    <span>가입당시에 입력하였던 아이디,이름,생년월일을 입력해주세요</span>
                </div>
                <div class="col-lg-3"></div>
            </div>
        </div>
        
        <div class="row">
            <div class="login-body col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <form class="form-signin" action="findPwd.do" method="post">
                        <fieldset>
	                        <div class="form-group">
		                        <div class="row">
		                            <div class="col-lg-2">
		                                <label class="control-label">아이디(이메일)</label>
		                            </div>
		                            <div class="col-lg-10">
		                                <input type="text" class="form-control" name="mId" placeholder="아이디(이메일)" required="true">
		                            </div>
		                        </div>
	                        </div>
                            
                            <div class="form-group">
                               <div class="row">
                                   <div class="col-lg-2">
                                       <label class="control-label">이름</label>
                                   </div>
                                   <div class="col-lg-10">
                                       <input type="text" class="form-control" id="mName" name="mName" placeholder="이름" required="true">
                                   </div>
                               </div>
                            </div>
                        
                            <div class="form-group">
	                            <div class="row">
	                                <div class="col-lg-2">
	                                    <label class="control-label">생년월일</label>
	                                </div>
	                                <div class="col-lg-10">
	                                    <input type="text" class="form-control" id="mBirth" name="mBirth" placeholder="생년월일" readonly required="true">
	                                </div>
	                            </div>
                            </div>
                                
                            <div class="row form-group">
                                <button class="btn btn-large btn-warning form-control active" type="submit"><span>확인</span></button>
                            </div>
                            <div class="row form-group">
                                <a href="/member/login.do" class="btn btn-large btn-primary form-control active">로그인</a>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <div class="col-lg-3"></div>
            </div>
        </div>
    </div>
</div>

<script>

  $(function() {
    setDatepicker();
  });

  //달력 설정 function
  function setDatepicker() {
    $("#mBirth").datepicker({
      dateFormat: "yy-mm-dd",
      maxDate: 0,
      yearRange: "c-80:c",
      changeYear: true,
      changeMonth: true
    });
  }
</script>