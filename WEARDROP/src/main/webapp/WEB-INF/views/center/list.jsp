<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
$(document).ready(function(){
    $("#spreadBtn").click(function(){
        if($("#hiddenContent").is(":visible")){
            $("#hiddenContent").css("display", "none");
        }else{
            $("#hiddenContent").css("display", "block");
        }
    });
});

</script>

</script>
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
<h3>문의사항</h3>
<p id="list-top">
<form method="post" action="list.ct" id="list">
<c:if test="${login_info.admin eq 'Y' }">
<a class="btn-fill"  onclick="location='new.ct'" style="float:right;">글쓰기</a>
</c:if>
</p>
<input type="hidden" name="curPage"/>
</form>
<!-- 관리자로 로그인한 경우만 글쓰기 가능 -->
<table style="margin: auto;">
	<tr>
		<th style="width:70px;">번호</th>
		<th>제목</th>
		<th style="width:100px;">작성자</th>
		
	</tr>
<c:forEach items="${page.list }" var="vo">
	<tr>
		<td>${vo.no }</td>
		<td>
		<a onclick="location='detail.ct?id=${vo.id}&read=1'">
		 ${vo.title} 
		</td>
		<td>${vo.name }</td>
	
	</tr>
	
</c:forEach>

</table>
<jsp:include page="/WEB-INF/views/include/page.jsp"/>

<form method="post" action="list.kt" id="list">

<a href = "javascript:void(window.open('http://pf.kakao.com/_xfJgfT/chat', '_blank','width=500px, height=500px'))
"><img src="img/kakaotalk1.png"></a>

</form>
<script type="text/javascript">
function go_page(ct) {
	$('input[name=curPage]').val(ct);
	$('#list').submit();
}



</script>



</body>
</html>