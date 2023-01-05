<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<%@include file="../include/myPageSide.jsp"%>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main clearfix">
			<h1 class="page-header">진료 예약 정보</h1>
			<div class="reservation-main">
			<div class="reservation clearfix">
				<h4>예 약 수 정</h4>
				<div class="reserv-calendar left">
				<!-- 
					<input type="date" class="reserv-date-input">
					
					<select class="reserv-time-select">
							<option>시간을 선택하세요</option>
						<optgroup label="오전 시간">
							<option>오전 9시</option>
							<option>오전 10시</option>
							<option>오전 11시</option>
							<option>오후 12시</option>
						</optgroup>
						<optgroup label="오후 시간">
							<option>오후 2시</option>
							<option>오후 3시</option>
							<option>오후 4시</option>
							<option>오후 5시</option>
						</optgroup>
					</select>
					 -->
					 
					 <button type="button" class="calendar-left">&lt;</button>&emsp;<span class="calendar-year">2023</span><span> 년&emsp;</span><span class="calendar-month">1</span> 일&emsp;<button type="button" class="calendar-right">&gt;</button>
					 
					 <div class="reserv-squares">
					    <div class="reserv-square1"></div>
					    <span>: 예약 가능</span>
					    <br>
					    <div class="reserv-square2"></div>
					    <span>: 예약 불가</span>
					 </div>
					
					 <div class="calendar-row calendar-day-row clearfix">
						 <div class="left sunday">일</div>
						 <div class="left">월</div>
						 <div class="left">화</div>
						 <div class="left">수</div>
						 <div class="left">목</div>
						 <div class="left">금</div>
						 <div class="left saturday">토</div>
					 </div>
					 <div class="calendar-remove-row">
					 
					 </div>
				 	
					 
				</div>
				<form action="${pageContext.request.contextPath}/myPage/modifyReservation" id="modify-modify-form" class="reserv-info left" method="post">
					<h4 class="page-header">진료예약 정보</h4>
					<h5 class="page-header">예약번호 : <span>${reservInfo.rvNo}</span></h5>
					<h5 class="page-header">진료과 : <span>${reservInfo.medicalDepartment}</span></h5>
					<h5 class="page-header doctor-name">담당의사 : <span>${reservInfo.doctorName}</span></h5>
					<h5 class="page-header">환자이름 : <span>${reservInfo.userName}</span></h5>
					<h5 class="page-header reserve-date">진료날짜 : <span></span></h5>
					<h5 class="page-header reserve-time">진료시간 : <span></span></h5>
					<h5 class="page-header pickup-time">픽업시간 : <span></span></h5>
					<button type="button" id="reserv-modify-btn">예 약 하 기</button>
					
					<input type="hidden" class="reserv-form-input-rvNo" name="rvNo" value="${reservInfo.rvNo}">
					<input type="hidden" class="reserv-form-input-date" name="rvDate">
					<input type="hidden" class="reserv-form-input-time" name="rvTime">
					<input type="hidden" class="reserv-form-input-pick" name="pickUpTime">
				</form>
			</div>
		</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	$('.reserv-calendar').css('display', 'block');
	
	let now = new Date();
	let year = now.getFullYear();
	let month = now.getMonth()+1;
	
	getCalendar(year, month);
	
	$('.calendar-remove-row').on('click', '.reservatable', function(e) {
		$('.reservatable').css('background', 'skyblue');
		$('.calendar-time-check').remove();
		$('.reserve-date > span').html($('.calendar-year').html()+'. '+$('.calendar-month').html()+'. '+$(this).html());
		$('.reserv-form-input-date').val($('.reserve-date > span').html());
		
		let doctorName = $('.doctor-name > span').html();
		let rvDate = $('.reserve-date > span').html();
		$.ajax({
			url: '${pageContext.request.contextPath}/myPage/getTime',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				'doctorName': doctorName,
				'rvDate': rvDate
			}),
			success: function(result) {
				console.log(result);
				
				const timeList = result.map((i) => Number(i));
				console.log(timeList);
				let div = '';
				div +=
					`<div class="calendar-time-check"><div class="am-box clearfix"><h4 style="text-align:left;">오전</h4>`;
					for(let i = 9; i < 12; i++){
						div += `<button type='button' class="reservTimeBtn reservatable left" value="` + i;
						
						if(timeList.includes(i)) {
							div += `" disabled="true" style="background: #E6E2E5`;
						}
						
						div += `">오전 ` + i + `시</button>`;
					}
					
					div += `</div><div class="pm-box clearfix"><h4 style="text-align:left;">오후</h4><button type='button' class="reservTimeBtn reservatable left" value="12"`;
					
					if(timeList.includes(12)) {
						div += `" disabled="true" style="background: #E6E2E5`;
					}
					
					div += `">오후 12시</button>`;
					
					for(let i = 1; i < 6; i++) {
						div += `<button type='button' class="reservTimeBtn reservatable left" value="` + i;
						
						if(timeList.includes(i+12)) {
							div += `" disabled="true" style="background: #E6E2E5`;
						}
						
						div += `">오후 ` + i + `시</button>`;
					}
				div += `</div></div>`;
				$('.reserv-calendar').append(div);
				
				
			},
			error: function(error, status) {
				console.log(error);
				console.log(status);
				alert('시간리스트 못불러옴');
				return;
			}
		});
		
		
		$(this).css('background', 'orange');
		
		
	
		});
	
	//시간 선택
	$('.reserv-calendar').on('click', '.reservTimeBtn', function() {
		$('.reservTimeBtn').css('background', 'skyblue');
		$('.reservTimeBtn[disabled="true"]').css('background', '#E6E2E5');
		$('.reserve-time > span').html($(this).html());
		let reservTime = ($(this).html());
		reservTime = reservTime.substring(3,5);
		if(reservTime.substring(1,2) === '시') {
			reservTime = $(this).html().substring(3,4);
		}
		if(reservTime-6 < 0) {
			reservTime = +reservTime + +12;
		}
		console.log(reservTime);
		$('.reserv-form-input-time').val(reservTime);
		$('#reserv-modify-btn').css('display', 'block');
		
		$(this).css('background', 'orange');
	});
	
	$('#reserv-modify-btn').click(function(){
		if(confirm('수정하시겠습니까?')){
			$('#modify-modify-form').submit();
		}
	});	
	
	
	function getCalendar(year, month) {
		document.querySelector('.calendar-remove-row').textContent = '';
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/myPage/getCalendar',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				'year': year,
				'month': month
			}),
			success: function(result) {
				const calendarList = result;
				let today = new Date();
				let toMonth = today.getMonth()+1;
				let toDate = today.getDate();
				
				let div = '';
				for(let i = 1; i < calendarList.length; i++ ){
					if(i%7==1) {
						div += `<div class="calendar-row clearfix">`;
					}
					div += `<button type="button" class="left calendarBtn`;
					if(((calendarList[i-1].split('.'))[1] == toMonth) && (+((calendarList[i-1].split('.'))[2]) > +toDate) && (+((calendarList[i-1].split('.'))[2]) <= +(+toDate + 21)) && (+month == +toMonth)){
						div += ` reservatable`;
					}
					
					div += `">` + (calendarList[i-1].split('.'))[2] + `</button>`;
					if(i%7 == 0) {
						div += `</div>`;
					}
				}
		 	
				$('.calendar-remove-row').append(div);
			},
			error: function(error, status) {
				console.log(error);
				console.log(status);
				alert('리스트 못불러옴');
			}
		});
	}
	
	$('.calendar-left').click(function() {
		$('.calendar-time-check').remove();
		let month = $('.calendar-month').html();
		month = month - 1;
		let year = $('.calendar-year').html();
		if(month == 0) {
			month = 12;
			year = year - 1;
			$('.calendar-year').html(year);
		}
		$('.calendar-month').html(month);
		getCalendar(year, month);
	});
	
	$('.calendar-right').click(function() {
		$('.calendar-time-check').remove();
		let month = $('.calendar-month').html();
		month = +month + 1;
		let year = $('.calendar-year').html();
		if(month == 13) {
			month = 1;
			year = +year + 1;
			$('.calendar-year').html(year);
		}
		$('.calendar-month').html(month);
		
		getCalendar(year, month);
	});
	
</script>