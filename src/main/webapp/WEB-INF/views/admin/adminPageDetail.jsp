<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>

	<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>관리자 게시판</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/admin/adminPageMain">의료진 관리<span class="sr-only">(current)</span></a></li>
				
			</ul>
		</div>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">의료진 신규 등록</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
			<form action="/admin/registDoctor" method="post">
				
				<div class="form-group">
					<label>의사 이름</label> <input class="form-control" name="doctorName">
				</div>
				<div class="form-group">
					<label>진료 과목</label> <input class="form-control" name="medicalDepartment">
				</div>
				<div class="form-group">
					<label>상세 진료</label> <input class="form-control" name="medicalCharge">
				</div>
				<div class="form-group">
					<label>진료 소개</label> <input class="form-control" name="medicalIntro">
				</div>
				
				
				<!-- 파일 업로드 폼입니다 -->
					<div class="reply-content">
						<div class="reply-group">
							<div class="filebox pull-left">
								<label for="file">이미지업로드</label> 
								<input type="file" name="file" id="file">
							</div>
						</div>
					</div>
				<!-- 파일 업로드 폼 끝 -->
				
				<!-- <form action="fileUpload_ok" method="post" enctype="multipart/form-data">
					<label>파일선택</label> <input class="file" name="file"> <br>
					<input type="submit" value="업로드">
				</form>-->


				<button type="submit" class="btn btn-primary">등록</button>
				<button type="button" class="btn btn-dark">취소</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>