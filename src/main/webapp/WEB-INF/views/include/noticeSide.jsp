<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar notice-sidebar">
		<li><h2>게시판</h2></li>
		<li class="active"><a href="${pageContext.request.contextPath}/notice/noticeMain">공지사항</a></li>
		<li><a href="${pageContext.request.contextPath}/claim/claimMain">고객의 소리</a></li>
		<li><a href="${pageContext.request.contextPath}/food/foodMain">병원 식단</a></li>
	</ul>
</div>

<script>

	/* $('a').click(function(e) {
		e.preventDefault();
	}); */

	$('.notice-sidebar').on('click', 'li', function(e) {
		console.log(e.target);
		for(let i of [...document.querySelector('.notice-sidebar').children]){
			console.log(i);
		}
	});

</script>