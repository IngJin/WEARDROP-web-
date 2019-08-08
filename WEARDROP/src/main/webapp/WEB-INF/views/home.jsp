<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>home</title>
<link rel="stylesheet" type="text/css" href="css/common.css?v=<%= new Date().getTime() %>">
<link rel="icon" type="image/x-icon" href="img/hanul.ico">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">

	var ip = "https://jsonip.com";
		$.ajax({
			url : ip,
			type : "post",
			dataType : "json",
			async : "false",
			success : function(ip) {							
				var ipURI = "http://ip-api.com/json/"+ ip.ip +"?fields=country,region,regionName,lat,lon,query";			
				$.ajax({
					url : ipURI,
					type : "post",
					dataType : "json",
					async : "false",
					success : function(resp) {
						var apiURI = "";
						apiURI += "https://api.openweathermap.org/data/2.5/weather?lat="
								+ resp.lat + "&lon=" + resp.lon
								+ "&appid=e5799cbefe2fe84bbfe2c2936d4816f4";
						$.ajax({
							url : apiURI,
							dataType : "json",
							type : "GET",
							async : "false",
							success : function(resp) {
								
								$('#daliy').hover(function() {
									$("#myVideo").attr("src", "img/daliy.mp4");
									$("#myVideo").fadeIn(1000);
									}, function(){
										$("#myVideo").attr("src", "img/main.mp4"); 
										$("#myVideo").fadeIn(1000);
									});
																									
								if((resp.weather[0].main).toString() == "Rain" || (resp.weather[0].main).toString() == "Drizzle" || (resp.weather[0].main).toString() == "Thunderstorm") {
									$('#weather').hover(function() {
										$("#myVideo").css("display", "none");
										$("#myVideo").attr("src", "img/rain2.mp4");
										$("#myVideo").fadeIn(1000);
										}, function(){
											$("#myVideo").css("display", "none");
											$("#myVideo").attr("src", "img/main.mp4"); 
											$("#myVideo").fadeIn(1000);
										});
								} else if((resp.weather[0].main).toString() == "Snow") {
									$('#weather').hover(function() {
										$("#myVideo").attr("src", "img/show.mp4"); 
										}, function(){
											$("#myVideo").attr("src", "img/main.mp4"); 
										});
								} else if((resp.weather[0].main).toString() == "Clear") {
									$('#weather').hover(function() {
										$("#myVideo").attr("src", "img/clear.mp4"); 
										}, function(){
											$("#myVideo").attr("src", "img/main.mp4"); 
										});
								} else if((resp.weather[0].main).toString() == "Clouds") {
									$('#weather').hover(function() {
										$("#myVideo").css("display", "none");
										$("#myVideo").attr("src", "img/cloud.mp4");
										$("#myVideo").fadeIn(1000);
										}, function(){
											$("#myVideo").css("display", "none");
											$("#myVideo").attr("src", "img/main.mp4"); 
											$("#myVideo").fadeIn(1000);
										});
								} else {
									$('#weather').hover(function() {
										$("#myVideo").attr("src", "img/mist.mp4"); 
										}, function(){
											$("#myVideo").attr("src", "img/main.mp4"); 
										});
								}
								
							}
						})
					}
				});
			}
		});
</script>
<style>

.out {
	width: 100%;
	text-align: center;
	font-family: 'Darker Grotesque', sans-serif;
	font-size: 1.4em;
}

.content {
	width: 290px;
	height: 100vh;
	display: inline-block;
	background-color: rgba(255, 255, 255, 1);
}

#floater {
	width: 100%;
	height: 25%;
	margin-top: 40px;
	margin-bottom: -100px;
}

#content {
	clear: both;
	width: 100%;
	height:60%;
	margin-bottom: -40px;
}

.service-over {
	display: none;
}

#myVideo {
   position: fixed;
   right: 0;
   bottom: 0;
   min-width: 100%;
   min-height: 100%;
   z-index: -1000;
}

a {text-decoration:none; color:#000000;}
.box { margin:10px; }
.box .title { display:block;  }
.box .title a { display:block; padding:10px; }
.box .cont { padding:10px; }

.group {
	margin-top: -20px;  
}

#size {
	margin-bottom: -15px;
}

.btn {
    background-color: #4F4F4D;
   	font-family: 'Darker Grotesque', sans-serif;
   	font-size: 0.8em;
    color: #F1F1F1;
    padding: 8px 30px;
    border-radius: 30px;
}

.user_info {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 0.7em;
}
</style>

<script type="text/javascript">
$(function(){

    var group = $(".group");

    group.each(function(){
        var _group = new GroupBox(this);
    });

    // 사용자 정의 생성자 함수 정의
    function GroupBox(groupElement){

        var box = $(groupElement).find(".box");
        var title = $(groupElement).find(".box .title a");

        box.each(function(idx){
            var newBox = new RootBox(this);
            if (idx >= 0){
                newBox.siblingsClose();
            }
        });
    }

    // 사용자 정의 생성자 함수 정의
    function RootBox(boxElement){
        var _this = this;
        var boxEl = $(boxElement);
        var target = $(boxEl).find(".title a");
        var cont = $(boxEl).find(".cont");

        // _groupParent = $(boxEl).parent();

        target.on("click", anchorClickEvent);

        function anchorClickEvent() {

            if (cont.is(':hidden')) {
                _this.open();
            } else {
                _this.close();
            }
        }

        _this.siblingsClose = function () {
            cont.css('display','none');
        }

        _this.open = function() {
            cont.slideDown();
        }
        _this.close = function() {
            cont.slideUp();
        }
    }
});

$(function($) {
    $("body").css("display", "none");
    $("body").fadeIn(1000);
});

function go_logout() {
	$.ajax({
		url : 'logout_log',
		success: function() {
			location='index';
		}, error: function(req, text) {
			alert( txt + ": " + req.status);
		}
	});
}

</script>
</head>
<body>
<video autoplay muted loop id="myVideo">
      <source src="img/main.mp4" type="video/mp4">
</video>
	<div class="out">
		<div class="content">
			
		<div id ="floater">
			<a onclick="location='index'"><img src="img/temporary.png" alt="로고" /></a>
		</div>
			
			<div id="content">
					<a id="weather" onclick="location='weather.ho'">What should I wear Today?</a> <br/><br/>
					<a id="daliy" onclick="location='index'">DailyLook</a> <br/><br/>
					<a href="list.se">UsedMarket</a><br/><br/>	
					<div class="group">		
							
						<div class="box">
							<div class="title"><a href="#">Service Center</a></div>	
							<div class="cont"><a onclick="location='index'">Notice</a></div>
							<div class="cont"><a onclick="location='index'">Frequently Asked Question</a></div>
							<div class="cont" id="size"><a onclick="location='index'">Questions and Answer</a></div>
						</div>
		 		
						<div class="box">
							<div class="title"><a href="#">Community</a></div>	
							<div class="cont"><a onclick="location='index'">Free Board</a></div>
							<div class="cont"><a onclick="location='index'">Reviews</a></div>			
							<div class="cont"><a onclick="location='index'">Find a store</a></div>
						</div><br/>
												
				</div>
				</br> 
				<c:if test="${ !empty info_login}">
					<div class="user_info">${info_login.userid} [${info_login.writer}]</div><br/>
					<a class="btn" onclick="go_logout()">Logout</a>
				</c:if>
				<c:if test="${ empty info_login}">
					<a onclick="location='login.ho'">Login</a>	
				</c:if>	
			</div>
		</div>
	</div>
</body>
</html>