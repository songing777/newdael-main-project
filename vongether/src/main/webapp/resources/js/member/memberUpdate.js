$(document).ready(function() {
    eventBinding();
    setDatepicker();
}); // onload

// 이벤트 바인딩 function
function eventBinding() {
    // 주소찾기 버튼
    $(document).on("click", "#searchPostBtn", function() {
	$('#myModal').modal('show');
    });

    // 주소검색 후 선택
    $(document).on("click", ".addressSelect", function() {
	var postcode = $(this).attr("id");
	var addr1 = $(this).attr("addr");
	$("#mPostcode").val(postcode);
	$("#mAddr1").val(addr1);
	$("#myModal").modal("hide");
    });

    // 모달창에서의 주소 검색버튼 클릭이벤트
    $(".btn_search").click(function() {
	$('#currentPage').val("1");
	$.ajax({
	    url : "postcodelist",
	    data : $("#postSearchForm").serialize(),
	    type : "POST",
	    dataType : "json",
	    success : function(data) {
		makePostList(data);
	    }
	});
    });

    $(document).on("click", "#firstpage", function() {
	$('#currentPage').val("1");
	$.ajax({
	    url : "postcodelist",
	    data : $("#postSearchForm").serialize(),
	    type : "POST",
	    dataType : "json",
	    success : function(data) {
		makePostList(data);
	    }
	});
    });

    $(document).on("click", ".mvpage", function() {
	$('#currentPage').val($(this).attr("move-page-no"));
	$.ajax({
	    url : "postcodelist",
	    data : $("#postSearchForm").serialize(),
	    type : "POST",
	    dataType : "json",
	    success : function(data) {
		makePostList(data);
	    }
	});

    });

    // 비밀번호 조합 체크
    $("#pwd1").change(function() {
	// 최소 6자리 이상 12자 이하
	// 영어 소대문자숫자, 특수기호 2가지 조합
	var regExp = /^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^*+=-]).{6,12}$/;
	var pass = pwd1.value.match(regExp);
	if (pass == null) {
	    swal("오류!", "유효한 형식으로 입력해주세요", "error");
	    $("#pwd1").val("");
	    $("#pwd1").focus();

	}
    });

    // 비밀번호 확인값 일치체크
    $("#pwd2").change(function() {
	if ($('#pwd1').val() != $('#pwd2').val()) {
	    $('font[name=check2]').text('');
	    $('font[name=check2]').html("불일치");
	    $("#pwd2").val("");
	    swal("오류!", "값이 일치하지 않습니다", "error");
	} else {
	    $('font[name=check2]').text('');
	    $('font[name=check2]').html("일치");
	}
    });

    // 이름 유효성체크
    $("#mName").change(function() {
	var regExp = /^[가-힣]{2,4}$/;
	var pass = mName.value.match(regExp);
	if (pass == null) {
	    swal("오류!", "한글 이름은 두글자 이상입니다", "error");
	    $("#mName").val("");
	    $("#mName").focus();
	    // 입력값ㅂ 비우기
	}
    });

    // 수정하기 버튼
    $("#editBtn").click(function() {

	// 널값 체크
	if ($("#mPwd").val() == "") {
	    swal("오류!", "비밀번호를 입력해주세요", "error");
	    $("#mPwd").focus();
	    return;
	}

	if ($("#mPostcode").val() == "") {
	    swal("오류!", "우편번호를 입력해주세요", "error");
	    $("#mPostcode").focus();
	    return;
	}

	if ($("#mAddr1").val() == "") {
	    $("#mAddr1").focus();
	    swal("오류!", "주소를 입력해주세요", "error");
	    return;
	}

	if ($("#mAddr2").val() == "") {
	    $("#mAddr1").focus();
	    swal("오류!", "주소를 입력해주세요", "error");
	    return;
	}

	$.fn.serializeObject = function() {
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
		if (o[this.name]) {
		    if (!o[this.name].push) {
			o[this.name] = [ o[this.name] ];
		    }
		    o[this.name].push(this.value || '');
		} else {
		    o[this.name] = this.value || '';
		}
	    });
	    return o;
	};
	// json 문자열로 form 내부의 값들을 추출
	var parameter = JSON.stringify($("#editForm").serializeObject());

	$.ajax({
	    url : '/member/edit.do',
	    type : 'POST',
	    contentType : 'application/json;charset=UTF-8',
	    dataType : 'json',
	    data : parameter,
	    success : function(data) {
		if (data.isSuccess == 'true') {
		    alert("성공");
		    location.href = "/member/view.do";
		} else {
		    alert("실패");
		    location.href = "redirect:/member/view.do";
		}
	    }
	});
    });

}

// 파싱한 우편목록 html생성
function makePostList(data) {
    $("#postTbody").empty();
    var strHtml = '';

    if (data.errorCode != null && data.errorCode != "") {
	strHtml += '<tr>';
	strHtml += '    <td colspan="2">';
	strHtml += data.errorMessage;
	strHtml += '    </td>';
	strHtml += '</tr>';
    } else {
	var postlist = data.postlist;
	var length = postlist.length;

	for (var i = 0; i < length; i++) {
	    strHtml += '<tr>';
	    strHtml += '  <td>' + postlist[i].zipcode + '</td>';
	    strHtml += '  <td><a id="' + postlist[i].zipcode
		    + '"class="addressSelect" addr="' + postlist[i].address
		    + '">' + postlist[i].address + '</a></td>';
	    strHtml += '</tr>';
	}

	var totalCount = data.totalCount; // 전체 데이터 개수
	var totalPage = data.totalPage; // 전체 페이지 개수
	var countPerPage = data.countPerPage; // 페이지당 몇개씩 10
	var currentPage = data.currentPage; // 현재 페이지
	var startPage = data.startPage; // 시작페이지
	var endPage = data.endPage; // 끝페이지

	strHtml += '<tr align="center"><td colspan="2">';
	strHtml += '<nav>';
	strHtml += '    <ul class="pagination">';

	if (startPage > 1) {
	    strHtml += '      <li><a class="mvpage" move-page-no="' + 1
		    + '"><span>&laquo;</span></a></li>';
	}

	if (currentPage > 1) {
	    strHtml += '      <li><a class="mvpage" move-page-no="'
		    + (currentPage - 1) + '"><span>&lsaquo;</span></a></li>';
	}

	for (var j = startPage; j <= endPage; j++) {

	    if (j == currentPage) {
		strHtml += '        <li class="active"><a class="mvpage" move-page-no="'
			+ j
			+ '">'
			+ j
			+ '<span class="sr-only"></span></a></li>';
	    } else {
		strHtml += '        <li><a class="mvpage" move-page-no="' + j
			+ '">' + j + '<span class="sr-only"></span></a></li>';
	    }
	}

	if (currentPage < totalPage) {
	    strHtml += '      <li><a class="mvpage" move-page-no="'
		    + (currentPage + 1) + '"><span>&rsaquo;</span></a></li>';
	}

	if (endPage < totalPage) {
	    strHtml += '      <li><a class="mvpage" move-page-no="'
		    + (totalPage) + '"><span>&raquo;</span></a></li>';
	}

	strHtml += '    </ul>';
	strHtml += '</nav>';
	strHtml += '</td></tr>';
    }

    $("#postTbody").append(strHtml);
}// end makePostList

// 달력 설정 function
function setDatepicker() {
    $("#mBirth").datepicker({
	dateFormat : "yy-mm-dd",
	maxDate : 0,
	yearRange : "c-80:c",
	changeYear : true,
	changeMonth : true
    });
}

// 뒤로가기
function back() {
    $("#joinForm")[0].reset();
    history.go(-1);
}

// input 태그에서 엔터를 누를경우 의도치 않은 submit 방지
$('input[type="text"]').keydown(function(e) {
    if (e.keyCode === 13) {
	e.preventDefault();
    }
});
