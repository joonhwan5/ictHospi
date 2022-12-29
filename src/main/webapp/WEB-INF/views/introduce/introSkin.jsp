<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../include/header.jsp"%>



<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>병원 소개</h2></li>
				<li><a href="#">개요<span class="sr-only">(current)</span></a></li>
				<li><a href="#">원장의 말</a></li>
				<li><h2>의료진 소개</h2></li>
				<li><a href="${pageContext.request.contextPath}/introduce/introInternal">내과</a></li>
				<li><a href="${pageContext.request.contextPath}/introduce/introOrtho">외과</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/introduce/introSkin">피부과</a></li>
				<li><h2>기타</h2></li>
				<li><a href="${pageContext.request.contextPath}/introduce/introCome">오시는 길</a></li>
				<li><a href="#">주변 편의시설</a></li>
			</ul>
		</div>


		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main doctor-main">
				<div>
					<h2>의료진 안내</h2>
					<hr>
					<div class="clearfix">
						<img class="doctor-img" alt=""
							src="${pageContext.request.contextPath}/resources/img/logo.png">
						<div class="doctor-intro">
							<h3>허 준</h3>
							<span>피부과</span> <br>
							<h3>전문진료과목</h3>
							<span>아토피 피부염, 여드름, 피부질환</span>
						</div>
					</div>
					<p>
						주저리<br> <br> <br> <br> <br> <br> <br>주저리
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



<script>
	$('intro-body1').attr('display', 'none');
</script>

<%@include file="../include/footer.jsp"%>