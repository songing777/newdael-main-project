$(function(){
	$('#noticeDelBtn').click(function(event){
		var bNo = $('#bNo').val();
		location.href="/admin/board/boarddelete.do?bNo="+bNo;;
	});
	
	$('#noticeModBtn').click(function(event){
		var bNo = $('#bNo').val();
		location.href="/admin/board/noticemodify.do?bNo="+bNo;;
	});
	
});