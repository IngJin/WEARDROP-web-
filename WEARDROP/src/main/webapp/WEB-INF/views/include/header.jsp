<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="css/menu.css?v=<%= new Date().getTime() %>">
<link href="https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Raleway&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/header.js"></script>
<style type="text/css">
    .login {
        margin-top: 240px;
        margin-left: 8px;
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
                                        <a id="daliy" href="list.gal">DailyLook</a> <br /><br />
                                        <a href="list.se">UsedMarket</a><br />
                                        <div class="group">
                                            <div class="box">
                                                <div class="title"><a href="#">Service Center</a></div>
                                                <div class="cont" OnClick="location.href ='list.no'" style="cursor:pointer;">Notice</div>
                                                <div class="cont" id="size"><a href="list.ct">Questions and Answer</a></div>
                                            </div>
                                            <div class="box">
                                                <div class="title"><a href="#">Community</a></div>
                                                <div class="cont"><a href="list.com">Free Board</a></div>
                                                <div class="cont" OnClick="location.href ='list.hu'" style="cursor:pointer;">Reviews</div>
                                                <div class="cont"><a href="map.com">Find a store</a></div>
                                            </div><br /> <!-- box -->
                                        </div> <!-- group -->
                                    </div> <!-- contnet id -->
                                </div> <!-- content cl -->
                            </div> <!-- out -->
                            <div class="login">
                                <c:if test="${ !empty info_login}">
                                    <div class="user_info"><a onclick="location='mypage.ho'">${info_login.userid} [${info_login.writer}]</a></div><br />
                                    <a class="btn" onclick="go_logout()">Logout</a>
                                </c:if>
                                <c:if test="${ empty info_login}">
                                    <a class="btn" onclick="location='login.ho'">Login</a>
                                </c:if>
                            </div>
                        </ul>
                    </div>
                </div> <!-- gbnin-->
                <p class="logo">
                    <a onclick="location='index'"><img src="img/logo.png" class="logo_img" alt="로고" /></a>
                </p>
            </div>
        </div>
    </header>
</body>