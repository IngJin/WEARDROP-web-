<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="css/common.css?v=<%= new Date().getTime() %>">
<link rel="icon" type="image/x-icon" href="img/hanul.ico">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
								$("#display").empty();
								var html = ""
								html += "<table>";
								html += "<tr align=center class='list'><th colspan=9>[날씨정보]</th></tr>";
								html += "<tr><th>현재온도</th><th>현재습도</th><th>날씨</th><th>상세날씨</th><th>날씨이미지</th><th>바람</th><th>나라</th><th>도시이름</th><th>구름</th></tr>";
								html +=   "<td>" + (resp.main.temp - 273.15) + "</td>";
								html +=   "<td>" + resp.main.humidity + "</td>";
								html +=   "<td>" + resp.weather[0].main + "</td>";
								html +=   "<td>" + resp.weather[0].description + "</td>";
								html +=   "<td><img src='http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png'/></td>";
								html +=   "<td>" + resp.wind.speed + "</td>";
								html +=   "<td>" + resp.sys.country + "</td>";
								html +=   "<td>" + resp.name + "</td>";
								html +=   "<td>" + (resp.clouds.all) + "%" + "</td>";
								html += "</tr>";
								if((resp.main.temp - 273.15) >= 27) {
									html += "<tr align=center'><th colspan=9>오늘의 코디는 나시티, 반바지, 민소매, 원피스 입니다.</th></tr>"	
								} else if((resp.main.temp - 273.15) >= 23) {
									html += "<tr align=center'><th colspan=9>오늘의 코디는 반팔, 얇은 셔츠, 얇은 긴팔, 반바지, 면바지 입니다.</th></tr>"									
								} else if ((resp.main.temp - 273.15) >= 20) {
									html += "<tr align=center'><th colspan=9>오늘의 코디는 긴팔티, 가디건, 후드티, 면바지, 슬렉스, 스키니 입니다.</th></tr>"	
								} else if ((resp.main.temp - 273.15) >= 17) {
									html += "<tr align=center'><th colspan=9>오늘의 코디는 니트, 가디건, 후드티, 맨투맨, 청바지, 면바지, 슬랙스, 원피스 입니다.</th></tr>"										
								} else if ((resp.main.temp - 273.15) >= 12) {
									html += "<tr align=center'><th colspan=9>오늘의 코디는 자켓, 셔츠, 가디건, 간절기 야상, 살색스타킹 입니다.</th></tr>"	
								} else if ((resp.main.temp - 273.15) >= 10) {
									html += "<tr align=center'><th colspan=9>오늘의 코디는 트렌치코트, 간절기 야상, 여러겹 껴입기 입니다.</th></tr>"	
								} else if ((resp.main.temp - 273.15) >= 6) {
									html += "<tr align=center'><th colspan=9>오늘의 코디는 코트, 가죽자켓 입니다.</th></tr>"	
								} else {
									html += "<tr align=center'><th colspan=9>오늘의 코디는 겨울 옷(야상, 패딩, 목도리 등등 다) 입니다.</th></tr>"	
									
								}
								html += "</table>";
								$("#display").append(html);
							}
						})
					}
				});
			}
		});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="display" align="center">날씨정보를 출력중입니다. 잠시만 기다려주세요..</div> <br/>
	<div class="weather"></div>
</body>
</html>