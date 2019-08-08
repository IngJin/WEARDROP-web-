<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
<h3>자주묻는질문</h3>
<form action="update.ct" method="post" >
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
<a class="btn-empty" onclick="location='list.ct'">취소</a>
</form>

</body>

</html>