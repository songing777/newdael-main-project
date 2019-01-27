<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- start:Left Menu -->
<div id="left-menu">
	<div class="sub-left-menu scroll">
		<ul class="nav nav-list">
			<li><div class="left-bg"></div></li>
			<li class="time">
				<h1 class="animated fadeInLeft">21:00</h1>
			</li>
			<li class="ripple"><a class="tree-toggle nav-header">
					<span class="fa-user fa"></span> 회원 <span
					class="fa-angle-right fa right-arrow text-right"></span>
			</a>
				<ul class="nav nav-list tree">
					<li><a href="#">회원 목록</a></li>
					<li><a href="#">블랙리스트</a></li>
				</ul></li>


			<li class="ripple"><a class="tree-toggle nav-header"><span
					class="fa fa-table"></span> 게시판 <span
					class="fa-angle-right fa right-arrow text-right"></span> </a>
				<ul class="nav nav-list tree">
					<li><a href="/admin/board/articlelist.do">일반 게시글 관리</a></li>
					<li><a href="/admin/board/noticelist.do">공지사항 관리</a></li>
					<li><a href="/admin/board/noticewrite.do">공지사항 작성</a></li>
				</ul></li>



		</ul>
	</div>
</div>
<!-- end: Left Menu -->