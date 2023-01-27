<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="col-sm-3 col-md-2 sidebar" style="top: 10vh;">
	<ul class="nav nav-sidebar">
		<li><h2>병원 소개</h2></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introMain/1">개요</a></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introMain/2">원장의 말</a></li>
		<li><hr style="border: 1px solid black; margin-top: 5px; margin-bottom: 35px"></li>
		<li><h2>의료진 소개</h2></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introInternalMain?subject=내과">내과</a></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introSurgeryMain?subject=외과">외과</a></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introSkinMain?subject=피부과">피부과</a></li>
		<li><hr style="border: 1px solid black; margin-top: 5px; margin-bottom: 35px"></li>
		<li><h2>기타</h2></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introCome">오시는 길</a></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introPharmacy">주변 편의시설</a></li>
	</ul>
</div>

<script>
	
	let url = document.location.pathname;
	
	if(url.includes('?')){
		url = url.split('?')[0];
	}
	
	let realUrl1 = url.split('/')[0] + '/';
	let realUrl2 = url.split('/')[1] + '/';
	let realUrl3 = url.split('/')[2];
	let realUrl4 = '/' + url.split('/')[3];
	if(realUrl4 == '/1' || realUrl4 == '/2') {
		realUrl = realUrl1 + realUrl2 + realUrl3 + realUrl4;	
	} else {
		realUrl = realUrl1 + realUrl2 + realUrl3;
	}
	
	console.log(realUrl);
	
	$(document).ready(function() {
		$('.sidebar').find('a[href^="' + realUrl + '"]').parents('li').addClass('active');
	});


</script>