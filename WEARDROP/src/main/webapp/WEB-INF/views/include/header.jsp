<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="css/menu.css?v=<%= new Date().getTime() %>">
<link href="https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Raleway&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/header.js"></script>
<link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all"/>
<script type="text/javascript" src="js/MarcTooltips.js"></script>
<style type="text/css">
    
.login {
    	position:fixed;
    	bottom:20%;
}
</style>

<body>
    <header id="header">
        <div class="header">
            <div class="fixmenu">
                <a class="all-menu"> <span></span><span></span><span></span></a>
            </div>
            <div class="gnbwrap">
                <div class="gnbIn">
                    <div class="grid">
                        <ul id="gnb">
                            <div class="out">
                                <div class="content">
                                    <div id="content">
                                        <a id="daliy" href="list.gal" style="font-size: 16px;">데일리룩</a> <br /><br />
                                        <a id="usedmarket" href="list.se" style="font-size: 16px;">중고거래</a><br /><br />
                                        <a id="servicecenter" href="list.no" style="font-size: 16px;">고객센터</a><br/>
                                        <div class="group" style="font-size: 16px;">
                                            <div class="box" >
                                                <div id="community" class="title"><a href="#">커뮤니티</a></div>
                                                <div class="cont"><a href="list.com">자유게시판</a></div>
                                                <div class="cont"><a href="list.hu">후기게시판</a></div>
                                                <div class="cont"><a href="map.com">매장찾기</a></div>
                                            </div><br /> <!-- box -->
				                            
	              
				                            <div class="login">
				                                <c:if test="${ !empty info_login}">
				                                    <div class="user_info"><a style="font-size:18px; text-align: center;" onclick="location='mypage.ho'">${info_login.userid}<br/> 
				                                    [${info_login.writer}]</a></div><br />
				                                    
				                                    <div class="ing_btn" style="position: fixed; left:0; width: 175px; margin-bottom: 10px;">
													<div class="ing_eff_out"></div>
														<a style="cursor: pointer;" onclick="go_logout()">Logout</a>
													</div><br/>
				                                   <!--  <a id="login_btn" class="btn" onclick="go_logout()">Logout</a><br/><br/> -->
				                                 <c:if test="${info_login.admin eq 'Y'}">
				                                 	<div class="ing_btn" style="position: fixed; left:0; width: 175px; margin-top: 10px;">
													<div class="ing_eff"></div>
														<a style="cursor: pointer;" onclick="location='manager.list'">관리자</a>
									               </div>
									             </c:if>
				                                </c:if>
				                                <c:if test="${ empty info_login}">
				                                 <div class="ing_btn" style="position: fixed; left:0; width: 175px;">
				                                 <div class="ing_eff"></div>
				                                   <a style="cursor: pointer;" onclick="location='login.ho'">Login</a>
				                                 </div>
				                                </c:if>
				                            </div><!-- login -->
                                        </div> <!-- group -->
                                        
                                        <script type="text/javascript">
											MarcTooltips.add('#daliy', '데일리룩을 공유해보세요 :)', {position:'right'});
											MarcTooltips.add('#usedmarket', '안전한 중고거래 :)', {position:'right'});
											MarcTooltips.add('#servicecenter', '공지사항 & 자주묻는질문', {position:'right'});
											MarcTooltips.add('#community', '하위 카테고리를 선택해주세요 !!', {position:'right'});
										</script>
                                    </div> <!-- contnet id -->
                                </div> <!-- content cl -->
                            </div> <!-- out -->
                        </ul>
                    </div>
                <p class="logo">
                    <a onclick="location='index'"><img src="img/logo.png" class="logo_img" alt="로고" /></a>
                </p>
                </div> <!-- gbnin-->
            </div>
        </div>
    </header>
</body>