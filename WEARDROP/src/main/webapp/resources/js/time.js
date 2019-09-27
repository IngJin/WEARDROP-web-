function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    var month;
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    } 
    
    if(currentDate.getMonth() == 1) {
    	month = "Janyary";
    } else if (currentDate.getMonth() == 2) {
    	month = "February";
    } else if (currentDate.getMonth() == 3) {
    	month = "March";
    } else if (currentDate.getMonth() == 4) {
    	month = "April";
    } else if (currentDate.getMonth() == 5) {
    	month = "May";
    } else if (currentDate.getMonth() == 6) {
    	month = "June";
    } else if (currentDate.getMonth() == 7) {
    	month = "July";
    } else if (currentDate.getMonth() == 8) {
    	month = "August";
    } else if (currentDate.getMonth() == 9) {
    	month = "September";
    } else if (currentDate.getMonth() == 10) {
    	month = "October";
    } else if (currentDate.getMonth() == 11) {
    	month = "November";
    } else if (currentDate.getMonth() == 12) {
    	month = "December";
    }
    
    clock.innerHTML = "<br/><span style='font-size:30px;'>" + month + " . " + currentDate.getDate() + " . "  + currentDate.getFullYear() + "</span><br/>" +
    "<span style='font-size:50px;'>" + currentHours+":"+currentMinute+":"+currentSeconds +"</sapn><span style='font-size:30px;'>"+ amPm +"</span>"; //날짜를 출력해 줌 
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
 }

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

