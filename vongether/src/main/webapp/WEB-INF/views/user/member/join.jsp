<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/member/memberInsert.js"></script>
<link href="/resources/css/member/loadingAnimation.css" rel="stylesheet" type="text/css" />

<div id="fh5co-page">
	<div class="container">
	
		<div class="row">
		<!-- loading animation -->
		<div class="heart" id="Progress_Loading">
            <i class="fa fa-heart fa-2x" aria-hidden="true"></i>
        </div>
        
			<div class="col-lg-12">
				<div class="page-header">
					<h2 id="container">회원 가입하기</h2>
				</div>
			</div>
		</div>
		
		<div class="row">
			<span>회원가입을 위해 아래 내용들을 작성해 주세요.</span>
			<span class="row"><label class="red">*</label>표시는 필수항목입니다.</span>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<form id="joinForm" class="form-horizontal">
					<fieldset>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
							        <dl class="row">
							            <dt class="col-lg-2">
							                <span>
							                    <label class="control-label"><span class="red">*</span>이메일 주소(아이디)</label>
							                </span>
							            </dt>
							
							            <dd class="col-lg-8">
							                <span class="input_text email_id">
							                    <input type="text" class="form-control" id="mId" name="mId" title="이메일 아이디 입력" placeholder="이메일" required="true">
							                </span>
							                
							                <button type="button" class="btn form_gray" id="checkId"><span>중복조회</span></button>
											<div class="row">
									            <div id="id_check_row" align="center"></div>
									        </div>
							            </dd>
							        </dl>
                                </div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-lg-2">
											<label class="control-label"><span class="red">*</span>비밀번호</label>
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
											<label class="control-label"><span class="red">*</span>비밀번호 확인</label>
										</div>
										<div class="col-lg-10">
											<input type="password" class="form-control" id="pwd2" name="mPwd" placeholder="비밀번호 확인" required="true">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-lg-2">
											<label class="control-label"><span class="red">*</span>성별</label>
										</div>
										<div class="col-lg-10">
											<div class="radio col-lg-12">
												<label><input type="radio" id="optionsRadios1" value="m" name="mGender" checked>남자</label>
												<label><input type="radio" id="optionsRadios2" value="f" name="mGender">여자</label>
											</div>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-lg-2">
											<label class="control-label"><span class="red">*</span>이름</label>
										</div>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="mName" name="mName" placeholder="이름" required="true">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-lg-2">
											<label class="control-label"><span class="red">*</span>생년월일</label>
										</div>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="mBirth" name="mBirth" placeholder="생년월일" readonly required="true">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-lg-2">
											<label class="control-label"><span class="red">*</span>우편번호</label>
										</div>
										<div class="col-lg-3">
											<input type="text" class="form-control" id="mPostcode" name="mPostcode" readonly placeholder="우편번호" required="true">
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
											<label class="control-label"><span class="red">*</span>기본주소</label>
										</div>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="mAddr1" name="mAddr1" placeholder="기본주소" readonly required="true">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-lg-2">
											<label class="control-label"><span class="red">*</span>상세주소</label>
										</div>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="mAddr2" name="mAddr2" placeholder="상세주소" required="true" >
										</div>
									</div>
								</div>
								
								<!-- 기본 mRole 값 입력, valid 체크 -->
								<input type="hidden" name="mRole" value="USER_GUEST">
							</div>
						</div>
						
						<div class="row">
							<div class="form-group">
								<div class="col-lg-4 col-lg-offset-9">
	                                <input type="hidden" class="form-control" id="m_role" name="m_role" >
									<button class="btn btn-danger" type="reset">초기화</button>
									<input id="joinBtn" type="button" class="btn btn-primary" value="가입하기" disabled>
								    <button class="btn btn-info" onclick="back();">취소</button>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
				<!-- form -->
			</div>
		</div>
	</div>
	<!-- container -->
</div>

<!-- modal popup -->
<div id="myModal" class="modal" tabindex="-1" role="dialog" data-backdrop="">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">우편번호검색</h4>
			</div>
			<div class="modal-body">
				<div>
					<form action="/search" id="postSearchForm" method="GET">
						<fieldset>
							<div>
								<label>검색할 도로명/지번주소를 입력</label>
								<div>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="query" name="query"
											style="width: 700px;" required="true"> <input type="hidden" id="currentPage"
											name="currentPage" value="" >
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
					      <colgroup>
                  <col width="10%">
                  <col width="*">
                </colgroup>
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
			</div>
		</div>
	</div>
</div>
<!-- modal popup -->

<script>
  $(document).ready(function(){
       $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
    })
    .ajaxStart(function(){
        $('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
    })
    .ajaxStop(function(){
        $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
    });
</script>