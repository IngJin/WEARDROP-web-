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
                var baseURL = "api.openweathermap.org/data/2.5/forecast?";
                var lat = resp.lat;
                var lon = resp.lon;
                var cityID = "1835848"; // Seoul
                var appKey = "e5799cbefe2fe84bbfe2c2936d4816f4"; // openweathermap.org에서
																	// api key
																	// 발급 후 입력할
																	// 것
                var url = "https://" + baseURL + "lat=" + lat + "&lon=" + lon + "&cnt=" + 7 + "&appid=" + appKey;
                $.getJSON(url, function(data) {
                    var __temp = '';
                    var __num = '';
                    var __hour = '';
                    var __date = '';
                    var __time = '';
                    var __img_url = '';
                    var __html = '<br/><div style="margin-top:20px;"><table width="800px"><tr align="center"><td colspan=8><h2 style="margin-right: 10px;">오늘의 날씨</h2></td></tr>';
                    for (var i = 0; i < data.list.length; i++) {
                        __temp = (parseFloat(data.list[i].main.temp) - 273.0).toFixed(1) + " °C";
                        __num = parseInt(data.list[i].weather[0].id);
                        __hour = parseInt(data.list[i].dt_txt.substr(11, 2));
                        __date = data.list[i].dt_txt.substr(5, 5).replace("-", " / ");
                        __time = (Number(__hour) < 10) ? '0' + __hour + ' : 00' : __hour + ' : 00';
                        __img_url = getIcon(__num, __hour);

                        if (i % 8 == 0) {
                            __html += '<tr align="center">'
                        }

                        __html += '<td width="100">';
                        __html += '	<p class="date">' + __date + '</p>';
                        __html += '	<p class="time">' + __time + '</p>';
                        __html += '	<p class="temp">' + __temp + '</p>';
                        __html += ' <img src="' + __img_url + '" height="50" width="50">';
                        __html += '</td>';

                        if (i % 8 == 7) {
                            __html += '</tr>'
                        }
                    }

                    if (data.list.length % 8 != 0) {
                        for (var j = 0; j <= data.list.length % 5; j++) {
                            __html += '<td width="100"></td>';
                        }
                        __html += '</tr>';
                    }
                    __html += '</table></div>';
                    
                    $('.weather').after(__html);
                });
            }
        });
    }
});

function getIcon(num, hour) {
    if (num >= 200 && num < 300) return "img/icons/2xx.png";
    else if (num >= 300 && num < 400) return "imgs/icons/3xx.png";
    else if (num >= 500 && num < 510) {
        if (hour >= 6 && hour < 19) return "img/icons/50x.png";
        else return "img/icons/50xn.png";
    } else if (num == 511) return "imgs/icons/511.png";
    else if (num >= 520 && num < 600) return "img/icons/52x.png";
    else if (num >= 600 && num < 700) return "img/icons/6xx.png";
    else if (num >= 700 && num < 800) return "img/icons/7xx.png";
    else if (num == 800) {
        if (hour >= 6 && hour < 19) return "img/icons/800.png";
        else return "img/icons/800n.png";
    } else if (num == 801) {
        if (hour >= 6 && hour < 19) return "img/icons/801.png";
        else return "img/icons/801n.png";
    } else if (num == 802) return "img/icons/802.png";
    else if (num == 803) return "img/icons/803.png";
    else if (num == 804) return "img/icons/804.png";
    else return "img/icons/000.png";
}



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
                                $("#display").empty();
                                var html = ""
                                html += "<div class='ingweather'>";
                                html += "<div class='ingtemp'>" + parseInt(resp.main.temp - 273.15) + "˚</div>";
                                html += "<div class='ingwet'>" + resp.weather[0].main + "</div>";
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
                                $("#display").append(html);
                         }
                    });
                }
            });
        }
    });


                    
          
