<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>		<!--jquery 선언-->
<link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all"/>
<link type="text/css" rel="stylesheet" href="css/ingjin.css"/>
<script type="text/javascript" src="js/MarcTooltips.js"></script>
<script>
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
		$("#spreadBtn").click(function() {
			if ($("#hiddenContent").is(":visible")) {
				$("#hiddenContent").css("display", "none");
			} else {
				$("#hiddenContent").css("display", "block");
			}
		});
	});
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#list-top {
	width: 80%;
	padding-left: 9.8%;
	padding-bottom: 20px;
	
}

dl {
	
}

dt, dd {
	padding: 10px;
	border:0px;
}

dt {
	width: 500px;
	height: 10px;
	background-color: white;
	border-bottom:1px dotted #000;
	text-align: left;
	font-size: 12px;
}

dt.on {
	background-color: #000;
	color: #fff;
}

dd {
	width: 500px;
	background-color: white;
	height: 100px;
	display: none;
	text-align: left;
	border-top: 0px;
}

.mid {
	float: right;
}
</style>

<script>
	<script type="text/javascript">
	$('#accordian h3').click(function() {
		$('#accordian').css('background', 'red');
	})
</script>


</head>
<body>
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu">
		<h1>
			<a class="cutOut" href="list.ct"> 
				<img src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
			</a>
		</h1>
	</div>
	
	<!-- 본문 -->
	<div id="weardrop_contents">
		<form action="list.ct" method="post" id="list">
		<header>
			<h1>SERVICE CENTER</h1>
		</header>
		
		<!-- 디자인 메인 -->
		<div id="ingjin_main">
			<!-- INFO -->
			<aside>
				<h2><img src='img/icon/info_icon.png' class="section_icon"/>INFO</h2>
					<!-- 소개란 -->
				<div class="aside_block">
					<h3>Q&A?</h3>
					<div class="item">
						<p>자주 묻는 질문을 확인해주세요<span class="right"></span></p>
					</div>
					<div class="item">
						<p>자주 묻는 질문을 확인해주세요<span class="right"></span></p>
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
			<section style="width: 550px;">
				<h2><img src='img/icon/list_icon_white.png' class="section_icon"/>BOARD LIST</h2>
				<!--탭 메뉴 영역  -->
				<div class="list_block" style="width: 500px; margin: 0 auto; padding: 0;">
					
					<c:forEach items="${page.list }" var="vo">
						<dl>
							<dt>
								<span></span>${vo.title }
								<c:if test="${info_login.admin eq 'Y' }">
									<div class="mid">
									<a class="btn-fill" onclick="location='modify.ct?id=${vo.id}'">수정</a> 
									<a class="btn-fill"
										onclick="if( confirm('정말 삭제하시겠습니까?')){location='delete.ct?id=${vo.id}'}">삭제</a>
									</div>
								</c:if>
							</dt>
							<dd>${fn: replace(vo.content, crlf, '<br>')}</dd>
						</dl>
					</c:forEach>
				</div>
				<jsp:include page="/WEB-INF/views/include/page.jsp" />
			</section>
		</div>
	
	
			<input type="hidden" name="curPage" />
		</form>
	</div>
</div>
	
<script type="text/javascript">
		function go_page(ct) {
			$('input[name=curPage]').val(ct);
			$('#list').submit();
		}

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
</body>
</html>