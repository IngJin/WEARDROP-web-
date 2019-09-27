<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table id="table" style="width: 100%;">
	<c:choose>
	<c:when test="${fn:length(page.list) > 0}">
	<tr>
		<th style="width:10%">번호</th>
		<th style="width:35%">제목</th>
		<th style="width:15%">작성자</th>
		<th style="width:20%">작성일</th>
		<th style="width:10%">조회수</th>
	</tr>
	<c:forEach items="${page.list }" var="vo">
		
			<tr>
				<td style="text-align: center;">${vo.no }</td>

				<c:if test="${ !empty info_login}">
				<td>
						<a onclick="location='detail.se?id=${vo.id}&code=${vo.code}&read=1'">
							<!--첨부파일 있는 경우에만 다운로드 이미지 나타내기-->
							<span class="ing_td">${vo.title }&nbsp;
							${empty vo.filename ? '' : '<img src="img/icon/gal_image.png" class="gal_icon" style="margin-left:3px;"/>' }
						</span> 
						</a>
				</td>
				</c:if>

				<c:if test="${ empty info_login}">
				<td>
						<a onclick="if(confirm('로그인 후 열람이 가능합니다!')){location='login.ho' }" >
							<span class="ing_td"><font style="font-size: 0.8em; color: #aeaeae;">[회원 열람 가능]</font>&nbsp;${vo.title }&nbsp;<font style="color: skyblue; font-weight: bold"></font>
							${empty vo.filename ? '' : '<img src="img/icon/gal_image.png" class="gal_icon" style="margin-left:3px;"/>' }
						</a>
				</td>
				</c:if> 
				
				<td>
					<span>
						<img class="gal_icon" src="img/icon/gal_user_icon.png"/>
						<font style="margin-left: 5px;">${vo.writer }</font>
					</span>
				</td>
				
				<td style="text-align: center;">
					<font class="my-effect">${vo.writedate }</font>
				</td>
				
				<td style="text-align: center;">${vo.readcnt }</td>
			</tr>
	</c:forEach>
	</c:when>
	
	<c:otherwise>
		<div>
		<img src="img/bg/crycry.gif" alt="사진이었던것" style="width: 100%; z-index: -99;">
		<div class="aside_block aside_box" style="float: right; z-index: 50; position:absolute; top:35%; left: 63%;" >
					<h2>DATA NOT FOUND!</h2>
					<p>
					<font style="font-size: 1.5em;">Oops!</font> Search results not found :)</br>
					You might have entered a keyword that does not have data or is invalid..!</br>
					you can go <a href="list.se" style="text-decoration: underline;">Back to the list</a> 
					and Please enter another keyword!
					</p>
					<p>
					<span>
					<a href="list.se">← 목록으로 돌아가기</a>
					</span>
					</p> 
					<!-- 
					<p>
					<span class="right">
					<img class="gal_icon" src="img/icon/paintbrush_icon.png" style="margin-right:5px;"/>
					Design by Ingjin
					</span>
					</p> 
					-->
				</div>
		</div>
	</c:otherwise>
	</c:choose>
</table>
<jsp:include page="/WEB-INF/views/include/page.jsp" />