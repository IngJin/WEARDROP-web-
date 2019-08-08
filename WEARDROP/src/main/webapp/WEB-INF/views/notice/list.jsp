<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#list-top{
	width: 80%; padding-left: 9.8%; padding-bottom: 20px;
	}

</style>
</head>
<body>
<h3>공지글목록</h3>
<form method="post" action="list.no" id="list">
<p id="list-top">
	<span style="float:left;">
		<select name="search" style="height:20px; width:92px;">
			<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
			<option value="title"  ${page.search eq 'title' ? 'selected' : '' }>제목</option>
			<option value="content"  ${page.search eq 'content' ? 'selected' : '' }>내용</option>
			<option value="writer"  ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
		</select>
		<input type="text" name="keyword" style="vertical-align:middle; width:350px;" value="${page.keyword }"/>
		<a class="btn-fill" onclick="$('form').submit()">검색</a>
	</span>
<c:if test="${login_info.admin eq 'Y' }">
<a class="btn-fill"  onclick="location='new.no'" style="float:right;">글쓰기</a>
</c:if>
</p>
<input type="hidden" name="curPage"/>
</form>
<!-- 관리자로 로그인한 경우만 글쓰기 가능 -->
<table>
	<tr>
		<th style="width:70px;">번호</th>
		<th>제목</th>
		<th style="width:100px;">작성자</th> 
		
		
	</tr>
<c:forEach items="${page.list }" var="vo">
	<tr>
		<td>${vo.no }</td>
		<td class="left">
		<c:forEach var="i" begin="1" end="${vo.indent }" >
		
		</c:forEach>
		<a onclick="location='detail.no?id=${vo.id}&read=1'">${vo.title }</a></td>
		<td>${vo.name }</td>
	</tr>
	
</c:forEach>
</table>
<jsp:include page="/WEB-INF/views/include/page.jsp"/>

<script type="text/javascript">
function go_page(no) {
	$('input[name=curPage]').val(no);
	$('#list').submit();
}
</script>

</body>
</html>