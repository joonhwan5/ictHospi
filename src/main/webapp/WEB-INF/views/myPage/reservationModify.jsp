<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<%@include file="../include/myPageSide.jsp"%>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main clearfix">
			<h1>진료 예약 정보</h1>
			<hr>
			<div class="reservation-main" style="z-index: 4">
				<div class="reservation clearfix">
					<h4>예 약 수 정</h4>
					<div class="reserv-calendar left">
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
					<div class="reserv-pickup left">
						<div class="reserv-squares">
						    <div class="reserv-square1"></div>
						    <span>: 예약 가능</span>
						    <br>
						    <div class="reserv-square2"></div>
						    <span>: 예약 불가</span>
						 </div>
						<button value="8">오전 8시</button>
						<button value="9">오전 9시</button>
						<button value="10">오전 10시</button> <br>
						<button value="11">오전 11시</button>
						<button value="12">오후 12시</button>
						<button value="13">오후 1시</button> <br>
						<button value="14">오후 2시</button>
						<button value="15">오후 3시</button>
						<button value="16">오후 4시</button>
						<button class="active-pick" value="-1">이용 안함</button>
					</div>
					
					<form action="${pageContext.request.contextPath}/myPage/modifyReservation" id="modify-modify-form" class="reserv-info left" method="post">
						<h4 class="page-header">진료예약 정보</h4>
						<h5 class="page-header">예약번호 : <span>${reservInfo.rvNo}</span></h5>
						<h5 class="page-header">진료과 : <span>${reservInfo.medicalDepartment}</span></h5>
						<h5 class="page-header doctor-name">담당의사 : <span>${reservInfo.doctorName}</span></h5>
						<h5 class="page-header reserve-date">진료날짜 : <span></span></h5>
						<h5 class="page-header reserve-time">진료시간 : <span></span></h5>
						<h5 class="page-header pickup-time hidden">픽업시간 : <span></span></h5>
						<button type="button" id="reserv-modify-btn">수 정 하 기</button>
						<button type="button" id="reserv-modify-prev-btn" class="prev1">뒤 로 가 기</button>
						
						<input type="hidden" class="reserv-form-input-rvNo" name="rvNo" value="${reservInfo.rvNo}">
						<input type="hidden" name="medicalDepartment" value="${reservInfo.medicalDepartment}">
						<input type="hidden" class="reserv-form-input-doctorNo" name="doctorNo" value="${reservInfo.doctorNo}">
						<input type="hidden" class="reserv-form-input-date" name="rvDate">
						<input type="hidden" class="reserv-form-input-time" name="rvTime">
						<input type="hidden" class="reserv-form-input-pick" name="pickUpTime" value="-1">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	//예약 수정
	$('.reservation-main').css('position', 'relative');
	$('.reservation-main').css('display', 'block');		
	$('.reserv-calendar').css('display', 'block');
	
	let calendarDate = new Date();
	let calendarLastDate = new Date(calendarDate.getFullYear(), calendarDate.getMonth()+1, 0);
	console.log("lastday = " + calendarLastDate);
	
	$('.calendar-year').html(calendarDate.getFullYear());
	
	if(calendarDate.getDate() == calendarLastDate){
		if(calendarDate.getMonth()+2 == 13) {
			$('.calendar-year').html(calendarDate.getFullYear()+1);
			$('.calendar-month').html('1');
		} else {
			$('.calendar-month').html(calendarDate.getMonth()+2);		
		}
	} else {
		$('.calendar-month').html(calendarDate.getMonth()+1);
	}
	getCalendar($('.calendar-year').html(), $('.calendar-month').html());
	//예약 날짜 선택
	$('.calendar-remove-row').on('click', '.reservatable', function(e) {
		$('#active-next-btn').remove();
		$('.reservatable').css('background', 'skyblue');
		$('.calendar-time-check').remove();
		$('.reserve-date > span').html($(this).attr('value'));
		$('.reserv-form-input-date').val($('.reserve-date > span').html());
		
		let id = '${login}';
		let rvDate = $('.reserve-date > span').html();
		let doctorNo = $('.reserv-form-input-doctorNo').val();
		let modify = '${reservInfo.rvDate}' == rvDate ? 'yes' : 'no';
		
		$(this).css('background', 'orange');
		
		if(($(this).attr('value').split('. '))[1] > $('.calendar-month').html()) {
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
			
			setTimeout(() => $('button[value="' + $(this).attr('value') + '"]').css('background', 'orange'), 10);
			$('.reserv-form-input-time').val('');
			$('.reserve-time > span').html('');
		} else if(($(this).attr('value').split('. '))[1] < $('.calendar-month').html()){
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
			setTimeout(() => $('button[value="' + $(this).attr('value') + '"]').css('background', 'orange'), 10);
			$('.reserve-time > span').html('');
			$('.reserv-form-input-time').val('');
		}
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/myPage/getTime',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				'id': id,
				'rvDate': rvDate,
				'doctorNo': doctorNo,
				'modify': modify
			}),
			success: function(result) {
				
				const timeList = result.map((i) => Number(i));
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
				if($('.reserv-form-input-date').val() == '${reservInfo.rvDate}'){
					$('.reservTimeBtn[value="${reservInfo.rvTime>12 ? reservInfo.rvTime-12 : reservInfo.rvTime}"]').attr('disabled', false);
					$('.reservTimeBtn[value="${reservInfo.rvTime>12 ? reservInfo.rvTime-12 : reservInfo.rvTime}"]').css('background', 'skyblue');
				}
				if(timeList.length == 9) {
					alert('해당날짜에 이미 예약을 완료하였습니다.');
				}
			},
			error: function(error, status) {
				console.log(error);
				console.log(status);
				alert('시간리스트 못불러옴');
				return;
			}
		});
	});
	
	//시간 선택
	$('.reserv-calendar').on('click', '.reservTimeBtn', function() {
		$('#active-next-btn').remove();
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
		$('.reserv-form-input-time').val(reservTime);
		$('#reserv-modify-btn').css('display', 'block');
		$(this).css('background', 'orange');
		$('.reserv-calendar').append('<button type="button" id="active-next-btn" class="btn">다음</button>');
	});
	
	//픽업 버튼 이벤트
	$('.reserv-pickup').on('click', 'button', function() {
		$('#active-reserv-btn').remove();
		$('.reserv-pickup > button[style="background: orange;"]').css('background', 'skyblue');
		$('.reserv-form-input-pick').val($(this).val());
		$('.pickUp-time > span').html($(this).html());
		$(this).css('background', 'orange');
		$('#reserv-modify-btn').css('display', 'block');
		flag = false;
		$('#active-prev-btn').before('<button type="button" id="active-reserv-btn" class="btn">예약</button>');
	});
	
	//예약 버튼
	let flag = true;
	$('#reserv-modify-btn').click(function() {
		if(confirm('예약하신 내용이 맞습니까??')) {
			if(flag && confirm('픽업 시스템을 이용하시겠습니까??')) {
				$('.reserv-info').attr('style', '');
				$('#reserv-modify-prev-btn').css('display', 'block');
				$(this).css('display', 'none');
				$('.hidden').attr('class', 'page-header pickUp-time');
				$('.reserv-pickup > button').css('background', 'skyblue');
				$('.reserv-calendar').css('display', 'none');
				
				$(".reserv-pickup > button").each(function( index, element ) {
				     if(+element.value >= +$('.reserv-form-input-time').val()) {
				    	 element.disabled = 'true';
				    	 element.style.background = 'buttonface';
				     }
				   });
				
				$('.reserv-pickup').css('display', 'block');
				$('.reservation').append('<button type="button" id="active-prev-btn" class="btn">뒤로</button>');
				
			} else {
				$('.reserv-info').submit();
			}
		} else {
			 
		}
	});
	
	//반응형 다음 버튼
	$('.reservation-main').on('click', '#active-next-btn', function() {
		$('.reserv-calendar').css('display', 'none');
		$('.reserv-info').css('display', 'block');
		$('#reserv-modify-prev-btn').css('display', 'block');
	});
	
	//반응형 뒤로가기
	$('.reservation-main').on('click', '#active-prev-btn', function() {
			$('#reserv-modify-prev-btn').click();
	});
	
	//반응형 예약하기
	$('.reservation').on('click', '#active-reserv-btn', function() {
		$('#reserv-modify-btn').click();
	});
	
	//뒤로 가기 버튼
	$('#reserv-modify-prev-btn').click(function(e) {
		$('.reservatable').css('background', 'skyblue');
		$('.reserv-calendar').css('display', 'block');
		$('.reserve-date > span').html('');
		$('.reserv-form-input-date').val('');
		$('.reserve-time > span').html('');
		$('.reserv-form-input-time').val('');
		$('#reserv-modify-btn').css('display', 'none');
		$('.pickUp-time').attr('class', 'page-header pickUp-time hidden');
		$('.reserve-time > span').html('');
		$('.reserv-form-input-pick').val('');
		$('.calendar-time-check').remove();
		$('#reserv-next-btn').css('display', 'none');
		$('.pickUp-time').attr('class', 'page-header pickUp-time hidden');
		$('.reserv-pickup').css('display', 'none');
		$('.pickUp-time > span').html('');
		$('.reserv-form-input-pick').val('-1');
		$('.reserv-pickup > button').attr('disabled', false);
		$(this).css('display', 'none');
		flag = true;
		
		if(window.innerWidth <= 1060){
			$('.reserv-info').css('display', 'none');
			$('#active-prev-btn').remove();
			$('#active-next-btn').remove();
			$('#active-reserv-btn').remove();
		}
		
	});
	
	
	
	//캘린더 불러오기
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
					
						//이번 달  && 오늘보다 큰 날 && 오늘날 + 21일 보다 같거나 작은날
					if((((calendarList[i-1].split('.'))[1] == toMonth) && (+((calendarList[i-1].split('.'))[2]) > +toDate) && (+((calendarList[i-1].split('.'))[2]) <= +(+toDate + 21)))
							|| (((calendarList[i-1].split('.'))[1] == +toMonth + 1) && (+toDate + 21) - new Date(year, toMonth, 0).getDate() >= (calendarList[i-1].split('.'))[2])){
						div += ` reservatable`;
					}
					
					div += `" value="` + (calendarList[i-1].split('.'))[0] + '. ' + (calendarList[i-1].split('.'))[1] + '. ' + (calendarList[i-1].split('.'))[2] + `">` + (calendarList[i-1].split('.'))[2] + `</button>`;
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
		$('#active-next-btn').remove();
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
		$('#active-next-btn').remove();
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
	
	$(document).ready(function() {
		if('${reservInfo.rvNo}' === '') {
			alert('잘못된 접근입니다.');
			location.href = history.back();
			return;
		}
	});
	
</script>