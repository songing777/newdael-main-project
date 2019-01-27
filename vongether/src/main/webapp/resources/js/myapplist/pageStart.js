
	if (max > applist[0].length) {
		max = applist[0].length
	}
	for (var i = min; i < max; i++) {
		$('#addlist')
				.after(
						'<div class="row applisthead"><div class="col-md-1 text-center "><div class="desc ">'
								+ applist[0][i]
								+ '</div></div><div class="col-md-4 text-center "><div class="desc ">'
								+ applist[1][i]
								+ '</div></div><div class="col-md-3 text-center "><div class="desc ">'
								+ applist[2][i]
								+ '</div></div><div class="col-md-2 text-center "><div class="desc ">'
								+ applist[3][i].substr(0, 10)
								+ '</div></div><div class="col-md-2 text-center "><div class="desc ">'
								+ applist[4][i].substr(0, 10)
								+ '</div></div></div>');
	}
	$('#addlist').after(
			'<div class="row applist">' + '<div class="col-md-1 text-center ">'
					+ '<div class="desc">코드</div>' + '</div>'
					+ '<div class="col-md-4 text-center ">'
					+ '<div class="desc">봉사 제목</div>' + '</div>'
					+ '<div class="col-md-3 text-center ">'
					+ '	<div class="desc">봉사 장소</div>' + '</div>'
					+ '<div class="col-md-2 text-center ">'
					+ '<div class="desc">봉사 시작 시간</div>' + '</div>'
					+ '<div class="col-md-2 text-center ">'
					+ '<div class="desc">봉사 마감 시간</div>' + '</div>' + '</div>');

	var total_page_num = Math.floor(applist[0].length / 10);
	//console.log(applist[0].length);
	for (var i = 0; i < (total_page_num + 1); i++) {
		$('#page').before(
				'<li id="pageli' + (i + 1) + '"><a href="#" id="page' + (i + 1)
						+ '" onclick="pageClick1(this);">' + (i + 1)
						+ '</a></li>');
	}

	if (max != 0) {
		$('#pageli1').addClass('active');
	}

	if (Number(pageNum) > 1) {
		$('#pagePreLitag').show();
	} else {
		$('#pagePreLitag').hide();
	}

	console.log(Number(pageNum));
	if (Number(pageNum) == total_page_num + 1) {

		$('#page').hide();
	} else {
		$('#page').show();

	}