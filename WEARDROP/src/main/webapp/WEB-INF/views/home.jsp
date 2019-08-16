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
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Orbitron&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/common.js"></script>

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
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	float: left;
}

#floater {
	width: 100%;
	height: 25%;
	margin-top: 80px;
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

.display {
	height:100%;
	width: 822px;
	float: left;
	margin-left: 1097px;
	background-size: cover;
}
.temp {
	font-size: 110px;
	color: #ffffff;
	margin-top: 80px;
	font-family: 'Black Han Sans', sans-serif;	
}
.wet {
	font-size: 30px;
	color: #ffffff;
	margin-top: 10px;
	font-family: 'Orbitron', sans-serif;	
}

.cityname {
	font-size: 45px;
	color: #ffffff;
	margin-top: 10px;
}

.tocody {
	font-size: 23px;
	color: #ffffff;
	margin-top: 500px;
	margin-bottom: 10px;
	font-family: 'Gugi', cursive;	
}
.tocodys {
	font-size: 23px;
	color: #ffffff;
	font-family: 'Gugi', cursive;	
}

.we_img {
	width: 130px;
	height: 130px; 
	margin-top: 140px;
	margin-left: 140px; 
	margin-right: -150px;
	background-size: 130px 130px;
	float: left;	
}

</style>
<script type="text/javascript">
function weather() {
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
								$("#display").empty();
								var html = ""											
								html += "<div class='temp'>" + (resp.main.temp - 273.15) + "˚</div>";
								html +=   "<div class='wet'>" + resp.weather[0].main + " / " + resp.name + "</div>";
								if((resp.main.temp - 273.15) >= 27) {
									html += "<div class='tocody'>Today is Cody</div><div class='tocodys'>나시티, 반바지, 민소매, 원피스</div>"	
								} else if((resp.main.temp - 273.15) >= 23) {
									html += "<div class='tocody'>Today is Cody</div><div class='tocodys'>반팔, 얇은 셔츠, 얇은 긴팔, 반바지, 면바지</div>"									
								} else if ((resp.main.temp - 273.15) >= 20) {
									html += "<div class='tocody'>Today is Cody</div><div class='tocodys'>긴팔티, 가디건, 후드티, 면바지, 슬렉스, 스키니</div>"	
								} else if ((resp.main.temp - 273.15) >= 17) {
									html += "<div class='tocody'>Today is Cody</div><div class='tocodys'>니트, 가디건, 후드티, 맨투맨, 청바지, 면바지, 슬랙스, 원피스</div>"										
								} else if ((resp.main.temp - 273.15) >= 12) {
									html += "<div class='tocody'>Today is Cody</div><div class='tocodys'>자켓, 셔츠, 가디건, 간절기 야상, 살색스타킹</div>"	
								} else if ((resp.main.temp - 273.15) >= 10) {
									html += "<div class='tocody'>Today is Cody</div><div class='tocodys'>트렌치코트, 간절기 야상, 여러겹 껴입기</div>"	
								} else if ((resp.main.temp - 273.15) >= 6) {
									html += "<div class='tocody'>Today is Cody</div><div class='tocodys'>코트, 가죽자켓</div>"	
								} else {
									html += "<div class='tocody'>Today is Cody</div><div class='tocodys'>겨울 옷(야상, 패딩, 목도리 등등 다)</div>"										
								}
								$("#display").append(html);
							}
						})
					}
				});
			}
		});
}

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
									$("#myVideo").attr("src", "video/daliy.mp4");
									$("#myVideo").fadeIn(1000);								
									}, function(){
										$("#myVideo").attr("src", "video/main.mp4"); 
										$("#myVideo").fadeIn(1000);
									});
																									
								if((resp.weather[0].main).toString() == "Rain" || (resp.weather[0].main).toString() == "Drizzle" || (resp.weather[0].main).toString() == "Thunderstorm") {
									$('#weather').hover(function() {
										$("#myVideo").css("display", "none");
										$("#myVideo").attr("src", "video/rain2.mp4");
										$("#myVideo").fadeIn(1000); 
										$(".we_img").css("background-image", 'url("img/we_rain.png")');
										weather();
										if((resp.main.temp - 273.15) > 18) { 
											$(".display").css('background-image', 'url("img/weather_hot.jpg")');
										} else {
											$(".display").css('background-image', 'url("img/weather_cold.jpg")');
										}
										}, function(){
											$("#myVideo").css("display", "none");
											$("#myVideo").attr("src", "video/main.mp4"); 
											$("#myVideo").fadeIn(1000);
											$("#display").empty();
											$(".display").css('background-image', '');
										});
								} else if((resp.weather[0].main).toString() == "Snow") {
									$('#weather').hover(function() {
										$("#myVideo").css("display", "none");
										$("#myVideo").attr("src", "video/show.mp4");
										$("#myVideo").fadeIn(1000); 
										$(".we_img").css("background-image", 'url("img/we_show.png")');
										weather();
										if((resp.main.temp - 273.15) > 18) {
											$(".display").css('background-image', 'url("img/weather_hot.jpg")');
										} else {
											$(".display").css('background-image', 'url("img/weather_cold.jpg")');
										}
										}, function(){
											$("#myVideo").css("display", "none");
											$("#myVideo").attr("src", "video/main.mp4");
											$("#myVideo").fadeIn(1000);
											$("#display").empty();
											$(".display").css('background-image', '');
											$(".we_img").css("background-image",'');
										});
								} else if((resp.weather[0].main).toString() == "Clear") {
									$('#weather').hover(function() {
										$("#myVideo").css("display", "none");
										$("#myVideo").attr("src", "video/clear.mp4");
										$("#myVideo").fadeIn(1000); 
										$(".we_img").css("background-image", 'url("img/we_sun.png")');
										weather();
										if((resp.main.temp - 273.15) > 18) {
											$(".display").css('background-image', 'url("img/weather_hot.jpg")');
										} else {
											$(".display").css('background-image', 'url("img/weather_cold.jpg")');
										}
										}, function(){
											$("#myVideo").css("display", "none");
											$("#myVideo").attr("src", "video/main.mp4");
											$("#myVideo").fadeIn(1000);
											$("#display").empty();
											$(".display").css('background-image', '');
											$(".we_img").css("background-image",'');
										});
								} else if((resp.weather[0].main).toString() == "Clouds") {
									$('#weather').hover(function() {
										$("#myVideo").css("display", "none");
										$("#myVideo").attr("src", "video/cloud.mp4");
										$("#myVideo").fadeIn(1000); 
										$(".we_img").css("background-image", 'url("img/we_cloud.png")');
										weather(); 
										if((resp.main.temp - 273.15) > 18) {
											$(".display").css('background-image', 'url("img/weather_hot.jpg")');
										} else {
											$(".display").css('background-image', 'url("img/weather_cold.jpg")');
										}
										}, function(){
											$("#myVideo").css("display", "none");
											$("#myVideo").attr("src", "video/main.mp4"); 
											$("#myVideo").fadeIn(1000);
											$("#display").empty(); 
											$(".display").css('background-image', '');
											$(".we_img").css("background-image",'');
										});
								} else {
									$('#weather').hover(function() {
										$("#myVideo").css("display", "none");
										$("#myVideo").attr("src", "video/mist.mp4");
										$("#myVideo").fadeIn(1000); 
										$(".we_img").css("background-image", 'url("img/we_mist.png")'); 
										weather();
										if((resp.main.temp - 273.15) > 18) {
											$(".display").css('background-image', 'url("img/weather_hot.jpg")');
										} else {
											$(".display").css('background-image', 'url("img/weather_cold.jpg")');
										}
										}, function(){
											$("#myVideo").css("display", "none");
											$("#myVideo").attr("src", "video/main.mp4");
											$("#myVideo").fadeIn(1000);
											$("#display").empty();
											$(".display").css('background-image', '');
											$(".we_img").css("background-image",'');
										});
								}
								
							}
						})
					}
				});
			}
		});
		
</script>
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
      <source src="video/main.mp4" type="video/mp4">
</video>
	<div class="out">
		<div class="content">
			
		<div id ="floater">
			<a onclick="location='index'"><img src="img/logo.png" alt="로고" style=" width: 280px; height: auto"/></a>
		</div>
			
			<div id="content">
					<a id="weather">What should I wear Today?</a> <br/><br/>
					<a id="daliy" href="list.gal">DailyLook</a> <br/><br/>
					<a href="list.se">UsedMarket</a><br/><br/>	
					<div class="group">		
							
						<div class="box">
							<div class="title"><a href="#">Service Center</a></div>	
							<div class="cont"><a href="list.no">Notice</a></div>
							<div class="cont" id="size"><a href="list.ct">Questions and Answer</a></div>
						</div>
		 		
						<div class="box">
							<div class="title"><a href="#">Community</a></div>	
							<div class="cont"><a href="list.com">Free Board</a></div>
							<div class="cont"><a href="list.hu">Reviews</a></div>			
							<div class="cont"><a href="map.com">Find a store</a></div>
						</div><br/>
												
				</div>
				</br> 
				<c:if test="${ !empty info_login}">
					<div class="user_info">${info_login.userid} [${info_login.writer}]</div><br/>
					<a class="btn" onclick="go_logout()">Logout</a>
				</c:if>
				<c:if test="${ empty info_login}">
					<a class="btn" onclick="location='login.ho'">Login</a>	
				</c:if>	
			</div>
		</div>
	</div>
	<div class="display">		
	<div class='we_img'></div>
		<div id="display"></div> <br/>
		<div class="weather"></div>
	</div>
</body>
</html>