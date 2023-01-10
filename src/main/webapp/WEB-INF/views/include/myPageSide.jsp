<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><h2>마이페이지</h2></li>
		<li><a href="${pageContext.request.contextPath}/myPage/myPageMain">내 정보 수정</a></li>
		<li><a href="${pageContext.request.contextPath}/myPage/userModifyPw">비밀번호변경</a></li>
		<li><a href="${pageContext.request.contextPath}/myPage/userWithdrawal">회원탈퇴</a></li>
		<li><h2>예약</h2></li>
		<li><a href="${pageContext.request.contextPath}/myPage/reservation">예약현황</a></li>
	</ul>
</div>

<script>
	let url = document.location.pathname;

	if (url.includes('?')) {
		url = url.split('?')[0];
	}

	let realUrl1 = url.split('/')[0] + '/';
	let realUrl2 = url.split('/')[1] + '/';
	let realUrl3 = url.split('/')[2];
	if (realUrl3 == 'reservationModify') {
		realUrl3 = 'reservation';
	}
	let realUrl = realUrl1 + realUrl2 + realUrl3;

	console.log(realUrl);

	$(document).ready(function() {
		$('.sidebar').find('a[href^="' + realUrl + '"]').parents('li').addClass('active');
	});
</script>