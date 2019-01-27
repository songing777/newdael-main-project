<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	window.onload = function() {
		var progrmBgnde = ${vo.progrmBgnde};
		var progrmEndde = ${vo.progrmEndde};
		var noticeBgnde = ${vo.noticeBgnde};
		var noticeEndde = ${vo.noticeEndde};
        
		function trans(p,q) {
			var yyyy = p.toString()[0] + p.toString()[1] + p.toString()[2]
					+ p.toString()[3];
			var mm = p.toString()[4] + p.toString()[5];
			var dd = p.toString()[6] + p.toString()[7];
			var total = yyyy.concat("-").concat(mm).concat("-").concat(dd);
			q.innerText = total;		
		}
		var pb = document.getElementById("progrmBgnde");
		trans(progrmBgnde,pb);
		var pe = document.getElementById("progrmEndde");
		trans(progrmEndde,pe);
		var nb = document.getElementById("noticeBgnde");
		trans(noticeBgnde,nb);
		var ne = document.getElementById("noticeEndde");
		trans(noticeEndde,ne);
		
		//document.getElementById("programInfo").value=${json};
		
		if(${vo.progrmSttusSe }=='2'){
			//console.log('1111');
			$('#programState').after(' : 모집중');
		}else if(${vo.progrmSttusSe }=='1'){
			$('#programState').after(' : 모집대기');
		}else{
			$('#programState').after(' : 모집완료');
			
		}
		

    };
    
    
	
</script>

<div id="fh5co-page">
	<div id="fh5co-main-services-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>봉사상세정보</h2>
					<p>
						<span>여러분의 <i class="sl-icon-heart"></i>따뜻한 손길을 내밀어 주세요
						</span>
					</p>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<h3 id="subject"
						style="margin: 5px 5px 5px 5px; text-align: center;">
						<span style="font-weight: 600;">${vo.progrmSj }</span>
					</h3>

				</div>
			</div>
			<div class="col-md-12">
				<form action="appl.do" method="post" >
				<div class="row" style="margin-left: 0px">

					<input value="참여하기" class="btn btn-primary" type="submit">
 					<!-- <input type="hidden"  name="programInfo" id="programInfo">  -->
 					<input type="hidden" value='${json }' name="programInfo" >  
					 <a href="list.do"
						class="btn btn-primary btn-outline with-arrow">목록으로<i
						class="icon-arrow-right"></i></a>
				</div>
				</form>
			</div>
			<div class="row line"
				style="border-bottom: 1px solid rgba(0, 0, 0, 0.3); margin: 5px 5px 5px 10px"></div>
			<div class="col-md-6">
				<div class="row" style="margin: auto">
					<div class="col-md-12 services-inner" style="margin-top: 20px"
						id="map-up">
						<div id="map" style="width: 100%; overflow: auto; margin: auto;"></div>
					</div>

				</div>
			</div>
			<div class="col-md-6">
				<aside class="sidebar"
					style="border-left: 1px solid rgba(0, 0, 0, 0.3);">
					<div class="row">
						<div class="col-md-12 side" style="margin: auto;">
							<ul>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">봉사시간</span> : ${vo.actBeginTm }:00 ~
									${vo.actEndTm }:00</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">봉사기간</span> : <span id="progrmBgnde"></span>
									~ <span id="progrmEndde"></span></li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">모집기간</span> : <span id="noticeBgnde"></span> ~
									<span id="noticeEndde"></span></li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">성인가능여부</span> : ${vo.adultPosblAt }</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">청소년가능여부</span> : ${vo.yngbgsPosblAt }</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">주관기관명</span> : ${vo.mnnstNm }</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">나눔주체명</span> : ${vo.nanmmbyNm }</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">봉사장소</span> :<br> ${vo.actPlace }</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">담당자명</span> : ${vo.nanmmbyNmAdmn }</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">전화번호</span> : ${vo.telno }</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">FAX번호</span> : ${vo.fxnum }</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">우편번호주소</span> :<br>
									${vo.postAdres }</li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">이메일</span> : ${vo.email }</li>
								<li><i class="icon-check"></i><span id="programState"
									style="font-weight: 600;">모집상태</span></li>
								<li><i class="icon-check"></i><span
									style="font-weight: 600;">모집인원(총인원)</span> : ${vo.rcritNmpr }</li>
							</ul>
						</div>
					</div>
				</aside>
			</div>
			<div class="col-md-12">
				<aside class="sidebar"
					style="border-top: 1px solid rgba(0, 0, 0, 0.3);">
					<div class="row">
						<div class="col-md-12 side">
							<i class="icon-check"></i><span style="font-weight: 600;">내용</span>
							: ${vo.progrmCn }

						</div>
					</div>
				</aside>
			</div>

		</div>

	</div>
</div>
<script>
	/* var json = (${vo});
	
	var vo = JSON.parse(json.toJSON);
	
	document.getElementById('subject').innerText = vo.MnnstNm;
	 */
</script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=177af53ddad8864dab8498322bdb3f8a&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new daum.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	var postAdres = '${vo.postAdres }';
	geocoder
			.addressSearch(
					postAdres,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === daum.maps.services.Status.OK) {

							var coords = new daum.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new daum.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new daum.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.progrmSj}</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						} else {
							var m = document.getElementById("map");
							m.style.visibility = 'hidden';
							var mu = document.getElementById("map-up");
							mu.innerHTML = "<h3 style='color : red; text-align : center;' >우편번호주소 정보가 잘못되어 지도 정보가 없습니다.<br>1365자원봉사포털의 담당자에게 문의하세요. </h3>";

						}
					});
</script>
