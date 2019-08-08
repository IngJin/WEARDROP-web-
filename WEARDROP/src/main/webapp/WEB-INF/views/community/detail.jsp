<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>		<!--jquery 선언-->
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	$('#file-download').on('click', function(){
		location='download.com?id=${vo.id}';
	});
});
</script>
</head>
<body>
	<h3>게시글 상세화면</h3>
	<table>
		<tr>
			<th style="width : 120px;">제목</th>
			<td>${vo.title }</td>
			<th >조회수</th>
			<td >${vo.readcnt }</td>
			<th >추천수</th>
			<td >${vo.likecnt }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.writer }</td>
			<th colspan="3" style="width:15%">작성일자</th>
			<td style="width:15%">${vo.writedate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5" >${fn: replace(vo.content, crlf, '<br>')}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="5">${vo.filename }
			<!--첨부파일 있는 경우에만 다운로드 이미지 나타내기-->
			${empty vo.filename ? '' : '<img id="file-download" src = "img/download.png" class="file-img"/>'}
			</td>
		</tr>
	</table><br>
	<a class="btn-fill" onclick="$('#detail').submit()">목록으로</a>
	<a class="btn-fill" onclick="location='modify.com?id=${vo.id }'">수정</a>
	<a class="btn-fill" onclick="if(confirm('정말 삭제하시겠습니까?')){location='delete.com?id=${vo.id}' }">삭제</a>
	<a class="btn-fill" >좋아요</a>
	
	<form id="detail" method="post" action="list.com">
	<input type="hidden" name="curPage" value="${page.curPage }">
	<input type="hidden" name="search" value="${page.search }">
	<input type="hidden" name="keyword" value="${page.keyword }">
	</form>
</body>
</html>