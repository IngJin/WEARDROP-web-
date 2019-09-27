<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="js/join_check.js?v=<%=new Date().getTime()%>"></script>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="css/mypage.css?v=<%=new Date().getTime()%>">
<script type="text/javascript"
	src="js/mypage.js?v=<%=new Date().getTime()%>"></script>
	<link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all"/>
	<script type="text/javascript" src="js/MarcTooltips.js"></script>
<script type="text/javascript">
	function go_join() {
		if ($('[name=writer]').val().trim() === '') {
			alert('닉네임을 입력하세요.');
			$('[name=writer]').focus();
			$('[name=writer]').val('');
			return;
		}

		// 안내문구에도 불구하고 유효하지 않은 형태의 데이터로
		// 회원가입할 수 있으므로 유효성부터 판단.
		if (!item_check('userpw')) {
			return;
		}
		if (!item_check('userpw_ck')) {
			return;
		}
		
		var check = '<c:out value="${info_login.email }"/>';
		if (check != $('[name=email]').val()) {
		// 이메일 중복확인 하지 않은 경우
			if ($('#email_check').val() === 'n') {
				if (!item_check('email')) {
					return;
				} else {
					// 중복확인 하도록 유도
					alert(join.email.valid.desc);
					$('#btn-email').focus();
					return;
				}
		}
			
		} else if ($('#email_check').val() === 'unusable') {
			// 이메일 중복확인 한 경우 : usable/usable
			var check = '<c:out value="${info_login.email }"/>';
			if (check == $('[name=email]').val()) {
				$('#from_mod').submit();
			} else {
				alert(join.email.unusable.desc);
				$('[name=email]').focus();
				return;
			}
		}
		$('#from_mod').submit();
	}
</script>
<title>마이페이지</title>
<style type="text/css">

h2 {
	margin: 0;
	padding: 0 1em;
	background: #000;
	font-size: 2em;
	color: #fff;
	height: 40px;
}

section{
	float: left;
	margin: 0 10px;
	width: 600px;
}

aside {
	width: 340px;
}

.aside_block {
	float: left;
	width: 320px;
	padding: 10px;
}

.post_block{
	float: left;
	width: 580px;
	padding: 10px;
}

.aside_block .listBtn {
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	margin-bottom: 0;
}

.aside_block .inputText {
	/* left: 175px; */
	width: 98%;
	height: 50px;
	background-color: #f1f1f1;
	font-size: 14px;
	display: block;
	border: none;
	padding:10px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    margin-bottom: 0;
}

.aside_block .inputBtn {
	margin: -25px 0 0 240px;
	display: block;
	width: 15px;
	height: 15px;
}

.aside_box {
	background: #000;
	color: #fff;
}

.aside_box h2 {
	padding: 0;
}

.aside_box a {
	color: #fff;
}

.ingbox{
	background-color:#fff; 
	box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);
}

.gal_icon {
	height: 15.5px;
	/* line-height: 33px; */
	/* margin-left:3px; */
	vertical-align: text-bottom;
}

.section_icon{
	width: 20px; 
	height: 20px; 
	margin-right: 10px;
}

.input_group_check{ 
  position:relative; 
  margin-bottom:45px;
}

.input_group
{ 
  position:relative; 
  margin-bottom:45px;
  margin-left: 20px;
}

	input[type=text], input[type=password], input[type=email] {
	/* height: 35px;
	border: hidden;
	background-color: #F1F1F1;
	border-bottom: 1px solid #C0C0C0;
	 */
	font-size:18px;
  	padding:10px 10px 10px 5px;
  	display:block;
  	/* width:300px; */
  	width:300px;
  	border:none;
  	border-bottom:1px solid #757575;
}

label 				 {
  color:#AEAEAE; 
  font-size:18px;
  font-weight:normal;
  position:absolute;
  pointer-events:none;
  left:5px;
  top:10px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label 		{
  top:-20px;
  font-size:14px;
  color:#000;
}

/* BOTTOM BARS ================================= */
.bar 	{ position:relative; display:block; width:315px; }
.bar:before, .bar:after 	{
  content:'';
  height:2px; 
  width:0;
  bottom:1px; 
  position:absolute;
  background:#000; 
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}
.bar:before {
  left:50%;
}
.bar:after {
  right:50%; 
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
  width:50%;
}

.login_button {
	/* background-color: #4F4F4D;
   	font-family: 'Darker Grotesque', sans-serif;
    color: #F1F1F1;
    padding: 4px 10px;
    border-radius: 13px; */
  	background-color: #000;
    color: #fff;
    border: 0;
    padding: 4px 10px;
    width: 100px;
    cursor: pointer;
}

#myVideo {
	position: fixed;
	left: 175px;
	top: 0;
	min-width: 100%;
	min-height: 100%;
	z-index: -9999;
}
</style>
</head>

<body>
	<div class="header_main">
		<div class="header_main_logo">
			<img src="img/logo.png" class="logo_img" alt="로고">
		</div>
	</div>
	<div class="all">
		<div class="inform">
			<c:if test="${ empty password_mod}">
				<aside>
				<form method="post" action="mypage_check" id="form_pwcheck">
				<h2 style="font-size: 28px; box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);"><img src='img/icon/warn_icon.png' class="section_icon"/>잠깐!</h2>
				<!-- 검색창 -->
				<div class="aside_block ingbox">
					<h3 style="margin-bottom:40px;">비밀번호를 입력해주세요!</h3>
					
				<div class="input_group_check">  
				  <input type="password" id="password_mod" name="userpw" required>     
         		  <span class="bar"></span>
      			  <label>UserId</label>
    			</div>
					
				<input class="login_button" type="button" id="password_button" name="password_button" value="Check" onclick="pm_check()" style="margin-left: 110px;">
						
						
					<!-- 툴팁 -->
					<script type="text/javascript">
						MarcTooltips.add('#password_mod', '비밀번호를 입력해주세요!', {position:'right'});
					</script>
				</div>
				
				<!-- aside_box -->
				<div class="aside_block aside_box" style="box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);">
					<h2>WEARDROP?</h2>
					<p style="font-size: 1em;">
					WEARDROP is a community media that creates fashion culture
					in Korea. The Fashion Forum, WEARDROP, was launched in 2019. We
					form a fashion community with a style and continue to send out
					the "now" in Korea.
					</p>

					<p>
					<img class="gal_icon" src="img/icon/tech_icon.png" style="margin-right: 5px;" /> 
					Technical support : JiWoong
					</p>
				</div>
				</form>
			</aside>
				<img src="img/bg/keykey.jpg" style="position:fixed; left:0; top:0; width:100%; height:100%; z-index: -9999"/>
			</c:if>
			
			<c:if test="${ !empty password_mod}">
			<video autoplay muted loop id="myVideo">
    	    	<source src="video/walkwalk.mp4" type="video/mp4">
    		</video>
    
			<section class="ingbox">
				<h2 style="font-size: 28px; margin-bottom: 45px;">회원정보수정</h2>
				<div class="post_block">
				<input type="hidden" id="email_check" value="n">
				<form class="modified_form" method="post" action="mod_info" id="from_mod" autocomplete=off>
				<input class="login_list" type="hidden" id="userid" name="userid"
							value="${info_login.userid }" />
							
					<div class="input_group">      
    			 	 <input type="text" id="writer" required name="writer" value="${info_login.writer }">
         			  <span class="bar"></span>
      			 	 <label>Nickname</label>
    				</div>
    				
    				<div class="input_group">      
    			 	 <input type="password" id="userpw" required name="userpw" value="${info_login.userpw }" onkeyup="validate('userpw')" />
         			 <span class="bar"></span>
      			 	 <label>PassWord</label>
      			 	  <a class="login_button"
							id="view" onclick="view()" style="position: absolute; left:65%; top:25%; text-align: center; height: 18px;">숨기기 해제</a>
							<div class="valid" id="userpw_status">비밀번호를 입력하세요.(영문 대문자,
							소문자, 숫자를 모두 입력하셔야 합니다)</div>
    				</div>
    				
    				<div class="input_group">      
    			 	 <input type="password" id="userpw_check" required name="userpw_ck" onkeyup="validate('userpw_ck')" />
         			 <span class="bar"></span>
      			 	 <label>PassWord_Check</label>
					<div class="valid" id="userpw_ck_status">비밀번호를 다시 입력하세요.</div>
    				</div>			
    				
    				<div class="input_group">      
    			 	 <input type="email" id="email" required name="email" value="${info_login.email }" onkeyup="$('#email_check').val('n'); validate('email')" />
         			 <span class="bar"></span>
      			 	 <label>Email</label>
      			 	 <input class="login_button" id="btn-email" type="button" value="중복확인" onclick="usable_email()" style="position: absolute; left:65%; top:25%; width: 120px;"/>
						<div class="valid" id="email_status">현재 등록된 이메일입니다.</div>
    				</div><br/>
    				
    				<div class="ing_btn" style="margin-left: 10px;">
						<div class="ing_eff_yes" ></div>
    					<a style="cursor: pointer;" onclick="go_join()">수정완료</a>
    				</div>
    				<div class="ing_btn">
						<div class="ing_eff_out" ></div>
    					<a style="cursor: pointer;" onclick="location='index'">취소</a>
    				</div>
					</form>
					
					<br /><br/>
					<div class="tre">※ 소셜 로그인시 보안을 위해 자동으로 비밀번호가 생성됩니다.</div>
					
					</div>
					
					<div id="delete_user_btn" class="ing_btn" style="position: absolute; bottom: 10%; border: 0;">
						<div class="ing_eff_out" ></div>
						<a style="cursor: pointer;" onclick="if(confirm('정말  탈퇴하시겠습니까?')){ location='delete.ho?userid=${info_login.userid}' }">회원탈퇴</a>
					</div>
					
					<script type="text/javascript">
						MarcTooltips.add('#delete_user_btn', '정말로 탈퇴하실겁니까?!', {position:'right'});
					</script>
				
			</section>
			
			<section class="ingbox">
			<h2>스마트 미러</h2>
			<div class="post_block" style="margin-top: 10px; margin-left: 30px;">
			 <c:if test="${empty mirror_check}"> <!-- 스마트미러를 안쓰면 -->
			 	<div id="mirror_on" class="ing_btn">
				<div class="ing_eff_yes" ></div>
					<a style="cursor: pointer;" onclick="if(confirm('스마트미러를 사용하시겠습니까?')){ location='iot_usermirror?userid=${info_login.userid}' }">스마트미러 사용</a>
    			</div>
    			
    			<script type="text/javascript">
				MarcTooltips.add('#mirror_on', '스마트미러를 작동합니다', {position:'right'});
			</script>
			 </c:if>
			 
			 <c:if test="${mirror_check == 'true'}"> <!-- 스마트미러를 사용중이면 -->
					<c:if test="${mirror.time == 0}"> <!-- 시간체크를 안쓰면 -->
						<div class="ing_btn">
							<div class="ing_eff_yes" ></div>
							<a style="cursor: pointer;" onclick="if(confirm('시간을 거울에 띄우시겠습니까?')){ location='iot_usertime?userid=${info_login.userid}' }">시간 on</a><br/>
    					</div>
			 		</c:if>
			 		<c:if test="${mirror.time == 1}"> <!-- 시간체크를 쓰면 -->
			 			<div class="ing_btn">
							<div class="ing_eff_out" ></div>
							<a style="cursor: pointer;" onclick="if(confirm('시간을 거울에서 지우시겠습니까?')){ location='iot_usertime?userid=${info_login.userid}' }">시간 off</a><br/>
    					</div>
			 		</c:if>
			 		<c:if test="${mirror.weather == 0}"> <!-- 날씨체크를 안쓰면 -->
			 			<div class="ing_btn">
							<div class="ing_eff_yes" ></div>
							<a style="cursor: pointer;" onclick="if(confirm('날씨를 거울에 띄우시겠습니까?')){ location='iot_userweather?userid=${info_login.userid}' }">날씨 on</a><br/>
    					</div>
			 		</c:if>
			 		<c:if test="${mirror.weather == 1}"> <!-- 날씨체크를 쓰면-->
			 			<div class="ing_btn">
							<div class="ing_eff_out" ></div>
							<a style="cursor: pointer;" onclick="if(confirm('날씨를 거울에서 지우시겠습니까?')){ location='iot_userweather?userid=${info_login.userid}' }">날씨 off</a><br/>
    					</div>
			 		</c:if>
			 		<div class="ing_btn">
				<div class="ing_eff_out" ></div>
				<a id="mirror_off" style="cursor: pointer;" onclick="if(confirm('스마트미러를 사용하지 않으시겠습니까?')){ location='iot_deletemirror?userid=${info_login.userid}' }">스마트미러 off</a>
    		</div>
    		<script type="text/javascript">
				MarcTooltips.add('#mirror_off', '스마트미러를 종료하실건가요?', {position:'up'});
			</script>			
				</div>
			</div>
			</section>
					
			 </c:if>
			</c:if>
		</div>			 				 
		</div> 
	</div>
</body>

</html>