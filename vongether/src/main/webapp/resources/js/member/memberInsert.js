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

    // input 태그에서 엔터를 누를경우 의도치 않은 submit 방지
    $('input[type="text"]').keydown(function(e) {
	if (e.keyCode === 13) {
	    e.preventDefault();
	}
    });

    $('input[type="password"]').keydown(function(e) {
	if (e.keyCode === 13) {
	    e.preventDefault();
	}
    });

    // 아이디(이메일) 유효성 체크
    $("#mId")
	    .change(
		    function() {
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var pass = mId.value.match(regExp);
			if (pass === null) {
			    swal("오류!", "다시 입력해주세요!", "error");
			    $("#mId").val("");
			    $("#mId").focus();
			} else {
			    $("#id_check_row").text("아이디 중복 체크를 해주세요 ");
			    $("#id_check_row").css("color", "blue");
			}
		    });

    // 아이디(이메일) 중복 체크
    $("#checkId").click(function() {
	var mId = $("#mId").val();
	$.ajax({
	    url : '/member/idCheck?mId=' + mId,
	    type : 'get',
	    success : function(data) {
		if (data === 1) {
		    $("#id_check_row").text("사용중인 아이디입니다! ");
		    $("#id_check_row").css("color", "red");
		    $("#joinBtn").attr("disabled", true);
		} else {
		    if (mId === "") {
			$("#id_check_row").text("아이디를 제대로 입력해주세요! ");
			$("#id_check_row").css("color", "red");
			$("#joinBtn").attr("disabled", true);
		    } else {
			$("#id_check_row").text("입력 가능한 아이디입니다! ");
			$("#id_check_row").css("color", "blue");
			$("#joinBtn").attr("disabled", false);
		    }
		}
	    }
	});
    });

    // 비밀번호 조합 체크
    $("#pwd1").change(function() {
	// 최소 6자리 이상 12자 이하
	// 영어 소대문자숫자, 특수기호 2가지 조합
	var regExp = /^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^*+=-]).{6,12}$/;
	var pass = pwd1.value.match(regExp);
	if (pass === null) {
	    swal("오류!", "유효한 형식으로 입력해주세요", "error");
	    $("#pwd1").val("");
	    $("#pwd1").focus();
	}
    });

    // 비밀번호 확인값 일치체크
    $("#pwd2").change(function() {
	if ($('#pwd1').val() != $('#pwd2').val()) {
	    $("#pwd2").val("");
	    swal("오류!", "값이 일치하지 않습니다", "error");
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
	}
    });

    // 가입하기 버튼
    $("#joinBtn").click(function(e) {

	// 널값 체크
	if ($("#mId").val() == "") {
	    swal("오류!", "아이디 입력을 해주세요", "error");
	    $("#mId").focus();
	    return;
	}

	if ($("#mName").val() == "") {
	    swal("오류!", "이름을 입력해주세요", "error");
	    $("#mName").focus();
	    return;
	}

	if ($("#mBirth").val() == "") {
	    swal("오류!", "생년월일을 입력해주세요", "error");
	    $("#mBirth").focus();
	    return;
	}

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

	// FORM 데이터를 JSON 형식으로 변환하는 플러그인 설정
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
	var parameter = JSON.stringify($("#joinForm").serializeObject());

	$.ajax({
	    url : '/member/join.do',
	    type : 'POST',
	    contentType : 'application/json;charset=UTF-8',
	    dataType : 'json',
	    data : parameter,
	    success : function(data) {
		if (data.isSuccess == 'true') {
		    alert("성공! 메일함을 확인해주세요");
		    // setTimeout(function() { swal("2"); }, 2000);
		    location.href = "/member/login.do";
		} else {
		    swal("오류!", "다시 확인하세요", "error");
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
	    strHtml += '      <li><a class="btn-sm mvpage" move-page-no="' + 1
		    + '"><span>&laquo;</span></a></li>';
	}

	if (currentPage > 1) {
	    strHtml += '      <li><a class="btn-sm mvpage" move-page-no="'
		    + (currentPage - 1) + '"><span>&lsaquo;</span></a></li>';
	}

	for (var j = startPage; j <= endPage; j++) {

	    if (j == currentPage) {
		strHtml += '        <li class="active"><a class="btn-sm mvpage" move-page-no="'
			+ j
			+ '">'
			+ j
			+ '<span class="sr-only"></span></a></li>';
	    } else {
		strHtml += '        <li><a class="btn-sm mvpage" move-page-no="' + j
			+ '">' + j + '<span class="sr-only"></span></a></li>';
	    }
	}

	if (currentPage < totalPage) {
	    strHtml += '      <li><a class="btn-sm mvpage" move-page-no="'
		    + (currentPage + 1) + '"><span>&rsaquo;</span></a></li>';
	}

	if (endPage < totalPage) {
	    strHtml += '      <li><a class="btn-sm mvpage" move-page-no="'
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
