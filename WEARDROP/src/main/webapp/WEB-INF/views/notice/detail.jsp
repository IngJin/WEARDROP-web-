<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.scroll-section{
	 position: fixed;
 	 bottom: 0;
 	 width: 150%;
  	overflow: hidden;
 	 height: 4rem;
  	background-color: rgba(255, 255, 255, 0.9);
  	padding-left: 100%;
 	 box-sizing: content-box;
	}

	.scroll-section .scroll{
	display: inline-block;
 	height: 4rem;
  	line-height: 4rem;
  	white-space: nowrap;
  	padding-right: 100%;
  	box-sizing: content-box;
  	-webkit-animation-iteration-count: infinite;
  	animation-iteration-count: infinite;
  	-webkit-animation-timing-function: linear;
  	animation-timing-function: linear;
  	-webkit-animation-name: ticker;
  	animation-name: ticker;
	  -webkit-animation-duration: 30s;
  	animation-duration: 30s;
	}

	.scroll-section .scroll_item{  
	
	display: inline-block;
  	padding: 0 2rem;
  	font-size: 2rem;
  	color: #000;
  	font-weight: 900;
  }
	
	@keyframes ticker
	{
		0% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
    visibility: visible;
  	}
  		100% {
    	-webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0);
  	}
	}
	
</style>
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
</script>
</head>
<body>
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu" style="background-color: rgba(255, 255, 255, 0.9);">
		<h1>
			<a class="cutOut" href="list.no"> 
				<img art src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width:0px; right:18px; left:0px;"></div>
			</a>
		</h1>
	</div>
	
	<!-- 본문 -->
	<div id="weardrop_contents">
		<header>
			<h1 style="color: #fff;">NOTICE</h1>
		</header>
		<!-- 디자인 메인 -->
		<div id="ingjin_main">
		<div class="modify_bg" style="position: fixed; background-color: rgba(0, 0, 0, 0.4); width: 100%; height: 100vh; left: 0; top: 0; z-index: -10;"></div>
			<!-- INFO -->
			<aside>
				<h2><img src='img/icon/info_icon.png' class="section_icon"/>INFO</h2>
				<!-- 소개란 -->
				<div class="aside_block" style="background-color: #fff;">
					<h3>Notice?</h3>
					<div class="item">
						<p>고객센터 게시판입니다.<span class="right"></span></p>
					</div>
					<div class="item">
						<p>공지사항을 잘 숙지해주세요 :)<span class="right"></span></p>
					</div>
				</div>
					
				<!-- SNS 링크 -->
				<div class="aside_block" style="background-color: #fff;">
					<h3>Follow Us</h3>
					<div class="ingstagram">
						<a href="https://www.instagram.com/weardrop" target="_blank">
							<img class="gal_icon" src="img/icon/icon_instagram.png" style="margin-right: 7px;"/> 
							<span class="my-effect">http://www.instagram.com/</span>
						</a>
					</div>
				</div>
					
				<div class="aside_block" style="background-color: #fff; padding-bottom: 20px;">
					<h3>
						<img class="gal_icon" src="img/icon/gal_list_icon.png" style="margin-right: 7px; margin-bottom:4px; vertical-align: middle;"/>
						<font onclick="$('#detail').submit()" style="cursor:pointer;">Back to List</font>
					</h3>
				</div>
					
				<!-- aside_box -->
				<div class="aside_block aside_box" style="margin-top: 0px;">
					<h2>WEARDROP?</h2>
					<p>
					WEARDROP is a community media that creates fashion culture
					in Korea. The Fashion Forum, WEARDROP, was launched in 2019. We
					form a fashion community with a style and continue to send out
					the "now" in Korea.
					</p>

					<p>
					<img class="gal_icon" src="img/icon/tech_icon.png" style="margin-right: 5px;" /> 
					Technical support : HS
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
				
				<aside style="padding: 0; margin: 0;" >
					<!-- 수정/삭제 권한 -->
					<c:if test="${info_login.admin eq 'Y'}">
					<!-- 글 작성자와 로그인 정보 일치해야 수정/삭제 가능-->
						<div id="modiftBtn" class="ing_btn" style="width:140px; margin: 5px; border: 0px;">
							<div class="ing_eff_yes"></div>
							<a onclick="location.href='modify.no?id=${vo.id}'">Modify</a>
						</div>
						<div class="ing_btn" style="width:140px; margin: 5px; border: 0px;">
							<div class="ing_eff_not"></div>
							<a onclick="if(confirm('정말 삭제를 하시겠습니까?')){location='delete.no?id=${vo.id}' }">Delete</a>
						</div>
					</c:if>
				</aside>
			</aside>
			
			<section class="ingbox">
			<h2><img src='img/icon/notice_icon_white.png' class="section_icon"/>Notice</h2>
			<div class="post_block">
				<div class="post_header">
					<h2 class="post_title">${vo.title }</h2>
					<div class="statusWrap">
						<p class="post_statsus">
							<img class="gal_icon" src="img/icon/gal_user_icon.png"/>
								${vo.writer }
							<img src="img/icon/gal_eye_icon.png" style="width:15.5px; height:15.5px; vertical-align:bottom"/>
								<font class="my-effect">${vo.readcnt}</font>
						</p>
						<p class="post_date">
							<font class="my-effect">${vo.writedate }</font>
						</p>
					</div>
				</div>
			</div>
			
			<div class="post_block">
				<img src="img/icon/content_logo.png" style="width:100%; height:100%;">
				<p>${fn:replace( fn:replace(vo.content, lf, '<br>') , crlf, '<br>')} <br></p>
			</div>
			</section>
		</div>

<!-- 로그인한 경우만 답글작성 권한 있음 -->
<form id="detail" method="post" action="list.no">
<input type="hidden" name="curPage" value="${page.curPage }"/>
<input type="hidden" name="search" value="${page.search }"/>
<input type="hidden" name="keyword" value="${page.keyword }"/>
</form>

<img src="img/bg/notice2.jpg" style="position:fixed; left:0; top:0; width:100%; height:100%; z-index: -9999"/>

<!-- <div class="scroll-section">
	<div class="scroll">
  		<div class="scroll_item">
  		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		</div>
  		<div class="scroll_item">팩트) 딱히 넣을게 없어서 넣어봤다.</div>
  		<div class="scroll_item">팩트) 딱히 넣을게 없어서 넣어봤다.</div>
  		<div class="scroll_item">팩트) 딱히 넣을게 없어서 넣어봤다.</div>
 	</div>
</div> -->
</body>
</html>