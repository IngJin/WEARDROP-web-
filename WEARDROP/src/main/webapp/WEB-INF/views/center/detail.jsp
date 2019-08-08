<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	text-align: center;
}	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3>자주묻는 질문</h3>
<table style="margin: auto;">
	<tr>
		<th style="width:120px;">제목</th>
		<td colspan="5">${vo.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${vo.writer }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="5" class="left">${fn: replace(vo.content, crlf, '<br>') }</td>
	</tr>
	
</table><br>
<a class="btn-fill" onclick="$('#detail').submit()">목록으로</a>

<!-- 글을 작성한 관리자가 수정, 삭제 권한을 갖는다 -->
<c:if test="${login_info.admin eq 'Y' }">
<a class="btn-fill" onclick="location='modify.ct?id=${vo.id}'">수정</a>
<a class="btn-fill" onclick="if( confirm('정말 삭제하시겠습니까?')){location='delete.ct?id=${vo.id}'}">삭제</a>
</c:if>

<form id="detail" method="post" action="list.ct">
<input type="hidden" name="curPage" value="${page.curPage }"/>


</script>

</body>
</html>