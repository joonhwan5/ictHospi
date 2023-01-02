<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/header.jsp"%>


<style>
.doctor-img-box {
	width: 100px;
	hight: 100px;
}


</style>


<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>병원 소개</h2></li>
				<li><a href="#">개요<span class="sr-only">(current)</span></a></li>
				<li><a href="#">원장의 말</a></li>
				<li><h2>의료진 소개</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/introduce/introInternalMain?subject=내과">내과</a></li>
				<li><a href="${pageContext.request.contextPath}/introOrthoMain?subject=외과">외과</a></li>
				<li><a href="${pageContext.request.contextPath}/introduce/introSkinMain?subject=피부과">피부과</a></li>
				<li><h2>기타</h2></li>
				<li><a href="${pageContext.request.contextPath}/introduce/introCome">오시는 길</a></li>
				<li><a href="#">주변 편의시설</a></li>
			</ul>
		</div>


		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main doctor-main">
				<div>
					<h2>의료진 안내</h2>
					<p>아래 의료진을 클릭하면 보다 상세한 내용을 확인하실 수 있습니다.</p>
					<hr>
					
						<c:if test="${doctorList.size()==0}">
							<div>
								<h2>의료진 정보가 없습니다.</h2>
							</div>
						</c:if>
					
					
						<c:forEach var="i" items="${doctorList}">
								<div>
									<div class="doctor-img-box">
										<img src="${pageContext.request.contextPath}/admin/doctorDisplay?fileLoca=${i.fileLoca}&fileName=${i.fileName}">
									</div>
									<div>
										<h3>${i.doctorName}</h3>
										<p>${i.medicalIntro}</p>
										<h4>전문 진료 과목</h4>
										<p>${i.medicalCharge}</p>
									</div>						
								</div>
						</c:forEach>
					
				</div>
			</div>
		</div>
		
	</div>
</div>



<script>
	$('intro-body1').attr('display', 'none');
</script>

<%@include file="../include/footer.jsp"%>