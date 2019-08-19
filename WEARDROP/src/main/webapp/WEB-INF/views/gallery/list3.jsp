<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 설정 -->
<script type="text/javascript" src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="js/fullpage.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet" href="css/sass-compiled.css" type="text/css" />
<link rel="stylesheet" href="css/fullpage.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css"> 

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

div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset,
	input, textarea, p, table, img, section, header, footer, article,
	object, svg {
	position: relative;
	backface-visibility: hidden;
	outline: none;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form,
	fieldset, input, textarea, p, blockquote, th, td {
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
	left: 150px;
}

#wrap #menu .searchBtn img {
	width: 100%;
	height: auto;
}

#wrap #menu .insertBtn{
	width: 100px;
	display: block;
	position: fixed;
	bottom: 100px;
	left: 100px;
}

/* 컨텐츠부분 */

#wrap #contents {
	margin-left: 175px;
	height: 100%;
}

#wrap #contents #columns {
    width: 100%;
    height: 100%;
    clear: both;
    *zoom: 1;
    background-color: #ffffff;
}

#wrap #contents #columns:before, #wrap #contents #columns:after {
	display: table;
	content: "";
	line-height: 0;
}

#wrap #contents #columns:after {
	clear: both;
}

#wrap #contents #columns .item {
    background-color: #0000ff;
}

#wrap #contents #columns .item {
    float: left;
    width: 16.66%;
    height: 33.33%;
    overflow: hidden;
    background-color: #ffffff;
}

#wrap #contents #columns .item a {
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

/* 카드뷰 */

#columns {
	colum-count:3;
}

#columns figure {
	display: inline-block;
	border: 1px solid rgba(0, 0, 0, 0.2);
	margin: 0;
	margin-top: 7.5px;
	margin-bottom: 7.5px;
	margin-right: 15px;
	/* padding: 10px; */
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

#columns figure img {
	width: 100%;
	height: 300px;
}

#columns figure figcaption {
	/* border-top: 1px solid rgba(0, 0, 0, 0.2); */
	line-hight: 20px;
	
	/* margin-top: 11px; */
}

/* 검색창 */

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
	background-color: #000000;
	opacity: 0.9;
}

#searchWrap .inputText {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 590px;
	height: 50px;
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
	margin: -9px 0 0 250px;
	display: block;
	width: 18px;
	height: 18px;
}

.header .logo {
	width: 100%;
}

.header .gnbIn {
	margin-left : -50px;
}
</style>
</head>
<body>
	<form action="list.gal" method="post" id="list">
		<div id="wrap">
			<div id="menu">
				<h1>
					<a class="cutOut" href="test.gal"> <img alt src="img/logo_gal_list.png"
						style="visibility: visible;">
						<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
					</a>
				</h1>
				<a class="insertBtn" style="cursor: pointer" onclick="location.href='new.gal'">
					글쓰기
					<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
				</a> 
				<a class="searchBtn" style="cursor: pointer" onclick="show_search();">
					<img alt="search" src="img/icon_search.png" style="visibility: visible;">
					<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
				</a>
			</div>

			<!-- 본문 -->
			<div id="contents">
					<div id="columns">
						<c:choose>
							<c:when test="${fn:length(page.list) > 0}">
								<c:forEach items="${page.list }" var="vo">
								<div class="item">
									<div class="cutSnap">
									<figure>
									<a onclick="href='detail.gal?id=${vo.id}&read=1'"> 
									<span class="photo">
										<img class="pic-image" src="<c:url value='/'/>${vo.filepath}" alt="사진이었던것">
									</span>
									</a>
									</figure>
									</div>
								</div>
								</c:forEach>	
							</c:when>
				
							<c:otherwise>
								<img src="img/no_result.png" alt="사진이었던것">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
					
				<!-- 페이징 -->
				<input type="hidden" name="curPage">
				</form>
				
				<jsp:include page="/WEB-INF/views/include/page.jsp"/>
				<script type="text/javascript">
				function go_page(no) {
				$('input[name=curPage]').val(no);
				$('#list').submit();
				}
				</script>
		
			
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		<!-- 검색기능  -->
		<div id="searchWrap" class="move" style="display: none;">
			<div class="bg" style="opacity: 0.6;"
				onclick="$('#searchWrap').css('display','none')"></div>
			<div class="inputText">
				<select name="search" style="height: 40px; width: 92px; left: 40%; border:0px;">
					<%-- <option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option> --%>
					<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
					<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
					<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
					<option value="writedate"
						${page.search eq 'writedate' ? 'selected' : '' }>작성일</option>
				</select> 
				<input type="text" name="keyword" value="${page.keyword }"
					style="padding-left: 3px; padding-right: 37px; width: 400px; line-height: 40px; border:0px; background-color:#ffffff; transform: matrix(1, 0, 0, 1, 0, 0);">
				<a><img alt="SUBMIT" onclick="$('form').submit()"
					class="inputBtn" height="18" src="img/icon_search.png" width="18"
					style="opacity: 1; transform: matrix(1, 0, 0, 1, 0, 0);" /></a>
			</div>
		</div>
	

</body>
</html>