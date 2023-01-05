<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="winPopup">
		<div class="popup-content">
			<img src="${pageContext.request.contextPath}/resources/img/durian.png">
		</div>
		<div class="popupBtn">
			<span class="popupChk">
				<input type="checkbox" id="popup-checkbox">
				<label for="popup-checkbox">오늘 하루 보지 않기</label>
			</span>
			<a href="">닫기</a>
		</div>
	</div>

</body>
</html>