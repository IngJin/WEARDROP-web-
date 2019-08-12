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
<form class="form">
<div class="ment">이메일을 입력해주세요.</div> <br/>
<div class="login_font"> Email<input type="text" name="email" id="email">
<input type="button" value="입력" onclick="id_find()" class="login_button"></div>
</form>
</body>
</html>