<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 설정 -->

<c:forEach items="${list }" var="vo" varStatus="status">
	${status.index eq 0 ? "<h3 style='margin-bottom:10px;'>Comment<img src='img/icon/comment_icon.png' style='width:15.5px; height:15.5px; margin-left: 7px; margin-bottom:4px; vertical-align: middle;'/></h3>" : " " }
	<div style="margin-bottom: 10px; font-size: 14px; ">
		<!-- 아이디 아이콘-->
			<img src="img/icon/gal_user_icon.png" style="width:15.5px; height:15.5px;  vertical-align:middle"/>
		<!-- 작성자/작성일 -->
			<span>
				${vo.writer }
				<span style="color: #a0a0a0; font-size: 12px; margin-left: 5px;">[${vo.writedate}]</span>
			</span>
	</div>
	
	<!-- 로그인한 회원이 글을 작성한 회원인 경우 수정,삭제 가능 -->
	<c:if test="${vo.userid eq info_login.userid  }">
		<span style="float:right;">
			<a id="btn-modify-save-${vo.id}" onclick="go_modify_save(${vo.id})">수정</a>
			<a id="btn-delete-cancel-${vo.id}" onclick="go_delete_cancel(${vo.id})">삭제</a>
		</span>
	</c:if>

	<!-- 댓글이 표시되는 부분  -->
	<div style="font-size:14px; padding-bottom:10px; padding-left:10px; margin-bottom: 10px; border-bottom: dotted 1px #000;" id="original-${vo.id}">
		${fn:replace( fn:replace(vo.content, lf, '<br>') , crlf, '<br>')}</div><!-- 줄내림 -->
	<!-- 버튼 눌렀을때 수정 textarea 나타나게-->
	<div id="modify-${vo.id}" style="display: none;"></div>
	<!-- <hr> -->
</c:forEach>

<script type="text/javascript">
function display_mode(id, mode) {
	$('#modify-'+id).css('display',mode=='m' ? 'block' : 'none');//수정창은 보여지고
	$('#original-'+id).css('display', mode=='m' ? 'none' : 'block');//원본창은 안보여지고
	$('#btn-modify-save-'+id).text(mode=='m' ? '저장' : '수정');
	$('#btn-delete-cancel-'+id).text(mode=='m' ? '취소' : '삭제');
}

//댓글 수정
function go_modify_save(id) {
	if($('#btn-modify-save-'+id).text()=='수정'){
		
	var tag = "<textarea id='edit-" + id + "' style='width:100%; height:50px;'>" //텍스트창 호출 
			//edit-id(JS Pram이기 떄문에 따로 묶어줌)
			+ $('#original-'+id).html().replace(/<br>/g, '\n') //원본글 나오게
			+ "</textarea>";
	$('#modify-'+id).html(tag); //
	display_mode(id, 'm'); //display_mode 함수 호출
	}else{
		var comment = new Object();
		comment.id = id;
		comment.content = $('#edit-'+id).val();
		//alert(comment.id +" : "+ comment.content); //확인용 alert
		
		$.ajax({
			type : 'post',
			url : 'sell/comment/update',
			data: JSON.stringify(comment),
			//전송할 json에 한글이 있는 경우 깨지지 않도록 처리
			contentType: 'application/json; charset=utf-8',
			success: function(data){
					alert('댓글변경' + data)
					comment_list();
			},
			error:function(req, text){
				alert( text + ": " + req.status);
			}
		});//ajax()
	}//if-else
}//go_modify_save()

//댓글 삭제
function go_delete_cancel(id) {
	if($('#btn-delete-cancel-'+id).text()=='취소'){
		display_mode(id, 'd');
	}else{
		if(confirm('정말 삭제하시겠습니까?')){
			$.ajax({
				url: 'sell/comment/delete/'+id,
				success:function(){
					comment_list();
				},
				error:function(req, text){
					alert( text + ": " + req.status);
				}
			});//ajax()
		}//if-else()
	}//if-else()
}//go_delete_cancel()
</script>