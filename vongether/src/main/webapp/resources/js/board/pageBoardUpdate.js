$(document).ready(function() {
	
		$('#summernote').summernote({
			minHeight: 400,
			maxHeight: 400
	    });

 		$("#writeCancelBtn").click(function(){
 			swal({
 				  title: "글 수정을 취소하시겠습니까?",
 				  text: "게시글 : 날 내버려 둬~!",
 				  icon: "warning",
 				  buttons: true,
 				  dangerMode: true,
 				})
 				.then((willDelete) => {
 				  if (willDelete) {
					location.href="/board/list.do";	
 				  } 
 			});
		}); 
		
		
 		$("#writeOKBtn").click(
			function(){
				var bTitle = $("#bTitle").val();
				var bContent = $("#bContent").val();
				console.log(bTitle);
				if(bTitle == ""){
					swal("제목을 입력하세요");
					return;
				}else if(bContent == ""){
					swal("내용을 입력하세요");
					return;
				}else{
					swal({
						  title: "글을 수정하시겠습니까?",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
					 		document.updateForm.action = "/board/update.do"; 
							document.updateForm.submit();
						  } 
						});
				}
		}); 
		
})
