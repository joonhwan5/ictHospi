<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/header.jsp"%>

<style>

	.doctorDiv {
		border: 1px solid red;
		height: 360px;
	}
	
	.doctor-img-box > img {
		width: 300px;
		height: 360px;
		display: inline;
	}
	
	.doctor-intro-box {
		float: right;
	}

</style>

<div class="container-fluid">
	<div class="row">

		<%@ include file="../include/introSide.jsp" %>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main doctor-main">
				<div>
					<h2>의료진 안내</h2>
					<p>아래 의료진을 클릭하면 보다 상세한 내용을 확인하실 수 있습니다.</p>
					<hr>
						<c:if test="${doctorList.size()==0}">
							<div id="getListNone">
								<h2>의료진 정보가 없습니다.</h2>
							</div>
						</c:if>
						<c:forEach var="i" items="${doctorList}">
								<div class="doctorDiv clearfix">
									<div class="doctor-img-box">
										<img src="${pageContext.request.contextPath}/admin/doctorDisplay?fileLoca=${i.fileLoca}&fileName=${i.fileName}">
									</div>
									<div class="doctor-intro-box">
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

<%@include file="../include/footer.jsp"%>




