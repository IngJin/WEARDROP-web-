$(function($) {
    $("body").css("display", "none");
    $("body").fadeIn(800);
});

function we_nothover() {
    $("#display").fadeOut(0.1);
    $("#display").css("display", "none");
    $("#display").empty();
}

function nothover() {
    we_nothover();
    $("#myVideo").attr("src", "video/walkwalk.mp4");
    $(".display").css('background-color', '');
    $(".we_img").css("background-image", '');
}

function notmain() {
    $("#myVideo").attr("src", "video/walkwalk.mp4");
}

function hot() {
    $(".display").css("display", "none");
    //$(".display").css('background-image', 'url("img/weather_hot.jpg")');
    /*$(".display").css('background-color', 'rgba(255,255,255,0.5)');*/
    $(".display").fadeIn(800);
}

function cold() {
    $(".display").css("display", "none");
    //$(".display").css('background-image', 'url("img/weather_cold.jpg")');
    /*$(".display").css('background-color', 'rgba(255,255,255,0.5)');*/
    $(".display").fadeIn(800);
}

var ip = "https://jsonip.com";
$.ajax({
    url: ip,
    type: "post",
    dataType: "json",
    async: "false",
    success: function(ip) {
        var ipURI = "http://ip-api.com/json/" + ip.ip + "?fields=country,region,regionName,lat,lon,query";
        $.ajax({
            url: ipURI,
            type: "post",
            dataType: "json",
            async: "false",
            success: function(resp) {
                var apiURI = "";
                apiURI += "https://api.openweathermap.org/data/2.5/weather?lat=" +
                    resp.lat + "&lon=" + resp.lon +
                    "&appid=e5799cbefe2fe84bbfe2c2936d4816f4";
                $.ajax({
                    url: apiURI,
                    dataType: "json",
                    type: "GET",
                    async: "false",
                    success: function(resp) {
                        $('#weather').hover(function() {
                            if ((resp.weather[0].main).toString() == "Rain" || (resp.weather[0].main).toString() == "Drizzle" || (resp.weather[0].main).toString() == "Thunderstorm") {
                                weather();
                                $("#myVideo").css("display", "none");
                                $("#myVideo").attr("src", "video/ing_rain.mp4");
                                $("#myVideo").fadeIn(800);
                                if ((resp.main.temp - 273.15) > 18) {
                                    hot();
                                } else {
                                    cold();
                                }
                            } else if ((resp.weather[0].main).toString() == "Snow") {
                                weather();
                                $("#myVideo").css("display", "none");
                                $("#myVideo").attr("src", "video/ing_snow.mp4");
                                $("#myVideo").fadeIn(800);
                                if ((resp.main.temp - 273.15) > 18) {
                                    hot();
                                } else {
                                    cold();
                                }
                            } else if ((resp.weather[0].main).toString() == "Clear") {
                                weather();
                                $("#myVideo").css("display", "none");
                                $("#myVideo").attr("src", "video/ing_sun.mp4");
                                $("#myVideo").fadeIn(800);
                                if ((resp.main.temp - 273.15) > 18) {
                                    hot();
                                } else {
                                    cold();
                                }
                            } else if ((resp.weather[0].main).toString() == "Clouds") {
                                weather();
                                $("#myVideo").css("display", "none");
                                $("#myVideo").attr("src", "video/ing_cloud.mp4");
                                $("#myVideo").fadeIn(800);
                                if ((resp.main.temp - 273.15) > 18) {
                                    hot();
                                } else {
                                    cold();
                                }
                            } else {
                                weather();
                                $("#myVideo").css("display", "none");
                                $("#myVideo").attr("src", "video/ing_mist.mp4");
                                $("#myVideo").fadeIn(800);
                                if ((resp.main.temp - 273.15) > 18) {
                                    hot();
                                } else {
                                    cold();
                                }
                            }
                        }, function() {
                            nothover();
                        });
                    }
                });
            }
        });
    }
});


function weather() {
    var ip = "https://jsonip.com";
    $.ajax({
        url: ip,
        type: "post",
        dataType: "json",
        async: "false",
        success: function(ip) {
            var ipURI = "http://ip-api.com/json/" + ip.ip + "?fields=country,region,regionName,lat,lon,query";
            $.ajax({
                url: ipURI,
                type: "post",
                dataType: "json",
                async: "false",
                success: function(resp) {
                    var apiURI = "";
                    apiURI += "https://api.openweathermap.org/data/2.5/weather?lat=" +
                        resp.lat + "&lon=" + resp.lon +
                        "&appid=e5799cbefe2fe84bbfe2c2936d4816f4";
                    $.ajax({
                        url: apiURI,
                        dataType: "json",
                        type: "GET",
                        async: "false",
                        success: function(resp) {
                            $('#weather').hover(function() {
                                $("#display").empty();
                                var html = ""
                                html += "<div class='ingweather'>";
                                html += "<div class='ingtemp'>" + parseInt(resp.main.temp - 273.15) + "˚</div>";
                                html += "<div class='ingwet'>" + resp.weather[0].main + "</div>";
                                html += "<div class='aside_block aside_box'>" + 
                               "<h2>WEARDROP?</h2>" + 
                                "<p>WEARDROP is a community media that creates fashion culture in Korea. The Fashion Forum, WEARDROP, was launched in 2019. We form a fashion community with a style and continue to send out the now in Korea.<p>"
                                + "<p><img class='gal_icon' src='img/icon/tech_icon.png' style='margin-right: 5px;'/>Technical support : JiWoong</p>"
            					+ "</div>";
                                html += "</div>";
                                
                                if ((resp.weather[0].main).toString() == "Rain" || (resp.weather[0].main).toString() == "Drizzle" || (resp.weather[0].main).toString() == "Thunderstorm") {
                                    $(".we_img").css("background-image", 'url("img/ing_rain.png")');
                                } else if ((resp.weather[0].main).toString() == "Snow") {
                                    $(".we_img").css("background-image", 'url("img/ing_snow.png")');
                                } else if ((resp.weather[0].main).toString() == "Clear") {
                                    $(".we_img").css("background-image", 'url("img/ing_sun.png")');
                                } else if ((resp.weather[0].main).toString() == "Clouds") {
                                    $(".we_img").css("background-image", 'url("img/ing_cloud.png")');
                                } else {
                                    $(".we_img").css("background-image", 'url("img/ing_mist.png")');
                                }
                                
                                if ((resp.main.temp - 273.15) >= 27) {
                                	html += "<div class='ing_codywrap'>"
                                    html += "<div class='ing_cody'>Today's Cody</div>"
                                    html += "<div class='ing_codys'>" +
                                        	"<img class='cody_icon' src='img/cloth/cloth_sleeveless.png'/>" +
                                       		"<img class='cody_icon' src='img/cloth/cloth_tshirt.png'/>" +
                                       		"<img class='cody_icon' src='img/cloth/cloth_polo.png'/>" +
                                       		"<img class='cody_icon' src='img/cloth/cloth_shorts.png'/>" +
                                       		"<img class='cody_icon' src='img/cloth/cloth_wshorts.png'/>" +
                                       		"</div>"
                                    html += "</div>"
                                    html += "<div class='scroll-sections'><div class='scrolls'><div class='scroll_items'>오늘은 뭘 입어도 더운날씨 :( 에어컨과 꼭 붙어있으세요! - WEARDROP -</div></div></div>";
                                } else if ((resp.main.temp - 273.15) >= 23) {
                                	html += "<div class='ing_codywrap'>"
                                    html += "<div class='ing_cody'>Today's Cody</div>"
                                    html += "<div class='ing_codys'>" +
                                    		"<img class='cody_icon' src='img/cloth/cloth_polo.png'/>" +
                                    		"<img class='cody_icon' src='img/cloth/cloth_tshirt.png'/>" +
                                    		"<img class='cody_icon' src='img/cloth/cloth_shortshirt.png'/>" +
                                    		"<img class='cody_icon' src='img/cloth/cloth_shorts.png'/>" +
                                    		"<img class='cody_icon' src='img/cloth/cloth_jean.png'/>" +
                                    		"</div>"
                                    html += "</div>"
                                    html += "<div class='scroll-sections'><div class='scrolls'><div class='scroll_items'>오늘은 어디로든 떠나고 싶어지는 맑은날씨입니다 :) 친구와 약속을 잡아보는게 어때요? - WEARDROP -</div></div></div>";
                                } else if ((resp.main.temp - 273.15) >= 20) {
                                	html += "<div class='ing_codywrap'>"
                                    html += "<div class='ing_cody'>Today's Cody</div>"
                                    html += "<div class='ing_codys'>" +
                                        	"<img class='cody_icon' src='img/cloth/cloth_shirt.png'/>" +
                                        	"<img class='cody_icon' src='img/cloth/cloth_vsweater.png'/>" +
                                       		"<img class='cody_icon' src='img/cloth/cloth_cardigan.png'/>" +
                                       		"<img class='cody_icon' src='img/cloth/cloth_pants.png'/>" +
                                       		"<img class='cody_icon' src='img/cloth/cloth_jean.png'/>" +
                                       		"</div>"
                                     html += "</div>"
                                     html += "<div class='scroll-sections'><div class='scrolls'><div class='scroll_items'>오늘은 어디로든 떠나고 싶어지는 맑은날씨입니다 :) 친구와 약속을 잡아보는게 어때요? - WEARDROP -</div></div></div>";
                                } else if ((resp.main.temp - 273.15) >= 17) {
                                	html += "<div class='ing_codywrap'>"
                                    html += "<div class='ing_cody'>Today's Cody</div>"
                                    html += "<div class='ing_codys'>" +
                                           	"<img class='cody_icon' src='img/cloth/cloth_hoodie.png'/>" +
                                         	"<img class='cody_icon' src='img/cloth/cloth_vsweater.png'/>" +
                                          	"<img class='cody_icon' src='img/cloth/cloth_cardigan.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_pants.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_jean.png'/>" +
                                            "</div>"
                                    html += "</div>"
                                    html += "<div class='scroll-sections'><div class='scrolls'><div class='scroll_items'>찬바람이 불기 시작했어요! 일교차가 심하니 외투를 꼭 챙겨주세요 :) - WEARDROP -</div></div></div>";
                                } else if ((resp.main.temp - 273.15) >= 12) {
                                	html += "<div class='ing_codywrap'>"
                                    html += "<div class='ing_cody'>Today's Cody</div>"
                                    html += "<div class='ing_codys'>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_blazer.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_denimjacket.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_sweater.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_pants.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_jean.png'/>" +
                                            "</div>"
                                    html += "</div>"
                                    html += "<div class='scroll-sections'><div class='scrolls'><div class='scroll_items'>여러분  외투의 계절이 돌아왔습니다! 부디 이 순간을 즐겨주세요 :) - WEARDROP -</div></div></div>";
                                } else if ((resp.main.temp - 273.15) >= 10) {
                                	html += "<div class='ing_codywrap'>"
                                    html += "<div class='ing_cody'>Today's Cody</div>"
                                    html += "<div class='ing_codys'>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_winterjacket.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_denimjacket.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_sweater.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_pants.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_jean.png'/>" +
                                            "</div>"
                                    html += "</div>"
                                    html += "<div class='scroll-sections'><div class='scrolls'><div class='scroll_items'>겨울이 다가왔습니다! 다들 주머니 속에 붕어빵 사먹을 돈은 넣어놓으셨나요? :) - WEARDROP -</div></div></div>";
                                } else if ((resp.main.temp - 273.15) >= 6) {
                                	html += "<div class='ing_codywrap'>"
                                    html += "<div class='ing_cody'>Today's Cody</div>"
                                    html += "<div class='ing_codys'>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_coat.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_padding.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_winterjacket.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_pants.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_jean.png'/>" +
                                            "</div>"
                                    html += "</div>"
                                    html += "<div class='scroll-sections'><div class='scrolls'><div class='scroll_items'>더 추워지기 전에 코트를 실컷 입어줘야합니다! 다들 감기조심하세요 :) - WEARDROP -</div></div></div>";
                                } else {
                                	html += "<div class='ing_codywrap'>"
                                    html += "<div class='ing_cody'>Today's Cody</div>"
                                    html += "<div class='ing_codys'>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_winterhat.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_glove.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_wpadding.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_winterjacket.png'/>" +
                                            "<img class='cody_icon' src='img/cloth/cloth_jean.png'/>" +
                                            "</div>"
                                    html += "</div>"
                                    html += "<div class='scroll-sections'><div class='scrolls'><div class='scroll_items'>오늘은 뭘 입어도 추운 날씨 :( 이불 밖은 위험해요 ! - WEARDROP -</div></div></div>";
                                }
                                $("#display").css("display", "none");
                                $("#display").append(html);
                                $("#display").fadeIn(800);
                                $(".we_img").css("display", "none");
                                $(".we_img").fadeIn(800);
                            }, function() {
                                nothover();
                            });
                        }
                    })
                }
            });
        }
    });
}

$(function() {
    var group = $(".group");
    group.each(function() {
        var _group = new GroupBox(this);
    });

    // 사용자 정의 생성자 함수 정의
    function GroupBox(groupElement) {
        var box = $(groupElement).find(".box");
        var title = $(groupElement).find(".box .title a");

        box.each(function(idx) {
            var newBox = new RootBox(this);
            if (idx >= 0) {
                newBox.siblingsClose();
            }
        });
    }

    // 사용자 정의 생성자 함수 정의
    function RootBox(boxElement) {
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
        _this.siblingsClose = function() {
            cont.css('display', 'none');
        }
        _this.open = function() {
            cont.slideDown();
        }
        _this.close = function() {
            cont.slideUp();
        }
    }
});

function go_logout() {
    $.ajax({
        url: 'logout_log',
        success: function() {
            location = 'index';
        },
        error: function(req, text) {
            alert(txt + ": " + req.status);
        }
    });
}


$('.counter-count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).text()
    }, {
        duration: 1000,
        easing: 'swing',
        step: function (now) {
            $(this).text(Math.ceil(now));
        }
    });
});