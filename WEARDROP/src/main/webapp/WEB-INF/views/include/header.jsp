<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<link rel="stylesheet" type="text/css" href="css/menu.css?v=<%= new Date().getTime() %>">
<link href="https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Raleway&display=swap" rel="stylesheet">
<style type="text/css">
</style>

<script type="text/javascript">
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
               <div>
                  <ul id="gnb">
                    <div class="out">
						<div class="content">			 											
							<div id="content">
								<a id="weather" onclick="location='weather.ho'">What should I wear today?</a> <br/><br/>
								<a id="daliy" onclick="location='index'">DailyLook</a> <br/><br/>
								<a href="list.se">UsedMarket</a><br/>
								<div class="group">												
									<div class="box">
										<div class="title"><a href="#">Service Center</a></div>	
										<div class="cont"><a onclick="location='index'"><div>Notice</div></a></div>
										<div class="cont"><a onclick="location='index'">Frequently Asked Question</a></div>
										<div class="cont" ><a onclick="location='index'">Questions and Answers</a></div>
									</div>						 		
									<div class="box">
										<div class="title"><a href="#">Community</a></div>	
										<div class="cont"><a onclick="location='index'">Free Board</a></div>
										<div class="cont" style="font-size:1.2em;"><a onclick="location='index'">Reviews</a></div>			
										<div class="cont"><a onclick="location='index'">Find a store</a></div>
									</div><br/> <!-- box -->
								</div> <!-- group -->			 													
							</div>	<!-- contnet id -->
						</div> <!-- content cl -->
					</div> <!-- out -->
                  </ul>        
               </div>
            </div> <!-- gbnin-->
            <p class="logo">
               <a onclick="location='index'"><img src="img/temporary.png" class="logo_img" alt="로고" /></a>
            </p>
         </div>
      </div>
   </header>
</body>

