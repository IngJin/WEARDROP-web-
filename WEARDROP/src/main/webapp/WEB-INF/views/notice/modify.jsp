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
<h3>공지글안내 수정</h3>
<form action="update.no" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="${vo.id }">
<table border="1">
<tr>
	<th style="width:20%">제목</th>
	<td><input value="${vo.title }" type="text" class="need" title="제목" name="title" style="width: 98.5%"/></td>
</tr>
<tr>
	<th>작성자</th>
	<td class="left">${vo.writer }</td>
</tr> 
<tr>
	<th>내용</th>
	<td><textarea class="need" title="내용" style="width: 99%; height: 200px" name="content">${vo.content }</textarea>
	</td>
</tr>

</table><br>
<input type="hidden" name="attach" id="attach"/>
<a class="btn-fill" onclick="if( necessary() ){$('form').submit()}">저장</a>
<a class="btn-empty" onclick="location='list.no'">취소</a>
</form>
<script type="text/javascript">


</body>

</html>