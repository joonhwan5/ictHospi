<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<%@include file="../include/myPageSide.jsp"%>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main reservation-group clearfix">
			<h1>진료 예약 정보</h1>
			<hr>
			
			<c:if test="${reserveList.size() == 0}">
				<div id="getListNone">
					<h1>예약 정보가 없습니다.</h1>
				</div>
			</c:if>
			
			
			<c:set var="nYear" value="${fn:split(nowDate, '. ')[0]}" />
			<c:set var="nMonth" value="${fn:split(nowDate, '. ')[1]}" />
			<c:set var="nDate" value="${fn:split(nowDate, '. ')[2]}" />
			
			<c:forEach var="i" items="${reserveList}">
				<div class="reservation-body">
					<h5 class="page-header">예약번호:<span>${i.rvNo}</span></h5>
					<h5 class="page-header">진료과:<span>${i.medicalDepartment}</span></h5>
					<h5 class="page-header">담당의사:<span>${i.doctorName}</span></h5>
					<h5 class="page-header">진료날짜:<span>${i.rvDate}</span></h5>
					<h5 class="page-header">진료시간:<span><c:if test="${i.rvTime > 12}">오후 ${i.rvTime-12}시</c:if><c:if test="${i.rvTime == 12}">오후 ${i.rvTime}시</c:if><c:if test="${i.rvTime < 12}">오전 ${i.rvTime}시</c:if></span></h5>
					<h5 class="page-header">픽업시간:<span>
						<c:choose>
							<c:when test="${i.pickUpTime == -1 }">-</c:when>
							<c:when test="${i.pickUpTime == 12}">오후 12시</c:when>
							<c:when test="${i.pickUpTime > 12}">오후 ${i.pickUpTime-12}시</c:when>
							<c:when test="${i.pickUpTime < 12}">오전 ${i.pickUpTime}시</c:when>
						</c:choose></span></h5>
						
					
					<c:set var="rYear" value="${fn:split(i.rvDate, '. ')[0]}" />
					<c:set var="rMonth" value="${fn:split(i.rvDate, '. ')[1]}" />
					<c:set var="rDate" value="${fn:split(i.rvDate, '. ')[2]}" />
					
					<c:choose>
						
						<c:when test="${rYear >= nYear}">
							<c:choose>
								<c:when test="${rMonth+10 >= nMonth+10}">
									<c:choose>
										<c:when test="${rDate+10 > nDate+10}">
											<h5 class="page-header">
												<button type="button" class="reserve-modify">예약 수정</button>
												<button type="button" class="reserve-cancel">예약 취소</button>
											</h5>	
										</c:when>
										<c:when test="${rDate+1 == nDate+1}">
											<h5 class="page-header" style="color: green; line-height: 40px; font-size: 17px">진료날짜입니다.</h5>
										</c:when>
										<c:otherwise>
											<h5 class="page-header" style="color: red; line-height: 40px; font-size: 17px">날짜가 만료된 예약입니다.</h5>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<h5 class="page-header" style="color: red; line-height: 40px; font-size: 17px">날짜가 만료된 예약입니다.</h5>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<h5 class="page-header" style="color: red; line-height: 40px; font-size: 17px">날짜가 만료된 예약입니다.</h5>
						</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	const msg = '${msg}';
	if(msg === 'regist') {
		alert('예약 완료!');
	} else if (msg === 'modify') {
		alert('예약 수정 완료!');
	}

	$('.reserve-cancel').click(function() {
		if(confirm('예약 취소하시겠습니까?')) {
			alert('예약취소 완료');
			const reservNum = ($(this).parent()[0]).parentNode.firstElementChild.firstElementChild.textContent;
			location.href = "${pageContext.request.contextPath}/myPage/reservationDelete/"+reservNum;
		}
	});
	
	$('.reserve-modify').click(function() {
		if(confirm('수정은 날짜/시간만 가능합니다.')) {
			const reservNum = ($(this).parent()[0]).parentNode.firstElementChild.firstElementChild.textContent;
			location.href = '${pageContext.request.contextPath}/myPage/reservationModify/' + reservNum;
		}
	});
</script>
