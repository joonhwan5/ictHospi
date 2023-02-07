<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="col-sm-3 col-md-2 sidebar sidebar-hide" style="top: 10vh;">
	<ul class="nav nav-sidebar">
		<li><h2>병원 소개</h2></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introMain/1">개요</a></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introMain/2">원장의 말</a></li>
		<li><h2>의료진 소개</h2></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introDoctor?subject=내과">내과</a></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introDoctor?subject=외과">외과</a></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introDoctor?subject=피부과">피부과</a></li>
		<li><h2>기타</h2></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introCome">오시는 길</a></li>
		<li><a href="${pageContext.request.contextPath}/introduce/introPharmacy">주변 편의시설</a></li>
		<li><a href="${pageContext.request.contextPath}/util/clientService">고객센터</a></li>
	</ul>
</div>
<div class="sidebar-btn sidebar-hide">
	<img src="${pageContext.request.contextPath}/img/left.svg">
</div>

<script>
	$('.sidebar-btn').click(function(){
		$(this).toggleClass('sidebar-show');
		$(this).toggleClass('sidebar-hide');		
		$('.sidebar').toggleClass('sidebar-show');
		$('.sidebar').toggleClass('sidebar-hide');
		$('.sidebar-btn > img').toggleClass('sidebar-img-rotate');
	});
	
	let url = document.location.pathname;
	
	
	let realUrl1 = url.split('/')[0] + '/'; // localhost
	let realUrl2 = url.split('/')[1] + '/'; // introduce
	let realUrl3 = url.split('/')[2]; //introDoctor
	let realUrl4 = '/' + url.split('/')[3];
	
	if(realUrl4 == '/1' || realUrl4 == '/2') {
		realUrl = realUrl1 + realUrl2 + realUrl3 + realUrl4;	
	} else {
		realUrl = realUrl1 + realUrl2 + realUrl3;
	}


	$(document).ready(function() {
		$('.sidebar').find('a[href^="' + realUrl + '"]').parents('li').addClass('active');
	});

	document.addEventListener("wheel", (event) => {
		if($(window).height() < 700){
			let scrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();
			
			if(event.deltaY > 0) {
				setTimeout(() => wherePosition(), 150);
			} else if(event.deltaY < 0){
				$('.sidebar').css('position', 'fixed');
				$('.sidebar').css('top', '10vh');
				$('.sidebar').css('bottom', '');
			}
		}
	},{passive:false});
	
	function wherePosition() {
		if($(window).scrollTop() > 600) {
			$('.sidebar').css('position', 'absolute');
			$('.sidebar').css('top', '');
			$('.sidebar').css('bottom', '110px');
		}
	}
</script>