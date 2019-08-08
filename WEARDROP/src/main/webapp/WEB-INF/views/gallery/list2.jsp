<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 설정 -->
<script src="js/shuffle-text/build/shuffle-text.js"></script>
<link rel="stylesheet" href="css/sass-compiled.css" type="text/css" />
<script type="text/javascript">
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

	function show_map() {
		$('#popup, #popup-background').css('display', 'block');
	}

	function show_search() {
		$('#searchWrap').css('display', 'block');
	}
	
	/* function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#th_img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.file[0]);
		}
	} */
</script>
<style type="text/css">

body {
    text-align: center;
}
#wrap #menu {
	position: fixed;
	top: 0;
	left: 0;
	width: 175px;
	height: 100%;
	background-color: #000;
}

#wrap #contents {
	margin-left: 175px;
	height: 100%;
	background-color: #f2f2f2;
}

#wrap #contents .format6 .freshsnapsWrap {
	background-color: #0000ff;
}

#wrap #contents .format6 {
	width: 100%;
	height: 100%;
	clear: both;
	*zoom: 1;
	background-color: #000000;
}

#wrap #contents .format6:before, #wrap #contents .format6:after {
	display: table;
	content: "";
	line-height: 0;
}

#wrap #contents .format6:after {
	clear: both;
}

#wrap #contents .format6 .item {
	float: left;
	width: 16.6666%;
	height: 33.3333%;
	overflow: hidden;
	background-color: #ffffff;
}

/* #wrap #contents .format6 .item a .photo {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.photo {
	background-position: 50% 50%;
	background-repeat: no-repeat;
	background-size: cover;
} */

/* 사이드바 */
/* #sidebarMenu {
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	width: 175px;
	transform: translateX(-250px);
	transition: transform 250ms ease-in-out;
	background: linear-gradient(180deg, #FC466B 0%, #3F5EFB 100%);
}

.sidebarMenuInner {
	margin: 0;
	padding: 0;
	border-top: 1px solid rgba(255, 255, 255, 0.10);
}

.sidebarMenuInner li {
	list-style: none;
	color: #fff;
	text-transform: uppercase;
	font-weight: bold;
	padding: 20px;
	cursor: pointer;
	border-bottom: 1px solid rgba(255, 255, 255, 0.10);
}

.sidebarMenuInner li span {
	display: block;
	font-size: 14px;
	color: rgba(255, 255, 255, 0.50);
}

.sidebarMenuInner li a {
	color: #fff;
	text-transform: uppercase;
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
}

input[type="checkbox"]:checked ~ #sidebarMenu {
	transform: translateX(0);
}

input[type=checkbox] {
	transition: all 0.3s;
	box-sizing: border-box;
	display: none;
}

.sidebarIconToggle {
	transition: all 0.3s;
	box-sizing: border-box;
	cursor: pointer;
	position: absolute;
	z-index: 99;
	height: 100%;
	width: 100%;
	top: 22px;
	left: 15px;
	height: 22px;
	width: 22px;
}

.spinner {
	transition: all 0.3s;
	box-sizing: border-box;
	position: absolute;
	height: 3px;
	width: 100%;
	background-color: #fff;
}

.horizontal {
	transition: all 0.3s;
	box-sizing: border-box;
	position: relative;
	float: left;
	margin-top: 3px;
}

.diagonal.part-1 {
	position: relative;
	transition: all 0.3s;
	box-sizing: border-box;
	float: left;
}

.diagonal.part-2 {
	transition: all 0.3s;
	box-sizing: border-box;
	position: relative;
	float: left;
	margin-top: 3px;
}

input[type=checkbox]:checked ~ .sidebarIconToggle>.horizontal {
	transition: all 0.3s;
	box-sizing: border-box;
	opacity: 0;
}

input[type=checkbox]:checked ~ .sidebarIconToggle>.diagonal.part-1 {
	transition: all 0.3s;
	box-sizing: border-box;
	transform: rotate(135deg);
	margin-top: 8px;
}

input[type=checkbox]:checked ~ .sidebarIconToggle>.diagonal.part-2 {
	transition: all 0.3s;
	box-sizing: border-box;
	transform: rotate(-135deg);
	margin-top: -9px;
} */

/* #popup-background {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background-color: #000;
	opacity: 0.5;
	display: none;
	z-index: 99997;
}

#popup {
	position: absolute;
	width: 800px;
	height: 600px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	border: 3px solid #666;
	display: none;
	z-index: 99998;
} */

/* #searchWrap {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
}

#searchWrap form {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

#searchWrap .bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: #00ffff;
	opacity: 0.9;
}

#searchWrap .inputText {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 590px;
	height: 40px;
	margin: -20px 0 0 -245px;
	background-color: #fff;
	font-size: 14px;
	display: block;
	border: none;
	padding: 3px;
	padding-right: 37px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

#searchWrap .inputBtn {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -9px 0 0 217px;
	display: block;
	width: 18px;
	height: 18px;
} */
</style>
</head>
<body>
	<form action="list.gal" method="post" id="list">
		<div id="wrap">
			<div id="popup"></div>
			<div id="popup-background"
				onclick="$('#popup, #popup-background').css('display','none')"></div>
			<div id="menu">
				<input type="checkbox" class="openSidebarMenu" id="openSidebarMenu">
				<label for="openSidebarMenu" class="sidebarIconToggle">
					<div class="spinner diagonal part-1"></div>
					<div class="spinner horizontal"></div>
					<div class="spinner diagonal part-2"></div>
				</label>
				<!-- 사이드바 메뉴 -->
				<div id="sidebarMenu">
					<ul class="sidebarMenuInner">
						<li></li>
						<li>WEARDROP <span>OOTD GALLERY</span></li>
						<li><a href="https://instagram.com/ing.jin" target="_blank">Instagram</a></li>
						<li><a onclick="show_map()">글쓰기</a></li>
						<li><a onclick="location.href='new.gal'">글쓰기</a></li>
						<li><a onclick="show_search()">검색</a></li>
					</ul>
				</div>
			</div>
			<!-- 본문 -->
			<div id="contents">
				<div class="format6 freshsnapsWrap">
					<!-- ::before -->
					<c:forEach items="${list }" var="vo">
						<div class="item">
							<div class="pic">
								<a onclick="href='detail.gal?id=${vo.id}&read=1'"> 
								<img class="photo pic-image" src="<c:url value='/'/>${vo.filepath}" alt="사진이었던것" 
									style="width: 300px; height: 300px" /> 
								<span class="pic-caption bottom-to-top"> 
									<span><p class="my-effect">${vo.title}</p></span><br> 
									<span><p class="my-effect">조회수 : ${vo.readcnt }</p></span>
								</span>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<!-- 검색기능  -->
		<div id="searchWrap" class="move" style="display: none;">
			<div class="bg" style="opacity: 0.9;" onclick="$('#searchWrap').css('display','none')"></div>
			<div class="inputText">
				<select name="search" style="height: 40px; width: 92px; left: 40%;">
					<%-- 	<option value="all" ${search eq 'all' ? 'selected' : '' }>전체</option> --%>
					<option value="title" ${search eq 'title' ? 'selected' : '' }>제목</option>
					<option value="content" ${search eq 'content' ? 'selected' : '' }>내용</option>
					<option value="writer" ${search eq 'writer' ? 'selected' : '' }>작성자</option>
					<option value="writedate" ${search eq 'writedate' ? 'selected' : '' }>작성일</option>
				</select> 
				<input type="text" name="keyword" value="${keyword }" style="padding-left: 3px; padding-right: 37px; width: 390px; line-height: 20px; transform: matrix(1, 0, 0, 1, 0, 0);">
				<a><img alt="SUBMIT" onclick="$('form').submit()" class="inputBtn" height="18" src="img/icon_search.png" width="18"
					style="opacity: 1; transform: matrix(1, 0, 0, 1, 0, 0);" /></a>
			</div>
		</div>
</body>
</html>