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

.chat-bot-header {
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
}

.chat-bot-header > div {
	font-size: 1.6rem;
}


/*	Section	*/
section {
	margin-top: 65px;
}

.part {
	width: 100%;
	height: 320px;
}

.part-inner {
	margin-top: 20px;
	height: 93%;
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
	width: 100%;
	border-radius: 15px;
	margin-bottom: 10px;
	border: 1px solid black;
	padding: 5px;
}

.textbox > p {
	line-height: 1.5rem;
}

.textbox-inner {
	width: 100%;
	font-size: 1rem;
	line-height: 1rem;
	padding: 5px;
	box-sizing: content-box;
	text-align: left;
}

.chat-btn, .chat-btn > tr {
	width: 100%;
	text-align: center;
}

.chat-btn td {
	width: 50%;
	font-size: 1rem;
	line-height: 1.5rem;
	padding: 5px;
	border: 1px solid black;
	margin: 0px;

}
</style>

</head>
<body>

	<header class="chat-bot-header clearfix">
		<div>ict병원 챗봇</div>
	</header>
	
	<section>
		<div class="part">
			<div class="part-inner clearfix">
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
					<table class="chat-btn textbox">
						<tr>
							<td>오시는 길</td>
							<td>입원 안내</td>
						</tr>
						<tr>
							<td>제증명서류</td>
							<td>안내동영상</td>
						</tr>
						<tr>
							<td colspan="2">간호상담</td>
						</tr>
						<tr>
							<td colspan="2">자주묻는 질문</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
	
	



</body>
</html>