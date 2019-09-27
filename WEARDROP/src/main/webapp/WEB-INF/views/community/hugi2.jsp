<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   colum-count:3;
   padding: 10px;
}

#columns figure {
   display: inline-block;
   width:33%;
   border: 1px solid rgba(0, 0, 0, 0.2);
   margin: 0;
   padding: 10px; 
   box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
   overflow: hidden;
  	-webkit-box-sizing: border-box;
  	box-sizing: border-box;
  	-webkit-transition: all 0.45s ease-in-out;
  	transition: all 0.45s ease;
}

#columns figure img {
   	width:100%;
   	height: 100%;
   	cursor: pointer; 
   	color:#ffffff;
  	max-width: 100%;
  	position: relative;
  	opacity: 1;
}

#columns figure img:hover{
   opacity: 0.35;
  -webkit-transform: scale(1.15);
  transform: scale(1.15);
}

#columns figure figcaption {
   border-top: 1px solid rgba(0, 0, 0, 0.2);
   padding: 10px;
   cursor: pointer;
}

pic-image {
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
						<p>왁왁왁 <span class="right"></span></p>
					</div>
					<div class="item">
						<p>상품 리뷰 게시판 입니다.<span class="right"></span></p>
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
							<div class="ing_eff" style="color: #000;"></div>
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
				<div class="list_block ">
				
		<!--본문  -->
	 <div id="columns">
		<c:forEach items="${list }" var="vo">
         <figure >
               <c:if test="${ empty vo.filepath}">
		            <img src="img/thum_logo.png" onclick="location='detail.hu?id=${vo.id}&read=1'">	
            </c:if>
             <c:if test="${ !empty vo.filepath}">
		        <img src="<c:url value='/'/>${vo.filepath}" onclick="location='detail.hu?id=${vo.id}&read=1'">
		    </c:if>
            <figcaption>
            	<span>${vo.title}</span>
            	<div>
            		<span>${vo.writer}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<span>${vo.writedate }</span>
            	</div>
            </figcaption>
         </figure>
   </c:forEach>
   </div>
	</form>
	</div>
	</div>
	
</div>
</body>
</html>