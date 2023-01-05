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
				<li><a href="${pageContext.request.contextPath}/myPage/reservationModify">일단예약수정버튼</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main reservation-group clearfix">
			<h1 class="page-header">진료 예약 정보</h1>
			
			<c:if test="${reserveList.size() == 0}">
				<div id="getListNone">
					<h1>예약 정보가 없습니다.</h1>
				</div>
			</c:if>
			
			<c:forEach var="i" items="${reserveList}">
				<div class="reservation-body">
					<h5 class="page-header">예약번호:<span>${i.rvNo}</span></h5>
					<h5 class="page-header">진료과:<span>${i.medicalDepartment}</span></h5>
					<h5 class="page-header">담당의사:<span>${i.doctorName}</span></h5>
					<h5 class="page-header">환자이름:<span>${i.userName}</span></h5>
					<h5 class="page-header">진료날짜:<span>${i.rvDate}</span></h5>
					<h5 class="page-header">진료시간:<span><c:if test="${i.rvTime > 12}">오후 ${i.rvTime-12}시</c:if><c:if test="${i.rvTime == 12}">오후 ${i.rvTime}시</c:if><c:if test="${i.rvTime < 12}">오전 ${i.rvTime}시</c:if></span></h5>
					<h5 class="page-header">픽업시간:<span>${i.pickUpTime}</span></h5>
					
					<button type="button" class="reserve-modify">예약 수정</button>
					<button type="button" class="reserve-cancel">예약 취소</button>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>
	$('.reserve-cancel').click(function() {
		if(confirm('예약 취소하시겠습니까?')) {
			alert('예약취소 완료');
			const reservNum = ($(this).parent()[0]).firstElementChild.firstElementChild.textContent;
			location.href = "${pageContext.request.contextPath}/myPage/reservationDelete/"+reservNum;
		}
	});
	
	$('.reserve-modify').click(function() {
		if(confirm('수정은 날짜/시간만 가능합니다.')) {
			const reservNum = ($(this).parent()[0]).firstElementChild.firstElementChild.textContent;
			location.href = '${pageContext.request.contextPath}/myPage/reservationModify/' + reservNum;
		}
	});
</script>
