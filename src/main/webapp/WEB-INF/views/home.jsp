<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="include/header.jsp"%>

<c:if test="${login==null}">
	<div class="main-banner">
		<img alt="" src="${pageContext.request.contextPath}/img/main1.jpg">
	</div>
</c:if>

<main class="container">
	<c:if test="${login!=null}">
		<div>
			<div class="reservation clearfix">
				<div class="hospi-category left">
					<p><a>내과</a> | <a>외과</a> | <a>피부과</a></p>
				</div>
				<div class="doctor-list left">
				</div>
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
				<form action="${pageContext.request.contextPath}/myPage/reservationRegist" class="reserv-info left" method="post">
					<h4 class="page-header">진료예약 정보</h4>
					<h5 class="page-header subject">진료과:<span></span></h5>
					<h5 class="page-header doctor-name">담당의사:<span></span></h5>
					<h5 class="page-header reserve-date">진료날짜:<span></span></h5>
					<h5 class="page-header reserve-time">진료시간:<span></span></h5>
					<button type="button" id="reserv-next-btn">예약하기</button>
					
					<input type="hidden" class="reserv-form-input-userId" name="userId" value="${login}"> <!-- 세션에서 가져오기 -->
					<input type="hidden" class="reserv-form-input-doctor" name="doctorNo"> <!-- doctor list 불러올 때 값 넣기 -->
					<input type="hidden" class="reserv-form-input-date" name="rvDate">
					<input type="hidden" class="reserv-form-input-time" name="rvTime">
					<input type="hidden" class="reserv-form-input-pick" value="-" name="pickUpTime">
				</form>
			</div>
		</div>
	</c:if>

	<div id="hospi-carousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->

		<ol class="carousel-indicators">
			<c:forEach var="i" begin="0" end="${doctorCarousel.size()-1}">
				<li data-target="#myCarousel" data-slide-to="${i}"></li>
			</c:forEach>
		</ol>
		<div class="carousel-inner" role="listbox">
			<c:forEach var="i" items="${doctorCarousel}">
				<div class="item">
					<img src="<c:url value='${pageContext.request.contextPath}/admin/doctorDisplay?fileLoca=${i.fileLoca}&fileName=${i.fileName}' />" alt="">
					<div class="container">
						<div class="carousel-caption">
							<h1>${i.doctorName}</h1>
							<p>${i.medicalDepartment}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<a class="left carousel-control" href="#hospi-carousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#hospi-carousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div>
		<div class="focus">
			<h1>병원 소식</h1>
			<div class="main-news-div clearfix">
				<div class="focus-img">
					<img class="news-img" src="<c:url value='img/logo.png' />" alt="">
				</div>
				<div class="focus-news">
					<c:forEach var="i" items="${homeNews}" begin="0" end="4">
						<h2><a href="${pageContext.request.contextPath}/news/newsDetail/${i.bno}">${i.title}</a></h2>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</main>

<%@include file="include/footer.jsp"%>
<script>
	
	$('.carousel-indicators').children()[0].setAttribute('class', 'active');
	$('.carousel-inner').children()[0].setAttribute('class', 'item active');
	
	$(document).ready(function() {
		//예약 시스템
		//진료과 선택
		$('.hospi-category > p').on('click', 'a', function(e) {
			e.preventDefault();
			const subject = $(this).html();
			$('.reserv-info > .subject > span').html(subject);
			$('.hospi-category').css('display', 'none');
			$('.doctor-list').css('display', 'block');
			
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/getDoctorList',
				type: 'POST',
				data: subject,
				contentType: 'application/json',
				success: function(result) {
					const doctorList = result;
					let div = '';
					for(let i=0; i < doctorList.length; i++){
						div += `<div class="doctor" value="`;
						div += doctorList[i].doctorNo + `">`+ doctorList[i].doctorName +`</div>`;
					}
					$('.doctor-list').append(div);
				},
				error: function() {
					alert('리스트 못불러옴');
				}
			}); // end ajax
		});
		
		//의사 선택
		$('.doctor-list').on('click', 'div', function(e) {
			$('.doctor-name > span').html($(this).html());
			$('.doctor-list').css('display', 'none');
			$('.reserv-form-input-doctor').val($(this).attr('value'));
			
			$('.reserv-calendar').css('display', 'block');
			let now = new Date();
			let year = now.getFullYear();
			let month = now.getMonth()+1;
			
			getCalendar(year, month);
			/* const time = new Date();
			const year = time.getFullYear();
			const month = time.getMonth() + 1;
			const date = time.getDate();
			const nowTime = year + '-' + month + '-' + date;
			const limitTime = (year + 1) + '-' + month + '-' + date;
			$('.reserv-date-input').attr('value', '날짜를 선택하세요');
			$('.reserv-date-input').attr('min', nowTime);
			$('.reserv-date-input').attr('max', limitTime); */
		});
		
		//날짜 선택
		$('.calendar-remove-row').on('click', '.reservatable', function(e) {
				$('.calendar-time-check').remove();
				$('.reserve-date > span').html($(this).html());
				$('.reserv-form-input-date').val($(this).html());
				
				let doctorName = $('.doctor-name > span').html();
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
			$('#reserv-next-btn').css('display', 'block');
		});
		
		//예약 버튼
		$('#reserv-next-btn').click(function() {
			if(confirm('예약하신 내용이 맞습니까?')) {
				$('.reserv-info').submit();
			}
		});

		//예약 끝
		$('.calendar-left').click(function() {
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

	}); // jQuery 끝
</script>