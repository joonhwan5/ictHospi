<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="col-sm-3 col-md-2 sidebar sidebar-hide" style="top: 10vh;">
	<ul class="nav nav-sidebar">
		<li><h2>관리자 권한</h2></li>
		<li class="active"><a href="${pageContext.request.contextPath}/admin/adminPageMain">의료진 관리</a></li>
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
	//스크롤 이벤트
	/* document.addEventListener("wheel", (event) => {
		if($(document).height() > $(window).height()){
			let scrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();
			if(scrollBottom <= 110 && event.deltaY > 0) {
				$('.sidebar').css('position', 'absolute');
				$('.sidebar').css('top', '');
				$('.sidebar').css('bottom', '110px');
			} else if(event.deltaY < 0){
				$('.sidebar').css('position', 'fixed');
				$('.sidebar').css('top', '10vh');
				$('.sidebar').css('bottom', '');
			}
		}
	},{passive:false}); */
</script>