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
#wrap {
    width: 100%;
    height: 100%;
}

div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, table, img, section, header, footer, article, object, svg {
    position: relative;
    backface-visibility: hidden;
    outline: none;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td {
    margin: 0;
    padding: 0;
}


div {
    display: block;
}

body {
    position: relative;
    outline: none;
    color: #000;
    background: #fff;
    text-align: left;
    line-height: 1.231;
    -webkit-text-size-adjust: none;
    letter-spacing: 2px;
    overflow: hidden;
}

#wrap #menu {
    position: fixed;
    top: 0;
    left: 0;
    width: 175px;
    height: 100%;
    background-color: #fff;
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
}

#wrap #menu h1 {
    position: absolute;
    top: 50%;
    left: 0;
    margin-top: -37px;
    width: 175px;
}

#wrap #menu h1 a, #wrap #menu h1 img {
    position: relative;
}

#wrap #menu .searchBtn {
    width: 18px;
    display: block;
    position: fixed;
    bottom: 15px;
    left: 15px;
}

#wrap #menu .searchBtn img {
    width: 100%;
    height: auto;
}

#wrap #contents {
    margin-left: 175px;
    height: 100%;
}

#wrap #contents .format6.freshsnapsWrap {
    background-color: #0000ff;
}

#wrap #contents .format6 {
    width: 100%;
    height: 100%;
    clear: both;
    *zoom: 1;
    background-color: #edff00;
}

#wrap #contents .format6:before, #wrap #contents .format6:after {
	display: table;
	content: "";
	line-height: 0;
}

#wrap #contents .format6:after {
	clear: both;
}

#wrap #contents .format6.freshsnapsWrap .item {
    background-color: #0000ff;
}

#wrap #contents .format6 .item {
    float: left;
    width: 16.6666%;
    height: 33.3333%;
    overflow: hidden;
    background-color: #edff00;
}

#wrap #contents .format6 .item a {
    width: 100.5%;
    height: 100.5%;
    position: relative;
    display: table;
    vertical-align: middle;
    overflow: hidden;
}

a {
    text-decoration: none;
}

a {
    cursor: pointer;
    _cursor: hand;
    outline: none;
}

#wrap #contents .format6 .item a:after {
    display: block;
    background-color: #edff00;
    width: 100%;
    height: 0;
    position: absolute;
    bottom: 0;
    left: 0;
    z-index: 2;
    content: "";
    -webkit-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    -moz-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    -o-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
}

/* #wrap #contents .format6 .item a .photo {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
} */

.pic-span{
	border: 0;
    outline: 0;
    font-size: 100%;
    vertical-align: baseline;
    margin: 0;
    padding: 0;
}

/* #wrap #contents .format6 .item a .photo {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
} */

.photo {
	background-position: 50% 50%;
	background-repeat: no-repeat;
	background-size: cover;
}



#searchWrap {
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
}
</style>
</head>
<body>
	<form action="list.gal" method="post" id="list">
		<div id="wrap">
			<div id="menu">
				<h1>
					<a class="cutOut" href="#">
						<img alt src="img/gal_logo.png" style="visibility: visible;">
						<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
					</a>
				</h1>
				
				<a class="searchBtn" style="cursor:pointer" onclick="show_search();"> 
				<a class="searchBtn" onclick="location.href='new.gal'">글쓰기</a>
				<img alt="search" src="img/icon_search.png" style="visibility: visible;">
				<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
				</a>
				
			</div>
			
			<!-- 본문 -->
			<div id="contents" style="transform-style: preserve-3d; perspective: 2000px; transform-origin: 50% 50% 0px; transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);">
				<div class="format6 freshsnapsWrap">
					<!-- ::before -->
					<c:forEach items="${list }" var="vo">
						<div class="item">
							<div class="cutSnap">
								<a onclick="href='detail.gal?id=${vo.id}&read=1'"> 
								<span class="pic-span photo">
									<img class="pic-image" src="<c:url value='/'/>${vo.filepath}" alt="사진이었던것"
									style="width:300px; height:300px;"/> 
								</span>
								
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