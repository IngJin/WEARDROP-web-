<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
#table {
	margin-top: -10px;
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

dl {
	
}

dt, dd {
	padding: 10px;
	border:0px;
}

dt {
	width: 480px;
	height: 10px;
	background-color: #f1f1f1;
	color:#000;
	border-bottom:1px dotted #000;
	text-align: left;
	font-size: 14px;
}

dt:hover{
	background-color: #f1f1f1;
}

dt.on {
	background-color: #000;
	color: #fff;
}

dd {
	width: 440px;
	background-color: white;
	height: 100px;
	display: none;
	text-align: left;
	border-top: 0px;
}

.mid {
	float: right;
}

.scroll-section{
	margin-left:175px;
	 position: fixed;
 	 bottom: 0;
 	 width: 150%;
  	overflow: hidden;
 	 height: 4rem;
  	background-color: rgba(0, 0, 0, 0.9);
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
  	color: #fff;
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

</head>
<body>
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu" style="background-color: rgba(255, 255, 255, 0.9);">
		<h1>
			<a class="cutOut" href="list.no"> 
				<img src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
			</a>
		</h1>
	</div>
	
	<!-- 본문 -->
	<div id="weardrop_contents">
		<form method="post" action="list.no" id="list">
		<header>
			<h1 style="color: #fff;">SERVICE CENTER</h1>
		</header>
		
		<!-- 디자인 메인 -->
		<div id="ingjin_main">
		<div class="modify_bg" style="position: absolute; background-color: rgba(0, 0, 0, 0.4); width: 100%; height: 100vh; left: 0; top: 0; z-index: -10;"></div>
			<!-- INFO -->
			<aside class="ingbox">
				<h2><img src='img/icon/info_icon.png' class="section_icon"/>INFO</h2>
				<!-- 소개란 -->
				<div class="aside_block">
					<h3>Service Center?</h3>
					<div class="item">
						<p>고객센터 게시판입니다.<span class="right"></span></p>
					</div>
					<div class="item">
						<p>공지사항을 잘 숙지해주세요 :)<span class="right"></span></p>
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
						<input type="hidden" name="curPage"/>
					</div>
					
					<script type="text/javascript">
							function go_page(no) {
							$('input[name=curPage]').val(no);
							$('#list').submit();
							}
					</script>

					<!-- 툴팁 -->
					<script type="text/javascript">
						MarcTooltips.add('#gal_search_btn', 'Search!', {position:'bottom'});
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
					Technical support : HS
					</p>
				</div>
			</aside>
			
			<!-- COMMUNITY 섹션  -->		
			<section style="width:600px;" class="ingbox">
				<h2><img src='img/icon/notice_icon_white.png' class="section_icon"/>Notice</h2>
				<div class="list_block" style="width: 580px;">
					<h3>공지사항</h3>
				</div>
				
				<!--탭 메뉴 영역  -->
				<div class="list_block" style="width: 580px;">
					<!-- 관리자로 로그인한 경우만 글쓰기 가능 -->
					<table id="table" style="width: 100%;">
					<tr>	
						<th style="width:10%; text-align: center;">번호</th>
						<th style="width:70%; text-align: center;">제목</th>
						<th style="width:20%; text-align: center;">작성자</th> 
					</tr>
					<c:forEach items="${page.list }" var="vo">
					<tr>
						<td style="text-align: center;">${vo.no }</td>
						<td class="left">
						<c:forEach var="i" begin="1" end="${vo.indent }" >
						</c:forEach>
						<a onclick="location='detail.no?id=${vo.id}&read=1'">${vo.title }</a></td>
						<td>
							<span>
								<img class="gal_icon" src="img/icon/gal_user_icon.png"/>
								<font style="margin-left: 5px;">${vo.writer }</font>
							</span>
						</td>
					</tr>
					</c:forEach>
					</table>
					<jsp:include page="/WEB-INF/views/include/page.jsp"/>
				</div>
					</form>
			</section>
			
			<!-- COMMUNITY 섹션  -->		
			<comment style="width:500px;" class="ingbox" >
				<h2><img src='img/icon/qa_icon.png' class="section_icon"/>Q&A</h2>
				<div class="list_block" style="width: 480px;">
				<h3 >자주묻는질문</h3>
				</div>
				<div class="list_block" style="width: 480px; margin: 0 auto; padding: 0;">
				
				
					<c:forEach items="${list }" var="vos">
						<dl>
							<dt>
								<span></span>${vos.title }
								<c:if test="${info_login.admin eq 'Y' }">
									<div class="mid">
									<a class="btn-fill" onclick="location='modify.ct?id=${vos.id}'">수정</a> 
									<a class="btn-fill"
										onclick="if( confirm('정말 삭제하시겠습니까?')){location='delete.ct?id=${vos.id}'}">삭제</a>
									</div>
								</c:if>
							</dt>
							<dd>${fn: replace(vos.content, crlf, '<br>')}</dd>
						</dl>
					</c:forEach>
				</div>
				
				<script>
				$("dt").click(function() {
			if ($(this).hasClass('on')) {
				slideUp();
			} else {
				slideUp();
				$(this).addClass('on').next().slideDown();
			}
			function slideUp() {
				$('dt').removeClass('on').next().slideUp();
			}
			;
		})
				</script>
			</comment>	
	</div>
</div>

	<img src="img/bg/notice2.jpg" style="position:fixed; left:0; top:0; width:100.5%; height:100.5%; z-index: -9999"/>
	
	<div class="scroll-section">
	<div class="scroll">
  		<div class="scroll_item">
  		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		</div>
  		<div class="scroll_item">공지사항을 잘 숙지해주시기 바랍니다 :) </div>
  		<div class="scroll_item">
  		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		</div>
		<div class="scroll_item">공지사항을 잘 숙지해주시기 바랍니다 :) </div>
  	</div>
  	</div>
</body>
</html>