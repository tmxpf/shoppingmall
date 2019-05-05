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
			
			<!-- <div class="cal_top">
			   <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
			    <span id="cal_top_year"></span>
			    <span id="cal_top_month"></span>
			    <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
			</div>
			<div id="cal_tab" class="cal">
				   
			</div>
				
			<div class="cal_top">
		        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
		        <span id="cal_top_year"></span>
		        <span id="cal_top_month"></span>
		        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
		    </div>
		    
		    <div id="cal_tab" class="cal"> -->
		    
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
	}
	
	function drawCalendar() {
		var dateRow = 0; 	//달력 row
		var setTableHTML = "";
		
		sumDay += lastDay.getDate() - firstDay.getDate() + 1;	//천제 날짜
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
		var dayCount = 0;
		
		tdDay = $('td div.cal-day');
		tdSche = $('td div.cal-schedule');
		
		for(var i = startDay; i < startDay + lastDay.getDate(); i++){
           /* tdDay.eq(i).text(++dayCount); */
           var dayHTML = "";
           
           dayHTML += '<a href="#none">' + ++dayCount + '</a>';
           
		   tdDay.eq(i).html(dayHTML);
        }
		
        for(var i=0; i < sumDay; i += 7){
            tdDay.eq(i).children().first().css("color","red");
        }
        
        for(var i = 6; i < sumDay; i += 7){
            tdDay.eq(i).children().first().css("color","green");
        }
	}
	
</script>

<!-- <script type="text/javascript">
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
 
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                setTableHTML+='    <div class="cal-day"></div>';
                setTableHTML+='    <div class="cal-schedule"></div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
 
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
 
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }

    
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
    }
</script> -->

</body>
</html>