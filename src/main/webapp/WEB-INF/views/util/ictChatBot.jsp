<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>

* {
	font-size: 16px;
	margin: 0px;
	padding: 0px;
}

html {
	background: #EFFBFB;
}

.clearfix::after {
    content: '';
    display: block;
    clear: both;
}

.left {
	float: left;
}

.right {
	float: right;
}



/*	ChatBot header	*/

.chat-header {
	background: skyblue;
	color: white;
	text-align: center;
	margin: 0 auto;
	height: 50px;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	line-height: 50px;
	min-width: 350px;
}

.chat-header > div {
	font-size: 1.6rem;
	min-width: 350px;
}


/*	Section	*/
.chat-section {
	margin-top: 65px;
	margin-bottom: 140px;
}

.part {
	margin-top: 20px;
	margin-right: 10px;
	width: 100%;
	max-width: 500px;
	min-width: 500px;
}

.part-right {
	max-width: 100%;
}

.part-right > div {
	margin-right: 20px;
}

.part-logo, .part-logo > img {
	width: 60px;
	height: 55px;
}

.part-message {
	width: 70%;
	height: 100%;
}

.textbox {
	width: max-content;
	border-radius: 15px;
	margin-bottom: 10px;
	border: 1px solid black;
	padding: 5px;
	background: white;
	box-sizing: content-box;
}

.textbox-inner {
	width: max-content;
	font-size: 1rem;
	line-height: 1rem;
	padding: 5px;
	text-align: left;
	line-height: 1.5rem;
	box-sizing: content-box;
}

.chat-btn, .chat-btn tr {
	width: 100%;
	text-align: center;
	border-spacing: 0px;
	padding: 0px;
}

.chat-btn td {
	width: 50%;
	font-size: 1rem;
	line-height: 1.5rem;
	padding: 5px;
	border: 1px solid black;
}

.r-t {
	border-radius: 0px 15px 0px 0px;
}

.l-t {
	border-radius: 15px 0px 0px 0px;
}

.top {
	border-radius: 15px 15px 0px 0px;
}

.bot {
	border-radius: 0px 0px 15px 15px;
}

.chat-time {
	color: gray;
}



/*	ChatBot footer	*/
.chat-footer * {
	border: 0px;
}

.chat-footer {
	width: 100%;
	height: 50px;
	line-height: 50px;
	min-width: 350px;
	border: 0px;
	border-top: 1px solid gray;
	position: fixed;
	bottom: 0px;
}

.chat-footer > div{
	height: 100%;
}

.chat-search {
	width: 100%;
	height: 100%;
	text-indent: 10px;
}

.chat-enter-box {
	position: absolute;
	height: 50px;
	bottom: 0px;
	right: 0px;
}

.chat-enter-box a {
	margin-top: 5px;
}



.chat-enter-box a, .chat-enter-box img {
	width: 40px;
	height: 40px;
	display: block;
}

.answer .chat-time {
	text-align: right;
}

.chat-new-btn {
	position: fixed;
	bottom: 65px;
	width: 100%;
	text-align: center;
}

.chat-new-btn > button {
	padding: 10px;
	border-radius: 15px;
}

.chat-new-btn > #newQuestion {
	margin-right: 15px;
}

.text-center {
	text-align: center;
}

</style>

</head>
<body>
	<!-- 헤더 -->
	<header class="chat-header clearfix">
		<div>ict병원 챗봇</div>
	</header>

	<!-- 섹션 -->
	<section class="chat-section clearfix" id="chat-section">
		
		<!-- 한 덩이 -->
		<div class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						안녕하세요 ict병원 챗봇입니다.<br>
						무엇을 도와드릴까요?
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<tr>
						<td class="l-t howCome">오시는 길</td>
						<td class="r-t howReserve">예약하기</td>
					</tr>
					<tr>
						<td>의료진 소개</td>
						<td>질문 게시판</td>
					</tr>
					<tr>
						<td colspan="2">병원 소식</td>
					</tr>
					<tr>
						<td class="bot" colspan="2">이번주 식단</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		
		
		<!-- 답장말풍선 -->
		<div class="part part-right clearfix">
			<div align="right" class="part-message answer right">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						오시는 길
					</p>
					<!-- 현재 시간 -->
				</div>
				<div class="chat-time">17:25:35</div>
			</div>
		</div>
		
		<!-- 예약하기 -->
		<div class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						예약하기 관련 서비스입니다.<br>
						아래 메뉴 중 원하시는 버튼을 선택해 주세요.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<tr>
						<td class="top chat-reserve">예약하기</td>
					</tr>
					<tr>
						<td class="reserveWay">예약서비스 이용 방법</td>
					</tr>
					<tr>
						<td class="chat-myReserve-list" colspan="2">내 예약 현황 보기</td>
					</tr>
					<tr>
						<td class="bot chat-myReserve" colspan="2">내 예약 수정 및 취소</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		<!-- 예약하기 눌렀을 때 -->
		<div class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						예약하는 방법은 다음 순서와 같습니다.
					</p>
				</div>
				
				<div class="textbox">
					<p class="textbox-inner text-center">
						홈페이지 우측 상단 로그인 <br>
						↓<br>
						메인 배너에서 예약하기
					</p>
				</div>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		
		<!-- 예약 서비스 이용 방법을 눌렀을 때 -->
		<div class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						예약서비스 이용 방법은 다음과 같습니다.
					</p>
				</div>
				
				<div class="textbox">
					<p class="textbox-inner text-center">
						메인배너에서 진료과 선택하기 <br>
						↓<br>
						희망하는 의사 선택하기 <br>
						↓<br>
						날짜 선택하기 <br>
						↓<br>
						시간 선택하기 <br>
						↓<br>
						예약하기 버튼 클릭 <br>
						↓<br>
						픽업서비스를 이용여부 선택 후<br>
						예약하기 버튼 다시 클릭<br>
						↓<br>
						예약완료!
					</p>
				</div>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		<!-- 내 예약 현황 보기 눌렀을 때 -->
		<div class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						내 예약 현황 확인 방법은 다음과 같습니다.
					</p>
				</div>
				
				<div class="textbox">
					<p class="textbox-inner text-center">
						홈페이지 우측 상단 로그인 <br>
						↓<br>
						상단 메뉴에 마이페이지 클릭 <br>
						↓<br>
						예약현황 확인!
					</p>
				</div>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		
		<!-- 내 예약 수정 및 취소 눌렀을 때 -->
		<div class="part clearfix">
			<!-- 로고 -->
			<div class="part-logo left">
				<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
			</div>
			
			<!-- 실제 컨텐트 -->
			<div class="part-message left">
				<!-- 말풍선 -->
				<div class="textbox">
					<p class="textbox-inner">
						내 예약 수정 및 취소 방법은 다음과 같습니다.
					</p>
				</div>
				
				<div class="textbox">
					<p class="textbox-inner text-center">
						홈페이지 우측 상단 로그인 <br>
						↓<br>
						상단 메뉴에 마이페이지 클릭 <br>
						↓<br>
						예약현황 수정 및 취소버튼 클릭<br>
						(예약 수정은 다음 단계를 추가로 진행해주십시오.)<br>
						↓<br>
						날짜 및 시간 재선택<br>
						↓<br>
						예약하기 버튼 클릭<br>
						↓<br>
						픽업서비스 이용여부 선택 후<br>
						예약하기 버튼 다시 클릭<br>
						↓<br>
						예약 완료!
					</p>
				</div>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		
	</section>
	
	<!-- 새 문의 버튼 -->
	<div class="chat-new-btn">
		<button type="button" id="newQuestion">새 문의하기</button>
		<button type="button">간호상담 바로가기</button>
	</div>
	
	
	<footer class="chat-footer">
		<div class="chat-input-box">
			<input class="chat-search" type="text" placeholder="질문을 입력하세요.">	
		</div>
		<div class="chat-enter-box">
			<a href="#">
				<img alt="" src="${pageContext.request.contextPath}/img/enter.PNG">
			</a>
		</div>
	</footer>
<script>
	
	const chatSection = document.getElementById('chat-section');
	
	//예약하기
	$('#chat-section').on('mousedown', '.howReserve', function(){
		let str =
			`<!-- 예약하기 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 말풍선 -->
					<div class="textbox">
						<p class="textbox-inner">
							예약하기 관련 서비스입니다.<br>
							아래 메뉴 중 원하시는 버튼을 선택해 주세요.
						</p>
					</div>
					
					<!-- 버튼풍선 -->
					<table class="chat-btn textbox">
					<tr>
						<td class="top chat-reserve">예약하기</td>
					</tr>
					<tr>
						<td class="reserveWay">예약서비스 이용 방법</td>
					</tr>
					<tr>
						<td class="chat-myReserve-list" colspan="2">내 예약 현황 보기</td>
					</tr>
					<tr>
						<td class="bot chat-myReserve" colspan="2">내 예약 수정 및 취소</td>
					</tr>
					</table>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
			
			
		const tpl = document.createElement('template');
		tpl.innerHTML = str;
		
		const frag = tpl.content;
		chatSection.appendChild(frag);
		
		window.scrollTo({top:5000000, left: 0, behavior: 'smooth'});
	});
	
	
	$('#chat-section').on('mousedown', '.chat-reserve', function(){
		let str=
			`<!-- 예약하기 눌렀을 때 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 말풍선 -->
					<div class="textbox">
						<p class="textbox-inner">
							예약하는 방법은 다음 순서와 같습니다.
						</p>
					</div>
					
					<div class="textbox">
						<p class="textbox-inner text-center">
							홈페이지 우측 상단 로그인 <br>
							↓<br>
							메인 배너에서 예약하기
						</p>
					</div>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
		
		const tpl = document.createElement('template');
		tpl.innerHTML = str;
		
		const frag = tpl.content;
		chatSection.appendChild(frag);
		
		window.scrollTo({top:5000000, left: 0, behavior: 'smooth'});
	});
	
	
	$('#chat-section').on('mousedown', '.reserveWay', function(){
		let str=
			`<!-- 예약 서비스 이용 방법을 눌렀을 때 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 말풍선 -->
					<div class="textbox">
						<p class="textbox-inner">
							예약서비스 이용 방법은 다음과 같습니다.
						</p>
					</div>
					
					<div class="textbox">
						<p class="textbox-inner text-center">
							메인배너에서 진료과 선택하기 <br>
							↓<br>
							희망하는 의사 선택하기 <br>
							↓<br>
							날짜 선택하기 <br>
							↓<br>
							시간 선택하기 <br>
							↓<br>
							예약하기 버튼 클릭 <br>
							↓<br>
							픽업서비스를 이용여부 선택 후<br>
							예약하기 버튼 다시 클릭<br>
							↓<br>
							예약완료!
						</p>
					</div>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
		
		const tpl = document.createElement('template');
		tpl.innerHTML = str;
		
		const frag = tpl.content;
		chatSection.appendChild(frag);
		
		window.scrollTo({top:5000000, left: 0, behavior: 'smooth'});
	});
	
	
	$('#chat-section').on('mousedown', '.chat-myReserve-list', function(){
		let str=
			`<!-- 내 예약 현황 보기 눌렀을 때 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 말풍선 -->
					<div class="textbox">
						<p class="textbox-inner">
							내 예약 현황 확인 방법은 다음과 같습니다.
						</p>
					</div>
					
					<div class="textbox">
						<p class="textbox-inner text-center">
							홈페이지 우측 상단 로그인 <br>
							↓<br>
							상단 메뉴에 마이페이지 클릭 <br>
							↓<br>
							예약현황 확인!
						</p>
					</div>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
		
		const tpl = document.createElement('template');
		tpl.innerHTML = str;
		
		const frag = tpl.content;
		chatSection.appendChild(frag);
		
		window.scrollTo({top:5000000, left: 0, behavior: 'smooth'});
	});
	
	
	$('#chat-section').on('mousedown', '.chat-myReserve', function(){
		let str=
			`<!-- 내 예약 수정 및 취소 눌렀을 때 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 말풍선 -->
					<div class="textbox">
						<p class="textbox-inner">
							내 예약 수정 및 취소 방법은 다음과 같습니다.
						</p>
					</div>
					
					<div class="textbox">
						<p class="textbox-inner text-center">
							홈페이지 우측 상단 로그인 <br>
							↓<br>
							상단 메뉴에 마이페이지 클릭 <br>
							↓<br>
							예약현황 수정 및 취소버튼 클릭<br>
							(예약 수정은 다음 단계를 추가로 진행해주십시오.)<br>
							↓<br>
							날짜 및 시간 재선택<br>
							↓<br>
							예약하기 버튼 클릭<br>
							↓<br>
							픽업서비스 이용여부 선택 후<br>
							예약하기 버튼 다시 클릭<br>
							↓<br>
							예약 완료!
						</p>
					</div>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
		
		const tpl = document.createElement('template');
		tpl.innerHTML = str;
		
		const frag = tpl.content;
		chatSection.appendChild(frag);
		
		window.scrollTo({top:5000000, left: 0, behavior: 'smooth'});
	});
	
	
	

	//새 문의하기 
	$('#newQuestion').click(function(){
		let str =
			`<!-- 한 덩이 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
			
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 말풍선 -->
					<div class="textbox">
						<p class="textbox-inner">
							안녕하세요 ict병원 챗봇입니다.<br>
							무엇을 도와드릴까요?
						</p>
					</div>
					
					<!-- 버튼풍선 -->
					<table class="chat-btn textbox">
						<tr>
							<td class="l-t howCome">오시는 길</td>
							<td class="r-t howReserve">예약하기</td>
						</tr>
						<tr>
							<td>의료진 소개</td>
							<td>질문 게시판</td>
						</tr>
						<tr>
							<td colspan="2">병원 소식</td>
						</tr>
						<tr>
							<td class="bot" colspan="2">이번주 식단</td>
						</tr>
					</table>
					
					<!-- 현재 시간 -->
					<div class="chat-time">` + timeStamp() + `</div>
				</div>
			</div>`;
						
		const tpl = document.createElement('template');
		tpl.innerHTML = str;
		
		const frag = tpl.content;
		chatSection.appendChild(frag);
		
		window.scrollTo({top:5000000, left: 0, behavior: 'smooth'});
		
		
		
		
	});
	
		//시간 처리 함수
		function timeStamp(){
			const currentTime = new Date();
			let hours = ('0' + currentTime.getHours()).slice(-2);
			let minutes = ('0' + currentTime.getMinutes()).slice(-2);
			let seconds = ('0' + currentTime.getSeconds()).slice(-2);
			
			let timeString = hours + ':' + minutes + ':' + seconds;
			
			return timeString;
		}
		
		$('.chat-time').html(timeStamp());
		
		
</script>
</body>

</html>