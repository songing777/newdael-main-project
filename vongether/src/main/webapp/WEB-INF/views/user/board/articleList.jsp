<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <script src="/resources/js/board/pageBoardList.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
	var login = '${userInfo.mId}';
	var key = $('#skey').val();
	var word = $('#sword').val();
	var pageNo = 1;
	$(".writeBtn").click(function(){
		if(login==null||login==""){
			swal("로그인 하세욧!","너는 로긴하게 될 것이야~","error");
		}else{
			location.href="/board/write.do";
		}
	});
	$("#searchBtn").click(
		function() {
			key = $('#skey').val();
			word = $('#sword').val();
			var data2 = {
					key : key,
					word : word,
					pageNo : 1
			}
			$.ajax({
				url : "/board/listAjax.do",
	    		dataType : "json",
	    		data : data2,
	    		contentType: "application/json; charset=UTF-8",
	    		method : "GET",
	    	    success : function(data) {
	    	    	makeVolunteerList(data.listAjaxArticle);
	    	    	makePageList(data.pagination);
	    	    }
			});
			/* $('#key').val($('#skey').val());
			$('#word').val($('#sword').val());
			$("#searchForm").attr("method", "get").attr(
					"action", "/board/list.do").submit(); */
		}
	); 
	
	$(document).on("click",".navigation-btn",
		function(){
			$('#pageNo').val($(this).attr("pageNo"));
			pageNo = $('#pageNo').val();
			var data = {
				key : key,
				word :word,
				pageNo: pageNo
			};
			getAjaxList(data);
		}
	); 
   function getAjaxList(data){
		$.ajax({
    		url : "/board/listAjax.do",
    		dataType : "json",
    		data : data,
    		contentType: "application/json; charset=UTF-8",
    		method : "GET",
    	    success : function(data) {
    	    	makeVolunteerList(data.listAjaxArticle);
    	    	makePageList(data.pagination);
    	    }
    	});		
	};
	function makeVolunteerList(data) {
		var htmlStr = "";

		for(var i=0;i<data.length;i++){
			htmlStr += "<tr>";
			htmlStr += "  <td>"+data[i].bNo+"</td>";
			htmlStr += "  <td><a href='/board/view.do?bNo="+data[i].bNo+"'>"+data[i].bTitle.replace('<','&lt;')+"</a></td>";
			htmlStr += "  <td><span>"+data[i].mId+"</span></td>";
			htmlStr += "  <td>"+data[i].bRegdate+"</td>";
			htmlStr += "  <td>"+data[i].bHitcount+"</td>";
			htmlStr += "  <td>"+data[i].rCount+"</td>";
			htmlStr += "</tr>";
		}
	 	$("#boardList").empty();
    	$("#boardList").append(htmlStr);
	}
	function makePageList(data) {
		var htmlStr = "";
		if(data.curPage!=1){
			htmlStr += "<button type='button' class='btn navigation-btn' pageNo='"+1+"'>&laquo;</button>";
			htmlStr += "<button type='button' class='btn navigation-btn' pageNo='"+data.prevPage+"'>&lt;</button>";
		}else{
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+1+"'>&laquo;</button>";
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+data.prevPage+"'>&lt;</button>";
		}
		for(var i=data.startPage;i<data.endPage+1;i++){
			if(data.curPage==i){
				htmlStr += "<button type='button' class='btn btn-primary' pageNo='"+i+"'>"+i+"</button>";
			}else{
				htmlStr += "<button type='button' class='btn btn-default navigation-btn' pageNo='"+i+"'>"+i+"</button>";
			}
		}
		if(data.curPage!=data.totalPage){
			htmlStr += "<button type='button' class='btn navigation-btn' pageNo='"+data.nextPage+"'>&gt;</button>";
			htmlStr += "<button type='button' class='btn navigation-btn' pageNo='"+data.totalPage+"'>&raquo;</button>";
		}else{
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+data.nextPage+"'>&gt;</button>";
			htmlStr += "<button type='button' class='btn' disabled pageNo='"+data.totalPage+"'>&raquo;</button>";
		}
	 	$("#pagination").empty();
    	$("#pagination").append(htmlStr); 
    	
	}
	
});
</script>
<div class="my-container">
  <!-- main-content-box -->
	<div class="main-content-box">
		<div class="container">
		
				<div class="col-md-12" ><br></div>
		    <div class="row" >
        		<h2 style="font-size:34px; font-weight: bold;">게시판</h2>
			</div>
			
			<div class="row">
			  <div class="col-md-12">
	        <table class="table table-list-search">
	             <colgroup>
                  <col width="5%">
                  <col width="*">
                  <col width="10%">
                  <col width="10%">
                  <col width="5%">
                  <col width="5%">
                </colgroup>
           
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회</th>
                        <th>댓글</th>
                    </tr>
                </thead>
	             <tbody id="noticeList">
	    	         <c:forEach var="Notice" items="${selectNoticeList}">
						 <tr>
		                     <td>[공지]</td>
		                     <td><a href="/board/view.do?bNo=${Notice.bNo}">${Notice.bTitle.replace("<","&lt;")}</a></td>
		                     <%-- <td class="posting" b-no="${list.bNo}"><a href="/board/view.do?bNo=${list.bNo}">${list.bTitle}</a></td> --%>
		                     <td>${Notice.mId}</td>
		                     <td>${Notice.bRegdate}</td>
		                     <td>${Notice.bHitcount}</td>
		                     <td>${Notice.rCount}</td>
		                 </tr>
				     </c:forEach>
	             </thead>
	             <tbody id="boardList">
	             <c:forEach var="list" items="${selectBoardList}">
						<tr>
	                     <td>${list.bNo}</td>
	                     <td><a href="/board/view.do?bNo=${list.bNo}">${list.bTitle.replace("<","&lt;")}</a></td>
	                     <%-- <td class="posting" b-no="${list.bNo}"><a href="/board/view.do?bNo=${list.bNo}">${list.bTitle}</a></td> --%>
	                     <td>${list.mId}</td>
	                     <td>${list.bRegdate}</td>
	                     <td>${list.bHitcount}</td>
	                     <td>${list.rCount}</td>
	                 </tr>
			     </c:forEach>
	             </tbody>
	         </table>
			  </div>
      </div>
      <div class="row">
        <div class="col-md-offset-1 col-md-9" align="center" id="pagination">
        	<c:if test="${pagination.curPage==1}">
	          		<button type='button' class='btn' disabled pageNo='1'>&laquo;</button>
					<button type='button' class='btn' disabled pageNo='${pagination.prevPage}'>&lt;</button>
          		</c:if>
          		<c:if test="${pagination.curPage!=1}">
	          		<button type='button' class='btn navigation-btn' pageNo='1'>&laquo;</button>"
					<button type='button' class='btn navigation-btn' pageNo='${pagination.prevPage}'>&lt;</button>"
          		</c:if>
          		<c:forEach  var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
					          			
	          		<c:if test="${pagination.curPage==i}">
	          			<button type='button' class='btn btn-primary navigation-btn' pageNo='${i}'>${i}</button>
          			</c:if>
	          		<c:if test="${pagination.curPage!=i}">
	          			<button type='button' class='btn btn-default navigation-btn' pageNo='${i}'>${i}</button>
          			</c:if>
          		</c:forEach>
          		<c:if test="${pagination.curPage!=pagination.totalPage}">
        	  		<button type='button' class='btn navigation-btn' pageNo='${pagination.nextPage}'>&gt;</button>
					<button type='button' class='btn navigation-btn' pageNo='${pagination.totalPage}'>&raquo;</button>
          		</c:if>
          		<c:if test="${pagination.curPage==pagination.totalPage}">
          			<button type='button' class='btn' disabled pageNo='${pagination.nextPage}'>&gt;</button>
					<button type='button' class='btn' disabled pageNo='${pagination.totalPage}'>&raquo;</button>
          		</c:if> 
        </div>
        <div class="col-md-offset-1 col-md-1">
	        <button type="button" class="btn btn-primary float-right writeBtn">글작성</button>
        </div>
      </div>
      <div class="row" style="padding-top: 20px;">
        <div class="col-md-2"></div>
        <!-- 검색 조건 -->
        <div class="col-md-8">
        	<div class="col-md-3">
        		<div class="input-group">
		            <select class="form-control" name="key" id="skey">
						<option value="">제목+내용</option>
						<option value="content">내용</option>
						<option value="title">제목</option>
						<option value="id">아이디</option>
					</select>
        		</div>
			</div>
			<div class="col-md-8">
	            <input type="text" class="form-control" name="sword" id="sword" placeholder="검색내용">
			</div>
			<div class="col-md-1">
        		<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
			</div>
        </div>
        <div class="col-md-2"></div>
      </div>

      <div class="col-md-4"></div>
		</div><!-- row1 End -->
	</div><!-- main-content-box End -->

</div>

