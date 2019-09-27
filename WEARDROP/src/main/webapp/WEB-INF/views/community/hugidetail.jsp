<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

$(document).ready(function() {
	comment_list();
})

$(function(){
	$('#file-download').on('click', function(){
		location='download.hu?id=${vo.id}';
	});
});

function go_comment_regist(){
	//로그인되어 있어야 댓글저장 가능
	if(${empty info_login}){
		alert('댓글을 등록하려면 로그인하세요!');
		return;
	}
	//입력한 글이 있어야 댓글저장
	if($('#comment').val().trim() === ''){
		alert('댓글을 입력하세요!!');
		$('#comment').val('');
		$('#comment').focus();
		return;
	}
	
	$.ajax({
		data: { pid : ${vo.id}, content: $('#comment').val() },
		url : "hugi/comment/insert",
		success: function(data){
			if(data){
				alert('댓글이 등록되었습니다.');
				$('#comment').val('');
				comment_list();
			}else{
				alert('댓글 등록이 실패되었습니다.');
			}
		},
		error: function(req, text){
			alert(text+ ": " + req.status);
		}
	});
}

//댓글이 보여지는 처리
function comment_list(){
	$.ajax({
		url: 'hugi/comment/${vo.id}',
		success: function(result){
			$('#comment_list').html(result);
		},
		error: function(req, text){
			alert(text + ":" + req.status);
		}
	});
}
</script>
</head>
<body>
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu">
		<h1>
			<a class="cutOut" href="list.hu"> 
				<img art src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width:0px; right:18px; left:0px;"></div>
			</a>
		</h1>
	</div>		
	
	<!-- 본문 -->
	<div id="weardrop_contents">
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
					
				<div class="aside_block">
					<h3>
						<img class="gal_icon" src="img/icon/gal_list_icon.png" style="margin-right: 7px; margin-bottom:4px; vertical-align: middle;"/>
						<font onclick="$('#detail').submit()" style="cursor:pointer;">Back to List</font><br/>
					</h3>
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
					
				<div class="aside_block">
					<!-- 수정/삭제 권한 -->
					<c:if test="${info_login.writer eq vo.writer}">
					<!-- 글 작성자와 로그인 정보 일치해야 수정/삭제 가능-->
						<div id="modiftBtn" class="ing_btn" style="width:140px; margin-top: 10px;">
							<div class="ing_eff_yes"></div>
							<a onclick="location.href='modify.hu?id=${vo.id}'">Modify</a>
						</div>
						<div class="ing_btn" style="width:140px; margin-top: 10px;">
							<div class="ing_eff_not"></div>
							<a onclick="if(confirm('정말 삭제하시겠습니까?')){location='delete.hu?id=${vo.id}' }">Delete</a>
						</div>
					</c:if>
				</div>
			</aside>
			
			<section>
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
			
			<!-- 댓글 -->
			<comment>
				<h2><img src='img/icon/comment_icon_white.png' class="section_icon"/>Comment</h2>
					<div class="comment_block" id="comment_regist" style="width: 480px; padding: 10px" >
						<h3>
						Write..
						<img class="gal_icon" src="img/icon/write_icon.png" style="margin-right:5px; margin-bottom:4px; vertical-align: middle;"/>
						</h3>
						<textarea id="comment" placeholder="댓글을 작성해주세요.." style="resize:none; width: 99%; height: 50px; margin-top: 10px;" maxlength="50" onblur="Limit(this)"></textarea>
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
			
			<form id="detail" method="post" action="list.hu">
			<input type="hidden" name="curPage" value="${page.curPage }">
			<input type="hidden" name="search" value="${page.search }"> <input
				type="hidden" name="keyword" value="${page.keyword }">
		</form>
		<br/>
			
			<!-- 글을 작성한 로그인 사용자가 수정,삭제 권한-->
			<%-- <c:if test="${info_login.writer eq vo.writer}">
				<a class="bottombtn" onclick="location='modify.hu?id=${vo.id}'">수정</a>
				<a class="bottombtn" onclick="if(confirm('정말 삭제하시겠습니까?')){location='delete.hu?id=${vo.id}' }">삭제</a>
			</c:if> --%>
</body>
</html>