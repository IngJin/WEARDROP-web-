<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	text-align: center;
}
</style>
</head>
<body>
<h3>신규공지글</h3>
<!-- 
파일첨부
1. from 태그의 method는 반드시 post로 지정한다.
2. enctype 속성을 지정한다. multipart/form-data
 -->
<form action="insert.no" method="post" enctype="multipart/form-data">
<table border="1">
<tr>
	<th style="width:20%">제목</th>
	<td><input type="text" class="need" title="제목" name="title" style="width: 98.5%"/></td>
</tr>
<tr>
	<th>작성자</th>
	<td class="left">${login_info.name }</td>
</tr> 
<tr>
	<th>내용</th>
	<td><textarea class="need" title="내용" style="width: 99%; height: 200px" name="content"></textarea>
	</td>
</tr>

</table><br>
<a class="btn-fill" onclick="if( necessary() ){$('form').submit()}">저장</a>
<a class="btn-empty" onclick="location='list.no'">취소</a>
</form>

<script type="text/javascript">

//파일명

//입력 alert 창

</script>
</body>
</html>