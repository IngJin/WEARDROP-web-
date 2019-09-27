<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="utf-8">
<title>하프미러 시스템</title>
<link rel="stylesheet" href="css/iot_style.css?v=<%= new Date().getTime() %>">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/todayweather.js"></script>
<script type="text/javascript" src="js/time.js?v=<%= new Date().getTime() %>" ></script>
</head>
<script type="text/javascript">
	setTimeout("location.reload()",10500);
</script>
<body>

<body onload="printClock()">
	<div style="float: right; position: fixed; right: 0; top: 5%;">
		<c:if test="${mirror.time == 1}">
			<div style="width:530px; line-height:10	0px; color:#fff; text-align:center; margin-bottom:20px; margin-top: 50px;" id="clock"></div>
		</c:if>
	</div>
	
	<c:if test="${mirror.weather == 1}"> <!-- 날씨체크를 쓰면-->
		<div style="float: right; position: fixed; right: 0; bottom: 50%;">
			<div class="weather"></div>
		</div>
		<div style="float: right; position: fixed; right: 0; bottom: 0;">
			<div id="display" style="color: #666;"></div>
		</div>
	</c:if>
	
	
</body>
</html>
