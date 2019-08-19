<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/fullpage.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript" src="wow.min.js"></script>
<link rel="stylesheet" href="css/fullpage.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css">

</head>
<body>
<div id="fullpage">
	<div class="section wow bounceInUp">Some section</div>
	<div class="section wow bounceInUp">Some section</div>
	<div class="section wow bounceInUp">Some section</div>
	<div class="section wow bounceInUp">Some section</div>
</div>
<script>
new fullpage('#fullpage',{
	scrollBar: true,
	afterRender: function(){
          new WOW().init();
    }
});
</script>
</body>
</html>