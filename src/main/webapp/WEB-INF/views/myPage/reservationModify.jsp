<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>마이페이지</h2></li>
				<li><a href="#">내 정보 수정</a></li>
				<li><a href="#">회원탈퇴</a></li>
				<li><h2>예약</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/myPage/reservation">예약현황<span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main clearfix">
			<h1 class="page-header">진료 예약 정보</h1>
			<div class="reservation-detail-body1">
				
			</div>
			<div class="reservation-detail-body2">
				<h5 class="page-header">예약번호:<span>${reserve.rvNo}</span></h5>
				<h5 class="page-header">진료과:<span>${reserve.medicalDepartment}</span></h5>
				<h5 class="page-header">담당의사:<span>${reserve.doctorName}</span></h5>
				<h5 class="page-header">환자이름:<span>${reserve.userName}</span></h5>
				<h5 class="page-header">진료날짜:<span>${reserve.rvDate}</span></h5>
				<h5 class="page-header">진료시간:<span>${reserve.rvTime}</span></h5>
				<h5 class="page-header">픽업시간:<span>${reserve.pickUpTime}</span></h5>
			</div>
		</div>
	</div>
</div>



<%@include file="../include/footer.jsp"%>