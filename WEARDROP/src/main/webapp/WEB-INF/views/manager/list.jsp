<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>		<!--jquery 선언-->
<link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all"/>
<link type="text/css" rel="stylesheet" href="css/ingjin.css"/>
<script type="text/javascript" src="js/MarcTooltips.js"></script>

<meta charset="UTF-8">
<title>회원관리</title>
<style type="text/css">
.header_main {
	width: 175px;
	background-color: #ffffff;
	float: left;
	height: 100%;
	overflow: hidden;
}

.header_main_logo {
	width: 100px;
	line-height: 100vh;
	text-align: center;
}

.all {
	height: 100%;
	overflow-y: auto;
}

.all::-webkit-scrollbar {
	display: none;
}

#table {
	border-collapse: collapse;
}

#table th, #table td {
	border-bottom:dotted 1px #000;
	margin-bottom:0;
	/* padding: 7px; */
}

#table th{
	height:40px;
	background-color: #f1f1f1;
}

#table td{
	height:40px;
}

#table tr:hover{
	background-color: #f1f1f1;
	color: #000;
}

#table a{
	text-decoration: none;
	
}

#shine {
  font-family: 'Arial';
  color: #fff;
  text-transform: uppercase;
  font-weight: bold;
  font-size: 3rem;
  line-height: 0.75;
}

span {
  display: block;
}

span:not(.light) {
  opacity: 0;
  animation: flashText 0.5s ease-out alternate infinite;
}
span.light {
  position: relative;
  display: inline-block;
}
span.light:before {
  position: absolute;
  left: 0;
  top: -10%;
  width: 100%;
  height: 120%;
  background: #fff;
  filter: blur(10px);
  content: "";
  opacity: 0;
  animation: flash 0.5s ease-out alternate infinite;
}
@keyframes flash {
  to {
    opacity: 1;
  }
}
@keyframes flashText {
  to {
    opacity: 0.15;
  }
}
</style>
</head>
<body>
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu" style="background-color: rgba(0,0,0,1);">
		<h1>
			<a class="cutOut" href="list.gal"> 
				<img src="img/logo_gal_insert.png" style="visibility: visible;">
				<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
			</a>
		</h1>
	</div>
	
	<!-- 본문 -->
	<div id="weardrop_contents">
		<form action="list.gal" method="post" id="list">
		<header>
			<h1 style="color: #fff">ADMINISTRATOR</h1>
		</header>
		
			<!-- 디자인 메인 -->
		<div id="ingjin_main">
			<!-- INFO -->
			<aside class="ingbox">
				<h2><img src='img/icon/info_icon.png' class="section_icon"/>INFO</h2>
					<!-- 소개란 -->
				<div class="aside_block">
					<h3>이곳은 관리자의 공간</h3>
					<div class="item">
						<p>고객관리 및 공지를 작성할 수 있습니다.<span class="right"></span></p>
					</div>
					<div class="item">
						<p>관리자 하고싶은대로 다해~<span class="right"></span></p>
					</div>
				</div>
				
				<!-- 글 작성 -->				
				<!-- <div class="aside_block">
					<h3>Write</h3>
						<div class="ing_btn">
						<div class="ing_eff"></div>
						<a style="cursor: pointer; color: #fff;" onclick="location='new.no'">공지사항 작성</a>
						</div>
						
						<div class="ing_btn">
						<div class="ing_eff"></div>
						<a style="cursor: pointer; color: #fff;" onclick="location='new.ct'">Q&A 작성</a>
						</div>
				</div> -->
					
				<!-- aside_box -->
				<div class="aside_block aside_box">
					<h2>나에게 권한이 있노라</h2>
					<!-- <p>
					WEARDROP is a community media that creates fashion culture
					in Korea. The Fashion Forum, WEARDROP, was launched in 2019. We
					form a fashion community with a style and continue to send out
					the "now" in Korea.
					</p> -->
					<span>오직 관리자에게만 권한이 있으라</span>
					<a style="cursor: pointer; color: #fff;" onclick="location='new.no'"><span class="light"><h2 id="shine">공지사항 작성</h2></span></a>
					<span>오직 관리자에게만 권한이 있으라</span>
					<a style="cursor: pointer; color: #fff;" onclick="location='new.ct'"><span class="light"><h2 id="shine">Q&A 작성</h2></span></a>
					<span>오직 관리자에게만 권한이 있으라</span>
					
					<p>
					<img class="gal_icon" src="img/icon/tech_icon.png" style="margin-right: 5px;" /> 
					Technical support : JiWoong
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
			
			
			<section style="width:40%; float: right; margin-right:10px; background-color: rgba(255,255,255,0.9);" class="ingbox">
				<h2><img src='img/icon/list_icon_white.png' class="section_icon"/>회원관리</h2>
				<div class="list_block" style="width:98%">
					<table id="table" style="width:98%">
					<tr>
						<th style="width:10%">번호</th>
						<th style="width:20%">아이디</th>
						<th style="width:30%">닉네임</th>
						<th style="width:30%">이메일</th>
						<th style="width:10%">삭제</th>
					</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.no}</td>
					<td>${vo.userid}</td>
					<td>${vo.writer}</td>
					<td>${vo.email}</td>
					<td><a class="btn-fill" onclick="if(confirm('정말 삭제하시겠습니까?')){ location='manager.delete?userid=${vo.userid}' }">삭제</a></td>				
				</tr>
			</c:forEach>
				</div>
				</table>
			</section>

	</div>
	<img src="img/bg/godgodgod.jpg" style="position:fixed; left:0; top:0; width:100.5%; height:100.5%; z-index: -9999"/>
</body>
</html>