<%@page import="java.util.Date"%>
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
<title>Flea Market Detail</title>
<style type="text/css">

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

//댓글 조회
$(function(){
	comment_list();
});//function()


$(function(){
	$('#file-download').on('click', function(){
		location='download.se?id=${vo.id}';
	});
});

//댓글 등록
function go_comment_regist() {
	// 로그인이 되어 있어야 댓글 저장 가능
	if( ${ empty info_login}){
		alert('댓글을 등록하려면 로그인하세요!');
		return;
	}
	
	// 입력한 글이 있어야 댓글저장
	if($('#comment').val().trim() === ''){
		alert('댓글을 입력하세요!');
		$('#comment').val('');
		$('#comment').focus();
		return;
	}
	
	$.ajax({
		data: { pid : ${vo.id}, content: $('#comment').val()},
		url: "sell/comment/insert",
		success: function(data){
			if(data){
				alert('댓글이 등록되었습니다!')
				$('#comment').val('');
				comment_list();
			}else{
				alert('댓글이 등록 실패!!')
			}
		},//success()
		error: function(req, text){
			alert(text + ": " + req.status);
		}// error()
	});// ajax()
}// go_comment_regist()


//댓글이 보여지는 처리
function comment_list(){
	$.ajax({
		url: 'sell/comment/${vo.id}',
		success: function(result) {
            $('#comment_list').html( result );
         }, error: function(req, text) {
            alert(text + ": " + req.status);
         }
      });
}// comment_list

/* $('.count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).text()
    }, {
        duration: 4000,
        easing: 'swing',
        step: function (now) {
            $(this).text(Math.ceil(now));
        }
    });
}); */
</script>
</head>
<body>
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu" style="background-color: rgba(255, 255, 255, 0.9);">
		<h1>
			<a class="cutOut" href="list.se"> 
				<img art src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width:0px; right:18px; left:0px;"></div>
			</a>
		</h1>
	</div>
	
	<!-- 본문 -->
	<div id="weardrop_contents">
		<header>
			<h1 style="color: #fff;">Used Market</h1>
		</header>
		
		<!-- 디자인 메인 -->
		<div id="ingjin_main">
		<div class="modify_bg" style="position: absolute; background-color: rgba(0, 0, 0, 0.4); width: 100%; height: 120vh; left: 0; top: 0; z-index: -10;"></div>
			<!-- INFO -->
			<aside>
				<h2><img src='img/icon/info_icon.png' class="section_icon"/>INFO</h2>
				<!-- 소개란 -->
				<div class="aside_block" style="background-color: #fff;">
					<h3>Used Market?</h3>
					<div class="item">
						<p>의류, 신발, 패션 잡화를 거래 할 수 있는<span class="right"></span></p>
					</div>
					<div class="item">
						<p>회원 간 중고 거래 게시판 입니다.<span class="right"></span></p>
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
				
				<aside style="padding: 0; margin: 0;" >
					<!-- 수정/삭제 권한 -->
					<c:if test="${info_login.writer eq vo.writer}">
					<!-- 글 작성자와 로그인 정보 일치해야 수정/삭제 가능-->
						<div id="modiftBtn" class="ing_btn" style="width:140px; margin: 5px; border: 0px;">
							<div class="ing_eff_yes"></div>
							<a onclick="location.href='modify.se?id=${vo.id}&code=${vo.code}'">Modify</a>
						</div>
						<div class="ing_btn" style="width:140px; margin: 5px; border: 0px;">
							<div class="ing_eff_not"></div>
							<a onclick="if(confirm('정말 삭제를 하시겠습니까?')){location='delete.se?id=${vo.id}' }">Delete</a>
						</div>
					</c:if>
				</aside>
			</aside>
			
			
			
			<section class="ingbox">
			<h2><img src='img/icon/post_page_icon.png' class="section_icon"/>Post</h2>
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
			<c:choose>
			<c:when test="${!empty vo.filename }">
				<img src="<c:url value='/'/>${vo.filepath}" style="width:100%; height:100%;">
			</c:when>
			<c:otherwise>
				<img src="img/icon/content_logo.png" style="width:100%; height:100%;">
			</c:otherwise>
			</c:choose>
				<p>${fn:replace( fn:replace(vo.content, lf, '<br>') , crlf, '<br>')} <br></p>
			</div>
			</section>
			
			<comment class="ingbox">
				<h2><img src='img/icon/price_icon_white.png' class="section_icon"/>Price</h2>
				<div class="comment_block">
					<div style="width: 100%; text-align: center;">
					<font style="font-size: 25px; margin-left: 50px; margin-right:10px; float: left">￦</font>&nbsp;
					<span class="right">
						<font class="counter-count" style="font-size: 25px; font-weight: bold; margin-left:10px; margin-right:10px;">${vo.price }</font>
						<font style="font-size: 25px; right:10%; margin-right:50px; font-weight: bold;">원</font>
					</span>
					</div>
				</div>
			</comment>
			
			<script type="text/javascript">
			$('.counter-count').each(function () {
		        $(this).prop('Counter',0).animate({
		            Counter: $(this).text()
		        }, {
		            duration: 1000,
		            easing: 'swing',
		            step: function (now) {
		                $(this).text(Math.ceil(now));
		            }
		        });
		    });
			</script>
			
			<!-- 댓글 -->
			<comment class="ingbox" style="margin-top: 10px;">
				<h2><img src='img/icon/comment_icon_white.png' class="section_icon"/>Comment</h2>
					<div class="comment_block" id="comment_regist" style="width: 480px; padding: 10px" >
						<h3>
						Write..
						<img class="gal_icon" src="img/icon/write_icon.png" style="margin-right:5px; margin-bottom:4px; vertical-align: middle;"/>
						</h3>
						<textarea id="comment" placeholder="댓글을 작성해주세요.." style="resize: none; width: 99%; height: 50px; margin-top: 10px;"></textarea>
						<div class="ing_btn right" style="margin-top: 5px; left: 0; color:#fff;">
							<div class="ing_eff_yes"></div>
							<a onclick="go_comment_regist()">Register</a>
						</div>
					</div>
					<!-- 댓글이 뿌려지는 창 -->
					<div id="comment_list" class="reply_block" style="text-align:left; width: 480px; padding: 10px;"></div>
			</comment>
			
				</div>
			</div>
			
		<form id="detail" method="post" action="list.se">
			<input type="hidden" name="curPage" value="${page.curPage }">
			<input type="hidden" name="search" value="${page.search }"> 
			<input type="hidden" name="keyword" value="${page.keyword }">
		</form>	
		<br />	

<!-- <script>
function comment_list() {
	
	$.ajax({
		url: 'sell/comment/${vo.id}',
		success: function(result) {
			$('#comment_list').html(result);
		},error: function(req, text) {
			alert(text + ": "+ req.status);
		}
	});
}	
function go_comment_regist() {
	// 로그인 되어 있어야 댓글 저장 가능
	if( ${empty info_login} ){
		alert('댓글을 등록하려면 로그인을 하세요!');
		return;
	}
	// 입력한 글이 있어야 댓글저장
	if($('#comment').val().trim()==='' ) {
		alert("댓글을 입력하세요!");
		$('#comment').val('');
		$('#comment').focus();
		return;
	}
	$.ajax({
		data: {pid: ${vo.id}, content: $('#comment').val()},
		url: "sell/comment/insert",
		success: function (data) {
			if(data){
				alert('댓글이 등록되었습니다.');
				$('#comment').val('');
				comment_list();
			}else{
				alert('댓글 등록 실패!');
			}
		}, error: function (req, text) {
			alert( text + ": " + req.status);
		}
	});
}
	$(function () {
		comment_list();
		$('#file-download').on('click', function() {
			location='download.se?id=${vo.id}';
		});
	});
</script> -->
<img src="img/bg/flea_market_bg.jpg" style="position:fixed; left:0; top:0; width:100%; height:100%; z-index: -9999"/>
</body>
</html>