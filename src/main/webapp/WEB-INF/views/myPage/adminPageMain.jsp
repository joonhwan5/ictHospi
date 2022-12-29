<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<style>
.doctorDiv {
	width: 300px;
	height: 400px;
	margin: 30px 30px;
	float: left;
	background: orange;
}

.doctor-img-box {
	height: 90%
}

.doctorImg {
	background-color: aqua;
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

.doctorSelect>* {
	float: right;
}

.deleteBtn {
	background-color: red;
	color: white;
	float: right;
	margin: 10px;
	margin-right: 20px;
}

.registBtn {
	float: right;
	margin: 10px;
}
</style>



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

			<div class="doctorDiv">
				<div class="doctor-img-box">
					<div class="doctorImg">이미지 들어갈 곳</div>
				</div>
				<div class="doctorSelect clearfix">
					<span>선택</span> <input type="checkbox" name="doctor">
				</div>
			</div>
			<div class="doctorDiv">
				<div class="doctor-img-box">
					<div class="doctorImg">이미지 들어갈 곳</div>
				</div>
				<div class="doctorSelect clearfix">
					<span>선택</span> <input type="checkbox" name="doctor">
				</div>
			</div>
			<div class="doctorDiv">
				<div class="doctor-img-box">
					<div class="doctorImg">이미지 들어갈 곳</div>
				</div>
				<div class="doctorSelect clearfix">
					<span>선택</span> <input type="checkbox" name="doctor">
				</div>
			</div>
			<div class="doctorDiv">
				<div class="doctor-img-box">
					<div class="doctorImg">이미지 들어갈 곳</div>
				</div>
				<div class="doctorSelect clearfix">
					<span>선택</span> <input type="checkbox" name="doctor">
				</div>
			</div>
		</div>
		<div class="clearfix">
			<a href="#" class="deleteBtn btn btn-secondary my-2">삭제하기</a> 
			<a href="${pageContext.request.contextPath}/admin/adminPageDetail" class="registBtn btn btn-primary my-2">등록하기</a>
		</div>

	</div>
</div>




<%@include file="../include/footer.jsp"%>