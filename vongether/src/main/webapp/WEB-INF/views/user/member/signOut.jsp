<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/member/customHeader.css" rel="stylesheet" type="text/css" />

<div id="fh5co-page">
    <div class="container">
        <div class="row">
            <div class="custom-header col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <h2>회원 탈퇴</h2>
                    <span>회원님의 정보를 안전하게 보호하기 위해 <b>비밀번호</b>를 다시 한번 확인합니다.</span>
                    <span>사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다</span>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="login-body col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <form class="form-signin" action="signOut.do" method="post">
                        <fieldset>
                            <div class="row">
                                <ul>
                                    <li><span class="w_typey01">비밀번호</span> : 
                                    <input type="password" name="mPwd" class="form-control" placeholder="비밀번호" title="비밀번호 입력" required="true"/></li>
                               </ul>
                            <input type="hidden" name="mId" value="${userInfo.mId}">
                            </div>                        
                            <div class="row form-group">
                                <button class="btn btn-large btn-warning form-control active" type="submit" id="checkBtn"><span>확인</span></button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>