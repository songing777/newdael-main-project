<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/member/customHeader.css" rel="stylesheet" type="text/css" />

<div class="container">
	<div class="row">

		<!-- ★★★ Contents -->
		<div class="custom-header">
			<div class="page-header2">
				<h2>회원정보</h2>
			</div>

			<div class="table-responsive">
				<table class="table table-bordered">
					<colgroup>
						<col width="120">
						<col width="*">
						<col width="120">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center">ID</th>
							<td class="text-left">${userInfo.mId}</td>
							<th class="text-center">회원명</th>
							<td class="text-left">${userInfo.mName}</td>
						</tr>
						<tr>
							<th class="text-center">생년월일</th>
							<td class="text-left">${userInfo.mBirth}</td>
							<th class="text-center">성별</th>
							<c:choose>
                                   <c:when test="${userInfo.mGender == 'm'}">
                                       <td class="text-left">남성</td>
                                   </c:when>
                                <c:otherwise>
                                    <td class="text-left">여성</td>
                                </c:otherwise>
                               </c:choose>
						</tr>
						<tr>
						    <th class="text-center">우편번호</th>
                               <td class="text-left">${userInfo.mPostcode}</td>
							<th class="text-center">주소</th>
							<td class="text-left">${userInfo.mAddr1} ${userInfo.mAddr2}</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="pull-right">
				<a href="/member/editCheck.do" class="btn btn-success btn-default">수정</a>
				<a href="/member/signOut.do" class="btn btn-large btn-default">탈퇴</a> 
			</div>

		</div>
	</div>
</div>
