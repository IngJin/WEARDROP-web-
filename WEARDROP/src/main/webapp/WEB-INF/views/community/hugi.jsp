<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>		<!--jquery 선언-->
<link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all"/>
<link type="text/css" rel="stylesheet" href="css/ingjin.css"/>
<script type="text/javascript" src="js/MarcTooltips.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#columns {
    width: 100%;
    height: 100%;
    clear: both;
    *zoom: 1;
    background-color: #ffffff;
}

#columns .gal_item {
    float: left;
    width: 33.3%;
    /* height: 33.33%; */
    overflow: hidden;
    background-color: #ffffff;
}

#columns .gal_item a {
    width: 100.5%;
    height: 100.5%;
    position: relative;
    display: table;
    vertical-align: middle;
    overflow: hidden;
}

/* #columns {
	colum-count:3;
} */

#columns .cutSnap {
	display: inline-block;
	margin-top: 10px;
	margin-right: 10px;
	margin-bottom: -10px;
	/* border: 1px solid rgba(0, 0, 0, 0.2); */
	/* margin: 0; */
	/* 
	margin-bottom: 5px;
	
	/* padding: 10px; */
}

#columns .cutSnap img {
	width: 100%;
	height: 100%;
}

#columns .pic-caption{
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-o-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box
}


.pic {
	max-width: 100.5%;
	max-height: 100.5%;
	position: relative;
	overflow: hidden;
	margin:0;
	margin-top:5px;
	margin-right: 10px;
	display: inline-block;
	-webkit-animation: anima 2s;
	-moz-animation: anima 2s;
	-o-animation: anima 2s;
	-ms-animation: anima 2s;
	animation: anima 2s;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	backface-visibility: hidden;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

.pic-caption {
	cursor: default;
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	padding: 30px;
	text-align: left;
	color:#fff;
	-ms-filter:
		"progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	filter: alpha(opacity = 0);
	-moz-opacity: 0;
	-khtml-opacity: 0;
	opacity: 0
}

.pic-image {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-o-transform: scale(1.2);
	-ms-transform: scale(1.2);
	transform: scale(1.2)
}

.pic:hover .pic-image {
	-webkit-transform: scale(1.5);
	-moz-transform: scale(1.5);
	-o-transform: scale(1.5);
	-ms-transform: scale(1.5);
	transform: scale(1.5)
}

a, a:hover, .pic .pic-image, .pic-caption, .pic:hover .pic-caption, .pic:hover img
	{
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
	transition: all 0.5s ease
}

.pic:hover .bottom-to-top{
	-ms-filter:
		"progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	filter: alpha(opacity = 100);
	-moz-opacity: 1;
	-khtml-opacity: 1;
	opacity: 1;
	-webkit-user-select: none;
	-moz-user-select: none;
	-o-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-touch-callout: none;
	-moz-touch-callout: none;
	-o-touch-callout: none;
	-ms-touch-callout: none;
	touch-callout: none;
	-webkit-tap-highlight-color: transparent;
	-moz-tap-highlight-color: transparent;
	-o-tap-highlight-color: transparent;
	-ms-tap-highlight-color: transparent;
	tap-highlight-color: transparent
}

.bottom-to-top {
	top: 50%;
	left: 0;
}

.pic:hover .bottom-to-top {
	top: 0;
	left: 0;
}


@
keyframes anima {
	from {margin-top: -50px;
	-ms-filter:
		"progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
	filter: alpha(opacity = 0);
	-moz-opacity: 0;
	-khtml-opacity: 0;
	opacity: 0
}

.scroll-box{
	position: fixed;
	right:0;
	bottom:0;
	transform: translate(-50%,-50%);
}

.scroll-box span{
	display: block;
	width: 20px;
	height: 20px;
	border-bottom: 1px solid #000;
	border-right: 1px solid #000;
	transform: rotate(45deg);
	margin:-10px;
	animation: scroll-animate 2s infinite;
	 
}

.scroll-box span:nth-child(2){
	animation-delay:-0.2s;
	
}

.scroll-box span:nth-child(3){
	animation-delay:-0.4s
}

@keyframes scroll-animate {
	0%
	{
		opacity:0;
		transform: rotate(45deg) translate(-20px,-20px);
	}
	50%
	{
		opacity:1;
	}	
	100%
	{
		opacity:0;
		transform: rotate(45deg) translate(20px,20px);
	}
}
</style>
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
</script>
</head>
<body>
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu">
		<h1>
			<a class="cutOut" href="list.hu"> 
				<img src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
			</a>
		</h1>
	</div>

	<!-- 본문 -->
	<div id="weardrop_contents">
		<form action="list.hu" method="post" id="list">
		<header>
			<h1>COMMUNITY</h1>
		</header>
		
				<!-- 디자인 메인 -->
		<div id="ingjin_main">
			<!-- INFO -->
			<aside>
				<h2><img src='img/icon/info_icon.png' class="section_icon"/>INFO</h2>
					<!-- 소개란 -->
				<div class="aside_block">
					<h3>Reviews?</h3>
					<div class="item">
						<p>여러분들이 소장하고 있는<span class="right"></span></p>
					</div>
					<div class="item">
						<p>제품들을 리뷰해주세요!<span class="right"></span></p>
					</div>
				</div>
				
				<!-- 검색창 -->
				<div class="aside_block">
					<h3>Search</h3>
					<div class="inputText">
						<!-- search -->
						<select name="search" style="height: 30px; width: 50px; border:0px; background-color: #f1f1f1">
							<option value="all" ${page.search eq 'all' ? 'selected' : '' }  >전체</option>
							<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
							<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
							<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
						</select>
						<!-- keyword -->
						<input type="text" name="keyword" value="${page.keyword }"
								style="width:180px; height:30px; padding:-1px; border:0px; background-color:#f1f1f1;">
						<!-- searchBtn -->
						<a>
							<img alt="SUBMIT" onclick="$('form').submit()"
							id="gal_search_btn" class="inputBtn" src="img/icon_search.png"
							style="opacity: 1; width: 17px; height: 17px; vertical-align: middle;" />
						</a>
					</div>
						
					<!-- 툴팁 -->
					<script type="text/javascript">
						MarcTooltips.add('#gal_search_btn', 'Search!', {position:'bottom'});
					</script>
				</div>
					
				<!-- 글 작성 -->				
				<div class="aside_block">
					<h3>Write</h3>
					<c:choose>
						<c:when test="${!empty info_login }"> 
							<div class="ing_btn insertBtn">
							<div class="ing_eff_yes"></div>
								<a style="cursor: pointer; color: #fff;" onclick="location='new.hu'">Write</a>
							</div>
						</c:when>
						<c:otherwise>
							<div id="not_login_btn" class="not_login_btn insertBtn">
							<div class="ing_eff_not"></div>
								<a style="cursor: pointer; color: #fff;" onclick="location.href='login.ho'">Write</a>
							</div>
						</c:otherwise>
					</c:choose>
					
					<!-- 툴팁 -->
					<script type="text/javascript">
						MarcTooltips.add('#not_login_btn', '로그인 후 글 작성이 가능합니다!', {position:'right'});
					</script>
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
			
			<!-- COMMUNITY 섹션  -->		
			<section style="width:1000px;">
				<h2><img src='img/icon/list_icon_white.png' class="section_icon"/>BOARD LIST</h2>
				<!--탭 메뉴 영역  -->
								<div id="columns">
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list }" var="vo">
								<div class="gal_item">
									<div class="cutSnap">
									<a onclick="href='detail.hu?id=${vo.id}&read=1'">
									<div class="photo pic">
										<img class="pic-image" src="<c:url value='/'/>${vo.filepath}" alt="사진이었던것"/>
										<span class="pic-caption bottom-to-top">
										<p class="pic-title" style="margin-top:65%; font-size:26px; font-weight: bold; border-bottom: 1px solid #fff;">${vo.title }</p>
										<p>
										<img src="img/icon/gal_user_icon.png" style="width:15px; height:15px; vertical-align: text-bottom;"/>
										<font style="font-size: 14px; margin-left: 2px;">${vo.writer }</font> /
										<img src="img/icon/gal_eye_icon_white.png" style="width:15px; height:15px; vertical-align: text-bottom;"/>
										<font style="font-size: 14px; margin-left: 5px;">${vo.readcnt}</font>
										</p>
										<p class="my-effect" style="width:40%; text-align:center; background-color: #000; font-weight: bold; margin-top: 10px; padding:0 10px">${vo.writedate }</p>
										</span>
									</div>
									</a>
									</div>
								</div>
								</c:forEach>	
							</c:when>
				
							<c:otherwise>
								<div>
		<img src="img/bg/crycry.gif" alt="사진이었던것" style="width: 100%; z-index: -99;">
		<div class="aside_block aside_box" style="float: right; z-index: 50; position:absolute; top:25%; left:62%;" >
					<h2>DATA NOT FOUND!</h2>
					<p style="">
					<font style="font-size: 1.5em;">Oops!</font> Search results not found :)</br>
					You might have entered a keyword that does not have data or is invalid..!</br>
					you can go <a href="list.hu" style="text-decoration: underline;">Back to the list</a> 
					and Please enter another keyword!
					</p>
					<p>
					<span>
					<a href="list.hu">← 목록으로 돌아가기</a>
					</span>
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
		</div>
							</c:otherwise>
						</c:choose>
					</div>
   </section>
   
	</form>
		
	</div>
			
	</div>
	
</body>
</html>