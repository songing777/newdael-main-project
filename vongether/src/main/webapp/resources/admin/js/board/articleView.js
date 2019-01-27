$(function(){
	$('#articleDelBtn').click(function(event){
		var bNo = $('#bNo').val();
		location.href="/admin/board/boarddelete.do?bNo="+bNo;;
	});
});