<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<link rel="stylesheet" type="text/css" href="css/menu.css?v=<%= new Date().getTime() %>">
<link href="https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Raleway&display=swap" rel="stylesheet">
<style type="text/css">
.login {
	margin-top: 240px;
	margin-left: 8px; 	
}
</style>

<script type="text/javascript">

function go_logout() {
	$.ajax({
		url : 'logout_log',
		success: function() {
			location='index';
		}, error: function(req, text) {
			alert( txt + ": " + req.status);
		}
	});
}

$(function(){

    var group = $(".group");

    group.each(function(){
        var _group = new GroupBox(this);
    });

    // 사용자 정의 생성자 함수 정의
    function GroupBox(groupElement){

        var box = $(groupElement).find(".box");
        var title = $(groupElement).find(".box .title a");

        box.each(function(idx){
            var newBox = new RootBox(this);
            if (idx >= 0){
                newBox.siblingsClose();
            }
        });
    }

    // 사용자 정의 생성자 함수 정의
    function RootBox(boxElement){
        var _this = this;
        var boxEl = $(boxElement);
        var target = $(boxEl).find(".title a");
        var cont = $(boxEl).find(".cont");

        // _groupParent = $(boxEl).parent();

        target.on("click", anchorClickEvent);

        function anchorClickEvent() {

            if (cont.is(':hidden')) {
                _this.open();
            } else {
                _this.close();
            }
        }

        _this.siblingsClose = function () {
            cont.css('display','none');
        }

        _this.open = function() {
            cont.slideDown();
        }
        _this.close = function() {
            cont.slideUp();
        }
    }
});

$(function($) {
    $("body").css("display", "none");
    $("body").fadeIn(1000);
    $("a.transition").click(function(event){
        event.preventDefault();
        linkLocation = this.href;
        $("body").fadeOut(500, redirectPage);
    });
    function redirectPage() {
    window.location = linkLocation;
    }
});

$(function(){
	   // gnb
	   $('#header a.all-menu').on('click',function(){
	      if ($(this).hasClass('active')) {
	         $('.mask').remove();
	         $('body').removeClass('ofH');
	         $('.gnbwrap').removeClass('open');
	         $('.header .fixmenu').removeClass('active');
	         $(this).removeClass('active');
	      } else {
	         $('.gnbwrap').addClass('open');
	         $('body').addClass('ofH');
	         $('.header .fixmenu').addClass('active');
	         $(this).addClass('active');
	         $('body').append('<div class="mask"></div>');
	         $('.mask').css({'z-index':500});
	      }
	      return false;
	   });
});
</script>
<body>
<header id="header">
      <div class="header">
         <div class="fixmenu">
            <a class="all-menu"> <span></span><span></span><span></span></a>
         </div>
         <div class="gnbwrap">
            <div class="gnbIn">
               <div class="grid">
                  <ul id="gnb">
                    <div class="out">
						<div class="content">			 											
							<div id="content">
								<a id="daliy" href="list.gal">DailyLook</a> <br/><br/>
								<a href="list.se">UsedMarket</a><br/>	
								<div class="group">												
									<div class="box">
										<div class="title"><a href="#">Service Center</a></div>	
										<div class="cont" OnClick="location.href ='list.no'" style="cursor:pointer;">Notice</div>
										<div class="cont" id="size"><a href="list.ct">Questions and Answer</a></div>
									</div>						 		
									<div class="box">
										<div class="title"><a href="#">Community</a></div>	
										<div class="cont"><a href="list.com">Free Board</a></div>
										<div class="cont" OnClick="location.href ='list.hu'" style="cursor:pointer;">Reviews</div>			
										<div class="cont"><a href="map.com">Find a store</a></div>
									</div><br/> <!-- box -->
								</div> <!-- group -->			 													
							</div>	<!-- contnet id -->
						</div> <!-- content cl -->
					</div> <!-- out -->
					<div class="login">
						<c:if test="${ !empty info_login}">
						<div class="user_info"><a onclick="location='mypage.ho'">${info_login.userid} [${info_login.writer}]</a></div><br/>
						<a class="btn" onclick="go_logout()">Logout</a>
						</c:if>
						<c:if test="${ empty info_login}">
							<a class="btn" onclick="location='login.ho'">Login</a>	
						</c:if>	
					</div>
                  </ul>        
               </div>
            </div> <!-- gbnin-->
            <p class="logo">
               <a onclick="location='index'"><img src="img/logo.png" class="logo_img" alt="로고" /></a>
            </p>
         </div>
      </div>
   </header>
</body>

