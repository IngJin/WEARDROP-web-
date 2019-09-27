<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all"/>
<script type="text/javascript" src="js/MarcTooltips.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" 	src="js/join_check.js?v=<%=new Date().getTime()%>"></script> 
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" 	src="js/login.js?v=<%=new Date().getTime()%>"></script>
<!-- <script type="text/javascript" 	src="js/fish.js"></script> -->
<style type="text/css">
.tre {
	font-size: 0.9em;
	font-family: 'Noto Sans KR', sans-serif;
	text-align: right;
	margin-right: 20px;
	margin-bottom: 20px;
}

.header_main {
	width: 175px;
	background-color: rgba(255,255,255,0.8);
	float: left;
	height: 100%;
	overflow: hidden;
}

.header_main_logo {
	width: 100px;
	line-height: 100vh;
	text-align: center;
}

.join {
	 margin-left: 10%;
}

#myVideo {
	position: fixed;
	left: 175px;
	top: 0;
	min-width: 100%;
	min-height: 100%;
	z-index: -9999;
}

.input_group{ 
  position:relative; 
  margin-bottom:45px;
  margin-left: 20px;
}

.input_group_sign_up{ 
  position:relative; 
  margin-bottom:45px;
  margin-left: 30px;
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

​#sign_up_window { 
display: none;
}
</style>

</head>
<body>
	<video autoplay muted loop id="myVideo">
        <source src="video/walkwalk.mp4" type="video/mp4">
    </video>
    
	<div class="header_main">
		<div class="header_main_logo">
			<a onclick="location='index'" style="cursor: pointer;"><img src="img/logo.png" class="logo_img" alt="로고"></a>
		</div>
	</div>
	
	<div id="sign_bg" style="display:none; position: absolute; background-color: rgba(0, 0, 0, 0.4); width: 100%; height: 100%; left: 0; top: 0;"></div>
	
	<div class="all">
	 <div class="join">
	<div class="login1">
		 	<h2 class="login_h1"><img src='img/icon/man_user_white.png' class="section_icon"/>Sign In</h2>
			<div style="margin-top:10%;">
				 <div class="input_group">      
    			  <input type="text" id="Loginid" required onkeypress="if(event.keyCode== 13) { go_login(); retrun; }">
         		  <span class="bar"></span>
      			  <label>UserId</label>
    			</div>
    			
    			 <div class="input_group">      
    			  <input type="password" id="Logindpwd" required onkeypress="if(event.keyCode== 13) { go_login(); retrun; }">
         		  <span class="bar"></span>
      			  <label>PassWord</label>
    			</div>
    			
    		<div class="btn_div" style="margin: 20px;">
				<div class="ing_btn" >
					<div class="ing_eff_yes" ></div>
					<a style="cursor: pointer;" onclick="go_login()">Login</a>
				</div>
				<div class="ing_btn" >
					<div class="ing_eff_kakao" ></div>
					<a style="cursor: pointer;" href="https://kauth.kakao.com/oauth/authorize?client_id=47035dbae45dcf3a446b494c2294ae92&redirect_uri=http://112.164.58.217/weardrop/kakaologin&response_type=code">Kakao</a>
				</div>
				
				<div class="ing_btn" >
					<div class="ing_eff_naver" ></div>
					<a style="cursor: pointer;" href="${url}">Naver</a>
				</div>
				<!-- <div class="login_font">UserId</div></br> 
				<input class="login_list" type="text" id="Loginid" onkeypress="if(event.keyCode== 13) { go_login(); retrun; }"/><br/><br/>
				<div class="login_font">PassWord</div></br>
				<input class="login_list" type="password" id="Logindpwd" onkeypress="if(event.keyCode== 13) { go_login(); retrun; }"/><br/><br/> -->
			</div>
			</div>
			
			<div class="tre" style="color: #aeaeae;"> 
				<span style="margin-right: 10px;">아이디와 비밀번호를 잊으셨나요?
					<span style="float: right;"><a href="javascript:void(0);" onclick="userid_find()">아이디 찾기</a> / <a href="javascript:void(0);" onclick="userpw_find()">비밀번호 찾기</a></span>
				</span>
				<br/><br/>
				<span style="margin-right: 10px;">아직 회원이 아니신가요?
					<span style="float: right; cursor: pointer;" ><a id="sign_up_btn">회원가입</a></span> 
				</span>
			</div>
		  </div>
	  </div> 
	  
	  <a id="sign_in_logo" onclick="location='index'" style="cursor: pointer;"><img alt="엑박띠" src="img/icon/content_logo.png" style="width: 565px;"></a>
	 
	  <div id="sign_up_window" class="join2" style="display: none;">
   		<form method="post" action="join_log" id="from_join">
		 <input type="hidden" id="id_check" value="n">
		  <input type="hidden" id="email_check" value="n">		 
		  <div class="login2">
		 	<h1 class="login_h1"><img src='img/icon/add_user_icon.png' class="section_icon"/>Sign Up<span style="float: right"><img id="sign_quit-btn" src='img/icon/delete_white_icon.png' class="section_icon" style="cursor: pointer;"/></span></h1>
			<div style="margin-top:10%; margin-left: 20px;">
				 <div class="input_group_sign_up">
				 <span>
    			 	 <input type="text" id="userid" name="userid" required onkeyup="$('#id_check').val('n'); validate('userid')" onkeypress="if(event.keyCode== 13) { go_join(); retrun; }"/>
         		 	 <span class="bar"></span>
      			  	 <label>UserId</label>
      			  		<span style="position: absolute; left:65%; top:30%;" >
      			  			<input class="login_button" id="btn-id" type="button" value="Check" onclick="usable()"/>
      			  		</span>
				</span>      
      			<div class="valid" id="userid_status">아이디를 입력하세요.(영문 소문자, 숫자만 입력 가능합니다)</div>
    			</div>
    			
    			<div class="input_group_sign_up">
				 <span>
    			 	 <input type="text" id="writer" name="writer" required/>
         		 	 <span class="bar"></span>
      			  	 <label>Nickname</label>
				</span>
				<div class="valid" id="nick">-</div>       
    			</div>
    			
    			<div class="input_group_sign_up">
				 <span>
    			 	 <input type="password" id="userpw" name="userpw" required onkeyup="validate('userpw')" onkeypress="if(event.keyCode== 13) { go_join(); retrun; }"/>
         		 	 <span class="bar"></span>
      			  	 <label>PassWord</label>
				</span> 
				<div class="valid" id="userpw_status">비밀번호를 입력하세요.(영문 대문자, 소문자, 숫자를 모두 입력하셔야 합니다)</div>  
    			</div>
    			
    			<div class="input_group_sign_up">
				 <span>
    			 	 <input type="password" id="userpw_check" name="userpw_ck" required onkeyup="validate('userpw_ck')" onkeypress="if(event.keyCode== 13) { go_join(); retrun; }"/>
         		 	 <span class="bar"></span>
      			  	 <label>PassWord_Check</label>
				</span> 
				<div class="valid" id="userpw_ck_status">비밀번호를 다시 입력하세요.</div>  
    			</div>
    			
    			<div class="input_group_sign_up">
				 <span>
    			 	 <input type="email" id="email" name="email" required onkeyup="$('#email_check').val('n'); validate('email')" onkeypress="if(event.keyCode== 13) { go_join(); retrun; }"/>
         		 	 <span class="bar"></span>
      			  	 <label>Email</label>
      			  	 <span style="position: absolute; left:65%; top:30%;">
      			  		<input class="login_button" id="btn-email" type="button" value="Check" onclick="usable_email()"/>
      			  	 </span>
				</span>
				<div class="valid" id="email_status">이메일을 입력하세요</div>    
    			</div>
			</div><br/>	
			<div class="tre" style="float: left; margin-left: 50px;"><input type="checkbox" name="terms" style="width:15px;height:15px;"> 본 서비스 <a href="javascript:void(0);" onclick="terms()" style="text-decoration:underline;">이용약관</a>에 동의합니다.</div><br/>
			
			<div class="btn_div" style="float: right; margin-right: 50px; margin-bottom: 40px;">
				<div class="ing_btn" >
					<div class="ing_eff"></div>
					<a style="cursor: pointer;" onclick="go_join()">Sign Up</a>
				</div>
			</div>
		  </div>			
		</form>
	  </div> 
	</div>
	
	<script type="text/javascript">
		$('#sign_up_btn').click(function(){
		$('.login1').css("z-index","-10");
		$('#sign_in_logo').css("z-index","-10");
		$('#sign_bg').show();
		$("#sign_up_window").fadeIn();
		$("#sign_up_window").fadeIn("slow");
		$("#sign_up_window").fadeIn(3000);
		})
		
		$('#sign_quit-btn').click(function(){
		$('#sign_up_window').hide();
		$('#sign_bg').hide();
		$('.login1').css("z-index","0");
		$('#sign_in_logo').css("z-index","0");
		})
	</script>
</body>
</html>