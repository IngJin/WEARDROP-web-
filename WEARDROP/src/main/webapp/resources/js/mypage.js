
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