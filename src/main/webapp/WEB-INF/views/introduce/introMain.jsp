<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="../include/header.jsp" %>


<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>병원 소개</h2></li>
				<li class="active"><a href="#">개요<span class="sr-only">(current)</span></a></li>
				<li><a href="#">원장의 말</a></li>
				<li><h2>의료진 소개</h2></li>
				<li><a href="${pageContext.request.contextPath}/introduce/introInternalMain?subject=내과">내과</a></li>
				<li><a href="${pageContext.request.contextPath}/introduce/introOrthoMain?subject=외과">외과</a></li>
				<li><a href="${pageContext.request.contextPath}/introduce/introSkinMain?subject=피부과">피부과</a></li>
				<li><h2>기타</h2></li>
				<li><a href="${pageContext.request.contextPath}/introduce/introCome">오시는 길</a></li>
				<li><a href="#">주변 편의시설</a></li>
			</ul>
		</div>
	
	
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
	$('.intro-body1').css("display", "none");
</script>
        