<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar notice-sidebar">
		<li><h2>게시판</h2></li>
		<li><a href="${pageContext.request.contextPath}/notice/noticeMain">공지사항</a></li>
		<li><a href="${pageContext.request.contextPath}/claim/claimMain">고객의 소리</a></li>
		<li><a href="${pageContext.request.contextPath}/food/foodMain">병원 식단</a></li>
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
	if(realUrl3 == 'noticeDetail' || realUrl3 == 'noticeRegist') {
		realUrl3 = 'noticeMain';
	} else if(realUrl3 == 'claimDetail' || realUrl3 == 'claimRegist') {
		realUrl3 = 'claimMain';
	} else if(realUrl3 == 'foodDetail' || realUrl3 == 'foodRegist') {
		realUrl3 = 'foodMain';
	}
	let realUrl = realUrl1 + realUrl2 + realUrl3;
	
	console.log(realUrl);
	
	$(document).ready(function() {
		$('.sidebar').find('a[href^="' + realUrl + '"]').parents('li').addClass('active');
	});

</script>