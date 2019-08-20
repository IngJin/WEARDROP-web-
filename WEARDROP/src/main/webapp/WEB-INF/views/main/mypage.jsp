<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" 	src="js/join_check.js?v=<%=new Date().getTime()%>"></script> 
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<style type="text/css">

.header_main {
	width: 175px;
	height: 100vh;
	background-color: #ffffff;
	float: left;
}

.header_main_logo {
	width: 100px;
	line-height: 1000px;
	text-align: center;
}

.inform {
	width: 450px;
	margin-left: 100px;
	margin-top: 130px;
	float: left;
}

.modified {
	margin-top: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.1em;
	padding: 8px 20px;
}
.modified_list {
	margin-left: 20px;
	margin-top: 20px;
}
.information {
    background-color: #4F4F4D;
   	font-family: 'Noto Sans KR', sans-serif;
   	font-size: 1.1em;
    padding: 8px 20px;
    border-radius: 30px;	
    width: 95px; 
    margin-top: 30px; 
    color: #F1F1F1; 
}
.delete {
    background-color: #4F4F4D;
   	font-family: 'Noto Sans KR', sans-serif;
   	font-size: 1.1em;
    padding: 8px 20px;
    border-radius: 30px;	
    width: 65px; 
    margin-top: 30px; 
    color: #F1F1F1;    
}

.delete a {
	color: #F1F1F1;
}
.modified_form{
	width: 450px;
	border: 1px solid #cccccc;
	padding: 20px;
}
.btn {
    padding: 5px 15px;
}

.pm {
   	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 30px;
	margin-bottom: 30px;
}

#view {
	font-size: 0.8em;
}

.tre {
	font-size: 0.9em;
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
<script type="text/javascript">

function view() {
	var value = $('#view').text();
	if(value == '보기') {		
		$('#userpw').attr("type", "text");
		$('#view').text("숨기기");
	} else {
		$('#userpw').attr("type", "password");
		$('#view').text("보기");
	}	
}

function pm_check() {
	var check = '<c:out value="${info_login.userpw }"/>';
	if ($('#password_mod').val() == check) {
		$.ajax({	
			type: 'post',
			url: 'mypage_check',
			data: { userpw : $('#password_mod').val() },
			success: function(){
				location='mypage.ho';
			},
			error: function(req, text){
				alert(text + ": "+req.status);
			}
		});	
	} else {
		alert("비밀번호를 잘못 입력하셨습니다.");
	}
}

function go_join() {	
	
	if($('[name=writer]').val().trim() === '' ) {
		alert('닉네임을 입력하세요.');
		$('[name=writer]').focus();
		$('[name=writer]').val('');
		return;
	}
	
	// 안내문구에도 불구하고 유효하지 않은 형태의 데이터로
	// 회원가입할 수 있으므로 유효성부터 판단.
	if ( !item_check('userpw') ) { return; }
	if ( !item_check('userpw_ck') ) { return; }
		
	// 이메일 중복확인 하지 않은 경우
	if ($('#email_check').val() === 'n') {
		if ( !item_check('email') ) { return; }
		else {
			// 중복확인 하도록 유도
			alert( join.email.valid.desc );
			$('#btn-email').focus();
			return;
		}
	} else if( $('#email_check').val() === 'unusable' ) {
	// 이메일 중복확인 한 경우 : usable/usable
		var check = '<c:out value="${info_login.email }"/>';
		if(check == $('[name=email]').val()) {
			$('#from_mod').submit();
		} else {			
			alert( join.email.unusable.desc );	
			$('[name=email]').focus();
			return;
		}
	}
	
	$('#from_mod').submit();
}

function item_check(item) {	
	 var result = validate(item);
	 if( result.code != 'valid' ) { 
		alert( result.desc );
		$('[name=' + item + ']').focus();
		return false; 
		} else { return true; }
}

function usable_email(){
	// DB에 해당 이메일로 가입한 회원이 있는지의 여부를 판단
	var result = validate('email');
	if( result.code !== 'valid' ){
		alert( result.desc );
		return;
	}
	$.ajax({	
		type: 'post',
		url: 'email_check_main',
		data: { email : $('[name=email]').val() },
		success: function(data){
			var result = join.email_usable(data);
			$('#email_status').text(result.desc);
			$('#email_status').removeClass('valid invalid');
			//usable -> valid, unusable -> invalid
			$('#email_status').addClass( 
					result.code==='usable' ? 'valid' : 'invalid' );
			$('#email_check').val( result.code );
		},
		error: function(req, text){
			alert(text + ": "+req.status);
		}
	});	
}

function validate(tag) {
	// 태그에 입력된 값이 유효한 조합인지 판단
	var result = $('[name=' + tag + ']').val();
	if ( tag === 'userpw') {
		// 영문 대, 소문자, 숫자 모두 포함
		result = join.pw_status(result);
	} else if ( tag === 'userpw_ck') {
		// 비밀번호와 비밀번호 확인이 같은지 확인
		result = join.pw_ck_status(result, $('[name=userpw]').val());
	} else if ( tag === 'email' ) {
		result = join.email_status(result);
	}
	if(result) { $('#' + tag + '_status').text(result.desc); }
	$('#' + tag + '_status').removeClass('valid invalid');
	$('#' + tag + '_status').addClass(result.code==='valid' ? 'valid' : 'invalid' );	
	
	return result;
}
</script>
<title>마이페이지</title>
</head>
<body>
	<div class="header_main">
		<div class="header_main_logo">
			<img src="img/logo.png" class="logo_img" alt="로고">
		</div>
	</div>
	<div class="inform">
		<c:if test="${ empty password_mod}">
		<div class="pm">비밀번호를 다시 입력해주세요.</div>
		<div class="pm"><input type="password" id="password_mod" name="password_mod">
		<input type="button" class="btn" id="password_button" name="password_button" value="check" onclick="pm_check()"></div>
		</c:if>
		<c:if test="${ !empty password_mod}">		
		<div class="information">회원정보 수정</div>	
			<div class="modified_list">
				 <input type="hidden" id="email_check" value="n">		 
			   	<form class="modified_form" method="post" action="mod_info" id="from_mod">
					<input class="login_list" type="hidden" id="userid" name="userid" value="${info_login.userid }"/>
					<div class="login_font">Nickname</div>
					<input class="login_list" type="text" id="writer" name="writer" value="${info_login.writer }" /><br />
					<br />
					<div class="login_font">PassWord</div>
					<input class="login_list" type="password" id="userpw" name="userpw" value="${info_login.userpw }" onkeyup="validate('userpw')" />
					<a class="login_button" id="view" onclick="view()">보기</a>
					<br /> 
					<div class="valid" id="userpw_status">비밀번호를 입력하세요.(영문 대문자, 소문자, 숫자를 모두 입력하셔야 합니다)</div>
					</br>
					<div class="login_font">PassWord_Check</div>
					<input class="login_list" type="password" id="userpw_check" name="userpw_ck" onkeyup="validate('userpw_ck')" /><br />
					<div class="valid" id="userpw_ck_status">비밀번호를 다시 입력하세요.</div>
					<br />
					<div class="login_font">Email</div>
					<input class="login_list" type="email" id="email" name="email" value="${info_login.email }" onkeyup="$('#email_check').val('n'); validate('email')" /> 
					<input class="login_button" id="btn-email" type="button" value="Duplicate" onclick="usable_email()" /><br />
					<div class="valid" id="email_status">이메일을 입력하세요</div>
				<br /> <br />
				<a class="btn" onclick="go_join()">modified</a>			
				<br />
				</form>
				<br />
				<div class="tre">※ 카카오톡 로그인시 보안을 위해 자동으로 비밀번호가 생성됩니다.</div>
			</div>
		<div class="delete">
			<a onclick="if(confirm('정말 삭제하시겠습니까?')){ location='delete.ho?userid=${info_login.userid}' }">회원탈퇴</a>
		</div>
		</c:if>
	</div>
</body>
</html>