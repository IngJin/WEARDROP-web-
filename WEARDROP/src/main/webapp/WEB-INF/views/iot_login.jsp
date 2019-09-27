<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>하프미러 시스템 - 로그인</title>
<style type="text/css">
.all {
	position: absolute;
	top: 25%;
	left: 40%;
	text-align: center;
}

.login_form {
	border: 1px solid #cccccc;
	padding: 10px 10px 10px 10px;	
	width: 300px;
	text-align: center;
	margin: 0 auto;
}	
.btn {
	background-color: #4F4F4D;
	font-family: 'Darker Grotesque', sans-serif;
	font-size: 0.8em;
	color: #F1F1F1;
	padding: 8px 30px;
	border-radius: 30px;	
}
</style>
<script type="text/javascript">
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1); //어제날짜를 쿠키 소멸날짜로 설정
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

$(document).ready(function() {
    //Id 쿠키 저장
    var userInputId = getCookie("userInputId");
    $("input[name='userId']").val(userInputId); 
     
    if($("input[name='userId']").val() != ""){ 
        $("#idSaveCheck").attr("checked", true); 
        $("#pwdSaveCheck").removeAttr("disabled");
    }
     
    $("#idSaveCheck").change(function(){ 
        if($("#idSaveCheck").is(":checked")){                     
               //id 저장 클릭시 pwd 저장 체크박스 활성화
               $("#pwdSaveCheck").removeAttr("disabled");
               $("#pwdSaveCheck").removeClass('no_act');
            var userInputId = $("input[name='userId']").val();
            setCookie("userInputId", userInputId, 365);
        }else{ 
            deleteCookie("userInputId");
            $("#pwdSaveCheck").attr("checked", false); 
            deleteCookie("userInputPwd");
            $("#pwdSaveCheck").attr("disabled", true);
            $("#pwdSaveCheck").addClass('no_act');
        }
    });     
  
    $("input[name='userId']").keyup(function(){ 
        if($("#idSaveCheck").is(":checked")){ 
            var userInputId = $("input[name='userId']").val();
            setCookie("userInputId", userInputId, 365);
        }
    });
    
    //Pwd 쿠키 저장 
    var userInputPwd = getCookie("userInputPwd");
    $("input[name='userPwd']").val(userInputPwd); 
     
    if($("input[name='userPwd']").val() != ""){ 
        $("#pwdSaveCheck").attr("checked", true);
        $("#pwdSaveCheck").removeClass('no_act');
    }
     
    $("#pwdSaveCheck").change(function(){ 
        if($("#pwdSaveCheck").is(":checked")){ 
            var userInputPwd = $("input[name='userPwd']").val();
            setCookie("userInputPwd", userInputPwd, 365);
        }else{ 
            deleteCookie("userInputPwd");
        }
    });     
  
    $("input[name='userPwd']").keyup(function(){ 
        if($("#pwdSaveCheck").is(":checked")){ 
            var userInputPwd = $("input[name='userPwd']").val();
            setCookie("userInputPwd", userInputPwd, 365);
        }
    });
     setTimeout("go_login()", 30000);
});



function go_login() {
    $.ajax({
        type: 'post',
        url: 'iot_login_log',
        data: {
            userid: $('#userId').val(),
            userpw: $('#userPwd').val()
        },
        success: function(data) {
            if (data) {
                location = 'main.iot';
            } else {
                alert('아이디나 비밀번호가 일치하지 않습니다!');
                $('#userId').focus();
            }
        },
        error: function(req, text) {
            alert(text + ": " + req.status);
        }
    });
}

</script>
</head>
<body>
<div class="all">
<div class="login_form">
<p><input type="text" name="userId" id="userId" class="form_id" title="아이디" value="" onkeypress="if(event.keyCode== 13) { go_login(); retrun; }"/></p>
<p><input type="password" name="userPwd" id="userPwd" class="form_pw" title="비밀번호" 
    value="" onkeydown="if(event.keyCode==13) javascript:chkEnter();" onkeypress="if(event.keyCode== 13) { go_login(); retrun; }" /></p>
<label><input type="checkbox" id="idSaveCheck"/> 아이디 저장</label>
<label><input type="checkbox" disabled id="pwdSaveCheck" class="no_act"/> 비밀번호 저장</label>
</div><br/>
<a class="btn"  onclick="go_login()">Login</a>
<br/><br/>
<div>30초 뒤 자동 로그인 됩니다.</div>
<br/>
</div>
</body>
</html>