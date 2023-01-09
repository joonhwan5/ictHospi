<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/header.jsp"%>

<style>

	.doctor-main {
		margin: 40px 20px;
	}

	.aboutDoctors {
		font-size: 4rem;
	}

	.doctor-intro-box {
		margin: 50px 80px;
	}

	.doctor-intro-box > .doctor-photo {
		width: 300px; 
		float: left;
		margin-right: 50px;
		margin-bottom: 50px;
	}
	
	
	.doctor-intro-box > .doctor-text {
		width: 500px; 
		float: left;
		display: block;
	}
	
	.doctor-photo > img {
		width: 300px;
		height: 360px;
		display: inline;
		border-radius: 30px;
	}
	
	
	
	.doctor-text > p {
		font-size: 2rem;
		color: gray;
	}
	

</style>

<div class="container-fluid">
	<div class="row">

		<%@ include file="../include/introSide.jsp" %>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main doctor-main">
				<div>
					<h1 class="aboutDotors">의료진 안내</h1>
					<p>아래 의료진을 클릭하면 보다 상세한 내용을 확인하실 수 있습니다.</p>
					<hr>
						<c:if test="${doctorList.size()==0}">
							<div id="getListNone">
								<h2>의료진 정보가 없습니다.</h2>
							</div>
						</c:if>
						
						<c:forEach var="i" items="${doctorList}">
								<div class="doctor-intro-box clearfix">
									<div class="doctor-photo">
										<img src="${pageContext.request.contextPath}/admin/doctorDisplay?fileLoca=${i.fileLoca}&fileName=${i.fileName}">
									</div>
									<div class="doctor-text">
										<h1>${i.doctorName}<span>&nbsp;&nbsp;&nbsp;의사</span></h1>
										<p>${i.medicalIntro}</p>
										<h3>전문 진료 과목</h3>
										<p>${i.medicalCharge}</p>
									</div>						
								</div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>


<script>
	$('.doctor-intro-box').click(function(e){
		location.href('${pageContext.request.contextPath}/introduce/introDotors');
	});
</script>

