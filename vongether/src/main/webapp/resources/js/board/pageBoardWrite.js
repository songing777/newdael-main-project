$(document).ready(function() {
	$('#summernote').summernote({
		minHeight: 400,
		maxHeight: 400,
		styleWithSpan: false,
        toolbar: [
        		['style', ['style']],
        	    ['font', ['bold', 'italic', 'underline', 'clear']],
        	    ['fontname', ['fontname']],
        	    ['color', ['color']],
        	    ['para', ['ul', 'ol', 'paragraph']],
        	    ['height', ['height']],
        	    ['table', ['table']],
        	    ['insert', ['link', 'picture', 'hr']],
        	    ['view', ['fullscreen', 'codeview']],
        	    ['help', ['help']]
                ]
    });
	$("#writeCancelBtn").click(function(){
		swal({
			  title: "글 작성을 취소하시겠습니까?",
			  text: "너의 글은 살아남지 못할것이다!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				location.href="/board/list.do";
			  } else {
			    swal("게시글 : 사..살았다...");
			  }
			});
	}); 
	$("#writeOKBtn").click(function(){
		$("#bContent").val($('#summernote').summernote('code'));
		$("#bTitle").val($('#writeTitleBox').val());
		if(document.writeForm.writeTitleBox.value.trim() == ""){
			swal("제목을 입력하세요","게시글 : 쥬인님 저에게 이름을 쥬세여~!","error");
			return;
		}else{
			$("#writeForm").attr("method", "post").attr(
					"action", "/board/write.do").submit();
			/*
			swal({
				  title: "글을 등록하시겠습니까?",
				  icon: "warning",
				  buttons:{
					  cancel: "cancel",
					  OK: true,
				  }, 
				})
				.then((willDelete) => {
				  if (willDelete) {
					$("#writeForm").attr("method", "post").attr(
							"action", "/board/write.do").submit();
				  } 	
				});
					 */
		}
	});
	
})