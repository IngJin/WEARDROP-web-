<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 설정 -->
<link type="text/css" rel="stylesheet" href="css/ingjin.css"/>
<meta charset="UTF-8">
<title>WEARDROP-Gallery-</title>
<script type="text/javascript">
// 텍스트 셔플
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

// 댓글 조회
$(function(){
	comment_list();
});//function()

// 댓글 등록
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
		url: "gallery/comment/insert",
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

// 댓글이 보여지는 처리
function comment_list(){
	  $.ajax({
          url: "gallery/comment/${vo.id}",
          success: function(result) {
             $('#comment_list').html( result );
          }, error: function(req, text) {
             alert(text + ": " + req.status);
          }
       });
}// comment_list

$(document).ready(function(){

	$(document).bind("contextmenu", function(e) {

		return false;

	});

});

// 우클릭 방지
$(document)[0].oncontextmenu = function() { return false; }

$(document).mousedown(function(e) {
	if( e.button == 2 ) {
			alert('사진 다운로드는 불가능합니다!');
			return false;
	} else {
			return true;
	}
});
</script>

<!-- CSS -->
<style type="text/css">
body, html {
    width: 100%;
    height: 100%;
}

div {
    display: block;
    outline: none;
}

p{
margin: 0;
padding: 0;
}

input[type=text], input[type=password], input[type=email] {
	height: 35px;
	border: hidden;
	background-color: #F1F1F1;
	border-bottom: 1px solid #C0C0C0;
}

#gal_wrap {
	width: 100%;
	height: 100%;
}


#gal_wrap #gal_menu {
	position: fixed;
	top: 0;
	left: 0;
	width: 175px;
	height: 100%;
	background-color: #fff;
}

#gal_wrap #gal_menu h1 {
	position: absolute;
	top: 50%;
	left: 0;
	margin-top: -37px;
	width: 175px;
}

#gal_wrap #gal_menu h1 a, #gal_wrap #gal_menu h1 img {
	position: relative;
	width: 175px;
}

#gal_wrap #gal_contents{
	margin-left: 175px;
	height: 100%;
}

#gal_wrap #gal_contents .rightpix {
    right: 0;
}

#gal_wrap #gal_contents .leftpix {
    left: 0;
}

#gal_wrap #gal_contents .leftside {
    width: 50%;
    height: 100%;
    position: absolute;
    top: 0;
}

#gal_wrap #gal_contents .leftside .snapsPhoto {
    background-color: #0000ff;
}

#gal_wrap #gal_contents .leftside .item {
    width: 100%;
    height: 0;
    position: absolute;
    top: 0;
    left: 0;
}

#gal_wrap #gal_contents .leftside .snapsPhoto .item .img {
    background-color: #0000ff;
}

#gal_wrap #gal_contents .leftside .item .img {
	margin-left:175px;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
    display: block;
    background-color: #edff00;
}

#gal_wrap #gal_contents .leftside .item .img .photo {
    position: relative;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    display: block;
    -webkit-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
	-moz-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
	-o-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
	transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1)
}

.photo {
    background-position: 50% 50%;
    background-repeat: no-repeat;
    background-size: cover;
}


/* 본문 우측 */
#gal_wrap #gal_contents .ootdDetail {
    overflow: hidden;
}

#gal_wrap #gal_contents .rightside {
    width: 41%;
    height: 100%;
    position: absolute;
    top: 0;
  	 background-color: #fff;
   /* background:linear-gradient(to right, white, black); */
}

#gal_wrap #gal_contents .rightside .rs_header {
    border-bottom: 1px solid #000000;
    background-size: 100% 1px;
    padding: 14px 20px 20px 20px;
}

#gal_wrap #gal_contents .rightside .rs_header .rs_title {
    font-size: 26px;
    font-weight: bold;
    line-height: 1.6;
    margin-bottom: 10px;
}

#gal_wrap #gal_contents .rightside .rs_header .statusWrap {
    *zoom: 1;
    width: 100%;
}

#gal_wrap #gal_contents .rightside .rs_header .statusWrap:before, #gal_wrap #gal_contents .rightside .rs_header .statusWrap:after {
    display: table;
    content: "";
    line-height: 0;
}

#gal_wrap #gal_contents .rightside .rs_header .statusWrap:after {
	clear: both
}

#gal_wrap #gal_contents .rightside .rs_header .statusWrap .rs_tag {
    float: left;
    display: inline-block;
    font-size: 14px;
    line-height: 1.231;
    letter-spacing: 1px;
    margin-right: 7px;
}

#gal_wrap #gal_contents .rightside .rs_header .statusWrap .rs_date {
   	float: right;
    display: inline-block;
    font-size: 14px;
    line-height: 1.231;
    letter-spacing: 1px;
    margin-right: 100px;
    background: #000; 
    color: #fff; 
    padding-left: 10px; 
    padding-right: 10px;
}

#gal_wrap #gal_contents .rightside .rs_body {
    padding: 20px 20px 10px 20px;
}

#gal_wrap #gal_contents .rightside .rs_body .rs_textarea {
	padding: 20px 20px 10px 30px;
    margin-bottom: 10px;
}

#gal_wrap #gal_contents .rightside .rs_body .rs_textarea p {
    font-size: 14px;
    line-height: 1.9;
    letter-spacing: 1px;
}

#gal_wrap #gal_contents .rightside .rs_body .rs_linkArea {
	margin-bottom: 10px;
}

#gal_wrap #gal_contents .rightside .rs_body .rs_instagram {
	width:100%;
	float:left;
	display: inline-block;
	font-size: 14px;
	line-height: 1.231;
	letter-spacing: 1px;
}

    
#gal_wrap #gal_contents .rightside .rs_body .rs_instagram a {
	color: #000;
	display: inline-block;
	padding: 20px 20px 10px 30px;
    margin-bottom: 10px;
	text-decoration: none;
}

/* 버튼 묶음 */

#gal_wrap #gal_contents .rightside .btnwrap {
	position: absolute;
	margin-left:50px;
	margin-right:50px;
	bottom: 20px;
	left: 0;
	width: 100%;
	*zoom: 1
}

#gal_wrap #gal_contents .rightside .nextprev:before, #gal_wrap #gal_contents .rightside .nextprev:after
	{
	display: table;
	content: "";
	line-height: 0
}

#gal_wrap #gal_contents .rightside .nextprev:after {
	clear: both
}


#comment_regist {
	float: left; 
	width: 50%;
}

/* 잉버튼 */
.ing_btn{
  width:175px;
  height:30px;
  border:2px solid #fff;
  background:#000;
  float:left;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:0 0 10px 0px;
}

.ing_btn a{
  font-family:arial;
  font-size:16px;
  color:#fff;
  text-decoration:none;
  line-height:30px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
}

.ing_eff{
  width:175px;
  height:50px;
  left:-175px;
  background:#3e3636;
  color:#000;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
}

.ing_eff_not{
  width:175px;
  height:50px;
  left:-175px;
  background:#d72323;
  color:#fff;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
}

.ing_eff_yes{
  width:175px;
  height:50px;
  left:-175px;
  background:#408150;
  color:#fff;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
}

.ing_btn:hover .ing_eff {
  left:0;
}

.ing_btn:hover .ing_eff_not {
  left:0;
}

.ing_btn:hover .ing_eff_yes{
  left:0;
}

.ing_btn:hover a{
  color:#fff;
}

.gal_icon{
	margin-right:7px; 
	width:15.5px; 
	height:15.5px; 
	vertical-align:bottom;
}

</style>
<script type="text/javascript">

</script>
</head>
<!-- 사진 우클릭 방지  -->
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
<div id="gal_wrap">
	<!-- 메뉴 -->
	<div id="gal_menu">
		<h1>
			<a class="cutOut" href="list.gal"> <img alt src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
			</a>
		</h1>
	</div>

	<!-- 본문 -->
	<div id="gal_contents">
		<!-- 좌측 사진 출력부분 -->
		<div class="leftside leftpix snapsPhoto">
			 <div class="item" style="display: block; height: 100%;  top: 0px;">
		  		<span class="img">
		  			<span class="photo">
		  				<img src="<c:url value='/'/>${vo.filepath}" style="width:100%; height:100%;">
		  			</span>
		 		</span>
			</div>
		</div>
	
		<!-- 우측 정보 출력부분 -->
		<div class="rightside rightpix ootdDetail">
			<!-- 헤더 -->
			<div class="rs_header">
				<h2 class="rs_title">${vo.title }</h2>
					<div class="statusWrap">
						<p class="rs_tag">
							<img class="gal_icon" src="img/icon/gal_user_icon.png"/>${vo.writer }
							<img src="img/icon/gal_eye_icon.png" style="width:15.5px; height:15.5px; vertical-align:bottom"/>
							<p class="rs_tag my-effect">${vo.readcnt}</p>
						</p>
						<p class="rs_date my-effect">${vo.writedate }</p>
					</div>
			</div>
		
			<!-- 본문 -->
			<div class="rs_body">
				<!-- 콘텐츠 -->
				<div class="rs_textarea">
					<p>${fn:replace( fn:replace(vo.content, lf, '<br>') , crlf, '<br>')} <br></p>
				</div>
			
				<!-- SNS 링크 -->
				<div class="rs_linkArea">
					<p class="rs_instagram">
						<a class="blank underline" href="https://www.instagram.com/${vo.userid}/" target="_blank">
							<img class="gal_icon" src="img/icon/icon_instagram.png"/>
							<span class="my-effect">https://www.instagram.com/${vo.userid}</span>
						</a>
					</p>	
				</div>
			
				<!-- 버튼 묶음 -->
				<div class="btnwrap">
					<div class="ing_btn">
						<div class="ing_eff"></div>
						<a onclick="$('#detail').submit()"> ← list</a>
					</div>
			
					<!-- 수정/삭제 권한 -->
					<c:if test="${vo.userid eq info_login.userid  }"> 
						<!-- 글 작성자와 로그인 정보 일치해야 수정/삭제 가능-->
						<div class="ing_btn">
							<div class="ing_eff_yes"></div>
							<a onclick="location.href='modify.gal?id=${vo.id}'">modify</a>
						</div>
						
						<div class="ing_btn">
							<div class="ing_eff_not"></div>
							<a onclick="if(confirm('정말 삭제를 하시겠습니까?')){location='delete.gal?id=${vo.id}' }">delete</a>
						</div>
						
						<!-- <div class="ing_btn">
							<div class="ing_eff"></div>
							<a onclick="">LIKE</a>
						</div> -->
					</c:if>
				</div>
			</div>
			
			<!-- 댓글 -->	
			<div class="rs_comment" id="comment_regist" style="text-align: center; width: 80%; margin-left: 50px;" >
				<p style="text-align:left; margin-bottom: 10px; font-size: 15px; font-weight: bold;">
					댓글<img src="img/reply.png" style="width:15.5px; height:15.5px; vertical-align:bottom; margin-left:7px; "/>
				</p>
				<textarea id="comment" placeholder="댓글을 작성해주세요.." style="resize:none; width: 99%; height: 50px;" maxlength="50" onblur="Limit(this)"></textarea>
				<div class="ing_btn" style="left: 0; margin-top: 5px;">
					<div class="ing_eff_yes"></div>
					<a onclick="go_comment_regist()">reply</a>
				</div>
			</div>
			
			<script type="text/javascript">
			//textarea maxlength 지정하기
			function Limit(obj){
			    var maxLength = parseInt(obj.getAttribute("maxlength"));
			    if(obj.value.length > maxLength){
			        alert("50자이하로입력하세요");
			        obj.value = obj.value.substring(0,maxLength);
			    }
			}
			</script>
			
			<!-- 댓글이 뿌려지는 창 -->
			<div id="comment_list" style="text-align:left; width: 80%; margin-left: 50px;"></div>
		</div>	
	</div>
	
	<form id="detail" method="post" action="list.gal">
			<input type="hidden" name="curPage" value="${page.curPage }">
			<input type="hidden" name="search" value="${page.search }"> 
			<input type="hidden" name="keyword" value="${page.keyword }">
		</form>	
		<br />	
</div>
</body>
</html>