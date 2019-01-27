<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/member/customHeader.css" rel="stylesheet" type="text/css" />

<div id="fh5co-page">
    <div class="container">
        <div class="row">
            <div class="custom-header col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <h2>아이디 찾기</h2>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="login-body col-lg-12">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
	                <div class="row">
	                   <span>가입하셨던 아이디는 <label>${mId}</label> 입니다</span>
	                </div>            
	                <div class="col-lg-1"></div>            
	                <div class="row">
	                   <a href="/member/login.do" class="btn btn-warning btn-default">로그인</a>
	                   <a href="/member/findPwd.do" class="btn btn-warning btn-default">비밀번호찾기</a>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>
    
