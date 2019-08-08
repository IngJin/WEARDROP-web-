<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	text-align: center;
}
	.file-img{
		cursor: pointer;
	}
</style>
</head>
<body>
<h3>공지글 안내</h3>
<table style="margin: auto;">
	<tr>
		<th style="width:120px;">제목</th>
		<td colspan="5">${vo.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${vo.name }</td>
		<th style="width: 15%">작성일자</th>
		<td style="width: 15%">${vo.writedate }</td>
		<th style="width: 12%">조회수</th>
		<td style="width: 8%">${vo.readcnt }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="5" class="left">${fn: replace(vo.content, crlf, '<br>') }</td>
	</tr>
	
</table><br>
<a class="btn-fill" onclick="$('#detail').submit()">목록으로</a>

<!-- 글을 작성한 관리자가 수정, 삭제 권한을 갖는다 -->
<c:if test="${login_info.admin eq 'Y' }">
<a class="btn-fill" onclick="location='modify.no?id=${vo.id}'">수정</a>
<a class="btn-fill" onclick="if( confirm('정말 삭제하시겠습니까?')){location='delete.no?id=${vo.id}'}">삭제</a>
</c:if>

<!-- 로그인한 경우만 답글작성 권한 있음 -->
<c:if test="${ !empty login_info }">
<a class="btn-fill" onclick="location='reply.no?id=${vo.id}'">답글작성</a>
</c:if>
<form id="detail" method="post" action="list.no">
<input type="hidden" name="curPage" value="${page.curPage }"/>
<input type="hidden" name="search" value="${page.search }"/>
<input type="hidden" name="keyword" value="${page.keyword }"/>
</form>

<script type="text/javascript">
$(function () {
	$('#file-download').on('click', function () {
		location='download.no?id=${vo.id}';	
	});
	
});
</script>

</body>
</html>