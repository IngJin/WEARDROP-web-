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
}

.login_font {
	font-size: 0.9em;
	margin-left: 120px;
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
input[name=userid], input[name=email] {
	text-align: center;
}
</style>
<script type="text/javascript">
function pw_find() {
	$.ajax({
		type: 'post',
		url: 'userpw_find',
		data: { userid : $('[name=userid]').val(), email : $('[name=email]').val() },
		success: function(data){			
			if(data != '') {				
				alert("비밀번호를 가입하신 이메일로 전송하였습니다.");
			} else {
				alert("비밀번호를 찾을 수 없습니다. 값을 잘못 입력하셨는지 확인해주세요.");
			}
		},
		error: function(req, text){
			alert(text + ": "+req.status);
		}
	});	
}
</script>
<title>비밀번호 찾기</title>
</head>
<body>
<div id="floater"></div>
<form class="form">
<div class="ment">아이디와 이메일를 입력해주세요.</div>
<div class="ment">(이메일 전송에는 시간이 걸립니다. 기다려주세요.)</div><br/>
<div class="login_font">UserID<input type="text" name="userid" id="userid"></div>
<br/>
<div class="login_font"> Email<input type="text" name="email" id="email">
<input type="button" value="입력" onclick="pw_find()" class="login_button"></div>
</form>
</body>
</html>