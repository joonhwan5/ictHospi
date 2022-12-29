
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>


<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>소식</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/news/newsMain">병원 소식<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/news/healtMain">건강 컬럼</a></li>
			</ul>
		</div>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">병원 소식</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="titlebox">
				<p>병원 소식 글쓰기</p>
				<hr>
			</div>

			<form action="#" method="post">
				<div>
					<label>DATE</label>
				</div>
				<div class="form-group">

					<input type="hidden" class="form-control" name="bno" value="admin">
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="writer" value="admin" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="title newsDetailTitle" value="제목">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label> <input type="file" name="file" id="file">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control newsDetailContent" rows="10" name="content">내용</textarea>
				</div>

				<button type="submit" class="btn btn-primary newsWriteBtn" onclick="location.href='${pageContext.request.contextPath}/news/newsDetail'">등록</button>
				<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/news/newsMain'">목록</button>

			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

