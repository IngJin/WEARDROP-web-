<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<!-- jQuery 설정 -->
<script src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="js/common.js"></script>


<style type="text/css">
/* body {
	position: fixed;
	right: 0; bottom : 0;
	text-align: center;
	z-index: 1;
	background-color: rgba(0, 0, 0, 0.4);
	bottom: 0;
} */
.header .gnbIn {
margin-left : -50px;
}
#wraps {
	width: 100%;
	height: 100%;
}

div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset,
	input, textarea, p, table, img, section, header, footer, article,
	object, svg {
	position: relative;
	backface-visibility: hidden;
	outline: none;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form,
	fieldset, input, textarea, p, blockquote, th, td {
	margin: 0;
	padding: 0;
}

div {
	display: block;
}

body {
	position: relative;
	outline: none;
	color: #000;
	background: rgba(0, 0, 0, 0);
	text-align: left;
	line-height: 1.231;
	-webkit-text-size-adjust: none;
	letter-spacing: 2px;
	overflow: hidden;
}

#wraps #menu {
	position: fixed;
	top: 0;
	left: 0;
	width: 175px;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
}

#wraps #menu h1 {
	position: absolute;
	top: 50%;
	left: 0;
	margin-top: -37px;
	width: 175px;
}

#wraps #menu h1 a, #wraps #menu h1 img {
	position: relative;
	width: 174px;
}

/* #wrap #menu .insertBtn{
	color:#ffffff;
	width: 100px;
	display: block;
	position: absolute;
	bottom: 100px;
	left: 100px;
}

#wrap #menu .cancleBtn{
	color:#ffffff;
	width: 100px;
	display: block;
	position: absolute;
	bottom: 50px;
	left: 100px;
} */

a {
    text-decoration: none;
}

a {
    cursor: pointer;
    _cursor: hand;
    outline: none;
}

#wraps #contents {
	margin-left: 200px;
	height: 100%;
}

#wraps #contents .inputTable{
	
	position: absolute;
	width: 50%;
	height: 50%;
}

#wraps #contents .inputArea {
    width: 50%;
    height: 100%;
    position: relative;
}

table {
	margin: 0 auto;
	/* width: 80%;
	height: 80%; */
	border: 20px hidden;
	border-collapse: collapse;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
}

table th, table td {
	border: 20px hidden;
	padding: 5px 10px; /*위아래 5px / 좌우10px*/
	background-color: rgba(255, 255, 255, 0.8);
	color: #000000;
	font-weight: bold;
}

table td:hover {
	background-color: rgba(242, 242, 242, 0.8);
}

#myVideo {
	position: fixed;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
	z-index: -1000;
}
</style>


</head>
<body>
<form action="insert.gal" method="post" enctype="multipart/form-data">
		
<div id="wraps">	
	<div id="menu">
		<h1>
			<a class="cutOut" href="list.gal"> 
				<img alt src="img/logo_gal_insert.png" style="visibility: visible;">
				<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
			</a>
		</h1>
		
		
	</div>
	
	<div id="contents">
		
		
		<table class="inputTable" border="1">
			
			<tr>
				<th class="inputArea" rowspan="5" style="width: 500px; height: 520px;"><img src="" /><input type="file" id="gdsImg" name="file" /></th>
				<th>상세정보</th>
			</tr>
			
			<tr>
				<td class="left"><input type="text" title="제목" placeholder="제목을 입력해주세요.." class="need" name="title" 
				style="width: 98.5%; height:20px; border:0px; background-color:#ffffff;" /></td>
			</tr>
			
			<tr>	
				<td class="left"><input type="text" title="작성자" placeholder="작성자를 입력해주세요.." class="need" name="writer" 
				style="width: 98.5%; height:20px; border:0px; background-color:#ffffff;" /></td>
			</tr>
			
			<tr>	
				<td class="left"><textarea title="내용" placeholder="내용을 입력해주세요.." class="need" 
				style="width: 99%; height:80%; line-height:200px; border:0px; background-color:#ffffff; margin: 0;" name="content"></textarea></td>
			</tr>
			
			<tr>
				<td>
				<span>
				<a class="insertBtn" onclick="if(necessary()){$('form').submit()}">저장</a>
				<a class="cancleBtn" onclick="location.href='list.gal'">취소</a> 
				</span>
				</td>
			</tr>
			
			
			
			
		</table><br> 
					
		<%-- 	<div class="inputArea">
			<img src="" />
			<label for="gdsImg">이미지</label> 
			<input type="file" id="gdsImg" name="file" />
				<%=request.getRealPath("/") %> --%>
			
			
			<script>
				$("#gdsImg").change(function() {
					if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".inputArea img").attr(
							"src", data.target.result).width(500);
					}
					reader.readAsDataURL(this.files[0]);
					}
				});
			</script>
		
		</div>
	</div>
	

</form>
	
	<video autoplay muted loop id="myVideo">
		<source src="img/insert_video.mp4" type="video/mp4">
	</video>
</body>
</html>