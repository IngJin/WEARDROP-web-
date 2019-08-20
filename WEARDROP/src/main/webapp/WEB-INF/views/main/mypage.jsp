<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="js/join_check.js?v=<%=new Date().getTime()%>"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/mypage.css?v=<%= new Date().getTime() %>">
    <script type="text/javascript" src="js/mypage.js?v=<%=new Date().getTime()%>"></script>
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
                    <input class="login_list" type="hidden" id="userid" name="userid" value="${info_login.userid }" />
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