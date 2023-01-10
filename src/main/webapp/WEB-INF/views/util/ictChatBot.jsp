<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>

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

.chat-bot-header > div {
	font-size: 1.6rem;
	min-width: 350px;
}


/*	Section	*/
.chat-section {
	margin-top: 65px;
}

.part {
	margin-top: 20px;
	margin-right: 10px;
	width: 100%;
	max-width: 430px;
	min-width: 350px;
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
	position: absolute;
	bottom: 0px;
	left: 0px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	min-width: 350px;
	border: 0px;
	border-top: 1px solid gray;
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
	height: 50px;
	position: absolute;
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


</style>

</head>
<body>
	<!-- 헤더 -->
	<header class="chat-header clearfix">
		<div>ict병원 챗봇</div>
	</header>
	
	<!-- 섹션 -->
	<section class="chat-section clearfix">
		
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
				<div class="chat-time">17:25:34</div>
			</div>
		</div>
		
		<!-- 답장말풍선 -->
		<div class="part right clearfix">
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
	</section>
	
	
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



</body>
</html>