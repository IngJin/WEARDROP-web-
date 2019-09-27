<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>		<!--jquery 선언-->
<link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all"/>
<link type="text/css" rel="stylesheet" href="css/ingjin.css"/>
<script type="text/javascript" src="js/MarcTooltips.js"></script>
<meta charset="UTF-8">
<title>쇼핑몰 위치</title>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-size: 18px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 100%;
	/* margin-top: -180px; */
}

#menu_wrap {
	/* position: absolute; */
	/* top: 100px; */
	left: 0;
	bottom: 0;
	width: 480px;
	height: 700px; 
	overflow-y: auto;
	background: rgba(255,255,255,0.9);
	z-index: 1;
	font-size: 14px;
}

.bg_white {
	background: #fff;
}

/* #menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}
 */

.option {
	text-align: center;
	position: relative;
	/* margin-left: 610px; */
}

/*#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
} */

#placesList ul {
	padding-inline-start: 0;
	margin: 0;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px dotted #000;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#menu_wrap::-webkit-scrollbar {
	display: none;
}


#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	font-size: 1.1em;
}

#placesList .item h5{
	margin-block-start: 1.2em;
    margin-block-end: 1.2em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 20px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

/* #keyword {
	height: 36px;
	width: 410px;
	font-size: 15px;
	border: 1px solid #000000;
}

.searchBtn {
	position: absolute;
	top: 0;
	margin-left: 167px;
	height: 28px;
	line-height: 35px;
	padding: 5px;
	background-color: #000000;
	cursor: pointer;
} */

#ingjin_main .comment_block .inputText {
	width: 500px;
	height: 50px;
	font-size: 14px;
	display: block;
	border: none;
	padding:10px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

#ingjin_main .comment_block .inputBtn {
	margin: -25px 0 0 460px;
	display: block;
	width: 15px;
	height: 15px;
}

</style>
</head>
<body>
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu" style="background-color: rgba(255, 255, 255, 0.9);">
		<h1>
			<a class="cutOut" href="map.com"> 
				<img art src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width:0px; right:18px; left:0px;"></div>
			</a>
		</h1>
	</div>	

	<!-- 본문 -->
	<div id="weardrop_contents">
		<div class="modify_bg" style="position: absolute; background-color: rgba(0, 0, 0, 0.4); width: 100%; height: 120vh; left: 0; top: 0; z-index: -10;"></div>
		<header style="color: #fff;">
			<h1>COMMUNITY</h1>
		</header>
		<div id="ingjin_main">
		<!-- INFO -->
			<aside class="ingbox">
				<h2><img src='img/icon/info_icon.png' class="section_icon"/>INFO</h2>
				<!-- 소개란 -->
				<div class="aside_block">
					<h3>Find a Store?</h3>
					<div class="item">
						<p>지역별 검색을 통해서<span class="right"></span></p>
					</div>
					<div class="item">
						<p>매장 위치를 찾아주는 게시판입니다.<span class="right"></span></p>
					</div>
				</div>
					
				<!-- SNS 링크 -->
				<div class="aside_block">
					<h3>Follow Us</h3>
					<div class="ingstagram">
						<a href="https://www.instagram.com/weardrop" target="_blank">
							<img class="gal_icon" src="img/icon/icon_instagram.png" style="margin-right: 7px;"/> 
							<span class="my-effect">http://www.instagram.com/</span>
						</a>
					</div>
				</div>
				
				<!-- aside_box -->
				<div class="aside_block aside_box">
					<h2>WEARDROP?</h2>
					<p>
					WEARDROP is a community media that creates fashion culture
					in Korea. The Fashion Forum, WEARDROP, was launched in 2019. We
					form a fashion community with a style and continue to send out
					the "now" in Korea.
					</p>

					<p>
					<img class="gal_icon" src="img/icon/tech_icon.png" style="margin-right: 5px;" /> 
					Technical support : SeolHwa 
					<img class="gal_icon" src="img/icon/admin_snowflake.png" style="margin-left: 5px;" />
					</p>

					<!-- 
					<p>
					<span class="right">
					<img class="gal_icon" src="img/icon/paintbrush_icon.png" style="margin-right:5px;"/>
					Design by Ingjin
					</span>
					</p> 
					-->
				</div>
			</aside>
				
			<section class="ingbox">
				<h2><img src='img/icon/map_icon.png' class="section_icon"/>MAP</h2>
					<div id="map" style="width:600px; height: 802px;"></div>
					<!-- position: relative; overflow: hidden;" -->
			</section>
			
			<!-- 검색 -->
			<comment class="ingbox">
				<h2>
					<img src='img/icon/search_icon_white.png' class="section_icon"/>SEARCH 
				</h2>
				
				<div class="comment_block option" style="padding: 0;">
					<div class="inputText" style="background-color:#fff;">
						<!-- keyword -->
						<form onsubmit="searchPlaces(); return false;">
						<input type="text" placeholder="지역명 + 옷가게 로 입력하세요." name="keyword" id="keyword" size="50"
								style="width:100%; height:30px; padding:-1px; border:0; border: 0; background-color:#fff;">
						</form>
						<!-- searchBtn -->
						<a>
							<img alt="SUBMIT" onclick="$('form').submit()"
							id="gal_search_btn" class="inputBtn" src="img/icon_search.png"
							style="opacity: 1; width: 17px; height: 17px; vertical-align: middle;" />
						</a>
					</div>
				</div>
			</comment>
			
			<comment class="ingbox" style="margin-top:10px;">
				<h2><img src='img/icon/list_icon_white.png' class="section_icon"/>LIST</h2>
				<div id="menu_wrap" class="bg_white" style="width: 100%;">
					<ul id="placesList" style="padding: 10px;"></ul>
					<div id="pagination"></div>
				</div>
			</comment>
			</div>
		</div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=618c2e7f29b2124480e969cbdaa84921&libraries=services"></script>
			<script type="text/javascript" src="./js/geolocation.gs.js"></script>
			<script type="text/javascript">
			//텍스트 셔플
			window.addEventListener('load', init);
			function init() {
				var effectList = [];
				var elementList = document.querySelectorAll('.my-effect');

				for (var i = 0; i < elementList.length; i++) {

					var element = elementList[i];
					element.dataset.index = i;

					effectList[i] = new ShuffleText(element);

					element.addEventListener('mouseenter', function() {
						effectList[+this.dataset.index].start();
					});

					element.addEventListener('mouseleave', function() {
						effectList[+this.dataset.index].start();
					});

					effectList[i].start();
				}
			}
			
				// 마커를 담을 배열입니다
				var markers = [];

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(35.153812, 126.888033), // 지도의 중심좌표
					level : 3	// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();

				// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					zIndex : 1
				});

				// 키워드로 장소를 검색합니다
				searchPlaces();

				// 키워드 검색을 요청하는 함수입니다
				function searchPlaces() {

					var keyword = document.getElementById('keyword').value;

					/* if (!keyword.replace(/^\s+|\s+$/g, '')) {
					    alert('키워드를 입력해주세요!');
					    return false;
					} */

					// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
					ps.keywordSearch(keyword, placesSearchCB);
				}

				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

						// 정상적으로 검색이 완료됐으면
						// 검색 목록과 마커를 표출합니다
						displayPlaces(data);

						// 페이지 번호를 표출합니다
						//displayPagination(pagination);

					} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

						alert('검색 결과가 존재하지 않습니다.');
						return;

					} else if (status === kakao.maps.services.Status.ERROR) {

						alert('검색 결과 중 오류가 발생했습니다.');
						return;

					}
				}

				// 검색 결과 목록과 마커를 표출하는 함수입니다
				function displayPlaces(places) {

					var listEl = document.getElementById('placesList'), menuEl = document
							.getElementById('menu_wrap'), fragment = document
							.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

					// 검색 결과 목록에 추가된 항목들을 제거합니다
					removeAllChildNods(listEl);

					// 지도에 표시되고 있는 마커를 제거합니다
					removeMarker();

					for (var i = 0; i < places.length; i++) {

						// 마커를 생성하고 지도에 표시합니다
						var placePosition = new kakao.maps.LatLng(places[i].y,
								places[i].x), marker = addMarker(placePosition,
								i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						bounds.extend(placePosition);

						// 마커와 검색결과 항목에 mouseover 했을때
						// 해당 장소에 인포윈도우에 장소명을 표시합니다
						// mouseout 했을 때는 인포윈도우를 닫습니다
						(function(marker, title) {
							kakao.maps.event.addListener(marker, 'mouseover',
									function() {
										displayInfowindow(marker, title);
									});

							kakao.maps.event.addListener(marker, 'mouseout',
									function() {
										infowindow.close();
									});

							itemEl.onmouseover = function() {
								displayInfowindow(marker, title);
							};

							itemEl.onmouseout = function() {
								infowindow.close();
							};
						})(marker, places[i].place_name);

						fragment.appendChild(itemEl);
					}

					// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
					listEl.appendChild(fragment);
					menuEl.scrollTop = 0;

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					map.setBounds(bounds);
				}

				// 검색결과 항목을 Element로 반환하는 함수입니다
				function getListItem(index, places) {

					var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
							+ (index + 1)
							+ '"></span>'
							+ '<div class="info">'
							+ '   <h5>' + places.place_name + '</h5>';

					if (places.road_address_name) {
						itemStr += '    <span>' + places.road_address_name
								+ '</span>'
								/* + '   <span class="jibun gray">' + places.address_name */
								+ '</span>';
					} else {
						itemStr += '    <span>' + places.address_name
								+ '</span>';
					}

					itemStr += '  <span class="tel">' + places.phone
							+ '</span>' + '</div>';

					el.innerHTML = itemStr;
					el.className = 'item';

					return el;
				}

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarker(position, idx, title) {
					var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
					imgOptions = {
						spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
						spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						offset : new kakao.maps.Point(13, 37)
					// 마커 좌표에 일치시킬 이미지 내에서의 좌표
					}, markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize, imgOptions), marker = new kakao.maps.Marker(
							{
								position : position, // 마커의 위치
								image : markerImage
							});

					marker.setMap(map); // 지도 위에 마커를 표출합니다
					markers.push(marker); // 배열에 생성된 마커를 추가합니다

					return marker;
				}

				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null);
					}
					markers = [];
				}

				// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
				function displayPagination(pagination) {
					var paginationEl = document.getElementById('pagination'), fragment = document
							.createDocumentFragment(), i;

					// 기존에 추가된 페이지번호를 삭제합니다
					while (paginationEl.hasChildNodes()) {
						paginationEl.removeChild(paginationEl.lastChild);
					}

					for (i = 1; i <= pagination.last; i++) {
						var el = document.createElement('a');
						el.href = "#";
						el.innerHTML = i;

						if (i === pagination.current) {
							el.className = 'on';
						} else {
							el.onclick = (function(i) {
								return function() {
									pagination.gotoPage(i);
								}
							})(i);
						}

						fragment.appendChild(el);
					}
					paginationEl.appendChild(fragment);
				}

				// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
				// 인포윈도우에 장소명을 표시합니다
				function displayInfowindow(marker, title) {
					var content = '<div style="padding:5px;z-index:1;">'
							+ title + '</div>';

					infowindow.setContent(content);
					infowindow.open(map, marker);
				}

				// 검색결과 목록의 자식 Element를 제거하는 함수입니다
				function removeAllChildNods(el) {
					while (el.hasChildNodes()) {
						el.removeChild(el.lastChild);
					}
				}
			</script>
		</div>
		
		<img src="img/bg/road1.jpg" style="position:fixed; left:0; top:0; width:100%; height:100%; z-index: -9999"/>
</body>
</html>