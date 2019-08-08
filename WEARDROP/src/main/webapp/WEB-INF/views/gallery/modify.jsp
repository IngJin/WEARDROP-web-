<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 수정</title>
<style type="text/css">
body {
    text-align: center;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<!-- jQuery 설정 -->
</head>
<body>
	<form action="update.gal" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${vo.id }">
		<table border="1">
			<tr>
				<th style="width: 20%">제목</th>
				<td class="left"><input value="${vo.title }" type="text"
					title="제목" class="need" name="title" style="width: 98.5%" /></td>
			</tr>

			<tr>
				<th>작성자</th>
				<td class="left">${vo.writer }</td>
			</tr>

			<tr>
				<th>내용</th>
				<td class="left"><textarea title="내용" class="need"
						style="width: 99%; height: 200px" name="content">${vo.content }</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td class="left"><img onclick="$('#attach').val('y')"
					src="img/delete.png" id="delete-file" class="file-img" /> 
					<label id="file-name">${vo.filename }</label>
				<!--첨부된 파일의 이름  --> 
				
				<label for="gdsImg"> 
				<img src="img/select.png" class="file-img" /> 
				<input type="file" name="file" id="attach-file" class="gdsImg" />
						<div id="select_img">
							<img src="" />
						</div>
				</label></td>
			</tr>
		</table>
		<br> <input type="hidden" name="attach" id="attach" /> <a
			class="btn-fill" onclick="if(necessary()){$('form').submit()}">저장</a>
		<a class="btn-fill" onclick="location.href='detail.gal?id=${vo.id}'">취소</a>
	</form>
	<script type="text/javascript">
		$(function() {
			if ('${ !empty vo.filename}' == 'true') {
				$('#delete-file').css('display', 'inline-block');
				$('#file-name').css('padding-right', '15px');
			}
		});

		$(function() {
			$('#attach-file').on('change', function() {
				$('#file-name').html(this.files[0].name);
				$('#file-name').css('padding-right', '15px');
				$('#delete-file').css('display', 'inline-block');
				$('#select_img').css('display', 'block');
			});
			$('#delete-file').on('click', function() {
				$('#attach-file').val('');
				$('#file-name').html('');
				$('#file-name').css('padding-right', '0px');
				$('#delete-file').css('display', 'none');
				$('#select_img').css('display', 'none');
			});
		});//function()

		function necessary() {
			var need = true;
			$('.need').each(function() {
				if ($(this).val() == '') {
					alert($(this).attr('title') + '을 입력하세요!'); /* title을 입력하세요 */
					$(this).focus(); /* 빈칸 커서 이동*/
					need = false;
					return need;
				}
			});
			return need;
		}//necessary()

		$(".gdsImg")
				.change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$("#select_img img").attr("src",
											data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
	</script>
</body>
</html>