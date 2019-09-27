<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<title>WEARDROP</title>
<head>
    <title>home</title>
    <link rel="stylesheet" type="text/css" href="css/common.css?v=<%= new Date().getTime() %>">
    <link rel="stylesheet" type="text/css" href="css/fullpage.css">
    <link rel="icon" type="image/x-icon" href="img/hanul.ico">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/home.js"></script>
    <script type="text/javascript" src="js/fullpage.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all"/>
    <script type="text/javascript" src="js/MarcTooltips.js"></script>
    <link rel="icon" type="image/x-icon" href="img/icon.png">
    <link rel="stylesheet" type="text/css" href="css/home.css?v=<%= new Date().getTime() %>">
    
    <script type="text/javascript">
    $(document).ready(function() {
    	$('#fullpage').fullpage({
    		//options here
    		autoScrolling:true,
    		scrollHorizontally: true,
    		navigation: false,
    		navigationPosition: 'right',
    	});
    	
    });
    </script>
    <style type="text/css">
	/* .about_section{
		position: absolute;
		width: 100%;
		height: 100%;
		background: #fff;
		display: grid;
		justify-content: center;
		align-items: center;
	}
	 
	 .bannerText{
	 	position: absolute;
	 	top:10%;
	 	left:10%;
	 	transform: translateY(-50%);
	 	max-width: 700px;
	 }
	 
	 .bannerText h2,
	 .bannerText h3{
	 	position: relative;
	 	margin: 0;
	 	padding: 0;
	 	display: inline-block;
	 	transform-origin: left;
	 	text-transform: uppercase;
	 	transform: scaleX(1);
	 	animation: rvealTextReverse 1s ease-in-out 
	 	forwards;
	 }
	 
	  .bannerText h2{
	  font-size: 6em;
	  }
	  
	  .bannerText h3{
		font-size:3em;	  
	  }
	  
	 .bannerText h2:before,
	 .bannerText h3:before{
	 	content: '';
	 	position: absolute;
	 	top:0;
	 	left: 0;
	 	background: #000;
	 	width: 100%;
	 	height: 100%;
	 	transform-origin:right;
	 	animation: rvealText 1s ease-in-out 
	 	forwards;
	 	animation-delay:3s;
	 }
	  
	 @keyframes revealText{
		0%{
			transform:scaleX(1);
		}
		100%{
			transform:scaleX(0);
		}
	}
	
	@keyframes revealTextReverse{
		0%{
			transform:scaleX(1);
		}
		100%{
			transform:scaleX(0);
		}
	}
	 
	 .bannerText h3:before{
	 	animation-delay:4s;
	 } */
	
	.wd_container{
		width:1100px;
		display:flex;
		justify-content: space-between;
		flex-wrap: weap;
	}
	
	.wd_container .wd_box{
		position: relative;
		width: 320px;
		background: #fff;
		padding: 100px 40px 60px;
		box-shadow: 0 15px 45px rgba(0,0,0,0.1);
		margin-left: 50px;
	}
	
	.wd_container .wd_box:before{
		content:'';
		position: absolute;
		top:0;
		left:0;
		width: 100%;
		height: 100%;
		background: #ff266d;
		transform: scaleY(0);
		transform-origin:top;
		transition: transform 0.5s;
	}
	
	.wd_container .wd_box:hover:before{
		transform: scaleY(1);
		transform-origin:bottom;
		transition: transform 0.5s;
	}
	
	.wd_container .wd_box h2{
		position: absolute;
		left:40px;
		top: 60px;
		font-size:4em;
		font-weight:800;
		z-index:1;
		opacity:0.1;
		transition:0.5s;
	}
	
	.wd_container .wd_box:hover h2{
		opacity:1;
		color:#fff;
		transform: translateY(-30px);
	}
	
	.wd_container .wd_box h3{
		position: relative;
		font-size:1.5em;
		z-index:2;
		color:#333;
		transition:0.5s;
	}
	
	.wd_container .wd_box:hover h3{
		position: relative;
		font-size:1.5em;
		z-index:2;
		color:#333;
		transition:0.5s;
	}
	
	.wd_container .wd_box p{
		position: relative;
		z-index:2;
		color:#555;
		transition:0.5s;
	}
	
	.wd_container .wd_box:hover h3,
	.wd_container .wd_box:hover p{
		color:#fff;
	} 
	
	.wd_scroll-section{
	 position: absolute;
 	 bottom: 0;
 	 width: 150%;
  	overflow: hidden;
 	 height: 4rem;
  	background-color: rgba(0, 0, 0, 0.9);
  	padding-left: 100%;
 	 box-sizing: content-box;
	}
	
	.wd_scroll-section .scroll{
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

	.wd_scroll-section .scroll_item{  
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
	
	.wd_scroll-section .scroll.text1
	{
		transform: rotate(30deg) translateY(200px) translateX(-200px);
		/* box-shadow: 0 5px 15px rgba(0,0,0,0.5); */
	}
	.airdrop{
		width: 300px;
		height:400px;
	}
    </style>
</head>
<body>
    <video autoplay muted loop id="myVideo">
        <source src="video/walkwalk.mp4" type="video/mp4">
    </video>
  	<div id="fullpage">
		<div class="section">
  			<h1><a onclick="location='index'"><img src="img/icon/content_logo.png"/></a></h1>
   			 <div class="out">
       		 <div class="content">
          		<div id="content">
                <a id="weather">기상정보</a> <br /><br />
                
                <script type="text/javascript">
						MarcTooltips.add('#weather', '마우스를 올려보세요 !!', {position:'up'});
				</script>
					
                <a id="daliy" href="list.gal">데일리룩</a> <br /><br />
                <a id="market" href="list.se">중고장터</a><br /><br />
                <a id="service" href="list.no">고객센터</a><br /><br />
               <div class="group">
                    <div class="box">
                        <div id="community" class="title"><a href="#">커뮤니티</a></div>
                        <div class="cont"><a href="list.com">자유게시판</a></div>
                        <div class="cont"><a href="list.hu">후기게시판</a></div>
                        <div class="cont"><a href="map.com">매장찾기</a></div>
                        
                        <script type="text/javascript">
							MarcTooltips.add('#daliy', '데일리룩을 공유해보세요 :)', {position:'right'});
							MarcTooltips.add('#market', '안전한 중고거래 :)', {position:'right'});
							MarcTooltips.add('#service', '공지사항 & 자주묻는질문', {position:'right'});
							MarcTooltips.add('#community', '하위 카테고리를 선택해주세요 !!', {position:'right'});
						</script>
				
                    </div><br />
                </div>
                </br>
						
                <c:if test="${ !empty info_login}">
                    <div class="user_info">
                    <a id="mypagegogo" onclick="location='mypage.ho'">${info_login.userid} [${info_login.writer}]</a>
                    <script type="text/javascript">
						MarcTooltips.add('#mypagegogo', '마이페이지로 이동합니다', {position:'right'});
					</script>
                    </div><br />
                    <div class="ing_btn" style="position: absolute; margin-left:38px; width: 174px; margin-bottom: 10px;">
                    <div class="ing_eff_out"></div>
                    	<a style="cursor: pointer;" onclick="go_logout()">Logout</a>
                    </div><br/>
                    <c:if test="${info_login.admin eq 'Y'}">
                    <div class="ing_btn" style="position: absolute; margin-left:38px; width: 174px; margin-top: 10px;">
                    <div class="ing_eff"></div>
                   		<a style="cursor: pointer;" onclick="location='manager.list'">관리자</a>
                   	</div>
                    </c:if>
                </c:if>
                <c:if test="${ empty info_login}">
                <div class="ing_btn" style="position: absolute; margin-left:38px; width: 174px;">
                <div class="ing_eff"></div>
                    <a style="cursor: pointer;" onclick="location='login.ho'">Login</a>
                </div>
                </c:if>
                <!-- <div class="scroll-box">
                	<span></span>
                	<span></span>
                	<span></span>
                </div> -->
            </div>
        </div>
    </div>
    <div class="display">
        <div class='we_img'></div>
    <div id="display"></div> <br />
        <div class="weather"></div>
    </div>
		</div>
	
<!-- <div class="section scroll-section" style="position:absolute; margin:0; padding:0; width:100%; min-height:100vh; background-color: #fff;">
	<h2 style="margin-left:50px; margin-bottom:50px; position: absolute; left: 0; top:10%; font-size: 5em; font-weight: 800; z-index: 1000"><a onclick="location='index'"><img style="vertical-align: text-bottom;" src="img/icon/content_logo.png"/></a></h2>
			<div class="wd_container">
				<div class="wd_box">
					<h2>01</h2>
					<h3>개발개요</h3>
					<p>WEARDROP이란?
					아이폰의 AirDrop 기능에서 착안했습니다.
					어쩌고 저쩌고 블라블라
					</p>
				</div>
				<div class="wd_box">
					<h2>02</h2>
					<h3>주요기능</h3>
					<p>
					아무튼 요런 기능이 있다는 내용
					</p>
				</div>
				<div class="wd_box">
					<h2>03</h2>
					<h3>향후계획</h3>
					<p>
					사실 향후계획은 없지만
					대충 이런 계획이 있다는 내용
					</p>
				</div>
			</div>
			<img class="iphone" src="img/iphone.png" art="엑박" style="position: absolute; right: 0; bottom:0; height: 100%; z-index: 100;"/>
			<div class="wd_scroll-section">
			<div class="scroll text1">
  				<div class="scroll_item">
  					WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
					WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
				</div>
  				<div class="scroll_item">
  					WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
					WEARDROP - <span>WEARDROP - </span>WEARDROP - <span> WEARDROP - </span>
				</div>
  			</div>
			</div>
	</div>
	</div> -->
	</div>
</body>

</html>