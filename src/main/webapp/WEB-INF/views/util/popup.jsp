<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>

<style>
#winPopup {
	width: fit-content;
	height: 100%;
}

.close>span {
	font-size: 1.1rem;
}

#classBtn {
	float: right;
}

.popup-content>img {
	width: 450px;
	height: 630px;
}
</style>

<script src="${pageContext.request.contextPath}/js/popup.js"></script>


</head>
<body>

	<div id="winPopup">
		<div class="popup-content">
			<img
				src="${pageContext.request.contextPath}/resources/img/poster.png">
		</div>
		<div class="close clearfix">
			<span id="check"><input type="checkbox" value="checkbox"
				name="chkbox" id="chkbox" /><label for="chkday">&nbsp;오늘
					하루동안 보지 않기</label></span>
			<button type="button" id="closeBtn">Close</button>
		</div>
	</div>
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=154cdf798b78dac46e164c6afddf8961"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
</script>

<script>

	
	 
	 
	
	const $box = document.querySelector('input[type=checkbox]');
	
	
	const $close = document.getElementById('closeBtn');
	
	$close.onclick = function(){
		console.log("닫는 버튼 클릭");
		if($box.checked){
			createCookie('popup');
			console.log("체크되어있고 쿠키생성함수 발생");
		}
		window.close();
	}
	
</script>


</html>