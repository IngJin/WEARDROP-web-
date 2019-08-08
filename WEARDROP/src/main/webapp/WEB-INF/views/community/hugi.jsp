<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
text-align: center;
}
#columns {
   colum-count:3;
   /* column-width: 250px;
   column-gap: 15px; */
}

#columns figure {
   display: inline-block;
   border: 1px solid rgba(0, 0, 0, 0.2);
   margin: 0;
   margin-bottom: 15px;
   padding: 10px;
   box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

#columns figure img {
   width: 400px;
   height: 400px;
}

#columns figure figcaption {
   border-top: 1px solid rgba(0, 0, 0, 0.2);
   padding: 10px;
   margin-top: 11px;
}
</style>
</head>
<body>
	<h3>후기게시판</h3>
	
		<span class="search" style="margin-right: 130px;"> 
		<select name="search" style="height: 28px; width: 92px;">
				<option value="all"}>전체</option>
				<option value="title"}>제목</option>
				<option value="content"}>내용</option>
				<option value="writer"}>작성자</option>
		</select> 
		<input type="text" name="keyword" style="width: 350px;" /> 
		<a class="btn-fill" >검색</a>
		</span>
		
	 <div id="columns">
        
         <figure>
            <img src="https://pbs.twimg.com/media/C-C9DppVwAAm-9e.jpg"/>
            <figcaption>
            	<span>제목</span>
            	<p>내용</p>
            	<div>
            		<span>작성자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<span>작성일자</span>
            	</div>
            </figcaption>
         </figure>
         
         
          <figure>
           <img src="https://pbs.twimg.com/media/C-C9DppVwAAm-9e.jpg"/>
            <figcaption>
           		<span>제목</span>
            	<p>내용</p>
            	<div>
            		<span>작성자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<span>작성일자</span>
            	</div>
            </figcaption>
         </figure>
         
          <figure>
            <img src="https://pbs.twimg.com/media/C-C9DppVwAAm-9e.jpg"/>
            <figcaption>
            	<span>제목</span>
            	<p>내용</p>
            	<div>
            		<span>작성자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<span>작성일자</span>
            	</div>
            </figcaption>
         </figure>
   </div>
	<a class="btn-fill">글쓰기</a>
		
	
</body>
</html>