<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- MouseOver-->
<link href="/resources/css/MouseOver.css" rel="stylesheet">

<!-- Default-page-->
<link href="/resources/css/default-page.css" rel="stylesheet">

<style type="text/css">
.cal_top{
    text-align: center;
    font-size: 30px;
}
.cal{
    text-align: center;    
}
table.calendar{
    border: 1px solid black;
    display: inline-table;
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid skyblue;
    width: 100px;
}
.day{
	height: 80px;
}

</style>

</head>
<body>

<!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
	<jsp:include page="/WEB-INF/views/cmmLayout/cmmSidebarLayout.jsp" flush="false"/>
	
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <jsp:include page="/WEB-INF/views/cmmLayout/cmmTopLayout.jsp" flush="false"/>

		<div class="cal">
		
			<div class="cal_top">
			    <a href="#" id="movePrevYear"><span id="prevYear" class="cal_tit">&lt;</span></a>
			    	<span id="cal_top_year"></span>
			    <a href="#" id="moveNextYear"><span id="nextYear" class="cal_tit">&gt;</span></a>
			    
			    <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
			    	<span id="cal_top_month"></span>
			    <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
			</div>
		
			<table class="calendar">
				<caption class="bind"></caption>
				<colgroup>
					<col style="width:101.5px" />
					<col style="width:101.5px"/>
					<col style="width:101.5px" />
					<col style="width:101.5px" />
					<col style="width:101.5px" />
					<col style="width:101.5px" />
					<col style="width:101.5px" />
				</colgroup>
				<tr class="cap">
					<td style="text-align:center;">일</td>
					<td style="text-align:center;">월</td>
					<td style="text-align:center;">화</td>
					<td style="text-align:center;">수</td>
					<td style="text-align:center;">목</td>
					<td style="text-align:center;">금</td>
					<td style="text-align:center;">토</td>
				</tr>
			</table>
		    
		    </div>

		</div>
<!-- Footer -->
      <jsp:include page="/WEB-INF/views/cmmLayout/cmmFooter.jsp" flush="false"/>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
</div>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<script type="text/javascript">

	var today = null;
	var year = null;
	var month = null;
	
	var firstDay = null;	//현재 달의 첫째 일 ex) 5월 1일 , 6월 1일
	var lastDay = null;		//현재 달의 마지막 일 ex) 5월 31일, 6월 30일
	
	var startDay = null;	//현재 달의 처음 날
	var endDay = null;		//현재 달의 마지막 날
	var sumDay = 0;		//날짜 전체 빈칸
	
	var tdDay = null;
	var tdSche = null;
	
	$(document).ready(function() {
		initDate();
		drawCalendar();
		drawDays();
	});
	
	function initDate() {
		today = new Date();
		year = today.getFullYear();
		month = today.getMonth()+1;
		
		firstDay = new Date(year,month-1,1);	//현재 달의 첫째 일 ex) 5월 1일 , 6월 1일
		lastDay = new Date(year,month,0);		//현재 달의 마지막 일 ex) 5월 31일, 6월 30일
		
		startDay = firstDay.getDay();		//현재 달의 처음 날
		endDay = lastDay.getDay();		//현재 달의 마지막 날
		
		$("#cal_top_year").text(year + "년");	//현재 달력의 년도
        $("#cal_top_month").text(month + "월");	//현재 달력의 달
	}
	
	function drawCalendar() {
		var dateRow = 0; 	//달력 row
		var setTableHTML = "";
		
		sumDay += lastDay.getDate();	//천제 날짜
		sumDay += startDay;		//첫날
		sumDay += 6 - endDay;		//마지막 날
		
		dateRow = (sumDay % 7) != 0 ? (sumDay / 7) + 1 : (sumDay / 7);
		
		for(var index = 0; index < dateRow; index++) {
			setTableHTML = "";
			setTableHTML += '<tr class="day">';
			
			for(var test = 0; test < 7; test++) {
				setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                setTableHTML += '    <div class="cal-day"></div>';
                setTableHTML += '    <div class="cal-schedule"></div>';
                setTableHTML += '</td>';
			}
			setTableHTML += '</tr>';
			$('.calendar').append(setTableHTML);
		}
	}
	
	function drawDays() {
		var dayCount = 0;		//날짜 증가
		var dayHTML = "";		//날짜 태그
		var schedulHTML = "";	//스케줄 태그
		var choiceDate = "";		//선택날짜
		var list = new Array(); //스케줄 리스트 가져오기
		
		list = getScheduleList();
		
		tdDay = $('td div.cal-day');
		tdSche = $('td div.cal-schedule');
		
		for(var i = startDay; i < startDay + lastDay.getDate(); i++) {
			dayCount++;
			
			choiceDate = "";
			choiceDate += year.toString() + "-";
			choiceDate += month.toString().length == 1 ? "0" + month.toString()  + "-" : month.toString()  + "-";
			choiceDate += dayCount.toString().length == 1 ? "0" + dayCount.toString() : dayCount.toString();
			
           dayHTML = '<a href="/calendar/registerSchedule.do?schdul_date=' + choiceDate + '">' + dayCount + '</a>';
           tdDay.eq(i).html(dayHTML);
           
           for(var j = 0; j < list.length; j++) {
        	   if(list[j].schdul_date == choiceDate ) {
            	   schedulHTML = '<a href="/calendar/showSchedule.do?schdul_id=' + list[j].schdul_id + '"><font style="font-size: 10px">' + list[j].schdul_title + '</font></a>';
            	   tdSche.eq(i).html(schedulHTML);
               }
           }
           
        }
		
        for(var i=0; i < sumDay; i += 7){
            tdDay.eq(i).children().first().css("color","red");
        }
        
        for(var i = 6; i < sumDay; i += 7){
            tdDay.eq(i).children().first().css("color","green");
        }
	}
	
	$("#movePrevYear").on("click", function() {
		year--;
		
		getNewInfo();
	});
	
	$("#moveNextYear").on("click", function() {
		year++;
		
		getNewInfo();
	});
	
	$("#movePrevMonth").on("click", function() {
		month--;
		
        if(month <= 0){
            month=12;
            year--;
        }
        
        getNewInfo();
	});
	
	$("#moveNextMonth").on("click", function() {
		month++;
		
        if(month > 12){
            month=1;
            year++;
        }
        
        getNewInfo();
	});
	
	function getNewInfo() {
		$('.day').remove();
		
		sumDay = 0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        
        startDay = firstDay.getDay();		//현재 달의 처음 날
		endDay = lastDay.getDay();		//현재 달의 마지막 날
		
		$("#cal_top_year").text(year + "년");	//현재 달력의 년도
        $("#cal_top_month").text(month + "월");	//현재 달력의 달
        
        drawCalendar();
		drawDays();
	}
	
	function getScheduleList() {
		var list = "";
		var date = "";
		
		date += year.toString() + "-";
		date += month.toString().length == 1 ? "0" + month.toString() : month.toString();
		
		$.ajax({
			url : "/calendar/getScheduleList.do",
			dataType : "json"	,
			async: false,
			data : {"currentDate" : date},
			success : function(result) {
				list = result;
			}
		});
		
		return list;
	}
	
</script>

</body>
</html>