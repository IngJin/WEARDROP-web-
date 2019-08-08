<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">

function go_join() {	

	// 중복확인 하지 않은 경우
	if ($('#id_check').val() === 'n') {
		if ( !item_check('userid') ) { return; }
		else {
			// 중복확인 하도록 유도
			alert( join.id.valid.desc );
			$('#btn-id').focus();
			return;
		}
	} else if( $('#id_check').val() === 'unusable' ) {
	// 중복확인 한 경우 : usable/usable
		alert( join.id.unusable.desc );	
		// $('[name=userid]').val('');
		$('[name=userid]').focus();
		return;
	}
	
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
	if ( !item_check('email') ) { return; }
	
	if($('[name=phone]').val().trim() === '' ) {
		alert('휴대전화 번호를 입력하세요.');
		$('[name=phone]').val('');		
		return;
	}
	var text = $('#phone').val()
	var textlength = text.length;
	if(textlength != 11) {
		alert('잘못된 휴대폰 번호를 입력하셨습니다.');
		$('[name=phone]').val('');		
		return;
	}
	
	$('#from_join').submit();
	
}

function item_check(item) {	
	 var result = validate(item);
	 if( result.code != 'valid' ) { 
		alert( result.desc );
		$('[name=' + item + ']').focus();
		return false; 
		} else { return true; }
}

function usable(){
	var result = validate('userid');
	if( result.code !== 'valid' ){
		alert( result.desc );
		return;
	}
	// DB에 해당 아이디로 가입한 회원이 있는지의 여부를 판단
	$.ajax({
		type: 'post',
		url: 'id_check_main',
		data: { userid : $('[name=userid]').val() },
		success: function(data){
			var result = join.id_usable(data);
			$('#userid_status').text(result.desc);
			$('#userid_status').removeClass('valid invalid');
			//usable -> valid, unusable -> invalid
			$('#userid_status').addClass( 
					result.code==='usable' ? 'valid' : 'invalid' );
			$('#id_check').val( result.code );
		},
		error: function(req, text){
			alert(text + ": "+req.status);
		}
	});	
}

function validate(tag) {
	// 태그에 입력된 값이 유효한 조합인지 판단
	var result = $('[name=' + tag + ']').val();
	if( tag === 'userid') {
		// 영문 소문자, 숫자로만 제한
		result = join.id_status(result);
	} else if ( tag === 'userpw') {
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

function go_login(){
	$.ajax({
		type: 'post',
		url: 'login_log',
		data: { userid: $('#Loginid').val(), 
				userpw: $('#Logindpwd').val() },
		success: function(data){
			if( data ){				
				location='index';
			} else{
				alert('아이디나 비밀번호가 일치하지 않습니다!');
				$('#Loginid').focus();
			}
		},
		error: function(req, text){
			alert( text + ": " + req.status );
		}
	});
}
</script>
</head>

<body>

	  <div class="join">
		  <div class="login">
		 	<h1 class="login_h1">Login</h1>
			<span>
				<div class="login_font">UserId</div></br> 
				<input class="login_list" type="text" id="Loginid"/><br/><br/>
				<div class="login_font">PassWord</div></br>
				<input class="login_list" type="password" id="Logindpwd"/><br/><br/>
			</span>	
			<div class="btn_div">
				<a class="btn" onclick="go_login()">Login</a>
				<a class="btn" href="https://kauth.kakao.com/oauth/authorize?client_id=47035dbae45dcf3a446b494c2294ae92&redirect_uri=http://192.168.0.67/iot/kakaologin&response_type=code">Kakao</a>
				<a class="btn" href="#">Naver</a>
			</div>
		  </div>		
	  </div> 
	  <div class="join2">
   	<form method="post" action="join_log" id="from_join">
		 <input type="hidden" id="id_check" value="n">
		  <div class="login2">
		 	<h1 class="login_h1">Register</h1>
			<span>
				<div class="login_font">UserId</div>
					<input class="login_list" type="text" id="userid" name="userid" onkeyup="$('#id_check').val('n'); validate('userid')"/>				
					<input class="login_button" id="btn-id" type="button" value="Duplicate" onclick="usable()"/><br/>
					<div class="valid" id="userid_status">아이디를 입력하세요.(영문 소문자, 숫자만 입력 가능합니다)</div></br>
					<div class="login_font">Nickname</div>
					<input class="login_list" type="text" id="writer" name="writer"/><br/><br/>
					<div class="login_font">PassWord</div>
					<input class="login_list" type="password" id="userpw" name="userpw" onkeyup="validate('userpw')"/><br/>
					<div class="valid" id="userpw_status">비밀번호를 입력하세요.(영문 대문자, 소문자, 숫자를 모두 입력하셔야 합니다)</div></br>
					<div class="login_font">PassWord_Check</div>
					<input class="login_list" type="password" id="userpw_check" name="userpw_ck" onkeyup="validate('userpw_ck')"/><br/>
					<div class="valid" id="userpw_ck_status">비밀번호를 다시 입력하세요.</div><br/>				
					<div class="login_font">Email</div>
					<input class="login_list" type="email" id="email" name="email" onkeyup="validate('email')"/><br/>
					<div class="valid" id="email_status">이메일을 입력하세요</div><br/>
					<div class="login_font">Phone</div>
					<input type="text" id="phone" name="phone" size="4" maxlength="3" /> -
					<input type="text" id="phone"  name="phone" size="4" maxlength="4" /> - 
					<input type="text" id="phone"  name="phone" size="4" maxlength="4" /><br/><br/>
			</span>	
			<div class="btn_div">
				<a class="btn" onclick="go_join()">Register</a>
			</div>
		  </div>			
		</form>
	  </div> 
</body>
</html>