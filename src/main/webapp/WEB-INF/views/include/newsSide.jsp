<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="col-sm-3 col-md-2 sidebar sidebar-hide" style="top: 10vh;">
	<ul class="nav nav-sidebar">
		<li><h2>소식</h2></li>
		<li><a href="${pageContext.request.contextPath}/news/newsMain">병원 소식</a></li>
		<li><a href="${pageContext.request.contextPath}/health/healthMain">건강 컬럼</a></li>
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
	
	if(url.includes('?')){
		url = url.split('?')[0];
	}
	
	let realUrl1 = url.split('/')[0] + '/';
	let realUrl2 = url.split('/')[1] + '/';
	let realUrl3 = url.split('/')[2];
	if(realUrl3 == 'newsDetail' || realUrl3 == 'newsRegist' || realUrl3 == 'newsModify') {
		realUrl3 = 'newsMain';
	} else if(realUrl3 == 'healthDetail' || realUrl3 == 'healthRegist' || realUrl3 == 'healthModify') {
		realUrl3 = 'healthMain';
	}
	let realUrl = realUrl1 + realUrl2 + realUrl3;
	
	$(document).ready(function() {
		$('.sidebar').find('a[href^="' + realUrl + '"]').parents('li').addClass('active');
	});
	

</script>