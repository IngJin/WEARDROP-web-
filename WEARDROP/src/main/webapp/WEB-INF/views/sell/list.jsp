<%@page import="java.util.Date"%>
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
<title>Insert title here</title>
<style type="text/css">
ul.tabs {
	margin-top:10px;
	padding: 0;
	float: left;
	list-style: none;
	height: 41px;
	/* border-left: 1px solid #eee; */
	width: 100%;
	/* font-family: "dotum"; */
	font-size: 14px;
	padding: 5px;
	
}

ul.tabs li {
	margin-right:10px;
	float: left;
	text-align: center;
	cursor: pointer;
	width: 10%;
	height: 39px;
	line-height: 31px;
	/* border: 1px solid #eee; */
	border-left: none;
	font-weight: bold;
	background: #ffffff;
	overflow: hidden;
	position: relative;
}


ul.tabs li.active {
	background: #fff;
	border-bottom: 3px solid #000;
}

.tab_container {
	/* border-top:dotted 1px #000; */
	clear: both;
	float: left;
	width: 100%;
	height: 100%;
	background: #fff;
}


.tab_content {
	/* margin-top: 10px; */
	/* padding: 5px; */
	font-size: 14px;
	display: none;
}

#container {
	width: 100%;
}


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

a:hover {
	color: #000;
}

.need_login:hover{
	color: #000;
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

var tabNo = 1;

   $(function() {

      $(".tab_content").hide(); //모든 탭 숨기기
      $(".tab_content:first").show(); //첫번째 탭 내용 보여주기
      getList(tabNo);
      
      $("ul.tabs li").click(function() {
         $("ul.tabs li").removeClass("active").css("color", "#AEAEAE").css("border-bottom","solid 3px #fff");	//active된 클래스 제거
         $(this).addClass("active").css("color", "#000").css("border-bottom","solid 3px #000");	
         $(".tab_content").hide()

         var activeTab = $(this).attr("rel");
         tabNo = activeTab.substring(3);         
         $('input[name=curPage]').val(1);     
         $("#" + activeTab).fadeIn()
   
         getList();
 //        $(window).hashchange();
      });
   });
   
function getList(){
	$.ajax({
		url: 'list.ajax',
		data : { code: tabNo },
		success: function(response){
			$('#tab' + tabNo ).html(response);
		}		
		
	});
	
}   
function getSearch(){			// 리스트안에 검색이 있으므로 code 필요 
	$.ajax({
		url: 'list.ajax',
		data : { code: tabNo, search: $('[name=search]').val() , keyword: $('[name=keyword]').val()},
		success: function(response){
			$('#tab' + tabNo ).html(response);
		}				
	});
}   
</script>
</head>
<body>
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu" style="background-color: rgba(255, 255, 255, 0.9);">
		<h1>
			<a class="cutOut" href="list.se"> 
				<img src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
			</a>
		</h1>
	</div>
	
	<!-- 본문 -->
	<div id="weardrop_contents">
   		<form method="post" action="list.se" id="list">
   		<header>
			<h1 style="color: #fff;">Used Market</h1>
		</header>
		
		<!-- 디자인 메인 -->
		<div id="ingjin_main">
			<div class="modify_bg" style="position: absolute; background-color: rgba(0, 0, 0, 0.4); width: 100%; height: 120%; left: 0; top: 0; z-index: -10;"></div>
			<!-- INFO -->
			<aside class="ingbox">
				<h2><img src='img/icon/info_icon.png' class="section_icon"/>INFO</h2>
					<!-- 소개란 -->
				<div class="aside_block">
					<h3>Used Market?</h3>
					<div class="item">
						<p>의류, 신발, 패션 잡화를 거래 할 수 있는<span class="right"></span></p>
					</div>
					<div class="item">
						<p>회원 간 중고 거래 게시판 입니다.<span class="right"></span></p>
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
						<input type="text" name="keyword" value="${page.keyword }" onkeypress="if( event.keyCode==13 ){getSearch(); return false;}"
								style="width:180px; height:30px; padding:-1px; border:0px; background-color:#f1f1f1;">
						<!-- searchBtn -->
						<a>
							<img alt="SUBMIT" onclick="getSearch()"
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
							<div id="insertBtn" class="ing_btn insertBtn" >
							<div class="ing_eff_yes" ></div>
								<a style="cursor: pointer;" onclick="location.href='new.se'">Write</a>
							</div>
						</c:when>
						
						<c:otherwise>
							<div id="not_login_btn" class="ing_btn insertBtn">
							<div class="ing_eff_not"></div>
								<a style="cursor: pointer; onclick="location.href='login.ho'">Write</a>
							</div>
						</c:otherwise>
					</c:choose>
					
					<!-- 툴팁 -->
					<script type="text/javascript">
						MarcTooltips.add('#not_login_btn', '로그인 후 글 작성이 가능합니다!', {position:'right'});
						MarcTooltips.add('#insertBtn', '글 작성이 가능합니다!', {position:'right'});
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
					Technical support : DaeWoong
					<!-- <img class="gal_icon" src="img/icon/bear_icon_white.png" style="margin-left: 5px;" /> -->
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
			<section style="width:1000px;" class="ingbox">
				<h2><img src='img/icon/list_icon_white.png' class="section_icon"/>BOARD LIST</h2>
				<!--탭 메뉴 영역  -->
				<div class="list_block">
				<div id="container" class="container">
					<h3 >Category</h3>
					<div>
						<ul class="tabs">
							<li class="active" rel="tab1">삽니다</li>
         					<li rel="tab2">팝니다</li>
						</ul>
					</div>
				</div>
				</div>	
				
				<div class="list_block">
      			<!--탭 콘텐츠 영역-->
      				<div class="tab_container">
        				 <!--첫번째 탭 내용  -->
        				 <div id="tab1" class="tab_content">         	
 	
        				 </div>
         
        				 <!-- 두번째 탭 내용 -->
         				<div id="tab2" class="tab_content">
         
       				  	</div>
     				 </div>
  				</div>
   			
   			<input type="hidden" name="curPage"/>
   			<input type="hidden" name="code"/>
    		</section>
    		</div>
			</form>
		</div>
</div>


<script type="text/javascript">
   function go_page(no){		 // 검색페이지
	   $.ajax({
			url: 'list.ajax',
			data : { code: tabNo, curPage: no, search: $('[name=search]').val(), keyword: $('[name=keyword]').val()  },
			success: function(response){
				$('#tab' + tabNo ).html(response);
			}		
			
		});
   }
</script>
<img src="img/bg/flea_market_bg.jpg" style="position:fixed; left:0; top:0; width:100%; height:100%; z-index: -9999"/>

<div class="scroll-section">
	<div class="scroll">
  		<div class="scroll_item">
  		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		</div>
  		<div class="scroll_item">중고거래 관련 글 작성시 주의사항 꼭 확인해주세요!! </div>
  		<div class="scroll_item">
  		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
		</div>
		<div class="scroll_item">중고거래 관련 글 작성시 주의사항 꼭 확인해주세요!! </div>
  	</div>
  	</div>
</body>
</html> 