<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>

<script src="${pageContext.request.contextPath}/js/popup.js"></script>
<div class="main-banner">
	<img alt="" src="${pageContext.request.contextPath}/img/main1.jpg">
</div>


<main class="container home-container">
	<c:if test="${login!=null}">
		<div class="reservation-main">
			<div class="reservation clearfix">
				<h4>예 약 하 기</h4>
				<div class="hospi-category left">
					<p>
						<a>내과</a> | <a>외과</a> | <a>피부과</a>
					</p>
				</div>
				<div class="doctor-list left"></div>
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
					<button value="8">오전 8시</button>
					<button value="9">오전 9시</button>
					<button value="10">오전 10시</button> <br>
					<button value="11">오전 11시</button>
					<button value="12">오후 12시</button>
					<button value="13">오후 1시</button> <br>
					<button value="14">오후 2시</button>
					<button value="15">오후 3시</button>
					<button value="16">오후 4시</button>
				</div>
				
				<form action="${pageContext.request.contextPath}/myPage/reservationRegist" class="reserv-info left" method="post">
					<h4 class="page-header">진료예약 정보</h4>
					<h5 class="page-header subject">진료과 : <span></span></h5>
					<h5 class="page-header doctor-name">담당의사 : <span></span></h5>
					<h5 class="page-header reserve-date">진료날짜 : <span></span></h5>
					<h5 class="page-header reserve-time">진료시간 : <span></span></h5>
					<h5 class="page-header pickUp-time hidden">픽업시간 : <span></span></h5>
					<button type="button" id="reserv-prev-btn" class="prev1">뒤 로 가 기</button>
					<button type="button" id="reserv-next-btn">예 약 하 기</button>

					<input type="hidden" class="reserv-form-input-userId" name="userId" value="${login}">
					<input type="hidden" class="reserv-form-input-doctor" name="doctorNo">
					<input type="hidden" class="reserv-form-input-date" name="rvDate">
					<input type="hidden" class="reserv-form-input-time" name="rvTime">
					<input type="hidden" class="reserv-form-input-pick" value="-1" name="pickUpTime">
				</form>
			</div>
		</div>
	</c:if>
	
	<div id="hospi-carousel" class="carousel slide clearfix" data-ride="carousel">
		<h1 class="text-center">ict병원 BEST 의료진</h1>
		<!-- Indicators -->
		<c:if test="${doctorCarousel.size() > 0}">
			<ol class="carousel-indicators">
				<c:forEach var="i" begin="0" end="${doctorCarousel.size()-1}">
					<li data-target="#hospi-carousel" data-slide-to="${i}"></li>
				</c:forEach>
			</ol>
			
			<div class="carousel-inner" role="listbox">
				<c:forEach var="i" items="${doctorCarousel}">
					<div data-spy="affix" data-offset-top="60" data-offset-bottom="200" class="item">
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
			<div class="carousel-inner carousel-side carousel-left left" role="listbox">
				<a class="left carousel-control" href="#hospi-carousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
			</div>
			<div class="carousel-inner carousel-side carousel-right right" role="listbox">
				<a class="right carousel-control" href="#hospi-carousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</c:if>
		<c:if test="${doctorCarousel.size() == 0}">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div data-spy="affix" data-offset-top="60" data-offset-bottom="200" class="item">
					<img src="<c:url value='${pageContext.request.contextPath}/img/ogu-logo.PNG' />" alt="">
					<div class="container">
						<div class="carousel-caption">
							<h1>등록된 의사가 없습니다.</h1>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>

	<div class="focus">
		<h1>병원 소식</h1>
		<div class="main-news-div clearfix">
			<div class="focus-img">
				<img class="news-img"
					src="${pageContext.request.contextPath}/news/display?fileLoca=${homeNews[0].fileLoca}&fileName=${homeNews[0].fileName}"
					alt="">
			</div>
			<div class="focus-news">
				<div class="newsMainCountBox clearfix">
					<h2 class="left">주요기사</h2>
					<h2 class="right">/5</h2>
					<h2 class="right rightCount">1</h2>
				</div>
				<c:forEach var="i" items="${homeNews}" begin="0" end="4">
					<h2 class="my-news-article ${i.fileLoca} ${i.fileName} ${i.bno}">${i.title}</h2>
				</c:forEach>
			</div>
		</div>
	</div>
</main>

<%@include file="include/footer.jsp"%>
<script>
	
	let msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	
	// 뉴스기사 리스트
	$('.my-news-article').click(function(e) {
		$('.my-news-article').attr('style', '');
		
		$(this).css('background', 'black');
		$(this).css('color', 'white');
		
		const fileLoca = e.target.classList[1];
		const fileName = e.target.classList[2];
		const bno = e.target.classList[3];
		
		$('.news-img').attr('src', '${pageContext.request.contextPath}/news/display?fileLoca='+fileLoca+'&fileName='+fileName);
		$('.news-img').attr('class', 'news-img '+bno);
		
			
		let index = $(this).index();
		$('.rightCount').html(index);
		
	});
	
	$('.news-img').click(function(e) {
		const bno = e.target.classList[1];
		location.href='${pageContext.request.contextPath}/news/newsDetail/'+bno;
	});
	
	
	
	
	//캐러셀
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
						div += doctorList[i].doctorNo + `"><span class="doctor-listone">`+ doctorList[i].doctorName +`</span></div>`;
					}
					$('.doctor-list').append(div);
				},
				error: function() {
					alert('리스트 못불러옴');
					return;
				}
			}); // end ajax

			$('#reserv-prev-btn').css('display', 'block');
		});
		
		//의사 선택
		$('.doctor-list').on('click', 'div', function(e) {
			$('#reserv-prev-btn').attr('class', 'prev2');
			$('.doctor-name > span').html(($(this).children()[0]).textContent);
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
		
		//예약 날짜 선택
		$('.calendar-remove-row').on('click', '.reservatable', function(e) {
			
			$('.reservatable').css('background', 'skyblue');			
			
			
			$('#reserv-next-btn').css('display', 'none');
			
			
			$('.calendar-time-check').remove();
			$('.reserve-date > span').html($(this).attr('value'));
			$('.reserv-form-input-date').val($(this).attr('value'));
			
			let doctorName = $('.doctor-name > span').html();
			let rvDate = $('.reserve-date > span').html();
			
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
					'doctorName': doctorName,
					'rvDate': rvDate
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
					
					
				},
				error: function(error, status) {
					console.log(error);
					console.log(status);
					alert('시간리스트 못불러옴');
					return;
				}
			});
		});
		
		
		
		//예약 시간 선택
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
			$('.reserv-form-input-time').val(reservTime);
			$('#reserv-next-btn').css('display', 'block');
			
			$(this).css('background', 'orange');
		});
		
		
		
		//캘린더 월 선택 좌측버튼
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
			$('#reserv-next-btn').css('display', 'none');
			$('.reserve-date > span').html('');
			$('.reserv-form-input-date').val('');
			
			$('.reserve-time > span').html('');
			$('.reserv-form-input-time').val('');
			getCalendar(year, month);
		});
		
		
		//캘린더 월 선택 우측버튼
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
			$('#reserv-next-btn').css('display', 'none');
			$('.reserve-date > span').html('');
			$('.reserv-form-input-date').val('');
			
			$('.reserve-time > span').html('');
			$('.reserv-form-input-time').val('');
			getCalendar(year, month);
		});
		
		
		//픽업 버튼 이벤트
		$('.reserv-pickup').on('click', 'button', function() {
			$('.reserv-form-input-pick').val($(this).val());
			$('.pickUp-time > span').html($(this).html());
			flag = false;
		});
		
		
		//예약 버튼
		let flag = true;
		$('#reserv-next-btn').click(function() {
			if(confirm('예약하신 내용이 맞습니까??')) {
				if(flag && confirm('픽업 시스템을 이용하시겠습니까??')) {
					$('.hidden').attr('class', 'page-header pickUp-time');
					$('.reserv-calendar').css('display', 'none');
					$('.reserv-pickup').css('display', 'block');
					
				} else {
					$('.reserv-info').submit();
				}
			} else {
				 
			}
		});

		//예약 끝
		
		
		//뒤로 가기 버튼
		$('#reserv-prev-btn').click(function(e) {
			if($(this).hasClass('prev1')) {
				
				$('.reserv-info > .subject > span').html('');
				$('.hospi-category').css('display', 'block');
				$('.doctor-list').css('display', 'none');
				$('.doctor-list').html('');
				$(this).css('display', 'none');
				return;
			} else if($(this).hasClass('prev2')) {
				$(this).attr('class', 'prev1');
				
				
				$('.doctor-name > span').html('');
				$('.doctor-list').css('display', 'block');
				$('.reserv-form-input-doctor').val('');
				$('.reserv-calendar').css('display', 'none');
				$('.calendar-remove-row').html('');
				$('.calendar-time-check').remove();
				
				$('.reserve-date > span').html('');
				$('.reserv-form-input-date').val('');
				
				$('.reserve-time > span').html('');
				$('.reserv-form-input-time').val('');
				$('#reserv-next-btn').css('display', 'none');
				$('.pickUp-time').attr('class', 'page-header pickUp-time hidden');
				$('.reserv-pickup').css('display', 'none');
				$('.reserve-time > span').html('');
				$('.reserv-form-input-pick').val('');
				flag = true;
				return;
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
	}); // jQuery 끝

	
	
	
	
	//팝업 이벤트
	window.onload = function(){
		
		window.open('${pageContext.request.contextPath}/util/ictChatBot', 'ictChatBot', 'width=520, height=800, left=300, top=300');
		
		if(!getCookie('popup')){
			window.open('${pageContext.request.contextPath}/util/popup', 'popup-test', 'width=350, height=400, left=100, top=100');
		}
	}
	
	 
	
	
	//스크롤 이벤트
	const row1 = document.querySelector('.reservation-main');
	const row2 = document.querySelector('#hospi-carousel');
	const row3 = document.querySelector('.focus');
	
	let absoluteTop1;
	if(row1 != null) {
		absoluteTop1 = window.pageYOffset + row1.getBoundingClientRect().top - 100;	
	}
	const absoluteTop2 = window.pageYOffset + row2.getBoundingClientRect().top - 100;
	const absoluteTop3 = window.pageYOffset + row3.getBoundingClientRect().top - 100;
	
	document.addEventListener("wheel", (event) => {
		event.preventDefault();
		
		
		if(event.deltaY < 0) {
			//휠 업
			console.log('휠 업');
			if(row1 != null){
				if($(window).scrollTop() < absoluteTop2 + 1){
					window.scrollTo({top:absoluteTop1, left: 0, behavior: 'smooth'});
				} else if($(window).scrollTop() > absoluteTop2 && $(window).scrollTop() < absoluteTop3 + 1) {
					window.scrollTo({top:absoluteTop2, left: 0, behavior: 'smooth'});
				} else {
					window.scrollTo({top:absoluteTop3, left: 0, behavior: 'smooth'});
				}
			} else {
				if($(window).scrollTop() < absoluteTop3 + 1){
					window.scrollTo({top:absoluteTop2, left: 0, behavior: 'smooth'});
				} else {
					window.scrollTo({top:absoluteTop3, left: 0, behavior: 'smooth'});
				}
			}
		}

		if(event.deltaY > 0) {
			//휠 다운
			console.log('휠 다운');
			if(row1 != null){
				if($(window).scrollTop()>=0 && $(window).scrollTop() < absoluteTop2 - 1){
					window.scrollTo({top:absoluteTop2, left: 0, behavior: 'smooth'});
				} else if($(window).scrollTop() > absoluteTop2 - 1 && $(window).scrollTop() < absoluteTop3 - 1) {
					window.scrollTo({top:absoluteTop3, left: 0, behavior: 'smooth'});
				} else {
					window.scrollTo({top:5000, left: 0, behavior: 'smooth'});
				}
			} else {
				if($(window).scrollTop() < absoluteTop3 - 1){
					window.scrollTo({top:absoluteTop3, left: 0, behavior: 'smooth'});
				} else {
					window.scrollTo({top:5000, left: 0, behavior: 'smooth'});
				}
			}
		}
		
	},{passive:false});
	
	
</script>