<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="searchForm" action="" method="get">
  <input type="hidden" id="key" name="key" value="">
  <input type="hidden" id="word" name="word" value="">
  <input type="hidden" id="pageNo" name="pageNo" value="1">
</form>
<header id="fh5co-header" role="banner">
    <div class="container">
        <div class="header-inner">
            <h1><i class="sl-icon-heart"></i><a href="/">봉사어때?</a></h1>
            <nav role="navigation">
                <ul class="nav navbar-nav">
                    <li><a class="active" href="/">홈</a></li>
                    <li><a href="/volunteeredu/list.do">교육봉사목록</a></li>
                    <li><a href="/volunteer/list.do">봉사참여</a></li>
                    <li><a href="/board/list.do">커뮤니티</a></li>
                    <c:choose>
                        <c:when test="${userInfo != null }">
                            <li><a href="/member/logout.do">로그아웃</a></li>
                            <li>
                             <a href="#" class="dropdown-toggle" data-toggle="dropdown">마이페이지 <b class="caret"></b></a>
                             <ul class="dropdown-menu">
                                 <li><a href="/member/view.do">상세정보 </a></li>
                                 <li><a href="/member/myAppList.do">참여신청목록</a></li>
                                 <li><a href="/member/myBoardList.do">작성게시글목록</a></li>
                             </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/member/login.do">로그인</a></li>
                            <li><a href="/member/join.do">회원가입</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="/board/donation.do">기부</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>