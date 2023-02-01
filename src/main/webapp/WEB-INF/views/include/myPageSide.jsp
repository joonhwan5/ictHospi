<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-sm-3 col-md-2 sidebar" style="top: 10vh;">
	<ul class="nav nav-sidebar">
		<li><h2>마이페이지</h2></li>
		<li><a href="${pageContext.request.contextPath}/myPage/myPageMain">내 정보 수정</a></li>
		<c:if test="${kakao == null}">
			<li><a href="${pageContext.request.contextPath}/myPage/userModifyPw">비밀번호변경</a></li>
		</c:if>
		<li><a href="${pageContext.request.contextPath}/myPage/userWithdrawal">회원탈퇴</a></li>
		<li><h2>예약</h2></li>
		<li><a href="${pageContext.request.contextPath}/myPage/reservation">예약현황</a></li>
		<li><h2>문의</h2></li>
		<li><a href="${pageContext.request.contextPath}/claim/claimMain?keyword=${login}&condition=userId">문의현황</a></li>
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

	$(document).ready(function() {
		$('.sidebar').find('a[href^="' + realUrl + '"]').parents('li').addClass('active');
	});

</script>