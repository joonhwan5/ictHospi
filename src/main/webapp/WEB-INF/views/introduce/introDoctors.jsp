<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">

		<%@ include file="../include/introSide.jsp" %>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main doctor-main">
				<div>
					<h2>의료진 안내</h2>
					<hr>
					<div class="clearfix">
						<img class="doctor-img" alt=""
							src="${pageContext.request.contextPath}/resources/img/logo.png">
						<div class="doctor-intro">
							<h3>${doctors.doctorName}</h3>
							<span>${doctors.medicalDepartment}</span> <br>
							<h3>전문진료과목</h3>
							<span>${doctors.medicalCharge}</span>
						</div>
					</div>
					<p>
						${doctors.medicalIntro}
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form>
				<div>
					<img src="/img/profile.png">
				</div>
				<div>
					<textarea class="form-control" rows="3" id="reply"></textarea>
					<div class="reply-group">
						<div class="reply-input">
							<img alt="좋아" src="/img/emptylike.png"
								style="width: 20px; heigth: 20px;" /> <img alt="좋아"
								src="/img/emptylike.png" style="width: 20px; heigth: 20px;" />
							<img alt="좋아" src="/img/emptylike.png"
								style="width: 20px; heigth: 20px;" /> <img alt="좋아"
								src="/img/emptylike.png" style="width: 20px; heigth: 20px;" />
							<img alt="좋아" src="/img/emptylike.png"
								style="width: 20px; heigth: 20px;" />
						</div>

						<button type="button" id="replyRegist" class="right btn btn-info">등록하기</button>
					</div>
				</div>
			</form>
			<div id="replyList"></div>
			<button type="button" class="form-control" id="moreList">더보기(페이징)</button>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>
	$('intro-body1').attr('display', 'none');
</script>



