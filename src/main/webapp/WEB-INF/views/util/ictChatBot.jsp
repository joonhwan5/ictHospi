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
		min-width: 70%;
		max-width: 100%;
		text-align: center;
		border-spacing: 0px;
		padding: 0px;
		box-sizing: content-box;
	}
	
	.textbox-inner {
		padding: 10px;
	}
	
	.chat-btn td {
		min-width: 50%;
		max-width: 70%;
		font-size: 1rem;
		line-height: 1.5rem;
		padding: 10px;
		border: 1px solid black;
		box-sizing: content-box;
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
	
	.text-left {
		text-align: left;
	}
	
	.chat-doctor p {
		margin: 50px 20px;
		height: 100%;
	}
	
	.chat-doctor-img, .chat-doctor-img > img {
		width: 150px;
		height: 150px;
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
						<td class="howCome l-t">오시는 길</td>
						<td class="howReserve r-t">예약</td>
					</tr>
					<tr>
						<td>의료진 소개</td>
						<td>자주하는 질문</td>
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
		
		<!-- 의료진 소개 -->
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
						의료진 소개 서비스입니다.<br>
						아래 메뉴 중 원하시는 과를 선택해 주세요.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<tr>
						<td class="top">내과</td>
					</tr>
					<tr>
						<td>외과</td>
					</tr>
					<tr>
						<td class="bot">피부과</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		<!-- 내과 -->
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
						내과 전문의 리스트입니다.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<tr>
						<td class="chat-doctor text-left clearfix">
							<!-- 사진 -->
							<div class="chat-doctor-img left">
								<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
							</div>
							<!-- 컨텐트 -->
							<div class="left">
								<p>
									이름 : 허준<br>
									상세진료 : 오목
								</p>
							</div>
							<img alt="" src="">
						</td>
					</tr>
					<tr>
						<td class="chat-doctor text-left clearfix">
							<!-- 사진 -->
							<div class="chat-doctor-img left">
								<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
							</div>
							<!-- 컨텐트 -->
							<div class="left">
								<p>
									이름 : 허준<br>
									상세진료 : 오목
								</p>
							</div>
							<img alt="" src="">
						</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time"></div>
			</div>
		</div>
		
		<!-- 자주하는 질문 -->
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
						사용자들이 가장 많이 찾은 질문 목록입니다.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<tr>
						<td class="top">예약하기</td>
					</tr>
					<tr>
						<td>예약수정</td>
					</tr>
					<tr>
						<td>이번주 식단</td>
					</tr>
					<tr>
						<td>병원 소식</td>
					</tr>
					<tr>
						<td class="bot">오시는 길</td>
					</tr>
				</table>
				
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
	
	
	//답장 말풍선
	function answerMessage(answer){
		
		let str = 
			`<!-- 답장말풍선 -->
			<div class="part part-right clearfix">
				<div align="right" class="part-message answer right">
					<!-- 말풍선 -->
					<div class="textbox">
						<p class="textbox-inner">
							`+ answer +`
						</p>
						<!-- 현재 시간 -->
					</div>
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
		
		appendFrag(str);
	}

	//frag 생성 후 append 함수
	function appendFrag(str) {
		const tpl = document.createElement('template');
		tpl.innerHTML = str;
		
		const frag = tpl.content;
		chatSection.appendChild(frag);

		window.scrollTo({top:5000000, left: 0, behavior: 'smooth'});
	}

	
	
	
	
	//예약하기
	$('#chat-section').on('mousedown', '.howReserve', function(e){
		
		answerMessage(e.target.textContent);
		let str =
			`<!-- 예약 -->
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
			
		appendFrag(str);
	});
	
	
	//예약하기 눌렀을 때
	$('#chat-section').on('mousedown', '.chat-reserve', function(e){
		answerMessage(e.target.textContent);
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
		
		appendFrag(str);
	});
	
	
	//예약 서비스 이용 방법을 눌렀을때
	$('#chat-section').on('mousedown', '.reserveWay', function(e){
		answerMessage(e.target.textContent);
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
		
		appendFrag(str);
	});
	
	
	//예약 현황 보기 눌렀을때
	$('#chat-section').on('mousedown', '.chat-myReserve-list', function(e){
		answerMessage(e.target.textContent);
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
		
		appendFrag(str);
	});
	
	
	//예약 수정 및 취소 눌렀을때
	$('#chat-section').on('mousedown', '.chat-myReserve', function(e){
		answerMessage(e.target.textContent);
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
		
		appendFrag(str);
	});

	
	//오시는 길
	$('#chat-section').on('mousedown', '.howCome', function(e){
		answerMessage(e.target.textContent);
		let str =
			`<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 말풍선 -->
					<div class="textbox">
						<p class="textbox-inner">
							병원에 오시는 방법을 안내해 드릴게요.<br>
							아래 메뉴 중 원하시는 버튼을 선택해 주세요.
						</p>
					</div>
					
					<!-- 버튼풍선 -->
					<table class="chat-btn textbox">
						<tr>
							<td class="top comeBus">
								버스 이용안내
							</td>
						</tr>
						<tr>
						<td class="comeMetro">지하철 이용안내</td>
						</tr>
						<tr>
							<td class="bot comeCar" colspan="2">승용차 이용안내</td>
						</tr>
					</table>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
			
		appendFrag(str);
	});
	
	
	//버스 이용 안내
	$('#chat-section').on('mousedown', '.comeBus', function(e){
		answerMessage(e.target.textContent);
		let str = 
			`<!-- 버스 이용안내 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 버튼풍선 -->
					<table class="chat-btn textbox">
						<tr>
							<td class="top">
								버스 이용안내
							</td>
						</tr>
						<tr>
							<td class="bot" colspan="2">
								<p>
									<strong>※ 신촌로터리나 서강대앞 하차 ※</strong><br><br><br>
									<span style="background:#395CB4;color:#fff">&nbsp;간선(파랑)버스&nbsp;</span>
									<br>
									13-1, 19, 110, 163, 170, 171, 271, 371, 472, 602, 603, <br>
									604, 705, 740, 753 <br><br>
									<span style="background:#4A972E;color:#fff">&nbsp;지선(초록)버스&nbsp;</span>
									<br>
									1, 1-1, 3, 7, 8, 8-1, 11, 11-1, 19, 10, 5711, 5712, 5713, <br>
									5714, 7011, 7012, 7015, 7016, 7611, 7613, 7711, 7726 <br><br>
									<span style="background:red;color:#fff">&nbsp;광역(빨간)버스&nbsp;</span>
									<br>
									1100, 1200, 9602, 9713
								</p>
							</td>
						</tr>
					</table>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
		
		
		appendFrag(str);
	});
	
	
	//지하철 이용 안내
	$('#chat-section').on('mousedown', '.comeMetro', function(e){
		answerMessage(e.target.textContent);
		let str =
			`<!-- 지하철 이용안내 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 버튼풍선 -->
					<table class="chat-btn textbox">
						<tr>
							<td class="top">
								지하철 이용안내
							</td>
						</tr>
						<tr>
							<td class="bot" colspan="2">
								<p>
									<span style="background:#4EB444;color:#fff">&nbsp;지하철 2호선&nbsp;</span><br>
									신촌역 6번 출구 - 서강대방면 150m <br><br>
									<span style="background:#AE4F00;color:#fff">&nbsp;지하철 6호선&nbsp;</span><br>
									대흥역 1번 출구 - 서강대방면 600m <br><br>
									<span style="background:#84C4A4;color:#fff">&nbsp;경의중앙선&nbsp;</span><br>
									서강대역 1번 출구 - 서강대방면 200m
								</p>
							</td>
						</tr>
					</table>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
		
		appendFrag(str);
	});
	
	//승용차 이용 안내
	$('#chat-section').on('mousedown', '.comeCar', function(e){
		answerMessage(e.target.textContent);
		let str =
			`<!-- 승용차 이용안내 -->
			<div class="part clearfix">
				<!-- 로고 -->
				<div class="part-logo left">
					<img alt="" src="${pageContext.request.contextPath}/img/ogu-logo.PNG">
				</div>
				
				<!-- 실제 컨텐트 -->
				<div class="part-message left">
					<!-- 버튼풍선 -->
					<table class="chat-btn textbox">
						<tr>
							<td class="top">
								승용차 이용안내
							</td>
						</tr>
						<tr>
							<td class="bot" colspan="2">
								<p>
									네비게이션<br>"ICTHospital" 검색 <br><br>
									도로명주소<br> 서울시 마포구 백범로 23(신수동 63-14) ICTHospital <br><br>
									주차장 안내<br> 정문(스타벅스쪽) 우측 주차장 이용
									<br>
									<br>
									<a href="https://map.naver.com/v5/entry/place/13323901?c=14129894.6754992,4515644.8778516,15,0,0,0,dh" class="a-naver">네이버 지도에서 보기</a>
								</p>
							</td>
						</tr>
					</table>
					
					<!-- 현재 시간 -->
					<div class="chat-time">`+ timeStamp() +`</div>
				</div>
			</div>`;
		
		appendFrag(str);
	});
	
	//새 문의하기 
	$('#newQuestion').click(function(e){
		answerMessage(e.target.textContent);
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
							<td class="r-t howReserve">예약</td>
						</tr>
						<tr>
							<td>의료진 소개</td>
							<td>자주하는 질문</td>
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
						
		appendFrag(str);
		
		
		
		
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
		
		
		
	//입력한 키워드 추가 
	
	$('.chat-enter-box').mousedown(searching);
	$('.chat-search').keydown(searching);
	
	//검색 메서드
	function searching(){
		if(event.type == 'keydown' && event.keyCode != 13){
			return;
		}
		const keyword = ($('.chat-search').val()).split(' ').join('');
		console.log(keyword);
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/util/chatKeyword',
			data: keyword,
			contentType: 'application/json',
			success: function(result) {
				console.log(result);
				
			},
			error: function(error){
				console.log('에러발생');
			}
		});//비동기 끝
	}
	
		
		
		
		
		
</script>

</body>

</html>