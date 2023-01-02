<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>마이페이지</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/myPage/myPageMain">내 정보 수정<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/myPage/userWithdrawal">회원탈퇴</a></li>
				<li><h2>예약</h2></li>
				<li><a href="${pageContext.request.contextPath}/myPage/reservation">예약현황</a></li>
			</ul>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>