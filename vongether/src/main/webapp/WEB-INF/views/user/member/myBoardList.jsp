<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="my-container">
  <!-- main-content-box -->
	<div class="main-content-box">
	   <div class="container">
	       <div class="row">
	           <h2 class="col-md-12 boardname"></h2>
	           <h2 class="col-md-4 "><b>작성한 글 목록</b></h2>
	       </div>
	        
	       <div class="row">
	           <div class="col-md-12">
	        <table class="table table-list-search">
	             <thead>
	                 <tr>
	                     <th>번호</th>
	                     <th>제목</th>
	                     <th>등록일</th>
	                     <th>조회수</th>
	                 </tr>
	             </thead>
	             <tbody id="boardList">
	             <c:choose>
                        <c:when test="${myList != null }">
	                        <c:forEach var="list" items="${myList}">
		                       <tr>
		                         <td>${list.bNo}</td>
		                         <td><a href="/board/view.do?bNo=${list.bNo}">${list.bTitle}</a></td>
		                         <td>${list.bRegdate}</td>
		                         <td>${list.bHitcount}</td>
		                       </tr>
	                        </c:forEach>
                        </c:when>
                        <c:otherwise>
                        <tr><td align="center">해당하는 항목이 없습니다.</td></tr>
                        </c:otherwise>
                 </c:choose>
	             </tbody>
	         </table>
	   </div>
	  </div>
	  <!-- boardList -->
	  
	  
	  <div class="row">
	    <div class="col-md-offset-1 col-md-9" align="center" id="pagination">
	        <c:if test="${pagination.curPage==1}">
	                <button type='button' class='btn' disabled pageNo='1'>&laquo;</button>
	                <button type='button' class='btn' disabled pageNo='${pagination.prevPage}'>&lt;</button>
	            </c:if>
	            <c:if test="${pagination.curPage!=1}">
	                <button type='button' class='btn navigation-btn' pageNo='1'>&laquo;</button>
	                <button type='button' class='btn navigation-btn' pageNo='${pagination.prevPage}'>&lt;</button>
	            </c:if>
	            <c:forEach  var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
	                                    
	                <c:if test="${pagination.curPage==i}">
	                    <button type='button' class='btn btn-primary navigation-btn' pageNo='${i}'>${i}</button>
	                </c:if>
	                <c:if test="${pagination.curPage!=i}">
	                    <button type='button' class='btn btn-default navigation-btn' pageNo='${i}'>${i}</button>
	                </c:if>
	            </c:forEach>
	            <c:if test="${pagination.curPage!=pagination.endPage}">
	                <button type='button' class='btn navigation-btn' pageNo='${pagination.nextPage}'>&gt;</button>
	                <button type='button' class='btn navigation-btn' pageNo='${pagination.endPage}'>&raquo;</button>
	            </c:if>
	            <c:if test="${pagination.curPage==pagination.endPage}">
	                <button type='button' class='btn' disabled pageNo='${pagination.nextPage}'>&gt;</button>
	                <button type='button' class='btn' disabled pageNo='${pagination.endPage}'>&raquo;</button>
	            </c:if> 
	    </div>
	    <!-- pagination -->
	  </div>
	  
	  <div class="row" style="padding-top: 20px;">
	    <div class="col-md-2"></div>
	  </div>
	  
	  <div class="col-md-4"></div>
	 </div><!-- row1 End -->
	 
	</div><!-- main-content-box End -->

</div>
