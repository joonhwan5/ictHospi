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
	border: 1px solid black;
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
	margin-top: 50px;
}

.part {
	width: 100%;
	height: 320px;
}

.part-inner {
	margin-top: 20px;
	height: 93%;
}

.part-logo {
	width: 40px;
	height: 30px;
}

.part-message {
	width: 70%;
	height: 100%;
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
				<div class="part-logo left">
				
				</div>
				<div class="part-message left">
				
				</div>
			</div>
		</div>
	</section>
	
	



</body>
</html>