<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript" src="js/MarcTooltips.js"></script>
<link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all"/>
<meta charset="UTF-8">
<title>갤러리 수정</title>
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
</script>
<style type="text/css">

body, html {
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0);
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

ol, ul, li {
	list-style: none;
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
    float:left;
    top: 0;
}

#gal_wrap #gal_contents .leftside .snapsPhoto {
   
}

#gal_wrap #gal_contents .leftside .item {
    width: 100%;
    height: 0;
    position: absolute;
    top: 0;
    left: 0;
}

#gal_wrap #gal_contents .leftside .snapsPhoto .item .img {
    
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
   /*  background-color: rgba(0, 0, 0, 0.5); */
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

/* .photo {
    background-position: 50% 50%;
    background-repeat: no-repeat;
    background-size: cover;
} */


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

    
#gal_wrap #gal_contents .rightside .rs_body .rs_instagram .a_replace {
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

/* 인풋 */
.file-input {
  display: inline-block;
  text-align: left;
  background-color: rgba(255, 255, 255, 0.5);
  padding: 16px 0 16px 16px;
  width: 80%;
  position: relative;
/*   box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5); */
  margin-left: 30px;
 /*  border-radius: 3px; */
}

.file-input > [type='file'] {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  z-index: 10;
  cursor: pointer;
}

.file-input > .button {
  display: inline-block;
  cursor: pointer;
  background: #eee;
  padding: 8px 16px;
  border-radius: 2px;
  margin-right: 8px;
}

.file-input:hover > .button {
  background: black;
  color: white;
}

.file-input > .label {
  color: #333;
  white-space: nowrap;
  opacity: .3;
}

.file-input.-chosen > .label {
  opacity: 1;
}

#attach-file, #delete-file {
	display: none;
}

.file-img {
	width: 15.5px;
	height: 15.5px;
	cursor: pointer; /* 커서 설정  */
}

#myVideo {
	position: fixed;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
	z-index: -9999;
}


</style>

</head>
<body>
<form action="insert.gal" method="post" enctype="multipart/form-data">

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
		  				<img src="img/icon/tpbg.png" style="width: 100%; height:100%;"/>
		  				<!-- <img src="" style="width:100%; height:100%;"/> -->
		  			</span>
		 		</span>
			</div>
		</div>
		
		<!-- 우측 정보 출력부분 -->
		<div class="rightside rightpix ootdDetail">
			<!-- 헤더 -->
			<div class="rs_header">
				<h2 class="rs_title"><input value="${vo.title }" type="text"
					title="제목" class="need" id="gal_title" placeholder="제목을 입력해주세요!" name="title" style="width: 40%; background-color: #fff; font-size: 26px; font-weight: bold;" /></h2>
					
					<script type="text/javascript">
						MarcTooltips.add('#gal_title', '제목을 입력해주세요!', {position:'right',onFocus:true});
					</script>
					
					<div class="statusWrap">
						<p class="rs_tag">
							<img class="gal_icon" src="img/icon/gal_user_icon.png"/>${info_login.writer}
							<img src="img/icon/gal_eye_icon.png" style="width:15.5px; height:15.5px; vertical-align:bottom"/>
							<p class="rs_tag">-----</p>
						</p>
						<p class="rs_date">----------</p>
					</div>
			</div>
			
			<!-- 본문 -->
			<div class="rs_body">
				<!-- 콘텐츠 -->
				<div class="rs_textarea">
					<p><textarea title="내용" class="need"
						style="resize:none; width: 50%; height: 200px;
    					" name="content" id="gal_content" placeholder="내용을 입력해주세요!">${vo.content }</textarea></p>
				</div>
				
				<script type="text/javascript">
					MarcTooltips.add('#gal_content', '내용을 입력해주세요!', {position:'right',onFocus:true});
				</script>
				
			<!-- SNS 링크 -->
				<div class="rs_linkArea">
					<p class="rs_instagram">
						<span class="a_replace" href="https://www.instagram.com/${info_login.userid}/" target="_blank">
							<img class="gal_icon" src="img/icon/icon_instagram.png"/>
							<span>https://www.instagram.com/${info_login.userid}</span>
						</span>
					</p>	
				</div>
				
				<div class='file-input'>
 				<input type='file' name="file" id="gdsImg" title="사진" class="need"/>
  				<span class='button'>Choose Pic!</span>
  				<span class='label' data-js-label>No file selected</label>
				</div>
				
				<script type="text/javascript">
				MarcTooltips.add('#gdsImg', '"Choose Pic!"을 눌러 사진을 꼭 첨부해주세요!');
				</script>
				
				<script type="text/javascript">
					var inputs = document.querySelectorAll('.file-input')

					for (var i = 0, len = inputs.length; i < len; i++) {
		 			 customInput(inputs[i])
					}

					function customInput (el) {
				  	const fileInput = el.querySelector('[type="file"]')
		  			const label = el.querySelector('[data-js-label]')
		  
		  			fileInput.onchange =
		 			 fileInput.onmouseout = function () {
		    		if (!fileInput.value) return
		    
		    			var value = fileInput.value.replace(/^.*[\\\/]/, '')
		    		el.className += ' -chosen'
		    		label.innerText = value
		 		 }
				}
				</script>
				
				<!-- 버튼 묶음 -->
				<div class="btnwrap">
					<div class="ing_btn">
						<div class="ing_eff_yes"></div>
						<a onclick="if(necessary()){$('form').submit()}">Save</a>
					</div>
					
					<div class="ing_btn">
						<div class="ing_eff_not"></div>
						<a onclick="location.href='list.gal'">Cancel</a>
					</div>
					
				</div>
				</form>
				
				
<!-- 	<script type="text/javascript">
	$(function() {
		if ('${ !empty vo.filename}' == 'true') {
			$('#delete-file').css('display', 'inline-block');
			$('#file-name').css('padding-right', '15px');
		}
	});
	</script> -->
	
	<script type="text/javascript">
		$("#gdsImg").change(function() {
			if (this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".photo img").attr("src", data.target.result)
				}
				reader.readAsDataURL(this.files[0]);
				}
			});
	</script>
	
	<script type="text/javascript">

	function necessary() {
		var need = true;
		$('.need').each(function(){
			if($(this).val()==''){
				alert($(this).attr('title') + '을 입력하세요!'); /* title을 입력하세요 */
				$(this).focus(); /* 빈칸 커서 이동*/
				need = false;
				return need;
			}
		});
		return need;
	}//necessary()
	</script>
</table>

	<video autoplay muted loop id="myVideo">
		<source src="img/gal_input.mp4" type="video/mp4">
	</video>
</body>
</html>