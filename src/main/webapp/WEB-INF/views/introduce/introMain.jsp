<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp" %>

<div class="container-fluid">
	<div class="row">

		<%@ include file="../include/introSide.jsp"%>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="intro-body1">
				<h2>병원 소개</h2>
				<div class="intro-article">
					<p>주저리<br><br><br><br><br><br><br><br><br><br><br><br><br> 주저리</p>
				</div>
				<div class="intro-img-out clearfix">
					<div class="intro-img-inner">
						<img alt="" src="${pageContext.request.contextPath}/resources/img/logo.png">
					</div>
					<div class="intro-img-inner">
						<img alt="" src="${pageContext.request.contextPath}/resources/img/logo.png">
					</div>
				</div>
			</div>
			<div class="intro-body2 clearfix">
				<h1 class="page-header">의료진</h1>
				<div class="intro-img-inner col-sm-4 col-md-4 main">
					<img alt="" src="${pageContext.request.contextPath}/resources/img/logo.png">
					<p>
				</div>
				<div class="intro-img-inner col-sm-4 col-md-4 main">
					<img alt="" src="${pageContext.request.contextPath}/resources/img/logo.png">
				</div>
				<div class="intro-comment main">
					<img alt="" src="${pageContext.request.contextPath}/resources/img/logo.png">
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>

<script>
	const msg = '${showBody}';
	console.log(msg);
	if(msg == 1){
		$('.intro-body1').css("display", "none");
	} else {
		$('.intro-body2').css("display", "none");
	}
	
</script>


        