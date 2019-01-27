$(function(){
	
	//체크박스 모두 체크
	$(document).on("click", ".allCheck", function(){
		if( $("input[name=checkbox1]").is(':checked') ){
			$("input[name=checkbox2]").prop("checked", true);
		}else {
			$("input[name=checkbox2]").prop("checked", false);
		}
	});
	
	
	//체크 박스를 이용한 다중삭제처리
	$(document).on("click", "#noticeDelBtn", function(){
		var checkRow = "";
		$( "input[name='checkbox2']:checked" ).each (function (){
			checkRow = checkRow + $(this).val()+"," ;
		});
		checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
		
		if(checkRow == ''){
			alert("삭제할 대상을 선택하세요.");
			return false;
		}
		console.log("### checkRow => {}"+checkRow);
		var checkData = { "checkRow" : checkRow };
		
		//true : 삭제 비동기 처리 후 목록 다시 불러오기
		if(confirm("정보를 삭제 하시겠습니까?")){
			//삭제 ajax처리
			$.ajax({
				url : "/admin/board/boarddelete.do",
				data : JSON.stringify(checkData),
				method : "POST",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
		        success : function(data) {
		        	if(data.isSuccess == true) {
			        	alert(data.msg);
			        	var jsonData = {
			    				pageNo : 1,
			    				keyword : $("#keyword").val(),
			    				searchType : $("#searchType option:selected").val()
		    			};
			        	getNoticeList(jsonData);
			        	$(".allCheck").prop("checked", false);
		        	}
		        },
		        error : function(jqXHR) {
		        	console.log("error :"+ jqXHR.status);
		        }
		     });
		}
	});
	
	
	
	
	//체크 박스를 이용한 다중삭제 취소처리
	$(document).on("click", "#noticeDelCancelBtn", function(){
		var checkRow = "";
		$( "input[name='checkbox2']:checked" ).each (function (){
			checkRow = checkRow + $(this).val()+"," ;
		});
		checkRow = checkRow.substring(0,checkRow.lastIndexOf( ","));
		
		if(checkRow == ''){
			alert("취소할 대상을 선택하세요.");
			return false;
		}
		console.log("### checkRow => {}"+checkRow);
		var checkData = { "checkRow" : checkRow };
		
		//true : 삭제취소 비동기 처리 후 목록 다시 불러오기
		if(confirm("정보를 삭제취소 하시겠습니까?")){
			$.ajax({
				url : "/admin/board/deletecancel.do",
				data : JSON.stringify(checkData),
				method : "POST",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
		        success : function(data) {
		        	if(data.isSuccess == true) {
			        	alert(data.msg);
			        	var jsonData = {
			    				pageNo : 1,
			    				keyword : $("#keyword").val(),
			    				searchType : $("#searchType option:selected").val()
		    			};
			        	getNoticeList(jsonData);
			        	$(".allCheck").prop("checked", false);
		        	}
		        },
		        error : function(jqXHR) {
		        	console.log("error :"+ jqXHR.status);
		        }
		     });
		}
	});
	
	
	
	$(document).on("click", "#searchBtn", function(){
		var keyword = $("#keyword").val();
		var searchType = $("#searchType option:selected").val();
		
		var jsonData = {
			pageNo : 1,
			keyword : keyword,
			searchType : searchType
		};
		getNoticeList(jsonData);
	});
	
	
	$(document).on("click", ".mvpage", function(){
		var jsonData = {
				pageNo : $(this).attr("move-page-no"),
				keyword : $("#keyword").val(),
				searchType : $("#searchType option:selected").val()
		};
		
		getNoticeList(jsonData);
		
	});
	
	function getNoticeList(jsonParam) {
    	$.ajax({
    		url : "/admin/board/ajaxnoticelist.do",
    		dataType : "json",
    		data : jsonParam,
    		contentType: "application/json; charset=UTF-8",
    		method : "GET",
    	    success : function(data) {
    	    	makeNoticeList(data);
    	    }
    	});
    }
	
	function makeNoticeList(data) {
		var htmlStr = '';
		
		if (data != null) {
			
			for (var i = 0; i < data.noticeList.length; i++) {
				var delDateHTML = "";
				var delYNHTML = "";
				
				if (data.noticeList[i].bDeldate == null) {
					delDateHTML = '	 <td></td>';
				}else {
					delDateHTML = '	 <td>' + data.noticeList[i].bDeldate + '</td>';
				}
				
				if (data.noticeList[i].bDelYN == null || data.noticeList[i].bDelYN == 0) {
					delYNHTML = '	 <td style="color: blue;">게시</td>';
				} else {
					delYNHTML = '	 <td style="color: red;">삭제</td>';
				}
				
				htmlStr += '<tr>';
				htmlStr += '	 <td><input type="checkbox" class="icheck" name="checkbox2" value="'+data.noticeList[i].bNo+'" /></td>';
				htmlStr += '	 <td>' + data.noticeList[i].bNo + '</td>';
				htmlStr += '	 <td><a href="/admin/board/view.do?bNo=' + data.noticeList[i].bTitle + '">' + data.noticeList[i].bTitle + '</a></td>';
				htmlStr += '	 <td>' + data.noticeList[i].mId + '</td>';
				htmlStr += '	 <td>' + data.noticeList[i].bRegdate + '</td>';
				htmlStr += '	 <td>' + data.noticeList[i].bHitcount + '</td>';
				htmlStr += '	 <td>' + data.noticeList[i].rCount + '</td>';
				htmlStr += delYNHTML;
				htmlStr += delDateHTML;
				htmlStr += '<tr>';
			}
			
			$("#articleListTBody").empty();
	    	$("#articleListTBody").append(htmlStr);
			
	    	
	    	var htmlStr2 = "";
	    	var htmlStr3 = "";
	        var pageOfStart = (data.pagination.curPage-1) * (data.pagination.pageSize)+1;
	        var pageOfLast = data.pagination.curPage * data.pagination.pageSize;
	        
	        
	        if (data.pagination.curRange != 1 || data.pagination.curPage != 1) {
	        	htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="1">&laquo;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="'+ data.pagination.prevPage +'">&lt;</button></li>';
			} else {
				htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no="1">&laquo;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no="'+ data.pagination.prevPage +'">&lt;</button></li>';
			}
	        
	        for (var nowPage = data.pagination.startPage; nowPage <= data.pagination.endPage; nowPage++) {
	        	if (nowPage == data.pagination.curPage) {
	        		htmlStr2 += '<li><button type="button" class="btn btn-primary mvpage"  move-page-no="'+ nowPage +'">'+ nowPage +'</button></li>';
				}else if(nowPage != data.pagination.curPage) {
					htmlStr2 += '<li><button type="button" class="btn btn-default mvpage"  move-page-no="'+ nowPage +'">'+ nowPage +'</button></li>';
				}
	        }
	        
	        if (data.pagination.curPage != data.pagination.totalPage && data.pagination.totalPage > 0) {
	        	htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="'+ data.pagination.nextPage +'">&gt;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage"  move-page-no="'+ data.pagination.totalPage +'">&raquo;</button></li>';
			} else {
				htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no="'+ data.pagination.nextPage +'">&gt;</button></li>';
           		htmlStr2 += '<li><button type="button" class="btn mvpage" disabled  move-page-no='+ data.pagination.totalPage +'">&raquo;</button></li>';
           		
           		pageOfLast = data.pagination.listCnt;
			}
	        htmlStr3 = 'showing '+ pageOfStart + ' - '+ pageOfLast +' of '+ data.pagination.listCnt + ' items'  ;
	        $('#pageItems').empty();
	        $('#pageItems').append(htmlStr3);
	        $('.pagination').empty();
	        $('.pagination').append(htmlStr2);         
		}
	};
	
});