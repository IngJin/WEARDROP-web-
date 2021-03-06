<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menu.css?v=<%= new Date().getTime() %>">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
.ment {
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
	margin-bottom: 20px;
}

.login_font {
	font-size: 0.9em;
	text-align: center;
}

#floater {
  float: left; 
  height: 100px; 
  margin-bottom: -50px;
}

.form  {
  clear: both; 
  height: 150px; 
  position: relative;
}

input[name=email] {
	text-align: center;
	font-size:18px;
  	padding:10px 10px 10px 5px;
  	display:block;
  	/* width:300px; */
  	width:300px;
  	border:none;
  	border-bottom:1px solid #757575;
}

.input_group{ 
  position:relative; 
  margin-bottom:45px;
  margin-left: 92px;
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

.login_button{
	position:absolute;
	margin-left: 200px;
}
</style>
<script type="text/javascript">
function id_find() {
	$.ajax({
		type: 'post',
		url: 'userid_find',
		data: { email : $('[name=email]').val() },
		success: function(data){			
			if(data != '') {				
				alert("당신의 아이디는 " + data.userid +  " 입니다.");
			} else {
				alert("아이디를 찾을 수 없습니다. 회원가입을 해주세요.");
			}
		},
		error: function(req, text){
			alert(text + ": "+req.status);
		}
	});	
}
</script>
<title>아이디 찾기</title>
</head>
<body>
<div id="floater"></div>
<form class="form" autocomplete=off>
<div class="ment">이메일을 입력해주세요.</div> <br/>
<div class="input_group">      
     <input type="text" name="email" id="email" required>
     <span class="bar"></span>
     <label>Email</label>
</div>
     <input type="button" value="입력" onclick="id_find()" class="login_button">
</form>
</body>
</html>