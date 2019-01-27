<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	/*
	 나의정보 - 봉사참여리스트
	 1. 리스트를 가져온다.
	 2. 리스트를 뿌려준다.
	 - 테두리 생성
	 3. 페이징을 한다.
	 */
	var applist = new Array(new Array(0), new Array(0), new Array(0),
			new Array(0), new Array(0));
	var max = 10;
	var min = 0;
	var pageNum = 1;//현재 페이지
</script>
<c:forEach items="${list}" var="item">
	<script type="text/javascript">
		applist[0].push("${item.appNo}");
		applist[1].push("${item.appName}");
		applist[2].push("${item.appPlace}");
		applist[3].push("${item.appBegintm}");
		applist[4].push("${item.appEndtm}");
	</script>
</c:forEach>




<style type="text/css">
.applisthead {
	border-top: 2px solid #99ffbb;
	color: #009933;
}

.applist {
	
}
</style>


<div id="fh5co-blog-section">
	<div class="container">
		<div id="addlist" class="row">
			<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
				<h2>참여신청목록</h2>
				<p>
					<span>여러분의 <i class="sl-icon-heart"></i> 따뜻한 손길을 내밀어 주세요
					</span>
				</p>
			</div>
		</div>

		<!-- <div class="row applist">
				<div class="col-md-1 text-center ">
					<div class="desc">코드</div>
				</div>
				<div class="col-md-4 text-center ">
					<div class="desc">봉사 제목</div>
				</div>
				<div class="col-md-3 text-center ">
					<div class="desc">봉사 장소</div>
				</div>
				<div class="col-md-2 text-center ">
					<div class="desc">봉사 시작 시간</div>
				</div>
				<div class="col-md-2 text-center ">
					<div class="desc">봉사 마감 시간</div>
				</div>
			</div> -->
		<div class="row text-center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li id="pagePreLitag"><a href="#" aria-label="Previous"
						onclick="pagePreSideClick1(this);"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li id="page"><a href="#" aria-label="Next"
						onclick="pageNextSideClick(this);"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/js/myapplist/pageClick1.js"></script>
<script type="text/javascript" src="/resources/js/myapplist/pageNextSideClick.js"></script>
<script type="text/javascript" src="/resources/js/myapplist/pagePreSideClick1.js"></script>
<script type="text/javascript" src="/resources/js/myapplist/pageStart.js"></script>

