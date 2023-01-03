<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>마이페이지</h2></li>
				<li><a href="#">내 정보 수정</a></li>
				<li><a href="#">회원탈퇴</a></li>
				<li><h2>예약</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/myPage/reservation">예약현황<span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main clearfix">
			<h1 class="page-header">진료 예약 정보</h1>
			<div class="reservation-detail-body1">
				<div class="reserv-calendar left">
					 <button type="button" class="calendar-left">&lt;</button><span class="calendar-year">2023</span><span>.</span><span class="calendar-month">1</span><button type="button" class="calendar-right">&gt;</button>
					 
					 <div class="calendar-row clearfix">
						 <div class="left">일</div>
						 <div class="left">월</div>
						 <div class="left">화</div>
						 <div class="left">수</div>
						 <div class="left">목</div>
						 <div class="left">금</div>
						 <div class="left">토</div>
					 </div>
					 <div class="calendar-remove-row">
					 
					 </div>
				</div>
			</div>
			<div class="reservation-detail-body2">
				<h5 class="page-header">예약번호:<span>${reservInfo.rvNo}</span></h5>
				<h5 class="page-header">진료과:<span>${reservInfo.medicalDepartment}</span></h5>
				<h5 class="page-header">담당의사:<span>${reservInfo.doctorName}</span></h5>
				<h5 class="page-header">환자이름:<span>${reservInfo.userName}</span></h5>
				<h5 class="page-header">진료날짜:<span>${reservInfo.rvDate}</span></h5>
				<h5 class="page-header">진료시간:<span>${reservInfo.rvTime}</span></h5>
				<h5 class="page-header">픽업시간:<span>${reservInfo.pickUpTime}</span></h5>
				<button type="button" class="reserv-modify-btn">수정하기</button>
			</div>
			<form action="${pageContext.request.contextPath}/myPage/modifyReservation" id="modify-reserv-form" method="post">
				
				<input type="hidden" name="rvNo" value="${reservInfo.rvNo}">
				<input type="hidden" class="modifyRvDate" name="rvDate">
				<input type="hidden" class="modifyRvTime" name="rvTime">
				
			</form>
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
		$('.calendar-time-check').remove();
		$('.modifyRvDate').val($(this).html());
		
		$('.reservation-detail-body2').children()[4].firstElementChild.textContent = $(this).html();
		
		let doctorName = $('.reservation-detail-body2').children()[2].firstElementChild.textContent;
		let rvDate = $(this).html();
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
				
				let div = '';
				div +=
					`<div class="calendar-remove-row calendar-time-check clearfix">`;
					for(let i = 9; i < 13; i++){
						div += `<button type='button' class="reservTimeBtn left" value="` + i;
						
						if(timeList.includes(i)) {
							div += `" disabled="true`;
						}
						
						div += `">오전 ` + i + `시</button>`;
					}
					
					for(let i = 1; i < 6; i++) {
						div += `<button type='button' class="reservTimeBtn left" value="` + i;
						
						let stringI = i;
						console.log(stringI.toString);
						if(timeList.includes(stringI)) {
							div += `" disabled="true`;
						}
						
						div += `">오후 ` + i + `시</button>`;
					}
				div += `</div>`;
				$('.reserv-calendar').append(div);
				
				
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
		
		$('.reservation-detail-body2').children()[5].firstElementChild.textContent = $(this).html();
		
		let reservTime = ($(this).html());
		reservTime = reservTime.substring(3,5);
		if(reservTime.substring(1,2) === '시') {
			reservTime = $(this).html().substring(3,4);
		}
		if(reservTime-6 < 0) {
			reservTime = +reservTime + +12;
		}
		console.log(reservTime);
		$('.modifyRvTime').val(reservTime);
		$('#reserv-next-btn').css('display', 'block');
	});
	
	$('.reserv-modify-btn').click(function(){
		if(confirm('수정하시겠습니까?')){
			$('#modify-reserv-form').submit();
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
					div += `<button type="button" class="left`;
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
	
</script>