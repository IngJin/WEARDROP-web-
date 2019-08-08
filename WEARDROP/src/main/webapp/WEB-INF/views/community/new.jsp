<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
text-align: center;
}
</style>
</head>
<body>
	<h3>신규게시글</h3>
	<form action="insert.com" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>유형</th>
				<td><select style="width: 20%; height: 28px; float: left"
					id="code" name="code">
						<option>유형을 선택하세요</option>
						<option value=1>세일정보</option>
						<option value=2>자유글</option>
				</select></td>
			</tr>
			<tr>
				<th style="width: 20%">제목</th>
				<td><input type="text" class="need" title="제목" id="title"
					name="title" style="width: 98.5%" /></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td class="left"><input type="text" class="need" title="작성자"
					id="writer" name="writer" style="width: 98.5%" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea style="width: 99%; height: 200px" class="need"
						title="내용" id="content" name="content"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td class="left">
				
				<img src="img/delete.png" id="delete-file" class="file-img"/>
				<label id="file-name"></label>
				<label for="gdsImg">
					<img src="img/select.png" class="file-img"/>
					<input type="file" name="file" id="attach-file" class="gdsImg"/>
					<div id="select_img"><img src="" /></div>
				</label>
						
				</td>
			</tr>
		</table>
		<br> <a onclick="if(necessary()){$('form').submit()}">저장</a> <a
			onclick="location='list.com'">취소</a>
	</form>
	<!--첨부파일 다운로드 시 썸네일  -->
	<script type="text/javascript">
	$(".gdsImg").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$("#select_img img").attr("src", data.target.result)
								.width(500);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
	</script>
	
</body>
</html>