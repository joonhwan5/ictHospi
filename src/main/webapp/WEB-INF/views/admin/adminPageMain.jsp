
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>관리자 게시판</h2></li>
				<li class="active"><a href="#">의료진 관리<span class="sr-only">(current)</span></a></li>

			</ul>
		</div>
		<div
			class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main clearfix">
			<h1 class="page-header">의료진 관리</h1>

			<c:if test="${doctorList.size()==0}">
				<div id="getListNone">
					<h2>의료진 정보가 없습니다.</h2>
				</div>
			</c:if>

			<c:forEach var="i" items="${doctorList}">
				<div class="doctorDiv">
					<div class="doctor-img-box">
						<img alt="" src="${pageContext.request.contextPath}/admin/doctorDisplay?fileLoca=${i.fileLoca}&fileName=${i.fileName}">
						<span>${i.doctorName}</span>
					</div>
					<div class="doctorSelect clearfix">
						<span>선택</span> <input type="checkbox" name="doctor">
					</div>
				</div>
			</c:forEach>
			
		</div>
		<div class="clearfix">
			<a href="#" class="deleteBtn btn btn-secondary my-2">삭제하기</a> 
			<a href="${pageContext.request.contextPath}/admin/adminPageDetail" class="registBtn btn btn-primary my-2">등록하기</a>
		</div>

	</div>
</div>
<%@include file="../include/footer.jsp"%>