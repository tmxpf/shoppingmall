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


		<div id="content" style="width:712px">
		<form id="leaderSchdulVO" name="leaderSchdulVO" action="/calendar/insertSchedule.do" method="post">
		
		<div class="container">
			<!-- 타이틀 -->
			<h4>일정관리 등록</h4><!-- 일정관리 등록 -->
			
			<!-- 등록폼 -->
			<table class="table">
				<colgroup>	
					<col style="width:30%">
					<col style="">
				</colgroup>
				<tbody class="table-bordered" style="position:fixed;">
				<tr>
					<th>일정구분 <span class="pilsu">*</span></th><!-- 일정구분 -->
					<td class="left">
				         <!-- 선택 -->
					    <select id="schdul_sel" name="schdul_sel" title="일정구분 선택">
				            <option value="" selected="selected">선택</option>
				            <option value="1">회의</option>
				            <option value="2">방문</option>
				            <option value="3">세미나</option>
				            <option value="4">기타</option>
				        </select>
					</td>
				</tr>
				<tr>
					<th>등록자명 <span class="pilsu">*</span></th><!-- 간부명 -->
					<td class="left">
					    <input id="schdul_registant_name" name="schdul_registant_name" style="width:98px" title="등록자명" readonly="readonly" type="text" value="${id}" maxlength="10" readonly>
					</td>
				</tr>
				<tr>
					<th>일정명 <span class="pilsu">*</span></th><!-- 일정명 -->
					<td class="left">
					    <input id="schdul_title" name="schdul_title" class="form-control" title="일정명" type="text" value="" size="92" maxlength="255">
					</td>
				</tr>
				<tr>
					<th>일정내용 <span class="pilsu">*</span></th><!-- 일정내용 -->
					<td class="left">
						<textarea id="schdul_content" name="schdul_content" class="form-control" title="일정내용" rows="5" cols="90"></textarea>
					</td>
				</tr>
				<tr>
					<th>일정장소</th><!-- 일정장소 -->
					<td class="left">
						<input id="schdul_place" name="schdul_place" class="form-control" title="일정장소" type="text" value="" size="92" maxlength="255">
					</td>
				</tr>
				<tr>
					<th>알람설정</th><!-- 반복구문 -->
					<td class="left">
						<input id="schdul_alarm1" name="schdul_alarm" style="margin-left:10px" type="radio" value="N">사용하지 않음<!-- 매일 -->
						<input id="schdul_alarm2" name="schdul_alarm" style="margin-left:10px" type="radio" value="Y">사용<!-- 매주 -->
					</td>
				</tr>
				<tr>
					<th>날짜/시간</th><!-- 날짜/시간 -->
					<td class="left">
						<input id="schdul_date" name="schdul_date" style="width:98px" title="일정시작일자" type="text" value="${schdul_date}" size="10" maxlength="10" readonly>
						
						<select id="schdul_bgnDeHH" name="schdul_bgnDeHH" style="margin-left:10px" title="일정시작 시 선택">
							<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
						</select>시<!-- 시 -->
						<select id="schdul_bgnDeMM" name="schdul_bgnDeMM" title="일정시작 분 선택">
							<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
						</select>분<!-- 분 -->
						~
						<select id="schdul_endDeHH" name="schdul_endDeHH" title="일정종료 시 선택">
							<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
						</select>시<!-- 시 -->
						<select id="schdul_endDeMM" name="schdul_endDeMM" title="일정종료 분 선택">
							<option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
						</select>분<!-- 분 -->
					</td>
				</tr>
			
			</tbody>
			</table>
			
			<!-- 하단 버튼 -->
			<div class="btn" style="position: relative;top: 480px;">
				<input class="s_submit" type="submit" value="저장"><!-- 저장 -->
				<span class="btn_s"><a href="/calendar/schedule.do">목록</a></span><!-- 목록 -->
			</div>
		</div>
		
			<!-- <input name="searchMode" id="searchMode" type="hidden" value="MONTH">
			<input name="year" id="year" type="hidden" value="2019">
			<input name="month" id="month" type="hidden" value="4">
			<input name="week" id="week" type="hidden" value="">
			<input name="day" id="day" type="hidden" value="">
			<input name="schdulBgnDe" id="schdulBgnDe" type="hidden">
			<input name="schdulEndDe" id="schdulEndDe" type="hidden">
			<input name="cmd" id="cmd" type="hidden" value="save"> -->
		</form>
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


<script>



</script>

</body>
</html>