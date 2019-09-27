<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="fr">
<head>
	<title>Internal Server Error</title>
	<meta charset="UTF-8">

	<meta name="Author" content="tix02.be">
	<meta name="Copyright" content="tix02.be">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<link rel="stylesheet" type="text/css" href="resources/css/errers.css">
	
	
	<!--[if LTE IE 8]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]--> 
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	
				
	<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	ga('create', 'UA-630776-1', 'tix02.be');
	ga('send', 'pageview');
	</script>
	<style type="text/css">
	.container{
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  background-color: #FFFFFF;
}
</style>
</head>
<body class="error-404 fr">
	<div id="contents-holder">
		<div id="contents">
		<a id="sign_in_logo" onclick="location='index'" style="cursor: pointer;"><img alt="엑박띠" src="img/icon/content_logo.png" style="width: 300px;"></a>
			<div id="errornum">
				<span id="error-h">5</span><span class="error-sep">:</span><span id="error-m">00</span><span class="error-sep">:</span><span id="error-s">00</span>
			</div>
			
			<h2 id="title">Internal Server Error</h2>
			<p id="body">서버에 오류가 발생하였습니다.<br>불편을 드려서 죄송합니다.</p>	
			
			<div id="back-to-index">
				<p><a href="/weardrop" rel="homepage">메인으로</a></p>
			</div>
		</div>
	</div>
	
	
	<div id="backgrounds">
		<div id="sky1p" class="layer" data-depth="0.80"></div>
		<div id="sky2p" class="layer" data-depth="0.40"></div>
		<div id="sky3p" class="layer" data-depth="0.20"></div>
	</div>

	<script src="resources/js/errors.js"></script>
	
	<script type="text/javascript" 	src="js/fish.js"></script>
	
	<div id="jsi-flying-fish-container" class="container" style="position: fixed; left: 0; top: 0; z-index: 100;">
	
	</div>
</body>
</html>

