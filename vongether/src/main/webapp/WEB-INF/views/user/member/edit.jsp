<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/member/memberUpdate.js"></script>

<div id="fh5co-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-header">
                    <h2 id="container">회원 수정하기</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <span>정보수정을 위해 아래 내용들을 작성해 주세요.</span>
            <span class="row" style="color: red;">*표시는 필수항목입니다.</span>
        </div>
        
        <div class="row">
            <div class="col-lg-12">
                <form id="editForm" class="form-horizontal">
                    <fieldset>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">아이디(email)</label>
                                        </div>
                                        <div class="col-lg-2">
                                            <label class="control-label">${userInfo.mId}</label>
                                        </div>
                                        <input type="hidden" class="form-control" name="mId" value="${userInfo.mId}">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">비밀번호</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="password" class="form-control" id="pwd1" placeholder="비밀번호" required="true">
                                        </div>
                                    </div>
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
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">성별</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <div class="radio col-lg-12">
	                                             <c:choose>
				                                    <c:when test="${userInfo.mGender == 'm'}">
				                                        <label><input type="radio" checked disabled>남자</label>
	                                                    <label><input type="radio" disabled>여자</label>
				                                    </c:when>
				                                    <c:otherwise>
				                                       <label><input type="radio" disabled>남자</label>
	                                                    <label><input type="radio" checked disabled>여자</label>
				                                    </c:otherwise>
				                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">이름</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" value="${userInfo.mName}" name="mName" placeholder="이름" required="true" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">생년월일</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="mBirth" value="${userInfo.mBirth}" readonly required="true">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">우편번호</label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" id="mPostcode" name="mPostcode" readonly value="${userInfo.mPostcode}" required="true">
                                        </div>
                                        <div class="col-lg-2">
                                            <input type="button" class="btn btn-primary" id="searchPostBtn" value="주소찾기">
                                        </div>
                                        <div class="col-lg-5"></div>
                                    </div>
                                </div>
                                
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">기본주소</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="mAddr1" name="mAddr1" value="${userInfo.mAddr1}" placeholder="기본주소" readonly required="true">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">상세주소</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="mAddr2" name="mAddr2" value="${userInfo.mAddr2}" placeholder="상세주소" required="true" >
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">사진(프로필)</label>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control"  placeholder="임시로 넣은 text Box" readonly>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-4 col-lg-offset-9">
                                    <button class="btn btn-danger" type="reset">초기화</button>
                                    <input id="editBtn" type="button" class="btn btn-primary" value="수정하기">
                                    <button class="btn btn-info" onclick="back();">취소</button>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="myModal" class="modal" tabindex="-1" role="dialog" data-backdrop="">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title">주소찾기</h5>
            </div>
            <div class="modal-body">
                <div>
                    <h4>우편번호 검색</h4>
                    <form action="/search" id="postSearchForm" method="GET">
                        <fieldset>
                            <div>
                                <label>검색할 도로명/지번주소를 입력</label>
                                <div>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="query" name="query"
                                            style="width: 472px;"> <input type="hidden" id="currentPage"
                                            name="currentPage" value="">
                                    </div>
                                    <div class="col-lg-2">
                                        <button type="button" class="btn btn-success btn_search">검색</button>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>

                <div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>우편번호</th>
                                <th>주소</th>
                            </tr>
                        </thead>
                        <tbody id="postTbody">
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" >확인</button>
            </div>
        </div>
    </div>
</div>


