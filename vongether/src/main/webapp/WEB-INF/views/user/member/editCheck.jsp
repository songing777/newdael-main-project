<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/member/customHeader.css" rel="stylesheet" type="text/css" />

<div id="fh5co-page">
    <div class="container">
        <div class="row">
            <div class="custom-header col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <h2>개인 정보 수정</h2>
                    <span>회원님의 정보를 안전하게 보호하기 위해 <b>비밀번호</b>를 다시 한번 확인합니다.</span>
                    <span>비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</span>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="login-body col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <form class="form-signin" action="editCheck.do" method="post">
                        <fieldset>
                            <div class="row">
                                <ul>
                                    <li><span class="w_typey01">아이디</span> : <label><span class="txt_y01">${userInfo.mId}</span></label></li>
                                    <li><span class="w_typey01">비밀번호</span> : 
                                    <input type="password" name="mPwd" class="form-control" placeholder="비밀번호" title="비밀번호 입력" required="true"/></li>
                               </ul>
                            <input type="hidden" name="mId" value="${userInfo.mId}">
                            </div>                        
                            <div class="row form-group">
                                <button class="btn btn-large btn-warning form-control active" type="submit"><span>확인</span></button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    
