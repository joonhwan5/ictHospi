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
						<td class="l-t">오시는 길</td>
						<td class="r-t">예약하기</td>
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
		
		
		
		<!-- 오시는 길 -->
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
						병원에 오시는 방법을 안내해 드릴게요.<br>
						아래 메뉴 중 원하시는 버튼을 선택해 주세요.
					</p>
				</div>
				
				<!-- 버튼풍선 -->
				<table class="chat-btn textbox">
					<tr>
						<td class="top">
							버스 이용안내
						</td>
					</tr>
					<tr>
						<td>지하철 이용안내</td>
					</tr>
					<tr>
						<td class="bot" colspan="2">승용차 이용안내</td>
					</tr>
				</table>
				
				<!-- 현재 시간 -->
				<div class="chat-time">17:25:34</div>
			</div>
		</div>
		
		
		<!-- 버스 이용안내 -->
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
				<div class="chat-time">17:25:34</div>
			</div>
		</div>
		
		<!-- 지하철 이용안내 -->
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
				<div class="chat-time">17:25:34</div>
			</div>
		</div>
		
		
		<!-- 승용차 이용안내 -->
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
				<div class="chat-time">17:25:34</div>
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


	//새 문의하기 
	$('#newQuestion').click(function(){
		const chatSection = document.getElementById('chat-section');
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
							<td class="l-t">오시는 길</td>
							<td class="r-t">입원 안내</td>
						</tr>
						<tr>
							<td>제증명서류</td>
							<td>안내동영상</td>
						</tr>
						<tr>
							<td colspan="2">간호상담</td>
						</tr>
						<tr>
							<td class="bot" colspan="2">자주묻는 질문</td>
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