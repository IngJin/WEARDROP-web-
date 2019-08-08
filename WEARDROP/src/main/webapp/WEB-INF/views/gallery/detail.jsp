<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 설정 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body, html {
    width: 100%;
    height: 100%;
    font-weight: 300;
    text-align: center;
}

div {
    display: block;
}

#wrap #contents{
	margin-left: 175px;
	height: 100%;
}

#wrap #contents .leftside {
    width: 50%;
    height: 100%;
    position: absolute;
    top: 0;
}

#wrap #contents .leftpix {
    left: 0;
}

#wrap #contents .leftside .snapsPhoto {
    background-color: #0000ff;
}

#wrap #contents .leftside .item {
    width: 100%;
    height: 0;
    position: absolute;
    top: 0;
    left: 0;
}

#wrap #contents .leftside .snapsPhoto .item .img {
    background-color: #0000ff;
}

#wrap #contents .leftside .item .img {
	margin-left:175px;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
    display: block;
    background-color: #edff00;
}

#wrap #contents .leftside .item .img .photo {
    position: relative;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    display: block;
}

.photo {
    background-position: 50% 50%;
    background-repeat: no-repeat;
    background-size: cover;
}


/* 우측 */
#wrap #contents .ootdDetail {
    overflow: hidden;
}

#wrap #contents .rightside {
    width: 50%;
    height: 100%;
    position: absolute;
    top: 0;
    background-color: #fff;
}

#wrap #contents .rightpix {
    right: 0;
}


#wrap #contents .rightside .rs_body {
    padding: 20px 20px 10px 20px;
}

#wrap #contents .rightside .rs_body .rs_textarea {
    margin-bottom: 10px;
}

.rs_textarea p {
    font-size: 12px;
    line-height: 1.9;
    letter-spacing: 1px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){

	$(document).bind("contextmenu", function(e) {

		return false;

	});

});

$(document)[0].oncontextmenu = function() { return false; }

$(document).mousedown(function(e) {

	if( e.button == 2 ) {

			alert('사진 다운로드는 불가능합니다!');

			return false;

	} else {

			return true;

	}

});
</script>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
<div id="wrap">
<div id="contents">
	<div class="leftside leftpix snapsPhoto">
		 <div class="item" style="display: block; height: 100%;  top: 0px;">
		  	<span class="img">
		  		<img src="<c:url value='/'/>${vo.filepath}" style="width:100%; height:100%;">
		 		</span>
		</div>
	</div>
	
	<div class="rightside rightpix ootdDetail">
		<div class="rs_header">
			<span class="rs_name">${vo.writer }</span>
			<span>${vo.readcnt  }</span>
		</div>
		<div class="rs_body">
			<div class="rs_textarea">
				<p>
				제목: ${vo.title} <br>
				작성자: ${vo.writer } <br>
				내용: ${vo.content } <br>
				${resources}<br>
				${vo.filepath }
				</p>
			</div>
			<ul class="rs_linkArea">
				<li class="instagram">
			</ul>
		</div>
		<div class="nextprev">
			<span>Prev</span><span>Next</span>
			<a class="btn-fill" onclick="location.href='modify.gal?id=${vo.id}'">수정</a>
			<a class="btn-fill" onclick="if(confirm('정말 삭제를 하시겠습니까?')){location='delete.gal?id=${vo.id}' }">삭제</a>
		</div>
	</div>
</div>	
</div>

</body>
</html>