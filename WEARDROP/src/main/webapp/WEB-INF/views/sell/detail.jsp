<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	text-align: center;
}
#comment_regist div { float: left; width: 85%; }
</style>
</head>
<body>
<h3>중고장터 상세화면</h3>
<table>
<tr><th style="width: 120px;">제목</th>
	<td colspan="7" class="left">${vo.title}</td>
</tr>
<tr><th>작성자</th>
	<td>${vo.name}</td>
	<th style="width: 12%">작성일자</th>
	<td style="width: 12%">${vo.writedate}</td>
	<th style="width: 8%">가격</th>
	<td style="width: 10%">${vo.price}</td>
	<th style="width: 10%">조회수</th>
	<td style="width: 8%">${vo.readcnt}</td>

</tr>
<tr><th>내용</th>
	<td colspan="7" class="left">${fn: replace(vo.content, crlf, '<br>')}</td>
</tr>
<tr><th>첨부파일</th>
	<td colspan="7" class="left">${vo.filename}
		${ empty vo.filename ? '' :  '<img id="file-download" src="img/download.png" class="file-img"/>' }
	</td>
</tr>
</table><br>
<a class="btn-fill" onclick="javascript:history.back(-1)">목록으로</a>

<%-- <!-- 글을 작성한 로그인 사용자가 수정,삭제 권한을 갖는다 -->
<c:if test="${login_info.userid eq vo.userid}">

</c:if> --%>

<a class="btn-fill" onclick="location='modify.se?id=${vo.id}'">수정</a>
<a class="btn-fill" onclick="if( confirm('정말 삭제?') ){ location='delete.se?id=${vo.id}' }">삭제</a>

<form id="detail" method="post" action="list.se">
	<input type="hidden" name="curPage" value="${page.curPage}"/>
	<input type="hidden" name="search" value="${page.search}"/>
	<input type="hidden" name="keyword" value="${page.keyword}"/>
</form><br>

<script>

</script>
</body>
</html>