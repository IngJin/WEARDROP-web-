<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잉러리</title>
<link rel="stylesheet" type="text/css" href="css/common.css"><!-- css설정 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 설정 -->
<script src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<style type="text/css">
body {
    text-align: center;
}

#wrap #menu {
    position: fixed;
    top: 0;
    left: 0;
    width: 175px;
    height: 100%;
    background-color: #fff;
}

#wrap #contents {
   margin-left:175px;
   height:100%
}

#wrap #contents .format6 .freshsnapsWrap {
    background-color: #0000ff;
}

#wrap #contents .format6 {
    width: 100%;
    height: 100%;
    clear: both;
    *zoom: 1;
    background-color: #edff00;
}

#wrap #contents .format6:before, #wrap #contents .format6:after {
    display: table;
    content: "";
    line-height: 0;
}

#wrap #contents .format6:after {
    clear: both;
}

#wrap #contents .format6 .item {
    float: left;
    width: 16.6666%;
    height: 33.3333%;
    overflow: hidden;
    background-color: #edff00;
}

#wrap #contents .format6 .item a {
    width: 100.5%;
    height: 100.5%;
    position: relative;
    display: table;
    vertical-align: middle;
    overflow: hidden;
}

a {
    text-decoration: none;
}

a {
    cursor: pointer;
    _cursor: hand;
    outline: none;
}

#wrap #contents .format6 .item a .photo {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    vertical-align: middle; /* 따로추가 */
    -webkit-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    -moz-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    -o-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
}

.photo {
    background-position: 50% 50%;
    background-repeat: no-repeat;
    background-size: cover;
}

#wrap #contents .format6 .item a .name {
    position: relative;
    display: table-cell;
    vertical-align: middle;
    text-align: center;
    font-size: 14px;
    color: #fff;
    line-height: 1.231;
    display: none;
}

#wrap #contents .format6 .item a .name .txt {
    position: absolute;
    background-color: #000;
    padding: 0 4px;
    z-index: 2;
}

#wrap #contents .format6.freshsnapsWrap .item a:after {
    background-color: #000000;
}

#wrap #contents .format6 .item a:hover:after {
    height: 5%;
}

#wrap #contents .format6 .item a:after {
    display: block;
    background-color: #edff00;
    width: 100%;
    height: 0;
    position: absolute;
    bottom: 0;
    left: 0;
    z-index: 2;
    content: "";
    -webkit-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    -moz-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    -o-transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
    transition: all 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
}

.jb-wrap {
	width: 50%;
	margin: 10px auto;
	border: 1px solid #000000;
	position: relative;
}


.txt:hover {
	font-weight:bold;
	color:white;
	padding: 5px 10px;
	background-color: black;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
}
</style>
<script type="text/javascript">
window.addEventListener('load', init);
function init() {
	var effectList = [];
	var elementList = document.querySelectorAll('.my-effect');

	for (var i = 0; i < elementList.length; i++) {

		var element = elementList[i];
		element.dataset.index = i;

		effectList[i] = new ShuffleText(element);

		element.addEventListener('mouseenter', function() {
			effectList[+this.dataset.index].start();
		});

		element.addEventListener('mouseleave', function() {
			effectList[+this.dataset.index].start();
		});

		effectList[i].start();
	}
}
</script>
</head>
<body>
<div id="wrap">
      <div id="menu">
      	<a class="btn-fill" style="font-size: 12px; line-height: 1.9; letter-spacing: 1px;" onclick="location.href='new.gal'">글쓰기</a>
      </div>
      <div id="contents">
      	<div class="format6 freshsnapsWrap">
   		<!-- ::before -->
   		<c:forEach items="${list }" var="vo">
   			<div class="item">
      			<div class="cutSnap">
         			<span class="photo">
         			<a onclick="href='detail.gal?id=${vo.id}'">
						<img src="img/fefe.png" alt="사진이었던것" style="width:100%;">
					</span>
					<span class="name">
   						<span class="txt my-effect">${vo.title}</span>
					</span>
					</a>
   			<!-- ::after -->
			 	</div>
   			</div>
   		</c:forEach>
		</div>
	</div>
</div>
	<%-- <!--리스트-->
	<div id="columns">
	<c:forEach items="${list }" var="vo">
	<figure>
		<div class="jb-wrap">
			<div class="jb-image">
				<a onclick="location.href='detail.gal?id=${vo.id}'">
				<img src="https://scontent-frx5-1.cdninstagram.com/vp/08a5d6ea0ecf9394c21c7fedae626342/5D951A31/t51.2885-15/e35/c0.62.500.500/62261384_328731851355180_8376990070111668302_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com">
				</a>
			</div>
			<div id="jb-text">
				<span class="my-effect">${vo.title}</span>
				<span class="my-effect">${vo.content}</span>
			</div>
		</div>
	</figure>
	</c:forEach>
	</div> --%>
</body>
</html>