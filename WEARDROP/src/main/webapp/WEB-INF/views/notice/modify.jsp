<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
</style>
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
	
	<div id="weardrop_contents">
		<div class="modify_bg" style="position: absolute; background-color: rgba(0, 0, 0, 0.2); width: 100%; height: 160%; left: 0; top: 0; z-index: 10;"></div>
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
						<p>관리자 전용입니다.<span class="right"></span></p>
					</div>
					<div class="item">
						<p>공지사항을 작성해주세요!<span class="right"></span></p>
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
			</aside>
			
			<!-- 본문 -->
			<section style="z-index: 1000; background-color: #fff; position: relative; box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);">
			<form action="update.no" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${vo.id }">
			<input type="hidden" name="attach" id="attach"/>
				<h2><img src='img/icon/write_icon_white.png' class="section_icon"/>Modify Post..</h2>
				<div class="post_block">
					<div class="post_header">
						<h2 class="post_title">
							<input id="post_title" value="${vo.title }" placeholder="제목을 입력해주세요!" type="text" class="need" title="제목" name="title"
								style="width: 50%; background-color: #fff; font-size: 26px; font-weight: bold; border-bottom: dotted 1px #000;" />
						</h2>
						<div class="statusWrap">
							<p class="post_statsus">
								<img class="gal_icon" src="img/icon/gal_user_icon.png" />
									${vo.writer } 
								<img src="img/icon/gal_eye_icon.png" style="width: 15.5px; height: 15.5px; vertical-align: bottom" />
									<font class="my-effect">${vo.readcnt}</font>
							</p>
							<p class="post_date">
								<font class="my-effect">${vo.writedate }</font>
							</p>
						</div>
					</div>
				</div>
				
				<script type="text/javascript">
					MarcTooltips.add('#post_title', '제목을 입력해주세요!', {position : 'right', onFocus : true});
				</script>

				<div id="select_img" class="post_block">
					<img src="img/icon/content_logo.png" style="width: 100%; height: 100%;">
				</div>

				<div class="post_block" style="z-index: 1000; background-color: #fff; position: relative;">
					<textarea id="post_content" placeholder="내용을 입력해주세요!" style="width: 99%; height: 100px" class="need" title="내용" name="content">${vo.content }</textarea>
					<br>
				</div>

				<script type="text/javascript">
					MarcTooltips.add('#post_content', '내용을 입력해주세요!', {position : 'right', onFocus : true});
				</script>
			</section>
			
			<comment style="z-index: 1000; background-color: #fff; position: relative; box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);">
				<h2><img src='img/icon/clip_icon.png' class="section_icon"/>SAVE</h2>
				<div class="comment_block">
					<div class="ing_btn" style="width: 140px; margin-top: 10px;">
						<div class="ing_eff_yes"></div>
							<a onclick="if(necessary()){$('form').submit()}">Save</a>
						</div>
					<div class="ing_btn" style="width: 140px; margin-top: 10px;">
						<div class="ing_eff_not"></div>
							<a onclick="location='detail.no?id=${vo.id}'">Cancel</a>
						</div>
					</div>
			</comment>
			<script type="text/javascript">
			function necessary() {
				var need = true;
				$('.need').each(function() {
					if ($(this).val() == '') {
						alert($(this).attr('title') + '을 입력하세요!'); /* title을 입력하세요 */
						$(this).focus(); /* 빈칸 커서 이동*/
						need = false;
						return need;
						}
					});
					return need;
				}
			</script>	
		</form>		
	</div>
</div>

<video autoplay muted loop id="myVideo">
		<source src="img/weardrop_insert.mp4" type="video/mp4">
</video>
</body>

</html>