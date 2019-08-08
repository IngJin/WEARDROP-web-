<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css"><!-- css설정 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 설정 -->
<script src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<style type="text/css">
	body {
	    text-align: center;
	}
</style>
</head>
<body>
<h1>갤러리따리</h1>
<!-- 
파일첨부
1. 데이터 전송시 form 태그의 method는 반드시 post로 지정한다.
2. enctype 속성을 지정한다. multipart/form-data - 오타나면 전송 안됨 
3. 라이브러리 선언
-->
<form action="insert.gal" method="post" enctype="multipart/form-data">
<table border="1">
<tr>
	<th style="width:20%">제목</th>
	<td class="left"><input type="text" title="제목" class="need" name="title" style="width: 98.5%"/></td>
</tr>

<tr>
	<th>작성자</th>
	<td class="left"><input type="text" title="작성자" class="need" name="writer" style="width: 98.5%"/></td>
</tr>

<tr>
	<th>내용</th>
	<td class="left"><textarea title="내용" class="need" style="width: 99%; height:200px" name="content"></textarea></td>
</tr>
<tr>
	
<div class="inputArea">
 <label for="gdsImg">이미지</label>
 <input type="file" id="gdsImg" name="file" />
 <%-- <%=request.getRealPath("/") %> --%>
 <div class="select_img"><img src="" /></div>
 </div>

 <script>
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

</table><br>
<a class="btn-fill" onclick="if(necessary()){$('form').submit()}">저장</a>
<a class="btn-fill" onclick="location.href='list.gal'">취소</a>
</form>

</body>
</html>