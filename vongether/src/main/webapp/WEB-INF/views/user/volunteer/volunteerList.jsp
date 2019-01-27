<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/js/volunteerlist/sty.css" rel="stylesheet" type="text/css" />

<script>
window.onload = function() {
	var result = "${result}";
	if(result=="1"){
		swal("정상적으로 신청되었습니다.");
	}else if(result==""){
		//alert("처음");		
	}else{
		swal(result);
	}
}

</script>
<script type="text/javascript" src="/resources/js/volunteerlist/func.js"></script>



<div id="fh5co-blog-section">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
				<h2>봉사참여</h2>
				<p><span>여러분의 <i class="sl-icon-heart"></i> 따뜻한 손길을 내밀어 주세요</span></p>
			</div>
		</div>
		<div class="row line"></div>
		<div id="searchSection" class="col-md-12 col-sm-12 col-sm-push-0 col-xs-12 col-xs-push-0">
			<div class="row">
				<div class="row"><label for="searchHopeArea1">봉사지역</label></div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<select id="schSido" title="봉사지역 시/도 선택" class="form-control">
								<option value="">전체</option>
								<option value="6110000">서울특별시</option>
								<option value="6260000">부산광역시</option>
								<option value="6270000">대구광역시</option>
								<option value="6280000">인천광역시</option>
								<option value="6290000">광주광역시</option>
								<option value="6300000">대전광역시</option>
								<option value="6310000">울산광역시</option>
								<option value="5690000">세종특별자치시</option>
								<option value="6410000">경기도</option>
								<option value="6420000">강원도</option>
								<option value="6430000">충청북도</option>
								<option value="6440000">충청남도</option>
								<option value="6450000">전라북도</option>
								<option value="6460000">전라남도</option>
								<option value="6470000">경상북도</option>
								<option value="6480000">경상남도</option>
								<option value="6500000">제주특별자치도</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<select id="schSign1" title="봉사지역 구/군 선택" class="form-control">
								<option value="">선택</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="row"><label for="searchTermArea">봉사기간</label></div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input id="progrmBgnde" class="form-control" width="550"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input id="progrmEndde" class="form-control" width="550"/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="row"><label for="searchKeyArea">검색내용</label></div>
				<div class="row">
					<div class="col-md-2">
						<div class="form-group">
							<select id="schCateGu" class="form-control">
								<option value="all">전체</option>
								<option value="progrmCn">내용</option>
								<option value="prormSj">제목</option>
							</select>
						</div>
					</div>
					<div class="col-md-9">
						<div class="form-group">
							<input type="text" class="form-control" id="keyword" name="query" placeholder="검색어를 입력해주세요.">
						</div>
					</div>
					<div class="col-md-1">
						<div class="form-group">
							<input id="searchBtn" value="검색" class="btn btn-primary btn-bg" type="button" width="100">
						</div>
					</div>
				</div>
			</div>
			<div class="row line"></div>
		</div>
		<div class="row">
			<div id="volunteerListDiv">
		
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12" align="center">
				<div id="pagination">
					<input type="hidden" id="pageNo" value="1">
					<input type="hidden" id="totalCount" value="0">

				</div>
			</div>
		</div>
		
	</div>
</div>


