<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/shuffle-text/build/shuffle-text.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/MarcTooltips.css" media="all" />
<link type="text/css" rel="stylesheet" href="css/ingjin.css" />
<script type="text/javascript" src="js/MarcTooltips.js"></script>
<title>Flea market new</title>
</head>
<body>
<form action="insert.se" method="post" enctype="multipart/form-data">
<div id="weardrop_wrap">
	<!-- 메뉴 -->
	<div id="weardrop_menu">
		<h1>
			<a class="cutOut" href="list.se"> 
				<img src="img/logo_gal_list.png" style="visibility: visible;">
				<div class="bg" style="width: 0px; right: 18px; left: 0px;"></div>
			</a>
		</h1>
	</div>
	
	<!-- 본문 -->
	<div id="weardrop_contents">
   		<!-- 배경 -->
		<div class="modify_bg" style="position: absolute; background-color: rgba(0, 0, 0, 0.2); width: 100%; height: 160%; left: 0; top: 0; z-index: 10;"></div>
   		<header>
			<h1 style="color: #fff;">Used Market</h1>
		</header>
		
		<!-- 디자인 메인 -->
		<div id="ingjin_main">
			<!-- INFO -->
			<aside class="ingbox">
				<h2><img src='img/icon/info_icon.png' class="section_icon"/>INFO</h2>
				<!-- 소개란 -->
				<div class="aside_block">
					<h3>Used Market?</h3>
					<div class="item">
						<p>의류, 신발, 패션 잡화를 거래 할 수 있는<span class="right"></span></p>
					</div>
					<div class="item">
						<p>회원 간 중고 거래 게시판 입니다.<span class="right"></span></p>
					</div>
				</div>

				<!-- SNS 링크 -->
				<div class="aside_block">
					<h3>Follow Us</h3>
					<div class="ingstagram">
						<a href="https://www.instagram.com/weardrop" target="_blank">
							<img class="gal_icon" src="img/icon/icon_instagram.png" style="margin-right: 7px;"/> 
							<span class="my-effect">http://www.instagram.com/</span>
						</a>
					</div>
				</div>

				<div class="aside_block">
					<h3>
						<img class="gal_icon" src="img/icon/gal_list_icon.png" style="margin-right: 7px; margin-bottom: 4px; vertical-align: middle;" />
						<font onclick="href='list.com'" style="cursor: pointer;">Back to List</font>
					</h3>
				</div>

				<!-- aside_box -->
				<div class="aside_block aside_box">
					<h2>WEARDROP?</h2>
					<p>
					WEARDROP is a community media that creates fashion culture
					in Korea. The Fashion Forum, WEARDROP, was launched in 2019. We
					form a fashion community with a style and continue to send out
					the "now" in Korea.
					</p>

					<p>
					<img class="gal_icon" src="img/icon/tech_icon.png" style="margin-right: 5px;" /> 
					Technical support : DaeWoong
					<!-- <img class="gal_icon" src="img/icon/bear_icon_white.png" style="margin-left: 5px;" /> -->
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
			</aside>
			
			<!-- 본문 -->
			<section style="z-index: 50; background-color: #fff; position: relative; box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);">
				<h2><img src='img/icon/write_icon_white.png' class="section_icon"/>New Post..</h2>
				<div class="post_block">
					<div class="post_header">
					
					<h3>Category</h3>
						<span>
						<select required="required" style="height: 28px; border:0; border-bottom: dotted 1px #000;" id="code" name="code" class="need" title="게시판">
								<option value="">게시판 선택</option>
								<option value=1>삽니다</option>
								<option value=2>팝니다</option>
						</select>
						</span>
						
						<script type="text/javascript">
							MarcTooltips.add('#code', '게시판을 선택해주세요!', {position : 'right', onFocus : true});
						</script>
						
						<h2 class="post_title">
							<input id="post_title" value="${vo.title }" type="text" class="need" title="제목" placeholder="제목을 입력해주세요!" name="title"
								style="width: 100%; background-color: #fff; font-size: 26px; font-weight: bold; border-bottom: dotted 1px #000;" />
						</h2>
						<div class="statusWrap">
							<p class="post_statsus">
								<img class="gal_icon" src="img/icon/gal_user_icon.png" />
									${info_login.writer} 
								<img src="img/icon/gal_eye_icon.png" style="width: 15.5px; height: 15.5px; vertical-align: bottom" />
									<font class="my-effect">---</font>
							</p>
							<p class="post_date">
								<font class="my-effect">----------</font>
							</p>
						</div>
					</div>
				</div>
				
				<script type="text/javascript">
					MarcTooltips.add('#post_title', 
							'제목 양식 [브랜드 / 상품명 / 사이즈]', 
							{position :'up', onFocus : true});
				</script>
				
				<div id="select_img" class="post_block">
					<c:choose>
						<c:when test="${!empty vo.filename }">
							<img src="<c:url value='/'/>${vo.filepath}" style="width: 100%; height: 100%;">
						</c:when>
						<c:otherwise>
							<img src="img/icon/content_logo.png" style="width: 100%; height: 100%;">
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="post_block">
					<textarea id="post_content" placeholder="내용을 입력해주세요!"
																style="resize: none; width: 99%; height: 100px" class="need" title="내용" name="content">${vo.content }</textarea>
					<br>
				</div>
				
				<script type="text/javascript">
					MarcTooltips.add('#post_content', 
							'우측 공지사항을 참고하여 내용을 작성해주세요!', 
							{position : 'bottom', onFocus : true});
				</script>
			</section>
			
			<comment style="z-index: 50; background-color: #fff; position: relative; box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);">
				<h2><img src='img/icon/price_icon_white.png' class="section_icon"/>Price</h2>
				<div class="comment_block">
					<font style="font-size: 25px; margin-left: 50px; margin-right:10px; float: left">￦</font>&nbsp;
					<%-- <input value="${vo.price}" id="post_price" type="text" name="price" class="need" title="제목" placeholder="희망가격을 입력해주세요!" 
						style="width: 80%; height:25px; background-color: #fff; text-align:right; font-size: 20px; font-weight: bold; border-bottom: 1px dotted #000;"> --%>
					<span class="right">
					<input value="${vo.price}" id="post_price" type="text" name="price" class="need" title="제목" placeholder="희망가격을 입력해주세요!" 
						style="width:290px; text-align:right; font-size: 25px; font-weight: bold; margin-left:10px; margin-right:10px; background-color: #fff; border:0px;"/>	
					<font style="font-size: 25px; margin-right:50px; font-weight: bold;">원</font>
					</span>
				</div>
				
				<script type="text/javascript">
					MarcTooltips.add('#post_price', '구매한 가격에 웃돈을 얹어 판매 하는 행위를 금지합니다. ', {position : 'up', onFocus : true});
				</script>
			</comment>
			
			<!-- 파일 첨부 -->
			<comment style="margin-top: 10px; z-index: 50; background-color: #fff; position: relative; box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);">
				<h2><img src='img/icon/clip_icon.png' class="section_icon"/>File</h2>
				<div class="comment_block">
					<h3>File Upload</h3>
					<div class="file-upload">
						<label for="attach-file"> 
							<img src="img/icon/weardrop_upload_icon.png" class="gal_icon" id="insert_icon" style="cursor: pointer;" /> 
							<input type="file" name="file" id="attach-file" class="gdsImg" style="display: none;" />
						</label> 
						<label id="file-name" style="margin-left: 15px;">${vo.filename }</label>
						<!--첨부된 파일의 이름  -->
							<img onclick="$('#attach').val('y')" src="img/icon/weardrop_delete_icon.png" id="delete-file" class="gal_icon" style="cursor: pointer;" />
					</div>
				</div>
				
				<script type="text/javascript">
					MarcTooltips.add('#insert_icon', '판매글은 포장이 제거된 실사 이미지 첨부 필수입니다', {position : 'right'});
					MarcTooltips.add('#delete-file', '사진을 삭제하시려면 눌러주세요!', {position : 'right'});
				</script>

				<div class="comment_block">
					<div class="ing_btn" style="width: 140px; margin-top: 10px;">
						<div class="ing_eff_yes"></div>
							<a onclick="if(necessary()){ $('form').submit()}">Save</a>
						</div>
					<div class="ing_btn" style="width: 140px; margin-top: 10px;">
						<div class="ing_eff_not"></div>
							<a onclick="location='list.se'">Cancel</a>
						</div>
					</div>
				</comment>
				
				<comment style="margin-top: 10px; z-index: 50; background-color: #fff; position: relative; box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);">
					<h2><img src='img/icon/notice_icon_white.png' class="section_icon"/>Notice</h2>
					<div class="comment_block">
						<div class="">
							<p>• 제목은 반드시 제목 작성 양식에 맞게 등록해주세요 <span class="right"></span></p>
						</div>
						<div class="">
							<p>• 연락처는 반드시 기재해주세요.</p>
						</div>
						<div class="">
							<p>• 구매한 가격에 웃돈을 얹어 판매 하는 행위를 금지합니다.<span class="right"></span></p>
						</div>
						<div class="">
							<p>• 판매글은 포장이 제거된 실사 이미지 첨부 필수입니다.<span class="right"></span></p>
						</div>
						<div class="">
							<p>• 물품이나 가격에 대한 근거없는 비방댓글을 금지합니다 .<span class="right"></span></p>
						</div>
						<div class="">
							<p>• 의류, 신발, 패션 잡화를 제외한 물품은 판매할 수 없습니다.<span class="right"></span></p>
						</div>
						<div class="">
							<p>• 하나의 게시물에는 하나의 상품만 등록 가능합니다.<span class="right"></span></p>
						</div>
						<div class="">
							<p>• 일방적 거래 파기 시 제재 조치<span class="right"></span></p>
						</div>
					</div>
				</comment>
				
				<script type="text/javascript">
					/* 첨부파일 다운로드 시 썸네일 */
					$(".gdsImg").change(function() {
						if (this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$("#select_img img").attr("src",data.target.result)
								}
								reader.readAsDataURL(this.files[0]);
								}
						});

					$(function() {
						if ('${ !empty vo.filename}' == 'true') {
							$('#delete-file').css('display', 'inline-block');
							$('#file-name').css('padding-right', '15px');
							}
						});

					$(function() { /*첨부파일 이미지 옆에 파일 이름 뿌리기 */
						$('#attach-file').on('change',function() {
							$('#file-name').html(this.files[0].name);
							$('#delete-file').css('display','inline-block'); /*첨부파일 선택한 후 취소 이미지 올라오기  */
							$('#select_img img').css('display','block');
							});
					
						$('#delete-file').on('click', function() { /*첨부파일 취소 이미지 클릭했을 경우(원래상태로 돌아가기)*/
							$('#attach-file').val(''); /*파일 선택 이미지 초기화  */
							$('#file-name').html(''); /*파일 이름 초기화  */
							$('#delete-file').css('display', 'none'); /*취소 이미지 안보이게 처리  */
							$('#select_img img').css('display', 'none');
							});
						});
						
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
					</script>
	
</div>
</form>

<video autoplay muted loop id="myVideo">
		<source src="img/weardrop_insert.mp4" type="video/mp4">
</video>	
		
 <!-- <input type='radio' id='code' name='code' value='1' />삽니다
  <input type='radio' id='code' name='code' value='2' checked="checked"/>팝니다
    <br> -->
</body>
</html>